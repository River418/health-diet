# Health-Diet 食疗养生小程序 测试环境配置清单

**版本**: v1.0  
**创建时间**: 2026-03-10  
**适用范围**: 微信小程序、抖音小程序、iOS/Android App  

---

## 目录

1. [测试环境概述](#1-测试环境概述)
2. [开发测试环境](#2-开发测试环境)
3. [集成测试环境](#3-集成测试环境)
4. [预发布环境](#4-预发布环境)
5. [生产监控环境](#5-生产监控环境)
6. [测试工具配置](#6-测试工具配置)
7. [测试数据环境](#7-测试数据环境)

---

## 1. 测试环境概述

### 1.1 环境架构图

```
┌─────────────────────────────────────────────────────────────────┐
│                         测试环境架构                             │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│   ┌──────────────┐    ┌──────────────┐    ┌──────────────┐     │
│   │  开发测试环境 │    │  集成测试环境 │    │  预发布环境  │     │
│   │    (DEV)     │    │    (SIT)     │    │    (UAT)     │     │
│   └──────┬───────┘    └──────┬───────┘    └──────┬───────┘     │
│          │                   │                   │              │
│          ▼                   ▼                   ▼              │
│   ┌──────────────────────────────────────────────────────┐     │
│   │              共享基础设施层                           │     │
│   │  • 代码仓库(Git)  • 镜像仓库  • CI/CD流水线           │     │
│   └──────────────────────────────────────────────────────┘     │
│                                                                 │
│   ┌──────────────────────────────────────────────────────┐     │
│   │              生产监控环境 (Production)                │     │
│   │  • 灰度发布  • 实时监控  • 日志收集  • 告警系统        │     │
│   └──────────────────────────────────────────────────────┘     │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

### 1.2 环境用途说明

| 环境名称 | 代码版本 | 数据状态 | 主要用途 | 访问权限 |
|---------|---------|---------|---------|---------|
| **开发测试环境 (DEV)** | 最新开发分支 | 模拟数据 | 开发自测、单功能验证 | 开发团队 |
| **集成测试环境 (SIT)** | 待测版本 | 仿真数据 | 集成测试、接口联调 | 测试团队 |
| **预发布环境 (UAT)** | 预发布版本 | 生产脱敏数据 | 验收测试、回归测试 | 测试/产品团队 |
| **生产监控环境** | 生产版本 | 生产数据 | 线上监控、灰度发布 | 运维团队 |

---

## 2. 开发测试环境 (DEV)

### 2.1 服务器配置

| 配置项 | 规格要求 | 数量 | 用途 |
|-------|---------|------|------|
| 应用服务器 | 4核8G | 1台 | 运行后端服务 |
| 数据库服务器 | 4核8G | 1台 | MySQL + Redis |
| 文件存储 | 100GB SSD | 1台 | 对象存储模拟 |

### 2.2 软件版本

| 软件 | 版本要求 | 安装路径 | 配置说明 |
|-----|---------|---------|---------|
| Node.js | ≥ 18.x LTS | /usr/local/node | 使用nvm管理 |
| MySQL | 8.0.x | /usr/local/mysql | 字符集utf8mb4 |
| Redis | 7.0.x | /usr/local/redis | 开启持久化 |
| Nginx | 1.24.x | /usr/local/nginx | 反向代理 |
| RabbitMQ | 3.12.x | /usr/local/rabbitmq | 消息队列 |
| Git | 2.40.x | /usr/bin/git | 代码版本控制 |

### 2.3 服务端口分配

| 服务 | 端口 | 说明 |
|-----|------|------|
| 后端API服务 | 3000 | RESTful API |
| MySQL | 3306 | 数据库 |
| Redis | 6379 | 缓存 |
| RabbitMQ Management | 15672 | 队列管理界面 |
| Nginx | 80/443 | Web服务器 |

### 2.4 环境变量配置

```bash
# /opt/health-diet/dev/.env

# 环境标识
NODE_ENV=development
APP_ENV=dev

# 数据库配置
DB_HOST=localhost
DB_PORT=3306
DB_NAME=health_diet_dev
DB_USER=hd_dev
DB_PASS=Hd_Dev_2026

# Redis配置
REDIS_HOST=localhost
REDIS_PORT=6379
REDIS_DB=0

# JWT配置
JWT_SECRET=dev_jwt_secret_key_2026
JWT_EXPIRES_IN=2h
JWT_REFRESH_EXPIRES_IN=7d

# 微信小程序配置
WECHAT_APPID=wx_dev_test_appid
WECHAT_SECRET=dev_wechat_secret

# 抖音小程序配置
DOUYIN_APPID=tt_dev_test_appid
DOUYIN_SECRET=dev_douyin_secret

# 文件存储配置
OSS_ENDPOINT=dev-oss.example.com
OSS_BUCKET=health-diet-dev

# 消息队列配置
RABBITMQ_URL=amqp://localhost:5672
RABBITMQ_QUEUE_PREFIX=hd_dev

# 日志配置
LOG_LEVEL=debug
LOG_PATH=/var/log/health-diet/dev
```

### 2.5 小程序测试账号配置

#### 微信小程序

| 配置项 | 值 | 说明 |
|-------|-----|------|
| AppID | wx_dev_test_appid | 测试号AppID |
| AppSecret | dev_wechat_secret | 测试号密钥 |
| 服务器域名 | https://dev-api.health-diet.com | 开发环境API域名 |
| 业务域名 | https://dev.health-diet.com | 开发环境Web域名 |

#### 抖音小程序

| 配置项 | 值 | 说明 |
|-------|-----|------|
| AppID | tt_dev_test_appid | 测试号AppID |
| AppSecret | dev_douyin_secret | 测试号密钥 |
| 服务器域名 | https://dev-api.health-diet.com | 开发环境API域名 |

---

## 3. 集成测试环境 (SIT)

### 3.1 服务器配置

| 配置项 | 规格要求 | 数量 | 用途 |
|-------|---------|------|------|
| 应用服务器 | 8核16G | 2台 | 负载均衡部署 |
| 数据库服务器 | 8核16G | 2台 | MySQL主从 |
| 缓存服务器 | 4核8G | 2台 | Redis主从 |
| 消息队列服务器 | 4核8G | 2台 | RabbitMQ集群 |
| 文件存储 | 500GB SSD | 1台 | 对象存储 |

### 3.2 软件版本

| 软件 | 版本要求 | 高可用配置 |
|-----|---------|-----------|
| Node.js | ≥ 18.x LTS | PM2进程管理 |
| MySQL | 8.0.x | 主从复制 |
| Redis | 7.0.x | Sentinel哨兵 |
| Nginx | 1.24.x | 负载均衡 |
| RabbitMQ | 3.12.x | 镜像队列 |
| Elasticsearch | 8.11.x | 搜索服务 |

### 3.3 服务端口分配

| 服务 | 端口 | 负载均衡端口 | 说明 |
|-----|------|-------------|------|
| 后端API服务 | 3000-3001 | 80/443 | 多实例部署 |
| MySQL Master | 3306 | - | 写库 |
| MySQL Slave | 3307 | - | 读库 |
| Redis Master | 6379 | - | 主库 |
| Redis Slave | 6380 | - | 从库 |
| RabbitMQ | 5672 | - | 消息队列 |
| Elasticsearch | 9200 | - | 搜索引擎 |

### 3.4 环境变量配置

```bash
# /opt/health-diet/sit/.env

# 环境标识
NODE_ENV=test
APP_ENV=sit

# 数据库配置 - 主从
DB_HOST_MASTER=mysql-master.sit.internal
DB_HOST_SLAVE=mysql-slave.sit.internal
DB_PORT=3306
DB_NAME=health_diet_sit
DB_USER=hd_sit
DB_PASS=Hd_Sit_2026_Secure

# Redis配置 - 哨兵
REDIS_SENTINEL_HOSTS=sentinel1:26379,sentinel2:26379,sentinel3:26379
REDIS_MASTER_NAME=mymaster
REDIS_DB=0

# JWT配置
JWT_SECRET=sit_jwt_secret_key_2026_secure
JWT_EXPIRES_IN=2h
JWT_REFRESH_EXPIRES_IN=7d

# 微信小程序配置 - 测试号
WECHAT_APPID=wx_sit_test_appid
WECHAT_SECRET=sit_wechat_secret

# 抖音小程序配置 - 测试号
DOUYIN_APPID=tt_sit_test_appid
DOUYIN_SECRET=sit_douyin_secret

# 对象存储配置
OSS_ENDPOINT=sit-oss.health-diet.com
OSS_BUCKET=health-diet-sit

# 消息队列配置
RABBITMQ_HOSTS=rabbit1:5672,rabbit2:5672
RABBITMQ_QUEUE_PREFIX=hd_sit

# 搜索服务配置
ELASTICSEARCH_HOSTS=es1:9200,es2:9200
ELASTICSEARCH_INDEX_PREFIX=hd_sit

# 日志配置
LOG_LEVEL=info
LOG_PATH=/var/log/health-diet/sit

# 监控配置
APM_SERVER=http://apm-server:8200
METRICS_PORT=9090
```

### 3.5 域名配置

| 域名 | 指向 | 用途 |
|-----|------|------|
| sit-api.health-diet.com | SIT负载均衡器 | API服务入口 |
| sit-admin.health-diet.com | SIT应用服务器 | 管理后台 |
| sit-cdn.health-diet.com | CDN节点 | 静态资源加速 |

---

## 4. 预发布环境 (UAT)

### 4.1 服务器配置

| 配置项 | 规格要求 | 数量 | 用途 |
|-------|---------|------|------|
| 应用服务器 | 8核16G | 2台 | 负载均衡部署 |
| 数据库服务器 | 8核16G | 2台 | MySQL主从 |
| 缓存服务器 | 4核8G | 2台 | Redis主从 |
| 消息队列服务器 | 4核8G | 2台 | RabbitMQ集群 |
| 文件存储 | 1TB SSD | 1台 | 对象存储 |

### 4.2 环境特点

- **数据**: 使用生产环境脱敏数据
- **配置**: 与生产环境配置一致
- **访问**: 限制IP白名单访问
- **监控**: 接入生产监控体系

### 4.3 环境变量配置

```bash
# /opt/health-diet/uat/.env

# 环境标识
NODE_ENV=production
APP_ENV=uat

# 数据库配置
DB_HOST_MASTER=mysql-master.uat.internal
DB_HOST_SLAVE=mysql-slave.uat.internal
DB_PORT=3306
DB_NAME=health_diet_uat
DB_USER=hd_uat
DB_PASS=Hd_Uat_2026_Secure

# Redis配置
REDIS_SENTINEL_HOSTS=sentinel1:26379,sentinel2:26379
REDIS_MASTER_NAME=mymaster
REDIS_DB=0

# JWT配置
JWT_SECRET=uat_jwt_secret_key_2026_secure_random
JWT_EXPIRES_IN=2h
JWT_REFRESH_EXPIRES_IN=7d

# 微信小程序配置 - 体验版
WECHAT_APPID=wx_uat_appid
WECHAT_SECRET=uat_wechat_secret

# 抖音小程序配置 - 体验版
DOUYIN_APPID=tt_uat_appid
DOUYIN_SECRET=uat_douyin_secret

# 对象存储配置
OSS_ENDPOINT=uat-oss.health-diet.com
OSS_BUCKET=health-diet-uat

# 消息队列配置
RABBITMQ_HOSTS=rabbit1:5672,rabbit2:5672
RABBITMQ_QUEUE_PREFIX=hd_uat

# 搜索服务配置
ELASTICSEARCH_HOSTS=es1:9200,es2:9200
ELASTICSEARCH_INDEX_PREFIX=hd_uat

# 日志配置
LOG_LEVEL=warn
LOG_PATH=/var/log/health-diet/uat

# 安全加固
RATE_LIMIT_ENABLED=true
RATE_LIMIT_WINDOW_MS=60000
RATE_LIMIT_MAX_REQUESTS=100

# 访问控制
ALLOWED_IPS=10.0.0.0/8,172.16.0.0/12
```

### 4.4 小程序体验版配置

#### 微信小程序体验版

| 配置项 | 值 | 说明 |
|-------|-----|------|
| 版本类型 | 体验版 | 微信审核前测试 |
| 服务器域名 | https://uat-api.health-diet.com | UAT环境API |
| 访问限制 | 白名单用户 | 仅测试账号可访问 |

#### 抖音小程序体验版

| 配置项 | 值 | 说明 |
|-------|-----|------|
| 版本类型 | 体验版 | 抖音审核前测试 |
| 服务器域名 | https://uat-api.health-diet.com | UAT环境API |
| 访问限制 | 白名单用户 | 仅测试账号可访问 |

---

## 5. 生产监控环境

### 5.1 监控体系架构

```
┌─────────────────────────────────────────────────────────────┐
│                      监控体系架构                            │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐      │
│  │  应用监控     │  │  基础设施监控 │  │  业务监控     │      │
│  │  (APM)       │  │  (Prometheus)│  │  (自定义)    │      │
│  └──────┬───────┘  └──────┬───────┘  └──────┬───────┘      │
│         │                 │                 │              │
│         └─────────────────┼─────────────────┘              │
│                           ▼                                │
│                  ┌──────────────────┐                      │
│                  │   告警中心        │                      │
│                  │  (AlertManager)  │                      │
│                  └────────┬─────────┘                      │
│                           ▼                                │
│                  ┌──────────────────┐                      │
│                  │   通知渠道        │                      │
│                  │ 钉钉/企业微信/邮件 │                      │
│                  └──────────────────┘                      │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### 5.2 监控指标配置

#### 应用性能监控 (APM)

| 指标类型 | 指标名称 | 告警阈值 | 告警级别 |
|---------|---------|---------|---------|
| 响应时间 | API平均响应时间 | > 500ms | 警告 |
| 响应时间 | API P99响应时间 | > 1s | 严重 |
| 错误率 | API错误率 | > 0.1% | 严重 |
| 吞吐量 | QPS | < 1000 | 警告 |
| JVM/Node | 内存使用率 | > 80% | 警告 |
| JVM/Node | CPU使用率 | > 70% | 警告 |

#### 基础设施监控

| 指标类型 | 指标名称 | 告警阈值 | 告警级别 |
|---------|---------|---------|---------|
| 数据库 | MySQL连接数 | > 80% | 警告 |
| 数据库 | MySQL慢查询数 | > 10/min | 警告 |
| 缓存 | Redis内存使用率 | > 80% | 警告 |
| 缓存 | Redis命中率 | < 90% | 警告 |
| 消息队列 | RabbitMQ队列堆积 | > 1000 | 严重 |
| 磁盘 | 磁盘使用率 | > 80% | 警告 |
| 磁盘 | 磁盘使用率 | > 90% | 严重 |

#### 业务监控

| 指标类型 | 指标名称 | 告警阈值 | 告警级别 |
|---------|---------|---------|---------|
| 用户 | 登录成功率 | < 99% | 严重 |
| 内容 | 评论审核延迟 | > 5min | 警告 |
| 合规 | 免责声明曝光率 | < 99.9% | 严重 |
| 安全 | 接口限流触发次数 | > 100/min | 警告 |

### 5.3 日志收集配置

| 日志类型 | 收集方式 | 存储位置 | 保留周期 |
|---------|---------|---------|---------|
| 应用日志 | Filebeat + ELK | Elasticsearch | 30天 |
| 访问日志 | Nginx + Fluentd | S3 + Elasticsearch | 90天 |
| 错误日志 | Sentry集成 | Sentry + Elasticsearch | 90天 |
| 审计日志 | 数据库记录 | MySQL | 1年 |

### 5.4 灰度发布配置

| 阶段 | 流量比例 | 用户范围 | 观察时间 |
|-----|---------|---------|---------|
| 金丝雀发布 | 5% | 内部测试用户 | 30分钟 |
| 小规模灰度 | 20% | 白名单用户 | 2小时 |
| 中规模灰度 | 50% | 随机用户 | 4小时 |
| 全量发布 | 100% | 全部用户 | - |

---

## 6. 测试工具配置

### 6.1 接口测试工具

#### Postman配置

```json
{
  "info": {
    "name": "Health-Diet API Test",
    "schema": "https://schema.getpostman.com/json/collection/v2.1.0/"
  },
  "item": [
    {
      "name": "用户系统",
      "item": [
        {"name": "微信登录", "request": {"url": "{{base_url}}/api/v1/auth/wechat"}},
        {"name": "抖音登录", "request": {"url": "{{base_url}}/api/v1/auth/douyin"}},
        {"name": "刷新Token", "request": {"url": "{{base_url}}/api/v1/auth/refresh"}}
      ]
    },
    {
      "name": "配方系统",
      "item": [
        {"name": "获取配方列表", "request": {"url": "{{base_url}}/api/v1/recipes"}},
        {"name": "获取配方详情", "request": {"url": "{{base_url}}/api/v1/recipes/{{recipe_id}}"}},
        {"name": "搜索配方", "request": {"url": "{{base_url}}/api/v1/search"}}
      ]
    }
  ],
  "variable": [
    {"key": "base_url", "value": "https://sit-api.health-diet.com"},
    {"key": "token", "value": ""}
  ]
}
```

#### JMeter配置

| 配置项 | 值 | 说明 |
|-------|-----|------|
| 线程数 | 1000 | 并发用户数 |
| Ramp-up | 60s | 启动时间 |
| 循环次数 | 10 | 每个线程执行次数 |
| 测试计划 | health-diet-load-test.jmx | 性能测试脚本 |

### 6.2 自动化测试工具

#### 小程序自动化测试

| 工具 | 版本 | 用途 | 配置 |
|-----|------|------|------|
| Minium | 2.x | 微信小程序自动化 | Python 3.9+ |
| Appium | 2.x | App端自动化 | Node.js 18+ |
| WebDriverIO | 8.x | H5端自动化 | Node.js 18+ |

#### UI自动化测试配置

```javascript
// wdio.conf.js
module.exports = {
  runner: 'local',
  specs: ['./test/specs/**/*.js'],
  capabilities: [{
    platformName: 'Android',
    'appium:deviceName': 'TestDevice',
    'appium:app': './apps/health-diet.apk'
  }],
  framework: 'mocha',
  reporters: ['spec', 'allure'],
  services: ['appium']
};
```

### 6.3 性能测试工具

| 工具 | 版本 | 用途 | 配置 |
|-----|------|------|------|
| JMeter | 5.6.x | 接口压测 | 4G堆内存 |
| k6 | 0.48.x | 云原生压测 | Docker部署 |
| Lighthouse | 11.x | 前端性能 | Chrome扩展 |

### 6.4 安全测试工具

| 工具 | 版本 | 用途 | 扫描范围 |
|-----|------|------|---------|
| OWASP ZAP | 2.14.x | Web漏洞扫描 | 全部接口 |
| Burp Suite | 2024.x | 渗透测试 | 核心接口 |
| SonarQube | 10.x | 代码安全审计 | 全部代码 |
| Dependency-Check | 9.x | 依赖漏洞扫描 | package.json |

---

## 7. 测试数据环境

### 7.1 数据库初始化脚本

```sql
-- /opt/health-diet/test-data/init-test-data.sql

-- 创建测试用户
INSERT INTO users (wx_openid, nickname, avatar, language, status, created_at) VALUES
('test_wx_openid_001', '测试用户001', 'https://example.com/avatar1.jpg', 'zh-CN', 1, NOW()),
('test_wx_openid_002', '测试用户002', 'https://example.com/avatar2.jpg', 'zh-TW', 1, NOW()),
('test_wx_openid_003', 'TestUser003', 'https://example.com/avatar3.jpg', 'en', 1, NOW());

-- 创建测试配方
INSERT INTO recipes (name_zh_cn, name_zh_tw, name_en, description_zh_cn, cover_image, crowd_tags, efficacy_tags, status, created_at) VALUES
('红枣枸杞茶', '紅棗枸杞茶', 'Red Date Goji Tea', '补气养血的养生茶饮', 'https://example.com/recipe1.jpg', '["crowd_elderly", "crowd_female"]', '["efficacy_blood"]', 1, NOW()),
('山药排骨汤', '山藥排骨湯', 'Yam Pork Rib Soup', '健脾养胃的滋补汤品', 'https://example.com/recipe2.jpg', '["crowd_universal"]', '["efficacy_stomach"]', 1, NOW()),
('银耳莲子羹', '銀耳蓮子羹', 'White Fungus Lotus Seed Soup', '安神助眠的甜汤', 'https://example.com/recipe3.jpg', '["crowd_elderly"]', '["efficacy_sleep"]', 1, NOW());

-- 创建测试评论
INSERT INTO comments (recipe_id, user_id, content, rating, status, created_at) VALUES
(1, 1, '这个配方很好，喝了之后气色变好了', 5, 1, NOW()),
(1, 2, '味道不错，推荐给大家', 4, 1, NOW()),
(2, 1, '很适合老人家喝', 5, 1, NOW());

-- 创建测试收藏
INSERT INTO favorites (user_id, recipe_id, created_at) VALUES
(1, 1, NOW()),
(1, 2, NOW()),
(2, 1, NOW());
```

### 7.2 测试数据量级

| 数据类型 | DEV环境 | SIT环境 | UAT环境 |
|---------|--------|--------|--------|
| 用户数据 | 100条 | 10,000条 | 100,000条(脱敏) |
| 配方数据 | 50条 | 1,000条 | 5,000条 |
| 评论数据 | 200条 | 50,000条 | 500,000条(脱敏) |
| 收藏数据 | 300条 | 100,000条 | 1,000,000条 |
| 内容数据 | 50条 | 5,000条 | 50,000条 |

### 7.3 数据生成工具

```python
# /opt/health-diet/test-data/generate_test_data.py

import random
import faker
from datetime import datetime, timedelta

faker = faker.Faker('zh_CN')

def generate_users(count=100):
    """生成测试用户数据"""
    users = []
    for i in range(count):
        users.append({
            'wx_openid': f'test_wx_{i:06d}',
            'nickname': faker.name(),
            'avatar': f'https://example.com/avatar_{i}.jpg',
            'language': random.choice(['zh-CN', 'zh-TW', 'en']),
            'created_at': faker.date_time_between('-1y', 'now')
        })
    return users

def generate_recipes(count=50):
    """生成测试配方数据"""
    recipes = []
    crowds = ['crowd_elderly', 'crowd_office', 'crowd_female', 'crowd_children', 'crowd_universal']
    efficacies = ['efficacy_blood', 'efficacy_stomach', 'efficacy_sleep', 'efficacy_beauty', 'efficacy_heatclear']
    
    for i in range(count):
        recipes.append({
            'name_zh_cn': faker.word() + '养生汤',
            'description_zh_cn': faker.text(max_nb_chars=100),
            'crowd_tags': random.sample(crowds, k=random.randint(1, 3)),
            'efficacy_tags': random.sample(efficacies, k=random.randint(1, 2)),
            'view_count': random.randint(0, 10000),
            'favorite_count': random.randint(0, 1000),
            'rating': round(random.uniform(3.5, 5.0), 1)
        })
    return recipes

if __name__ == '__main__':
    users = generate_users(1000)
    recipes = generate_recipes(500)
    print(f"Generated {len(users)} users, {len(recipes)} recipes")
```

### 7.4 敏感词测试数据

```text
# /opt/health-diet/test-data/sensitive-words.txt

# 政治敏感词
测试政治敏感词1
测试政治敏感词2

# 色情敏感词
测试色情敏感词1
测试色情敏感词2

# 暴力敏感词
测试暴力敏感词1
测试暴力敏感词2

# 广告敏感词
测试广告敏感词1
测试广告敏感词2

# 医疗误导词
测试医疗误导词1
测试医疗误导词2
```

---

## 附录

### A. 环境访问信息

| 环境 | URL | 账号 | 密码 |
|-----|-----|------|------|
| DEV API | http://dev-api.health-diet.com | - | - |
| SIT API | https://sit-api.health-diet.com | - | - |
| UAT API | https://uat-api.health-diet.com | - | - |
| RabbitMQ DEV | http://dev-rabbitmq:15672 | admin | dev_rabbit_2026 |
| RabbitMQ SIT | http://sit-rabbitmq:15672 | admin | sit_rabbit_2026 |
| Kibana DEV | http://dev-kibana:5601 | - | - |
| Grafana | http://monitor.health-diet.com | admin | grafana_2026 |

### B. 环境部署检查清单

- [ ] 服务器资源已分配
- [ ] 操作系统已安装并配置
- [ ] 基础软件(Node.js/MySQL/Redis等)已安装
- [ ] 环境变量已配置
- [ ] 数据库已初始化
- [ ] 测试数据已导入
- [ ] 服务已启动并健康检查通过
- [ ] 域名和SSL证书已配置
- [ ] 小程序测试号已配置
- [ ] 监控和日志已接入
- [ ] 防火墙和安全组已配置

### C. 环境维护责任人

| 环境 | 负责人 | 联系方式 | 职责 |
|-----|-------|---------|------|
| DEV | 开发团队 | dev-team@health-diet.com | 环境维护、问题排查 |
| SIT | 测试团队 | qa-team@health-diet.com | 环境维护、数据管理 |
| UAT | 运维团队 | ops-team@health-diet.com | 环境维护、发布管理 |
| Production | 运维团队 | ops-team@health-diet.com | 生产运维、监控告警 |

---

**文档结束**

*本文档为 Health-Diet 食疗养生小程序的测试环境配置清单，涵盖DEV/SIT/UAT/生产监控环境的配置要求、工具配置和测试数据准备。*
