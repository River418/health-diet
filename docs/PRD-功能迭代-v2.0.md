# Health Diet 食疗养生小程序 - 功能迭代需求文档 (PRD)

**版本**: v2.0  
**日期**: 2026-03-16  
**作者**: 产品团队  
**状态**: 待评审

---

## 1. 文档概述

### 1.1 背景
Health Diet 食疗养生小程序已上线运行，需要完成功能迭代以提升用户体验和运营效率。本次迭代包含两个核心需求：
1. 修复大字模式（无障碍功能）
2. 创建运营管理后台

### 1.2 目标
- 修复现有大字模式功能缺陷，确保无障碍功能正常工作
- 构建完整的运营管理后台，支持内容运营和日常管理

### 1.3 适用范围
- 前端小程序（Taro + Vue3 + TypeScript）
- 运营管理后台（Next.js + React + TypeScript）
- 后端 API（Node.js + Express + PostgreSQL）

---

## 2. 需求 1：修复大字模式

### 2.1 问题描述
**现状**: 用户在「设置-辅助功能」中将字体大小设置为 `large` 后，页面文字没有变化。

**根本原因分析**:
1. `accessibility store` 中的 `applyFontSize()` 方法在小程序环境下无法正确操作 DOM
2. 小程序 `page` 节点选择器返回的 `node` 对象不支持 `classList.add/remove` 操作
3. CSS 变量 `--font-scale` 和 `--root-font-size` 未正确应用到页面根元素
4. 页面组件未正确监听字体大小变化事件

### 2.2 功能需求

#### 2.2.1 需求列表

| 需求 ID | 需求描述 | 优先级 | 状态 |
|---------|---------|--------|------|
| ACC-001 | 修复字体大小设置后页面无变化问题 | P0 | 待修复 |
| ACC-002 | 确保字体大小变化实时应用到所有页面 | P0 | 待修复 |
| ACC-003 | 支持系统字体大小跟随 | P1 | 已支持 |
| ACC-004 | 支持高对比度模式 | P1 | 已支持 |

#### 2.2.2 详细需求

**ACC-001: 修复字体大小应用机制**
- 修改 `applyFontSize()` 方法，使用小程序支持的 API
- 通过 `Taro.setStorageSync` 保存字体大小状态
- 在页面 `onShow` 生命周期中读取并应用字体大小
- 使用全局 CSS class 切换实现字体大小变化

**ACC-002: 全局字体大小同步**
- 所有页面在 `onShow` 时检查并应用当前字体大小设置
- 使用 `Taro.eventCenter` 实现跨页面字体大小变化通知
- 提供 `usePageFontSize()` 组合式函数供页面使用

### 2.3 技术方案

#### 2.3.1 修复策略

**方案 A: CSS Class 切换（推荐）**
```typescript
// 在 app.ts 中全局应用
Taro.getStorageSync('accessibility_fontSize') === 'large' 
  ? document.documentElement.classList.add('font-large')
  : document.documentElement.classList.remove('font-large')
```

**方案 B: CSS 变量动态计算**
```scss
// 全局样式
page {
  --base-font-size: 16px;
  --font-scale: 1;
  font-size: calc(var(--base-font-size) * var(--font-scale));
}

page.font-large {
  --font-scale: 1.125;
  --base-font-size: 18px;
}
```

#### 2.3.2 修改文件清单

| 文件路径 | 修改类型 | 修改内容 |
|---------|---------|---------|
| `src/stores/accessibility.ts` | 修改 | 重写 `applyFontSize()` 方法 |
| `src/composables/useFontSize.ts` | 修改 | 优化事件监听和页面应用逻辑 |
| `src/composables/usePageFontSize.ts` | 修改 | 简化页面级字体大小应用 |
| `src/app.ts` | 修改 | 添加全局字体大小初始化 |
| `src/app.scss` | 修改 | 添加 `.font-large` 全局样式 |
| 各页面 `.vue` 文件 | 修改 | 添加 `usePageFontSize()` 调用 |

#### 2.3.3 代码实现示例

**accessibility.ts 修改**:
```typescript
const applyFontSize = () => {
  const isLarge = fontSize.value === 'large'
  
  // 保存到 storage
  Taro.setStorageSync('font_size_class', isLarge ? 'font-large' : '')
  
  // 触发全局事件
  Taro.eventCenter.trigger('accessibility:fontSizeChanged', { 
    isLarge, 
    scale: scaleRatio.value 
  })
}
```

**app.ts 修改**:
```typescript
onLaunch() {
  // 初始化字体大小
  const accessibilityStore = useAccessibilityStore()
  accessibilityStore.initSettings()
  
  // 应用初始字体大小
  const fontClass = Taro.getStorageSync('font_size_class')
  if (fontClass === 'font-large') {
    // 在页面渲染后添加 class
    Taro.nextTick(() => {
      // 小程序环境下通过选择器添加
      const query = Taro.createSelectorQuery()
      query.select('page').node()
      query.exec((res) => {
        if (res && res[0]) {
          // 使用 dataset 或 style 标记
        }
      })
    })
  }
}
```

**全局样式 (app.scss)**:
```scss
/* 标准字体 */
page {
  font-size: 16px;
}

/* 大字体模式 */
page.font-large {
  font-size: 18px;
  
  .text-sm { font-size: 14px; }
  .text-base { font-size: 18px; }
  .text-lg { font-size: 20px; }
  .text-xl { font-size: 22px; }
  .text-2xl { font-size: 24px; }
}
```

### 2.4 界面原型

#### 2.4.1 设置页面 - 辅助功能
```
┌─────────────────────────────┐
│ ← 辅助功能              保存 │
├─────────────────────────────┤
│                             │
│ 字体大小                    │
│ ┌─────────────────────────┐ │
│ │  标准        [●] 大字体 │ │
│ └─────────────────────────┘ │
│                             │
│ 跟随系统字体大小            │
│                    [开关]   │
│                             │
│ 高对比度模式                │
│                    [开关]   │
│                             │
│ 语音辅助                    │
│                    [开关]   │
│                             │
└─────────────────────────────┘
```

#### 2.4.2 大字模式效果
```
标准模式:                    大字模式:
┌─────────────────┐         ┌─────────────────┐
│ 养生食谱        │         │ 养生食谱        │  ← 标题 18px → 20px
│                 │         │                 │
│ 今日推荐        │         │ 今日推荐        │  ← 18px → 20px
│ ┌───────────┐   │         │ ┌───────────┐   │
│ │ 红枣银耳羹 │   │         │ │ 红枣银耳羹 │   │  ← 16px → 18px
│ │ 滋阴润肺   │   │         │ │ 滋阴润肺   │   │  ← 14px → 16px
│ └───────────┘   │         │ └───────────┘   │
└─────────────────┘         └─────────────────┘
```

### 2.5 验收标准

| 验收项 | 验收标准 | 测试方法 |
|-------|---------|---------|
| ACC-001 | 设置字体大小为 large 后，页面文字立即变大 | 手动测试 |
| ACC-002 | 切换页面后字体大小保持设置值 | 手动测试 |
| ACC-003 | 重启小程序后字体大小设置保持 | 手动测试 |
| ACC-004 | 所有页面文字统一放大 1.125 倍 | 视觉对比 |
| ACC-005 | 大字体模式下页面布局不错乱 | 手动测试 |
| ACC-006 | 设置跟随系统字体后，自动适配系统设置 | 手动测试 |

---

## 3. 需求 2：创建运营管理后台

### 3.1 概述
构建一个基于 Next.js + React + TypeScript 的运营管理后台，支持分类管理、首页信息流管理和食谱详情管理。

### 3.2 技术架构

#### 3.2.1 技术栈
- **框架**: Next.js 14 (App Router)
- **UI 库**: Ant Design 5.x
- **状态管理**: React Context + useReducer / Zustand
- **HTTP 客户端**: Axios
- **样式**: CSS Modules / Tailwind CSS
- **类型**: TypeScript 5.x

#### 3.2.2 项目结构
```
admin/
├── src/
│   ├── app/                    # Next.js App Router
│   │   ├── layout.tsx          # 根布局
│   │   ├── page.tsx            # 登录页
│   │   ├── dashboard/          # 仪表盘
│   │   │   └── page.tsx
│   │   ├── categories/         # 分类管理
│   │   │   ├── page.tsx        # 列表页
│   │   │   └── [id]/           # 编辑页
│   │   │       └── page.tsx
│   │   ├── contents/           # 信息流管理
│   │   │   ├── page.tsx
│   │   │   └── [id]/
│   │   │       └── page.tsx
│   │   └── recipes/            # 食谱管理
│   │       ├── page.tsx
│   │       └── [id]/
│   │           └── page.tsx
│   ├── components/             # 公共组件
│   │   ├── Layout/             # 布局组件
│   │   ├── DataTable/          # 数据表格
│   │   ├── SearchForm/         # 搜索表单
│   │   └── ImageUpload/        # 图片上传
│   ├── hooks/                  # 自定义 Hooks
│   │   ├── useAuth.ts
│   │   ├── useTable.ts
│   │   └── useRequest.ts
│   ├── services/               # API 服务
│   │   ├── api.ts              # axios 实例
│   │   ├── auth.ts
│   │   ├── category.ts
│   │   ├── content.ts
│   │   └── recipe.ts
│   ├── types/                  # TypeScript 类型
│   │   ├── auth.ts
│   │   ├── category.ts
│   │   ├── content.ts
│   │   └── recipe.ts
│   ├── utils/                  # 工具函数
│   │   ├── request.ts
│   │   ├── format.ts
│   │   └── validator.ts
│   └── styles/
│       └── globals.css
├── public/
├── next.config.js
├── tailwind.config.js
└── package.json
```

### 3.3 功能模块

#### 3.3.1 模块 1: 分类管理

**功能描述**: 管理小程序中的分类数据，包括人群分类、功效分类、节气分类等。

**数据模型**:
```typescript
interface Category {
  id: number
  name_zh_cn: string        // 简体中文名称
  name_zh_tw: string        // 繁体中文名称
  name_en: string           // 英文名称
  type: 'crowd' | 'efficacy' | 'solar_term' | 'ingredient'
  icon: string              // 图标 URL
  sort_order: number        // 排序
  is_active: boolean        // 是否启用
  created_at: string
  updated_at: string
}
```

**页面设计**:

1. **分类列表页** (`/categories`)
```
┌─────────────────────────────────────────────────────────────────┐
│  Health Diet 管理后台                              [用户] 退出  │
├──────────┬──────────────────────────────────────────────────────┤
│          │  分类管理                                    + 新增  │
│  仪表盘   ├──────────────────────────────────────────────────────┤
│  分类管理 │  ┌────────────────────────────────────────────────┐  │
│  信息流   │  │ 类型 [全部▼]  状态 [全部▼]  [搜索...]   [筛选]  │  │
│  食谱管理 │  └────────────────────────────────────────────────┘  │
│  用户管理 │                                                      │
│  系统设置 │  ┌────────────────────────────────────────────────┐  │
│          │  │ □ │ 名称       │ 类型     │ 排序 │ 状态 │ 操作 │  │
│          │  ├───┼────────────┼──────────┼──────┼──────┼──────┤  │
│          │  │ □ │ 孕妇       │ 人群     │  1   │ 启用 │编辑删除│ │
│          │  │ □ │ 儿童       │ 人群     │  2   │ 启用 │编辑删除│ │
│          │  │ □ │ 老年人     │ 人群     │  3   │ 启用 │编辑删除│ │
│          │  │ □ │ 滋阴润肺   │ 功效     │  1   │ 启用 │编辑删除│ │
│          │  │ □ │ 补气养血   │ 功效     │  2   │ 禁用 │编辑删除│ │
│          │  └───┴────────────┴──────────┴──────┴──────┴──────┘  │
│          │                                                      │
│          │  共 25 条  [1] [2] [3] ... [10]  每页 10 条           │
└──────────┴──────────────────────────────────────────────────────┘
```

2. **分类表单页** (`/categories/new` 和 `/categories/[id]`)
```
┌─────────────────────────────────────────────────────────────────┐
│  Health Diet 管理后台                              [用户] 退出  │
├──────────┬──────────────────────────────────────────────────────┤
│          │  分类管理 > 新增分类                          返回   │
│  仪表盘   ├──────────────────────────────────────────────────────┤
│  分类管理 │                                                      │
│  ...      │  基本信息                                            │
│          │  ┌────────────────────────────────────────────────┐  │
│          │  │  简体中文名称 *                                  │  │
│          │  │  [                              ]                │  │
│          │  │                                                  │  │
│          │  │  繁体中文名称                                    │  │
│          │  │  [                              ]                │  │
│          │  │                                                  │  │
│          │  │  英文名称                                        │  │
│          │  │  [                              ]                │  │
│          │  │                                                  │  │
│          │  │  分类类型 *        排序                          │  │
│          │  │  [人群▼]           [    ]                        │  │
│          │  │                                                  │  │
│          │  │  图标                                            │  │
│          │  │  [+ 上传图标]  建议尺寸 64x64px                  │  │
│          │  │                                                  │  │
│          │  │  状态                                            │  │
│          │  │  (●) 启用  ( ) 禁用                              │  │
│          │  └────────────────────────────────────────────────┘  │
│          │                                                      │
│          │  [取消]                              [保存]          │
└──────────┴──────────────────────────────────────────────────────┘
```

**API 接口需求**:
| 方法 | 路径 | 描述 |
|-----|------|------|
| GET | /api/admin/categories | 获取分类列表（分页+筛选） |
| GET | /api/admin/categories/:id | 获取分类详情 |
| POST | /api/admin/categories | 创建分类 |
| PUT | /api/admin/categories/:id | 更新分类 |
| DELETE | /api/admin/categories/:id | 删除分类 |
| PATCH | /api/admin/categories/:id/status | 修改分类状态 |

#### 3.3.2 模块 2: 首页信息流管理

**功能描述**: 管理首页底部信息流内容，支持文章、视频等多种内容类型。

**数据模型**:
```typescript
interface Content {
  id: number
  title: string               // 标题
  source: string              // 来源
  source_url: string          // 原文链接
  cover_image: string         // 封面图
  author: string              // 作者
  content_type: 'article' | 'video' | 'gallery'
  tags: string[]              // 标签
  view_count: number          // 浏览数
  status: 0 | 1               // 0=禁用, 1=启用
  published_at: string        // 发布时间
  created_at: string
  updated_at: string
}
```

**页面设计**:

1. **信息流列表页** (`/contents`)
```
┌─────────────────────────────────────────────────────────────────┐
│  Health Diet 管理后台                              [用户] 退出  │
├──────────┬──────────────────────────────────────────────────────┤
│          │  信息流管理                                  + 新增  │
│  仪表盘   ├──────────────────────────────────────────────────────┤
│  分类管理 │  ┌────────────────────────────────────────────────┐  │
│  信息流   │  │ 类型 [全部▼]  状态 [全部▼]  [搜索...]   [筛选]  │  │
│  食谱管理 │  └────────────────────────────────────────────────┘  │
│  ...      │                                                      │
│          │  ┌────────────────────────────────────────────────┐  │
│          │  │ □ │ 封面 │ 标题           │ 类型 │ 状态 │ 操作 │ │
│          │  ├───┼──────┼────────────────┼──────┼──────┼──────┤ │
│          │  │ □ │ [图] │ 春季养生指南   │ 文章 │ 启用 │编辑删除│ │
│          │  │ □ │ [图] │ 红枣的10种吃法 │ 视频 │ 启用 │编辑删除│ │
│          │  │ □ │ [图] │ 养生汤谱大全   │ 文章 │ 禁用 │编辑删除│ │
│          │  └───┴──────┴────────────────┴──────┴──────┴──────┘ │
│          │                                                      │
└──────────┴──────────────────────────────────────────────────────┘
```

2. **内容表单页** (`/contents/new` 和 `/contents/[id]`)
```
┌─────────────────────────────────────────────────────────────────┐
│  信息流管理 > 新增内容                                  返回    │
├─────────────────────────────────────────────────────────────────┤
│  基本信息                                                        │
│  ┌────────────────────────────────────────────────────────────┐ │
│  │  标题 *                                                    │ │
│  │  [                                                        ] │ │
│  │                                                            │ │
│  │  内容类型 *          状态                                  │ │
│  │  [文章▼]             (●) 启用  ( ) 禁用                    │ │
│  │                                                            │ │
│  │  封面图                                                    │ │
│  │  [+ 上传图片]                                              │ │
│  │                                                            │ │
│  │  来源              原文链接                                │ │
│  │  [        ]        [                                      ]│ │
│  │                                                            │ │
│  │  作者              发布时间                                │ │
│  │  [        ]        [日期选择器]                            │ │
│  │                                                            │ │
│  │  标签                                                      │ │
│  │  [养生, 春季, ...]  [+ 添加标签]                           │ │
│  └────────────────────────────────────────────────────────────┘ │
│                                                                  │
│  [取消]                                              [保存]      │
└─────────────────────────────────────────────────────────────────┘
```

**API 接口需求**:
| 方法 | 路径 | 描述 |
|-----|------|------|
| GET | /api/admin/contents | 获取内容列表 |
| GET | /api/admin/contents/:id | 获取内容详情 |
| POST | /api/admin/contents | 创建内容 |
| PUT | /api/admin/contents/:id | 更新内容 |
| DELETE | /api/admin/contents/:id | 删除内容 |

#### 3.3.3 模块 3: 食谱详情管理

**功能描述**: 管理食疗食谱数据，包括基本信息、食材、步骤、标签等。

**数据模型**:
```typescript
interface Recipe {
  id: number
  name_zh_cn: string          // 名称
  name_zh_tw: string
  name_en: string
  description_zh_cn: string   // 描述
  description_zh_tw: string
  description_en: string
  cover_image: string         // 封面图
  crowd_tags: string[]        // 适用人群标签
  efficacy_tags: string[]     // 功效标签
  solar_term_tags: string[]   // 节气标签
  ingredients: Ingredient[]   // 食材清单
  steps: Step[]               // 制作步骤
  tips: string[]              // 小贴士
  rating: number              // 评分
  view_count: number          // 浏览数
  favorite_count: number      // 收藏数
  comment_count: number       // 评论数
  status: 0 | 1               // 状态
  created_at: string
  updated_at: string
}

interface Ingredient {
  name: string
  amount: string
  unit: string
}

interface Step {
  order: number
  description: string
  image?: string
}
```

**页面设计**:

1. **食谱列表页** (`/recipes`)
```
┌─────────────────────────────────────────────────────────────────┐
│  Health Diet 管理后台                              [用户] 退出  │
├──────────┬──────────────────────────────────────────────────────┤
│          │  食谱管理                                    + 新增  │
│  仪表盘   ├──────────────────────────────────────────────────────┤
│  分类管理 │  ┌────────────────────────────────────────────────┐  │
│  信息流   │  │ 人群 [全部▼]  功效 [全部▼]  [搜索...]   [筛选]  │  │
│  食谱管理 │  └────────────────────────────────────────────────┘  │
│  ...      │                                                      │
│          │  ┌────────────────────────────────────────────────┐  │
│          │  │ □ │ 封面 │ 名称       │ 评分 │ 浏览 │ 状态 │操作│ │
│          │  ├───┼──────┼────────────┼──────┼──────┼──────┼────┤ │
│          │  │ □ │ [图] │ 红枣银耳羹 │ 4.8  │ 1.2k │ 启用 │... │ │
│          │  │ □ │ [图] │ 枸杞菊花茶 │ 4.5  │  890 │ 启用 │... │ │
│          │  │ □ │ [图] │ 当归生姜汤 │ 4.9  │ 2.1k │ 禁用 │... │ │
│          │  └───┴──────┴────────────┴──────┴──────┴──────┴────┘ │
│          │                                                      │
└──────────┴──────────────────────────────────────────────────────┘
```

2. **食谱表单页** (`/recipes/new` 和 `/recipes/[id]`)
```
┌─────────────────────────────────────────────────────────────────┐
│  食谱管理 > 新增食谱                                    返回    │
├─────────────────────────────────────────────────────────────────┤
│  ┌────────────┐ ┌────────────┐ ┌────────────┐ ┌────────────┐   │
│  │  基本信息  │ │  食材清单  │ │  制作步骤  │ │  其他设置  │   │
│  └────────────┘ └────────────┘ └────────────┘ └────────────┘   │
├─────────────────────────────────────────────────────────────────┤
│  【基本信息】                                                    │
│  ┌────────────────────────────────────────────────────────────┐ │
│  │  食谱名称 *                                                │ │
│  │  [                                                        ]│ │
│  │                                                            │ │
│  │  封面图                                                    │ │
│  │  [+ 上传图片]  建议尺寸 750x420px                          │ │
│  │                                                            │ │
│  │  食谱描述                                                  │ │
│  │  [                                                        ]│ │
│  │  [                                                        ]│ │
│  │                                                            │ │
│  │  适用人群              功效标签          节气标签          │ │
│  │  [孕妇, 老人...]       [滋阴...]         [立春...]         │ │
│  └────────────────────────────────────────────────────────────┘ │
│                                                                  │
│  【食材清单】                                          [+ 添加]  │
│  ┌────────────────────────────────────────────────────────────┐ │
│  │  食材名称        用量        单位                  [删除]  │ │
│  │  [红枣    ]      [10  ]      [克▼]                 [x]     │ │
│  │  [银耳    ]      [1   ]      [朵▼]                 [x]     │ │
│  │  [冰糖    ]      [适量]      [  ▼]                 [x]     │ │
│  └────────────────────────────────────────────────────────────┘ │
│                                                                  │
│  【制作步骤】                                          [+ 添加]  │
│  ┌────────────────────────────────────────────────────────────┐ │
│  │  步骤 1                                            [删除]  │ │
│  │  [                                                        ]│ │
│  │  [+ 添加图片]                                              │ │
│  ├────────────────────────────────────────────────────────────┤ │
│  │  步骤 2                                            [删除]  │ │
│  │  [                                                        ]│ │
│  └────────────────────────────────────────────────────────────┘ │
│                                                                  │
│  [取消]                                              [保存]      │
└─────────────────────────────────────────────────────────────────┘
```

**API 接口需求**:
| 方法 | 路径 | 描述 |
|-----|------|------|
| GET | /api/admin/recipes | 获取食谱列表 |
| GET | /api/admin/recipes/:id | 获取食谱详情 |
| POST | /api/admin/recipes | 创建食谱 |
| PUT | /api/admin/recipes/:id | 更新食谱 |
| DELETE | /api/admin/recipes/:id | 删除食谱 |
| PATCH | /api/admin/recipes/:id/status | 修改食谱状态 |

### 3.4 公共组件设计

#### 3.4.1 布局组件 (Layout)
```typescript
interface LayoutProps {
  children: React.ReactNode
  title?: string
  breadcrumbs?: { label: string; path?: string }[]
}
```

#### 3.4.2 数据表格 (DataTable)
```typescript
interface DataTableProps<T> {
  columns: Column<T>[]
  data: T[]
  loading?: boolean
  pagination: PaginationConfig
  rowSelection?: RowSelectionConfig
  actions?: ActionConfig<T>[]
  onSearch?: (values: Record<string, any>) => void
}
```

#### 3.4.3 搜索表单 (SearchForm)
```typescript
interface SearchFormProps {
  fields: SearchField[]
  onSearch: (values: Record<string, any>) => void
  onReset?: () => void
}
```

### 3.5 权限设计

#### 3.5.1 角色定义
| 角色 | 权限 |
|-----|------|
| 超级管理员 | 所有权限 |
| 内容管理员 | 分类管理、信息流管理、食谱管理 |
| 运营人员 | 信息流管理、食谱管理（仅查看和编辑） |

#### 3.5.2 权限控制
- 使用 Next.js Middleware 进行路由权限拦截
- 使用 Context 存储用户权限信息
- 组件级别使用 `usePermission` hook 控制按钮显示

### 3.6 验收标准

| 验收项 | 验收标准 | 测试方法 |
|-------|---------|---------|
| ADMIN-001 | 管理后台可以正常登录 | 手动测试 |
| ADMIN-002 | 分类管理 CRUD 功能完整 | 手动测试 |
| ADMIN-003 | 信息流管理 CRUD 功能完整 | 手动测试 |
| ADMIN-004 | 食谱管理 CRUD 功能完整 | 手动测试 |
| ADMIN-005 | 列表页支持分页、筛选、排序 | 手动测试 |
| ADMIN-006 | 表单验证功能正常 | 手动测试 |
| ADMIN-007 | 图片上传功能正常 | 手动测试 |
| ADMIN-008 | 响应式布局适配 | 手动测试 |
| ADMIN-009 | 页面加载时间 < 2s | 性能测试 |
| ADMIN-010 | 权限控制生效 | 手动测试 |

---

## 4. 技术建议

### 4.1 后端 API 扩展建议

#### 4.1.1 新增 Admin 路由
```javascript
// routes/admin/index.js
const express = require('express')
const router = express.Router()

router.use('/categories', require('./categories'))
router.use('/contents', require('./contents'))
router.use('/recipes', require('./recipes'))
router.use('/auth', require('./auth'))
router.use('/upload', require('./upload'))

module.exports = router
```

#### 4.1.2 认证中间件
```javascript
// middleware/adminAuth.js
const authenticateAdmin = async (req, res, next) => {
  const token = req.headers.authorization?.split(' ')[1]
  if (!token) {
    return res.status(401).json({ error: '未登录' })
  }
  
  try {
    const decoded = jwt.verify(token, process.env.JWT_SECRET)
    const user = await req.db.query('SELECT * FROM admin_users WHERE id = $1', [decoded.id])
    
    if (!user.rows[0] || user.rows[0].status !== 1) {
      return res.status(403).json({ error: '无权限' })
    }
    
    req.admin = user.rows[0]
    next()
  } catch (error) {
    return res.status(401).json({ error: '登录已过期' })
  }
}
```

### 4.2 前端开发建议

#### 4.2.1 状态管理方案
```typescript
// stores/useAuthStore.ts
import { create } from 'zustand'
import { persist } from 'zustand/middleware'

interface AuthState {
  token: string | null
  user: AdminUser | null
  login: (credentials: LoginCredentials) => Promise<void>
  logout: () => void
}

export const useAuthStore = create<AuthState>()(
  persist(
    (set, get) => ({
      token: null,
      user: null,
      login: async (credentials) => {
        const { token, user } = await authApi.login(credentials)
        set({ token, user })
      },
      logout: () => set({ token: null, user: null })
    }),
    { name: 'auth-storage' }
  )
)
```

#### 4.2.2 请求封装
```typescript
// utils/request.ts
import axios from 'axios'
import { useAuthStore } from '@/stores/useAuthStore'

const request = axios.create({
  baseURL: process.env.NEXT_PUBLIC_API_URL,
  timeout: 10000
})

request.interceptors.request.use((config) => {
  const token = useAuthStore.getState().token
  if (token) {
    config.headers.Authorization = `Bearer ${token}`
  }
  return config
})

request.interceptors.response.use(
  (response) => response.data,
  (error) => {
    if (error.response?.status === 401) {
      useAuthStore.getState().logout()
      window.location.href = '/login'
    }
    return Promise.reject(error)
  }
)
```

### 4.3 部署建议

#### 4.3.1 环境配置
```bash
# .env.production
NEXT_PUBLIC_API_URL=https://api.health-diet.com/v1
NEXT_PUBLIC_CDN_URL=https://cdn.health-diet.com
```

#### 4.3.2 Docker 部署
```dockerfile
# Dockerfile
FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

FROM node:18-alpine AS runner
WORKDIR /app
COPY --from=builder /app/.next/standalone ./
COPY --from=builder /app/.next/static ./.next/static
EXPOSE 3000
CMD ["node", "server.js"]
```

---

## 5. 项目计划

### 5.1 里程碑

| 里程碑 | 交付物 | 预计时间 |
|-------|--------|---------|
| M1 | PRD 评审通过 | 2026-03-17 |
| M2 | 后端 API 开发完成 | 2026-03-20 |
| M3 | 管理后台开发完成 | 2026-03-25 |
| M4 | 大字模式修复完成 | 2026-03-22 |
| M5 | 联调测试完成 | 2026-03-27 |
| M6 | 上线发布 | 2026-03-28 |

### 5.2 任务分解

#### 后端开发任务
- [ ] 创建 admin_users 表和认证接口
- [ ] 创建分类管理 CRUD 接口
- [ ] 创建信息流管理 CRUD 接口
- [ ] 创建食谱管理 CRUD 接口
- [ ] 实现图片上传接口
- [ ] 添加权限控制中间件

#### 前端开发任务
- [ ] 搭建 Next.js 项目框架
- [ ] 实现登录页面
- [ ] 实现布局组件
- [ ] 实现分类管理模块
- [ ] 实现信息流管理模块
- [ ] 实现食谱管理模块
- [ ] 修复大字模式功能

---

## 6. 附录

### 6.1 数据库表结构

#### admin_users
```sql
CREATE TABLE admin_users (
  id SERIAL PRIMARY KEY,
  username VARCHAR(50) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  nickname VARCHAR(50),
  role VARCHAR(20) DEFAULT 'editor',
  avatar VARCHAR(255),
  status INTEGER DEFAULT 1,
  last_login_at TIMESTAMP,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### 6.2 接口响应格式

```typescript
// 统一响应格式
interface ApiResponse<T> {
  success: boolean
  data?: T
  error?: string
  code?: string
  message?: string
}

// 分页响应格式
interface PaginatedResponse<T> {
  list: T[]
  pagination: {
    page: number
    pageSize: number
    total: number
    totalPages: number
  }
}
```

### 6.3 变更记录

| 版本 | 日期 | 变更内容 | 作者 |
|-----|------|---------|------|
| v1.0 | 2026-03-16 | 初稿 | 产品团队 |
| v2.0 | 2026-03-16 | 完善技术方案和验收标准 | 产品团队 |

---

**文档结束**
