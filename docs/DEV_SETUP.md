# Health-Diet 开发环境搭建指南

## 项目结构

```
health-diet/
├── frontend/          # 前端项目 (Taro + Vue3)
├── backend/           # 后端项目 (Node.js + Express)
├── database/          # 数据库脚本
│   ├── migrations/    # 数据库迁移文件
│   └── scripts/       # 初始化脚本
└── docs/              # 项目文档
```

## 环境要求

- Node.js >= 18.0.0 LTS
- MySQL >= 8.0
- Redis >= 6.0
- npm >= 9.0

## 后端环境搭建

### 1. 安装依赖

```bash
cd backend
npm install
```

### 2. 配置环境变量

```bash
cp .env.example .env
# 编辑 .env 文件，配置数据库和Redis连接
```

### 3. 初始化数据库

```bash
# 创建数据库
mysql -u root -p -e "CREATE DATABASE IF NOT EXISTS health_diet CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"

# 执行迁移脚本
for f in ../database/migrations/*.sql; do
    mysql -u root -p health_diet < "$f"
done

# 初始化数据
mysql -u root -p health_diet < ../database/scripts/init_database.sql
```

### 4. 启动服务

```bash
# 开发模式
npm run dev

# 生产模式
npm start
```

服务默认运行在 http://localhost:3000

## 前端环境搭建

### 1. 安装依赖

```bash
cd frontend
npm install
```

### 2. 配置环境变量

开发环境配置已包含在 `.env.development` 中，如需修改请编辑该文件。

### 3. 启动开发服务器

```bash
# 微信小程序
npm run dev:weapp

# 抖音小程序
npm run dev:tt
```

## API 接口列表

### 认证接口
- `POST /api/v1/auth/wechat/login` - 微信登录
- `POST /api/v1/auth/douyin/login` - 抖音登录
- `POST /api/v1/auth/refresh` - 刷新Token

### 用户接口
- `GET /api/v1/users/profile` - 获取用户信息
- `PUT /api/v1/users/profile` - 更新用户信息
- `GET /api/v1/users/favorites` - 获取收藏列表
- `GET /api/v1/users/history` - 获取浏览历史
- `DELETE /api/v1/users/history` - 清除浏览历史

### 配方接口
- `GET /api/v1/recipes` - 获取配方列表
- `GET /api/v1/recipes/:id` - 获取配方详情
- `POST /api/v1/recipes/:id/favorite` - 收藏配方
- `DELETE /api/v1/recipes/:id/favorite` - 取消收藏

### 分类接口
- `GET /api/v1/categories` - 获取分类列表
- `GET /api/v1/categories/kingkong` - 获取金刚位配置

### 评论接口
- `GET /api/v1/comments` - 获取评论列表
- `POST /api/v1/comments` - 发表评论
- `DELETE /api/v1/comments/:id` - 删除评论

### 搜索接口
- `GET /api/v1/search` - 搜索配方
- `GET /api/v1/search/hot` - 热门搜索
- `GET /api/v1/search/suggestions` - 搜索建议

### 内容接口
- `GET /api/v1/contents` - 获取内容列表
- `GET /api/v1/contents/:id` - 获取内容详情

### 系统接口
- `GET /api/v1/health` - 健康检查

## 数据库表结构

详见 `database/migrations/` 目录下的 SQL 文件。

主要表：
- `users` - 用户表
- `recipes` - 配方表
- `recipe_ingredients` - 食材表
- `recipe_steps` - 步骤表
- `categories` - 分类表
- `comments` - 评论表
- `favorites` - 收藏表
- `contents` - 内容表
- `user_history` - 浏览历史表
- `kingkong_config` - 金刚位配置表

## 开发优先级

### P0 (核心功能)
- [x] 用户系统 (微信/抖音登录)
- [x] 配方查询 (列表/详情/筛选)
- [x] 收藏功能
- [x] 分类系统
- [x] 金刚位配置

### P1 (重要功能)
- [ ] 评论系统
- [ ] 内容信息流
- [ ] 搜索功能
- [ ] 浏览历史

### P2 (增强功能)
- [ ] 消息队列
- [ ] 用户激励
- [ ] 多语言完整支持
