# Health Diet 管理后台

健康饮食管理后台系统，基于 Next.js 14 + Ant Design 5.x + TypeScript 开发。

## 技术栈

- **Next.js 14** - React 框架 (App Router)
- **React 18** - UI 库
- **TypeScript** - 类型安全
- **Ant Design 5.x** - UI 组件库
- **Zustand** - 状态管理
- **Tailwind CSS** - 样式工具
- **Axios** - HTTP 客户端

## 项目结构

```
src/
├── app/
│   ├── (auth)/                 # 认证路由组
│   │   ├── layout.tsx          # 认证布局
│   │   └── login/
│   │       └── page.tsx        # 登录页面
│   ├── (dashboard)/            # 仪表盘路由组
│   │   ├── layout.tsx          # 仪表盘布局
│   │   ├── page.tsx            # 仪表盘首页
│   │   ├── categories/         # 分类管理
│   │   │   ├── page.tsx        # 分类列表
│   │   │   ├── create/
│   │   │   │   └── page.tsx    # 创建分类
│   │   │   └── [id]/edit/
│   │   │       └── page.tsx    # 编辑分类
│   │   ├── feeds/              # 信息流管理
│   │   │   ├── page.tsx        # 信息流列表
│   │   │   ├── create/
│   │   │   │   └── page.tsx    # 创建信息流
│   │   │   └── [id]/edit/
│   │   │       └── page.tsx    # 编辑信息流
│   │   └── recipes/            # 食谱管理
│   │       ├── page.tsx        # 食谱列表
│   │       ├── create/
│   │       │   └── page.tsx    # 创建食谱
│   │       └── [id]/edit/
│   │           └── page.tsx    # 编辑食谱
│   ├── api/                    # Mock API 路由
│   │   ├── auth/login/
│   │   ├── categories/
│   │   ├── feeds/
│   │   └── recipes/
│   ├── layout.tsx              # 根布局
│   ├── page.tsx                # 根页面（自动跳转）
│   └── globals.css             # 全局样式
├── components/                 # 公共组件
├── lib/                        # 工具库
├── stores/                     # Zustand 状态管理
├── types/                      # TypeScript 类型定义
└── utils/                      # 工具函数
```

## 功能模块

### 1. 登录模块
- JWT Token 认证
- 登录状态持久化
- 权限守卫

### 2. 分类管理
- 分类列表（搜索、分页）
- 创建分类
- 编辑分类
- 删除分类

### 3. 信息流管理
- 信息流列表（搜索、筛选、分页）
- 创建信息流
- 编辑信息流
- 删除信息流

### 4. 食谱管理
- 食谱列表（搜索、筛选、分页）
- 创建食谱（支持食材清单、制作步骤）
- 编辑食谱
- 删除食谱

## 开发命令

```bash
# 安装依赖
npm install

# 开发模式
npm run dev

# 构建
npm run build

# 生产模式
npm start
```

## 默认账号

- 用户名: `admin`
- 密码: `admin123`

## API 接口

项目使用 Mock API，真实后端 API 开发完成后，修改 `src/utils/api.ts` 中的 `API_BASE_URL` 即可。

### 认证接口
- POST `/api/auth/login` - 登录

### 分类接口
- GET `/api/categories` - 获取分类列表
- POST `/api/categories` - 创建分类
- PUT `/api/categories/:id` - 更新分类
- DELETE `/api/categories/:id` - 删除分类

### 信息流接口
- GET `/api/feeds` - 获取信息流列表
- POST `/api/feeds` - 创建信息流
- PUT `/api/feeds/:id` - 更新信息流
- DELETE `/api/feeds/:id` - 删除信息流

### 食谱接口
- GET `/api/recipes` - 获取食谱列表
- POST `/api/recipes` - 创建食谱
- PUT `/api/recipes/:id` - 更新食谱
- DELETE `/api/recipes/:id` - 删除食谱

## 响应式布局

- 桌面端：侧边栏 + 内容区
- 平板端：可折叠侧边栏
- 移动端：适配移动端布局
