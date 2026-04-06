# 大字模式屏幕适配实现计划

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 修复大字模式下的布局溢出问题，实现容器随文字自动撑大，内容完整展示不截断

**Architecture:** 基于 CSS 变量驱动的字号缩放，通过替换固定高度为 min-height/padding、移除硬性截断、允许网格流式换行来实现适配

**Tech Stack:** Taro 3.x + Vue 3 + SCSS + Pinia

---

## 文件结构概览

本次修改涉及以下模块：

| 类型 | 文件 |
|------|------|
| 共享组件 | `frontend/src/components/common/HdButton.vue`, `HdTag.vue` |
| 业务组件 | `frontend/src/components/business/RecipeCard.vue`, `RecipeCardHorizontal.vue`, `SearchBar.vue`, `FilterPicker.vue` |
| 页面 | `frontend/src/pages/index/index.vue`, `user/index.vue`, `category/index.vue`, `favorites/index.vue` |
| 样式 | `frontend/src/styles/variables.scss`, `index.scss` |

---

## Task 1: HdButton.vue 按钮组件适配

**Files:**
- Modify: `frontend/src/components/common/HdButton.vue:80-97`

- [ ] **Step 1: 读取当前 HdButton 样式并确认需要修改的位置**

读取 `frontend/src/styles/variables.scss` 中的按钮高度变量 `$btn-height-sm/md/lg`，确认当前硬编码高度位置

- [ ] **Step 2: 修改 small 尺寸样式**

```scss
// 原代码 (80-85行)
&--small {
  height: $btn-height-sm;
  padding: 0 $spacing-lg;
  font-size: $font-size-sm;
}

// 修改为
&--small {
  min-height: $btn-height-sm;
  padding: 8px $spacing-lg;
  font-size: $font-size-sm;
  line-height: 1.5;
}
```

- [ ] **Step 3: 修改 medium 尺寸样式**

```scss
// 原代码 (87-91行)
&--medium {
  height: $btn-height-md;
  padding: 0 $spacing-xl;
  font-size: $font-size-base;
}

// 修改为
&--medium {
  min-height: $btn-height-md;
  padding: 12px $spacing-xl;
  font-size: $font-size-base;
  line-height: 1.5;
}
```

- [ ] **Step 4: 修改 large 尺寸样式**

```scss
// 原代码 (93-97行)
&--large {
  height: $btn-height-lg;
  padding: 0 $spacing-xxl;
  font-size: $font-size-md;
}

// 修改为
&--large {
  min-height: $btn-height-lg;
  padding: 14px $spacing-xxl;
  font-size: $font-size-md;
  line-height: 1.5;
}
```

- [ ] **Step 5: 验证编译通过**

运行: `cd frontend && npm run build:h5` 或在开发者工具中检查
预期: 无编译错误

---

## Task 2: HdTag.vue 标签组件适配

**Files:**
- Modify: `frontend/src/components/common/HdTag.vue:40-60`

- [ ] **Step 1: 读取 HdTag.vue 样式部分**

确认当前标签的固定高度和 line-height 样式位置

- [ ] **Step 2: 修改 small 尺寸样式**

```scss
// 查找并修改 small 尺寸样式
&--small {
  min-height: 32px;  // 从固定高度改为 min-height
  padding: 4px 10px;
  font-size: $font-size-xs;
  line-height: 1.5;
}
```

- [ ] **Step 3: 修改 medium 尺寸样式**

```scss
&--medium {
  min-height: 40px;  // 从固定高度改为 min-height
  padding: 6px 14px;
  font-size: $font-size-sm;
  line-height: 1.5;
}
```

- [ ] **Step 4: 验证编译通过**

预期: 无编译错误

---

## Task 3: RecipeCard.vue 食谱卡片适配

**Files:**
- Modify: `frontend/src/components/business/RecipeCard.vue:118-130`

- [ ] **Step 1: 读取 RecipeCard.vue 样式部分第 118-130 行**

- [ ] **Step 2: 修改标题样式，移除 2 行截断**

```scss
// 原代码 (118-130行)
&__title {
  display: block;
  font-size: 15px;
  font-weight: $font-weight-medium;
  color: $text-primary;
  margin-bottom: 8px;
  line-height: 1.4;
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
}

// 修改为 - 允许换行
&__title {
  display: block;
  font-size: 15px;
  font-weight: $font-weight-medium;
  color: $text-primary;
  margin-bottom: 8px;
  line-height: 1.4;
  word-wrap: break-word;
  word-break: break-all;
}
```

- [ ] **Step 3: 调整内容区域 padding 以适应大字模式**

```scss
// 在 &__content 样式中增加 bottom padding
&__content {
  padding: 12px;
  padding-bottom: 16px;  // 增大底部间距适应换行
}
```

- [ ] **Step 4: 验证编译通过**

预期: 无编译错误

---

## Task 4: RecipeCardHorizontal.vue 横向食谱卡片适配

**Files:**
- Modify: `frontend/src/components/business/RecipeCardHorizontal.vue`

- [ ] **Step 1: 读取 RecipeCardHorizontal.vue 样式部分**

查找固定宽度和高度的位置

- [ ] **Step 2: 移除固定宽度约束**

```scss
// 原代码可能包含
.recipe-card-horizontal {
  width: 160px;
  flex-shrink: 0;
}

// 修改为
.recipe-card-horizontal {
  min-width: 160px;  // 改为 min-width
  flex: 1;
  max-width: 200px;  // 添加最大宽度限制
}
```

- [ ] **Step 3: 移除标题截断**

找到 `-webkit-line-clamp: 2` 相关样式并移除截断，改为允许换行

- [ ] **Step 4: 验证编译通过**

预期: 无编译错误

---

## Task 5: SearchBar.vue 搜索栏适配

**Files:**
- Modify: `frontend/src/components/business/SearchBar.vue`

- [ ] **Step 1: 读取 SearchBar.vue 样式部分**

查找固定 height 位置

- [ ] **Step 2: 修改搜索栏整体高度**

```scss
// 原代码
.search-bar {
  height: 56px;
}

// 修改为
.search-bar {
  min-height: 56px;
  padding: 8px 0;
}
```

- [ ] **Step 3: 修改输入框高度**

确保输入框也是 min-height 而非固定 height

- [ ] **Step 4: 验证编译通过**

预期: 无编译错误

---

## Task 6: FilterPicker.vue 筛选器组件适配

**Files:**
- Modify: `frontend/src/components/business/FilterPicker.vue`

- [ ] **Step 1: 读取 FilterPicker.vue 样式部分**

查找固定高度行和 max-height 列表容器

- [ ] **Step 2: 修改行高度为 min-height**

```scss
// 原代码
.filter-picker__row {
  height: 56px;
}

// 修改为
.filter-picker__row {
  min-height: 56px;
  padding: 12px 16px;
}
```

- [ ] **Step 3: 移除列表容器固定高度**

```scss
// 原代码
.filter-picker__list {
  max-height: 300px;
}

// 修改为
.filter-picker__list {
  max-height: none;  // 移除固定高度，允许内容自然延伸
  flex: 1;
}
```

- [ ] **Step 4: 验证编译通过**

预期: 无编译错误

---

## Task 7: index/index.vue 首页适配

**Files:**
- Modify: `frontend/src/pages/index/index.vue`

- [ ] **Step 1: 读取 index.vue 样式部分**

查找内容卡片标题的固定高度和截断样式

- [ ] **Step 2: 修改首页内容卡片标题**

移除 `height: 40px` 和 2 行截断，允许标题自然换行

- [ ] **Step 3: 调整网格布局**

如果首页使用 2 列网格，考虑在大字模式下改为单列或增加列间距

- [ ] **Step 4: 验证编译通过**

预期: 无编译错误

---

## Task 8: user/index.vue 用户页适配

**Files:**
- Modify: `frontend/src/pages/user/index.vue`

- [ ] **Step 1: 读取 user/index.vue 样式部分**

查找设置行固定高度

- [ ] **Step 2: 修改设置行样式**

```scss
// 原代码
.user-row {
  height: 56px;
}

// 修改为
.user-row {
  min-height: 56px;
  padding: 16px;
}
```

- [ ] **Step 3: 验证编译通过**

预期: 无编译错误

---

## Task 9: category/index.vue 分类页适配

**Files:**
- Modify: `frontend/src/pages/category/index.vue`

- [ ] **Step 1: 读取 category/index.vue 样式部分**

查找侧边栏项和标签的固定高度

- [ ] **Step 2: 修改侧边栏项高度**

```scss
// 原代码
.sidebar-item {
  height: 72px;
}

// 修改为
.sidebar-item {
  min-height: 72px;
  padding: 12px 8px;
}
```

- [ ] **Step 3: 修改标签高度**

```scss
// 原代码
.solar-tag {
  height: 36px;
}

// 修改为
.solar-tag {
  min-height: 36px;
  padding: 8px 12px;
}
```

- [ ] **Step 4: 验证编译通过**

预期: 无编译错误

---

## Task 10: favorites/index.vue 收藏页适配

**Files:**
- Modify: `frontend/src/pages/favorites/index.vue`

- [ ] **Step 1: 读取 favorites/index.vue 样式部分**

查找固定图片高度和标题截断

- [ ] **Step 2: 修改列表项样式**

移除固定图片高度，改为 aspect-ratio 或自然高度

- [ ] **Step 3: 移除标题截断**

移除 `-webkit-line-clamp: 2` 相关样式

- [ ] **Step 4: 验证编译通过**

预期: 无编译错误

---

## Task 11: CSS 变量增强

**Files:**
- Modify: `frontend/src/styles/variables.scss`

- [ ] **Step 1: 读取 variables.scss**

- [ ] **Step 2: 添加大字模式专用变量**

```scss
// 在文件末尾添加大字模式变量
:root.font-large {
  --spacing-xs: 8px;
  --spacing-sm: 12px;
  --spacing-md: 16px;
  --spacing-lg: 24px;
  --spacing-xl: 32px;
  
  --component-min-height: 48px;
  --card-padding: 16px;
  --list-row-padding: 16px 12px;
}
```

- [ ] **Step 3: 验证编译通过**

预期: 无编译错误

---

## 验证清单

实现完成后，执行以下验证：

1. **字号切换测试** — 在应用中切换大字模式开关，观察各页面布局变化
2. **无截断验证** — 确认所有卡片标题、列表项文字完整显示，无 `...` 截断
3. **无溢出验证** — 确认无意外横向滚动条，内容不溢出容器
4. **可点击区域** — 确认按钮、列表行可点击区域不小于 44x44px
5. **编译检查** — `npm run build:h5` 无错误

---

## 提交记录

每完成一个任务后执行提交：

```bash
git add frontend/src/components/.../xxx.vue
git commit -m "fix: 移除 HdButton 固定高度，改用 min-height 适配大字模式"
```

建议按以下顺序提交：
1. HdButton.vue
2. HdTag.vue
3. RecipeCard.vue
4. RecipeCardHorizontal.vue
5. SearchBar.vue
6. FilterPicker.vue
7. index/index.vue
8. user/index.vue
9. category/index.vue
10. favorites/index.vue
11. variables.scss