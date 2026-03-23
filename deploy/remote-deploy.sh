#!/bin/bash
set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

SERVER_HOST=""
SSH_USER="root"
SSH_PORT="22"
SSH_KEY=""
DEPLOY_BRANCH="main"
DEPLOY_OPTS=""

log_info() { echo -e "${BLUE}[INFO]${NC} $1"; }
log_success() { echo -e "${GREEN}[SUCCESS]${NC} $1"; }
log_warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }

show_help() {
    echo "用法: $0 [选项]"
    echo ""
    echo "选项:"
    echo "  -h, --host      服务器地址 (必须)"
    echo "  -u, --user      SSH 用户名 (默认: root)"
    echo "  -p, --port      SSH 端口 (默认: 22)"
    echo "  -k, --key       SSH 私钥路径"
    echo "  -b, --branch    部署分支 (默认: main)"
    echo "  --h5            仅部署 H5 前端"
    echo "  --backend       仅部署后端"
    echo "  --admin         仅部署管理后台"
    echo "  --database      仅初始化数据库"
    echo "  --all           部署所有组件 (默认)"
    echo "  --help          显示帮助信息"
    echo ""
    echo "示例:"
    echo "  $0 -h 192.168.1.100 -u root"
    echo "  $0 -h example.com -u deploy -p 2222 -k ~/.ssh/id_rsa"
    echo "  $0 -h 192.168.1.100 --backend"
    exit 0
}

parse_args() {
    while [[ "$#" -gt 0 ]]; do
        case $1 in
            -h|--host) SERVER_HOST="$2"; shift ;;
            -u|--user) SSH_USER="$2"; shift ;;
            -p|--port) SSH_PORT="$2"; shift ;;
            -k|--key) SSH_KEY="$2"; shift ;;
            -b|--branch) DEPLOY_BRANCH="$2"; shift ;;
            --h5|--backend|--admin|--database|--all) DEPLOY_OPTS="$DEPLOY_OPTS $1" ;;
            --help) show_help ;;
            *) log_error "未知参数: $1"; exit 1 ;;
        esac
        shift
    done

    if [ -z "${SERVER_HOST}" ]; then
        log_error "必须指定服务器地址 (-h 或 --host)"
        exit 1
    fi
}

ssh_cmd() {
    local ssh_args=()
    [ -n "${SSH_KEY}" ] && ssh_args+=("-i" "${SSH_KEY}")
    ssh_args+=("-p" "${SSH_PORT}" "-o" "StrictHostKeyChecking=no")
    
    ssh "${ssh_args[@]}" "${SSH_USER}@${SERVER_HOST}" "$@"
}

scp_cmd() {
    local src="$1"
    local dst="$2"
    local scp_args=()
    [ -n "${SSH_KEY}" ] && scp_args+=("-i" "${SSH_KEY}")
    scp_args+=("-P" "${SSH_PORT}" "-o" "StrictHostKeyChecking=no")
    
    scp "${scp_args[@]}" "$src" "$dst"
}

check_ssh_connection() {
    log_info "测试 SSH 连接..."
    if ssh_cmd "echo 'SSH 连接成功'" > /dev/null 2>&1; then
        log_success "SSH 连接正常"
    else
        log_error "SSH 连接失败，请检查服务器地址和认证信息"
        exit 1
    fi
}

deploy() {
    log_info "开始远程部署..."
    log_info "服务器: ${SSH_USER}@${SERVER_HOST}:${SSH_PORT}"
    log_info "分支: ${DEPLOY_BRANCH}"

    local remote_path="/opt/health-diet"
    local repo_url="https://github.com/your-org/health-diet.git"

    ssh_cmd << EOF
        set -e
        
        if [ ! -d "${remote_path}" ]; then
            echo "克隆仓库..."
            git clone -b ${DEPLOY_BRANCH} ${repo_url} ${remote_path}
        else
            echo "更新仓库..."
            cd ${remote_path}
            git fetch origin
            git checkout ${DEPLOY_BRANCH}
            git pull origin ${DEPLOY_BRANCH}
        fi

        cd ${remote_path}/deploy
        
        if [ ! -f "cloud/.env" ]; then
            echo "请先配置 cloud/.env 文件"
            exit 1
        fi

        chmod +x cloud-deploy.sh
        ./cloud-deploy.sh ${DEPLOY_OPTS}
EOF

    log_success "远程部署完成"
}

main() {
    parse_args "$@"
    check_ssh_connection
    deploy
}

main "$@"