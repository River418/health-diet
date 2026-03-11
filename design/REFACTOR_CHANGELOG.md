# Health-Diet 前端重构变更说明

## 重构概述

基于 Linda 的设计文档，对 health-diet 项目前端进行了全面的 UI/UX 重构，主要目标是提升视觉品质、优化用户体验、增强无障碍支持。

---

## 一、全局样式系统重构

### 1. 设计变量更新 (`src/styles/variables.scss`)

**变更内容：**
- 更新主色调为设计规范中的品牌绿：`#2E7D32`（主色）、`#4CAF50`（浅色）、`#1B5E20`（深色）
- 新增辅助色系统：暖橙 `#FF8C42`、暖黄 `#FFD54F`、天蓝 `#64B5F6`、粉色 `#F48FB1`
- 更新中性色：标题 `#1A1A1A`、正文 `#4A4A4A`、次要 `#8A8A8A`、禁用 `#BDBDBD`
- 新增背景色系统：页面 `#F8F9FA`、卡片 `#FFFFFF`、分隔 `#F0F0F0`
- 完善间距系统：基于 4px 单位（xs/sm/md/lg/xl/xxl/xxxl）
- 新增圆角系统：sm(4px)/md(8px)/lg(12px)/xl(16px)/full(全圆角)
- 新增阴影系统：4 个层级（Level 1-4）+ 品牌色阴影
- 更新字体系统：适配中老年用户（最小 12px，正文 15px，大标题 22px）
- 新增无障碍变量：最小触摸目标 44px、对比度要求

**变更原因：**
- 建立完整的设计系统，确保全局一致性
- 提升无障碍支持，适配中老年用户群体
- 提供更丰富的视觉层次和交互反馈

### 2. 全局样式更新 (`src/styles/index.scss`)

**变更内容：**
- 重构基础样式重置，使用新变量
- 更新卡片样式，增加悬浮效果
- 新增按钮样式系统（主按钮/次按钮/文字按钮/小按钮）
- 新增标签样式系统（primary/secondary/info 等类型）
- 新增筛选标签样式
- 更新免责声明样式（浅黄色背景 `#FFF8E1`）
- 新增金刚位样式（48px 图标 + 渐变背景）
- 新增列表样式系统
- 新增评分样式系统
- 新增步骤引导样式
- 新增工具类（flex 布局、间距、文本截断等）
- 新增动画类（fade-in、slide-up）
- 增加无障碍支持（prefers-reduced-motion、focus-visible）

**变更原因：**
- 提供统一的组件样式，减少重复代码
- 增强交互反馈（悬浮、点击效果）
- 支持无障碍访问

---

## 二、页面重构

### 1. 首页 (`src/pages/index/index.vue`)

**变更内容：**
- 新增品牌 Logo 区域（🌿 食疗有方）
- 搜索栏优化：圆角增大至全圆角，添加品牌标识
- Banner 重构：高度调整为 160px，添加渐变遮罩和标题文字
- 金刚位重构：图标改为 48px 圆形渐变背景，2行4列布局
- 推荐配方改为横向滚动卡片（RecipeCardHorizontal 组件）
- 养生资讯改为左图右文列表布局
- 更新所有间距和颜色使用新变量

**设计亮点实现：**
- ✅ 轮播 Banner 带渐变遮罩
- ✅ 48px 分类入口图标
- ✅ 推荐配方横向卡片
- ✅ 养生资讯左图右文布局

**变更原因：**
- 提升首页视觉层次和信息密度
- 优化中老年用户的操作体验
- 增强品牌识别度

### 2. 食谱详情页 (`src/pages/recipe/detail/index.vue`)

**变更内容：**
- 重构封面区域：全宽沉浸式大图（320px 高度），底部渐变遮罩
- 新增营养价值展示区域（热量/蛋白质/脂肪/碳水）
- 食材清单重构：卡片式展示，添加购买按钮
- 制作步骤重构：步骤数字使用品牌绿圆形背景，添加步骤图支持
- 用户评论重构：展示评分星星、评论时间
- 相关推荐改为横向滚动
- 底部操作栏重构：收藏按钮 + 评论按钮 + 主按钮（写评论）
- 导航栏优化：滚动后显示，透明背景 + 毛玻璃效果

**设计亮点实现：**
- ✅ 沉浸式大图（16:10 比例）
- ✅ 步骤引导（品牌绿圆形序号）
- ✅ 营养价值展示
- ✅ 底部固定操作栏

**变更原因：**
- 提供更沉浸的食谱浏览体验
- 清晰展示食材和步骤信息
- 增强用户互动（评论、收藏）

### 3. 个人中心页 (`src/pages/user/index.vue`)

**变更内容：**
- 头部重构：品牌绿到浅绿的渐变背景（180px 高度）
- 添加装饰性圆形图案增加层次感
- 头像改为 72px 圆形，白色边框
- 统计数据改为悬浮卡片设计（与头部重叠 16px）
- 常用功能改为 4 列网格，渐变色圆形图标
- 设置列表重构：分组展示，彩色图标背景
- 语言选择弹窗优化

**设计亮点实现：**
- ✅ 渐变头部背景
- ✅ 统计卡片悬浮效果
- ✅ 常用功能彩色图标
- ✅ 设置分组展示

**变更原因：**
- 提升个人中心页的视觉冲击力
- 优化功能入口的识别度
- 增强设置项的视觉分组

### 4. 分类浏览页 (`src/pages/category/index.vue`)

**变更内容：**
- 左侧导航重构：选中项使用品牌绿渐变背景
- 人群分类卡片：彩色标签（中老年暖橙、白领天蓝、女性粉色、儿童暖黄）
- 新增当前节气展示区域（渐变背景卡片）
- 二十四节气标签：圆角标签，选中状态品牌绿
- 功效分类卡片：彩色图标 + 顶部彩色边框
- 食材分类：3 列网格，图片 + 文字

**设计亮点实现：**
- ✅ 左右分栏布局
- ✅ 彩色分类标签
- ✅ 当前节气展示
- ✅ 功效分类彩色卡片

**变更原因：**
- 提供更清晰的分类导航
- 通过颜色区分不同分类，提升识别度
- 优化分类内容的展示密度

### 5. 收藏页面 (`src/pages/user/favorites/index.vue`)

**变更内容：**
- 新增顶部导航栏（标题 + 管理/筛选按钮）
- 新增分类筛选栏（全部/汤羹/粥品/茶饮/其他）
- 列表项重构：左图右文布局，显示评分、标签、收藏时间
- 新增管理模式：支持批量选择和删除
- 空状态重构：大爱心图标 + 温馨文案 + 主按钮引导
- 新增骨架屏加载效果

**设计亮点实现：**
- ✅ 温馨空状态设计
- ✅ 分类筛选功能
- ✅ 批量管理模式
- ✅ 骨架屏加载

**变更原因：**
- 提供分类筛选，方便用户查找
- 批量管理提升操作效率
- 温馨的空状态减少用户挫败感

---

## 三、组件重构

### 1. 新增组件

#### RecipeCardHorizontal (`src/components/business/RecipeCardHorizontal.vue`)
- 横向食谱卡片组件
- 宽度 160px，图片 120px 高度
- 显示标题、评分、功效标签
- 支持热门标签 badge

### 2. 组件更新

#### SearchBar (`src/components/business/SearchBar.vue`)
- 新增品牌 Logo 区域
- 搜索框改为全圆角（24px）
- 使用新颜色变量

#### KingKong (`src/components/business/KingKong.vue`)
- 图标改为 48px 圆形
- 添加渐变色背景
- 使用新间距和动画

#### HdDisclaimer (`src/components/common/HdDisclaimer.vue`)
- 更新为浅黄色背景 `#FFF8E1`
- 橙色文字 `#F57C00`
- 圆角 8px

#### HdEmpty (`src/components/common/HdEmpty.vue`)
- 图标改为 64px 圆形背景
- 支持自定义图标、标题、描述
- 支持操作按钮

#### HdTag (`src/components/common/HdTag.vue`)
- 新增多种类型（primary/secondary/success/warning/error/info）
- 支持多种尺寸（small/medium/large）
- 支持圆角模式

#### HdButton (`src/components/common/HdButton.vue`)
- 新增多种类型（primary/secondary/outline/text/danger）
- 支持多种尺寸（small/medium/large）
- 支持块级、禁用、加载状态

#### HdSkeleton (`src/components/common/HdSkeleton.vue`)
- 新增卡片/列表/图文三种骨架屏类型
- 支持自定义行数

#### HdCard (`src/components/common/HdCard.vue`)
- 通用卡片容器组件
- 支持阴影、悬浮、边框模式

---

## 四、无障碍支持增强

### 1. 字体优化
- 正文最小字号从 14px 提升到 15px
- 标题层级分明（22px/18px/16px）
- 支持大字模式（可进一步放大字体）

### 2. 对比度保障
- 文字与背景对比度 ≥ 4.5:1
- 重要按钮使用深色背景 + 白色文字
- 禁用状态使用浅灰色，避免误导

### 3. 触摸目标
- 所有可点击元素最小 44×44px
- 按钮高度统一 48px，方便点击
- 列表项高度 56px，增加误触容错

### 4. 动画支持
- 支持 prefers-reduced-motion 媒体查询
- 减少动画模式下，动画时长设为 0.01ms

---

## 五、技术实现细节

### 1. CSS 变量使用
- 所有颜色、间距、圆角、阴影均使用 SCSS 变量
- 便于主题切换和维护

### 2. 动画与过渡
- 统一使用 `$duration-fast` (150ms)、`$duration-normal` (200ms)、`$duration-slow` (300ms)
- 统一使用 `$ease-standard` (ease-in-out)、`$ease-bounce`、`$ease-decelerate`

### 3. 响应式支持
- 页面边距使用变量 `$page-padding` (16px)
- 平板端可扩展为 `$page-padding-tablet` (24px)

### 4. 安全区域
- 底部操作栏支持 `env(safe-area-inset-bottom)`
- 适配刘海屏、全面屏设备

---

## 六、文件变更清单

### 新增文件
- `src/components/business/RecipeCardHorizontal.vue` - 横向食谱卡片

### 修改文件
1. `src/styles/variables.scss` - 设计变量系统
2. `src/styles/index.scss` - 全局样式
3. `src/pages/index/index.vue` - 首页
4. `src/pages/recipe/detail/index.vue` - 食谱详情页
5. `src/pages/user/index.vue` - 个人中心页
6. `src/pages/category/index.vue` - 分类浏览页
7. `src/pages/user/favorites/index.vue` - 收藏页面
8. `src/components/business/SearchBar.vue` - 搜索栏
9. `src/components/business/KingKong.vue` - 金刚位
10. `src/components/common/HdDisclaimer.vue` - 免责声明
11. `src/components/common/HdEmpty.vue` - 空状态
12. `src/components/common/HdTag.vue` - 标签
13. `src/components/common/HdButton.vue` - 按钮
14. `src/components/common/HdSkeleton.vue` - 骨架屏
15. `src/components/common/HdCard.vue` - 卡片

---

## 七、后续优化建议

### 高优先级
1. 实现暗色模式（使用 CSS 变量切换）
2. 图片懒加载和 WebP 格式支持
3. 搜索功能增强（历史、建议）

### 中优先级
1. 收藏功能增强（自定义标签、排序）
2. 食谱详情语音播报
3. 制作计时器

### 低优先级
1. 智能推荐算法
2. 社交功能（分享、评论互动）
3. 会员体系

---

## 八、总结

本次重构基于 Linda 的设计文档，全面更新了 Health-Diet 小程序的视觉设计和交互体验。主要改进包括：

1. **设计系统**：建立完整的颜色、字体、间距、阴影系统
2. **视觉升级**：更新所有页面，实现设计文档中的视觉亮点
3. **无障碍支持**：优化字体大小、对比度、触摸目标
4. **组件化**：重构通用组件，提高代码复用性
5. **用户体验**：增强交互反馈，优化空状态、加载状态

重构后的代码保持了原有技术栈（Taro + Vue3），使用 CSS 变量实现设计规范，确保了一致性和可维护性。
