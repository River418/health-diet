#!/bin/bash
set -euo pipefail

# ==================== 配置 ====================
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
CLOUD_DIR="${SCRIPT_DIR}/cloud"

DOCKER_COMPOSE="docker compose"
NPM_REGISTRY="${NPM_REGISTRY:-https://registry.npmmirror.com}"

# ==================== 参数解析 ====================
DEPLOY_H5=false
DEPLOY_BACKEND=false
DEPLOY_ADMIN=false
DEPLOY_DATABASE=false
DEPLOY_ALL=false

parse_args() {
    if [ "$#" -eq 0 ]; then
        DEPLOY_ALL=true
        DEPLOY_H5=true
        DEPLOY_BACKEND=true
        DEPLOY_ADMIN=true
        DEPLOY_DATABASE=true
        return
    fi

    while [[ "$#" -gt 0 ]]; do
        case $1 in
            --h5) DEPLOY_H5=true ;;
            --backend) DEPLOY_BACKEND=true ;;
            --admin) DEPLOY_ADMIN=true ;;
            --database) DEPLOY_DATABASE=true ;;
            --all)
                DEPLOY_ALL=true
                DEPLOY_H5=true
                DEPLOY_BACKEND=true
                DEPLOY_ADMIN=true
                DEPLOY_DATABASE=true
                ;;
            -h|--help)
                echo "用法: $0 [选项]"
                echo "选项:"
                echo "  --h5        仅部署 H5 前端"
                echo "  --backend   仅部署后端"
                echo "  --admin     仅部署管理后台"
                echo "  --database  仅初始化数据库"
                echo "  --all       部署所有组件 (默认)"
                echo "  -h, --help  显示帮助信息"
                exit 0
                ;;
            *) log_error "未知参数: $1"; exit 1 ;;
        esac
        shift
    done
}

# ==================== 函数 ====================
log_info() { echo -e "${BLUE}[INFO]${NC} $1"; }
log_success() { echo -e "${GREEN}[SUCCESS]${NC} $1"; }
log_warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }

check_dependencies() {
    log_info "检查依赖..."
    
    if ! command -v docker &> /dev/null; then
        log_error "Docker未安装"
        exit 1
    fi
    
    if ! docker compose version &> /dev/null; then
        log_error "Docker Compose V2 未安装"
        log_info "请安装 Docker Compose-plugin: https://docs.docker.com/compose/install/"
        exit 1
    fi
    
    log_success "依赖检查通过"
}

check_env_file() {
    if [ ! -f "${CLOUD_DIR}/.env" ]; then
        log_warn "未找到.env文件，从模板创建..."
        
        if [ -f "${CLOUD_DIR}/.env.example" ]; then
            cp "${CLOUD_DIR}/.env.example" "${CLOUD_DIR}/.env"
            log_info "已创建.env文件，请编辑配置后重新运行"
            log_info "配置文件: ${CLOUD_DIR}/.env"
            exit 1
        else
            log_error "未找到环境变量模板 (${CLOUD_DIR}/.env.example)"
            exit 1
        fi
    fi
    
    log_success "环境变量检查通过"
}

load_env() {
    set -a
    . "${CLOUD_DIR}/.env"
    set +a
}

require_env() {
    local var_name="$1"
    local var_value="${!var_name:-}"

    if [ -z "${var_value}" ]; then
        log_error "缺少环境变量: ${var_name}"
        exit 1
    fi
}

validate_env() {
    local required_vars=(
        POSTGRES_USER
        POSTGRES_PASSWORD
        POSTGRES_DB
        REDIS_PASSWORD
        JWT_SECRET
        CLOUDFLARE_API_TOKEN
        CERTBOT_EMAIL
        CERTBOT_DOMAIN
    )

    for var_name in "${required_vars[@]}"; do
        require_env "${var_name}"
    done
}

prepare_certbot_credentials() {
    if [ -z "${CLOUDFLARE_API_TOKEN:-}" ]; then
        log_error "缺少 CLOUDFLARE_API_TOKEN"
        exit 1
    fi

    mkdir -p "${CLOUD_DIR}/.secrets"
    printf "dns_cloudflare_api_token = %s\n" "${CLOUDFLARE_API_TOKEN}" > "${CLOUD_DIR}/.secrets/cloudflare.ini"
    chmod 600 "${CLOUD_DIR}/.secrets/cloudflare.ini"
}

request_certificates() {
    local domain="${CERTBOT_DOMAIN}"
    local propagation="${CERTBOT_PROPAGATION_SECONDS:-60}"

    log_info "申请/续期证书..."
    cd "${CLOUD_DIR}"
    
    set +e
    ${DOCKER_COMPOSE} run --rm --entrypoint certbot certbot certonly \
        --dns-cloudflare \
        --dns-cloudflare-credentials /etc/letsencrypt/cloudflare.ini \
        --dns-cloudflare-propagation-seconds "${propagation}" \
        --agree-tos \
        --keep-until-expiring \
        --non-interactive \
        --email "${CERTBOT_EMAIL}" \
        -d "${domain}" \
        -d "*.${domain}"
    local certbot_exit_code=$?
    set -e
    
    if [ $certbot_exit_code -ne 0 ]; then
        log_error "证书申请失败 (退出码: $certbot_exit_code)"
        echo ""
        log_info "常见原因:"
        echo "  1. CLOUDFLARE_API_TOKEN 无效或权限不足"
        echo "  2. DNS 传播延迟（可增大 CERTBOT_PROPAGATION_SECONDS）"
        echo "  3. 域名解析未指向 Cloudflare"
        echo "  4. 已达到 Let's Encrypt 速率限制"
        exit 1
    fi
    
    log_success "证书申请/续期成功"
}

pull_latest_code() {
    log_info "拉取最新代码..."
    
    cd "${PROJECT_ROOT}"
    
    if git rev-parse --git-dir > /dev/null 2>&1; then
        git pull origin main || log_warn "Git拉取失败，使用本地代码"
    else
        log_warn "不是Git仓库，跳过"
    fi
}

build_images() {
    log_info "构建Docker镜像..."
    log_info "使用 npm 镜像源: ${NPM_REGISTRY}"
    
    cd "${CLOUD_DIR}"

    local build_services=()
    [ "$DEPLOY_H5" = true ] && build_services+=("h5")
    [ "$DEPLOY_BACKEND" = true ] && build_services+=("backend")
    [ "$DEPLOY_ADMIN" = true ] && build_services+=("admin")

    if [ ${#build_services[@]} -eq 0 ]; then
        log_info "没有需要构建的服务"
        return 0
    fi

    local max_attempts="${DOCKER_BUILD_RETRIES:-3}"
    local retry_delay="${DOCKER_BUILD_RETRY_DELAY_SECONDS:-15}"
    local attempt=1

    while [ "${attempt}" -le "${max_attempts}" ]; do
        log_info "镜像构建尝试 (${attempt}/${max_attempts}): ${build_services[*]}..."
        if ${DOCKER_COMPOSE} build --parallel \
            --build-arg NPM_CONFIG_REGISTRY="${NPM_REGISTRY}" \
            --build-arg npm_config_registry="${NPM_REGISTRY}" \
            "${build_services[@]}"; then
            log_success "镜像构建完成"
            return 0
        fi

        if [ "${attempt}" -lt "${max_attempts}" ]; then
            log_warn "镜像构建失败，${retry_delay} 秒后重试..."
            sleep "${retry_delay}"
        fi
        attempt=$((attempt + 1))
    done

    log_error "镜像构建失败，已达到最大重试次数 (${max_attempts})"
    exit 1
}

stop_old_containers() {
    if [ "$DEPLOY_ALL" = true ]; then
        log_info "停止所有旧容器..."
        cd "${CLOUD_DIR}"
        ${DOCKER_COMPOSE} down || true
        log_success "所有旧容器已停止"
    else
        log_info "停止目标旧容器..."
        cd "${CLOUD_DIR}"
        local stop_services=()
        [ "$DEPLOY_H5" = true ] && stop_services+=("h5")
        [ "$DEPLOY_BACKEND" = true ] && stop_services+=("backend")
        [ "$DEPLOY_ADMIN" = true ] && stop_services+=("admin")

        if [ ${#stop_services[@]} -gt 0 ]; then
            ${DOCKER_COMPOSE} stop "${stop_services[@]}" || true
            ${DOCKER_COMPOSE} rm -f "${stop_services[@]}" || true
            log_success "目标旧容器已清理: ${stop_services[*]}"
        fi
    fi
}

wait_for_service() {
    local service_name=$1
    local max_attempts=${2:-30}
    local container_name="health-diet-${service_name}"
    local attempt=1
    
    log_info "等待 ${service_name} 就绪..."
    
    while [ $attempt -le $max_attempts ]; do
        local health_status
        local container_status
        health_status=$(docker inspect --format='{{if .State.Health}}{{.State.Health.Status}}{{else}}no-healthcheck{{end}}' "${container_name}" 2>/dev/null || echo "missing")
        container_status=$(docker inspect --format='{{.State.Status}}' "${container_name}" 2>/dev/null || echo "missing")
        
        if [ "$health_status" = "healthy" ] || { [ "$health_status" = "no-healthcheck" ] && [ "$container_status" = "running" ]; }; then
            log_success "${service_name} 已就绪"
            return 0
        fi
        
        log_info "等待 ${service_name}... ($attempt/$max_attempts)"
        sleep 2
        attempt=$((attempt + 1))
    done
    
    log_error "${service_name} 启动超时"
    ${DOCKER_COMPOSE} logs "${service_name}"
    return 1
}

start_services() {
    log_info "启动服务..."
    
    cd "${CLOUD_DIR}"
    
    if [ "$DEPLOY_DATABASE" = true ] || [ "$DEPLOY_ALL" = true ]; then
        log_info "启动数据库服务..."
        ${DOCKER_COMPOSE} up -d postgres redis
        wait_for_service "postgres" 30 || exit 1
        wait_for_service "redis" 30 || exit 1
    fi
    
    if [ "$DEPLOY_BACKEND" = true ]; then
        log_info "启动后端服务..."
        ${DOCKER_COMPOSE} up -d backend
        wait_for_service "backend" 30 || exit 1
    fi

    if [ "$DEPLOY_H5" = true ]; then
        log_info "启动 H5 前端..."
        ${DOCKER_COMPOSE} up -d h5
        wait_for_service "h5" 30 || exit 1
    fi

    if [ "$DEPLOY_ADMIN" = true ]; then
        log_info "启动管理后台..."
        ${DOCKER_COMPOSE} up -d admin
        wait_for_service "admin" 30 || exit 1
    fi
    
    log_info "启动 Nginx 和证书服务..."
    ${DOCKER_COMPOSE} up -d nginx certbot
    wait_for_service "nginx" 30 || exit 1
    
    log_success "相关服务已启动"
}

init_database() {
    if [ "$DEPLOY_DATABASE" != true ] && [ "$DEPLOY_ALL" != true ]; then
        return 0
    fi

    log_info "初始化数据库..."
    cd "${CLOUD_DIR}"

    ${DOCKER_COMPOSE} exec -T postgres psql -U "${POSTGRES_USER}" -d "${POSTGRES_DB}" -c "SELECT 1" > /dev/null 2>&1 || {
        log_error "数据库连接失败"
        exit 1
    }

    local migrations_dir="${PROJECT_ROOT}/database/migrations"
    if [ -d "${migrations_dir}" ]; then
        log_info "执行数据库迁移..."
        
        for file in $(ls "${migrations_dir}"/*.sql 2>/dev/null | sort); do
            local filename=$(basename "${file}")
            log_info "执行迁移: ${filename}"
            
            ${DOCKER_COMPOSE} exec -T postgres psql -U "${POSTGRES_USER}" -d "${POSTGRES_DB}" -f - < "${file}" || {
                log_warn "迁移 ${filename} 可能已执行或失败"
            }
        done
    fi

    local seed_file="${PROJECT_ROOT}/database/scripts/seed_data.sql"
    if [ -f "${seed_file}" ]; then
        log_info "导入测试数据..."
        ${DOCKER_COMPOSE} exec -T postgres psql -U "${POSTGRES_USER}" -d "${POSTGRES_DB}" -f - < "${seed_file}" || {
            log_warn "测试数据导入可能已存在或失败"
        }
        log_success "测试数据导入完成"
    fi

    log_success "数据库初始化完成"
}

check_services() {
    log_info "检查服务状态..."
    
    cd "${CLOUD_DIR}"
    ${DOCKER_COMPOSE} ps
    
    log_success "服务检查完成"
}

show_info() {
    local domain="${CERTBOT_DOMAIN:-health-diet.instory.tech}"
    
    echo ""
    echo "==============================================="
    log_success "部署完成！"
    echo "==============================================="
    echo ""
    log_info "访问地址:"
    echo "  - H5 前端:    https://${domain}"
    echo "  - API:        https://${domain}/api/v1/"
    echo "  - 管理后台:   https://admin.${domain}"
    echo ""
    log_info "容器端口映射 (避免与 novel-writer 冲突):"
    echo "  - Nginx HTTP:  31080"
    echo "  - Nginx HTTPS: 31443"
    echo "  - Backend:     ${BACKEND_PORT:-3100}"
    echo ""
    log_info "常用命令:"
    echo "  进入目录:   cd ${CLOUD_DIR}"
    echo "  查看日志:   ${DOCKER_COMPOSE} logs -f [服务名]"
    echo "  重启服务:   ${DOCKER_COMPOSE} restart [服务名]"
    echo "  停止服务:   ${DOCKER_COMPOSE} down"
    echo ""
    log_info "数据库操作:"
    echo "  连接数据库: ${DOCKER_COMPOSE} exec postgres psql -U ${POSTGRES_USER} -d ${POSTGRES_DB}"
    echo "  执行迁移:   ${DOCKER_COMPOSE} exec backend npm run migrate"
    echo ""
    echo "==============================================="
}

cleanup() {
    log_info "清理旧镜像..."
    docker image prune -f
}

should_pull_latest_code() {
    local auto_pull="${AUTO_PULL_LATEST:-ask}"

    case "${auto_pull}" in
        true|TRUE|1|yes|YES|y|Y)
            return 0
            ;;
        false|FALSE|0|no|NO|n|N)
            return 1
            ;;
    esac

    if [ -t 0 ]; then
        read -p "是否拉取最新代码? (y/n) " -n 1 -r
        echo
        [[ ${REPLY} =~ ^[Yy]$ ]]
        return
    fi

    log_info "非交互模式，默认不拉取代码（可设置 AUTO_PULL_LATEST=true）"
    return 1
}

# ==================== 主流程 ====================
on_failure() {
    local exit_code=$?
    echo ""
    log_error "部署失败 (退出码: ${exit_code})"
    echo ""
    log_info "恢复服务:"
    echo "  cd ${CLOUD_DIR} && ${DOCKER_COMPOSE} up -d"
    echo ""
    log_info "查看日志:"
    echo "  cd ${CLOUD_DIR} && ${DOCKER_COMPOSE} logs --tail=50"
    echo ""
}

main() {
    parse_args "$@"
    trap on_failure ERR

    echo "==============================================="
    log_info "云服务器部署 - Health-Diet"
    echo "==============================================="
    
    check_dependencies
    check_env_file
    load_env
    validate_env
    prepare_certbot_credentials

    if should_pull_latest_code; then
        pull_latest_code
    fi
    
    build_images
    request_certificates
    stop_old_containers
    start_services
    init_database
    check_services
    cleanup
    show_info
}

main "$@"