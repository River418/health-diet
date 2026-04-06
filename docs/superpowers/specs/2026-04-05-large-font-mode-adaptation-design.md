# 大字模式屏幕适配设计规范

> **目标用户**: 中老年和白领群体
> **核心原则**: 大字模式下内容完整展示，不截断、不溢出，容器随文字自动撑大

---

## 1. 问题概述

当前大字模式（`fontSize: 'large'`）存在以下适配问题：

- **固定高度截断** — 卡片标题、列表行使用固定 `height` + 2 行截断（`-webkit-line-clamp`），文字变大后溢出或被切断
- **硬编码尺寸** — 按钮、行高、图标按钮使用 `height: 36px/40px/48px` 等固定值，不随字号缩放
- **窄网格溢出** — 双列栅栏在小屏幕+大字模式下空间不足，元素被挤出
- **单行布局破裂** — 使用 `white-space: nowrap` 或 `flex-nowrap` 的横向滚动区域，文字换行时溢出

---

## 2. 核心规则

### 2.1 容器高度

**禁止**:
```scss
// 禁止固定高度硬编码
.title { height: 40px; }
.row { height: 56px; }
```

**必须**:
```scss
// 使用 min-height 或 padding 驱动高度
.title { 
  min-height: 40px; 
  padding: 8px 12px;
}
// 或使用 padding 模拟高度
.row {
  padding: 16px;
}
```

### 2.2 文字截断

**禁止**:
```scss
// 禁止硬性截断
.title {
  overflow: hidden;
  -webkit-line-clamp: 2;
}
```

**必须**:
```scss
// 允许自然换行，或使用 flex-wrap
.card-title {
  display: flex;
  flex-wrap: wrap; // 允许换行
}
// 或使用 min-height 容器
```

### 2.3 按钮与交互组件

**禁止**:
```scss
// 禁止固定按钮高度
.btn { height: 40px; }
```

**必须**:
```scss
// 使用 padding + line-height 自动撑大
.btn {
  padding: 10px 20px;
  min-height: 40px; // 最小高度约束
  line-height: 1.5;
}
```

### 2.4 网格布局

**禁止**:
```scss
// 禁止固定列宽 + 固定换行
.grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr); // 大字模式太窄
}
```

**必须**:
```scss
// 大字模式下自动切换为单列
@container (max-width: 360px) {
  .grid {
    grid-template-columns: 1fr;
  }
}
// 或使用 fluid 布局
```

### 2.5 横向滚动区域

**禁止**:
```scss
// 禁止强制单行
.tabs {
  white-space: nowrap;
  overflow-x: auto;
}
```

**必须**:
```scss
// 允许换行
.tabs {
  flex-wrap: wrap; // 或使用 grid 自动换行
}
```

---

## 3. 受影响的组件与页面

### 高优先级（共享组件）

| 组件 | 问题 | 修复方式 |
|------|------|----------|
| `HdButton.vue` | 固定 `height: 36/40/48px` | 改用 `padding` + `min-height` |
| `HdTag.vue` | 固定 `min-height: 40/48px` | 允许高度随内容增长 |
| `RecipeCard.vue` | 2 行截断 + 固定高度 | 移除截断，允许换行 |
| `RecipeCardHorizontal.vue` | 固定 `width: 160px` + 2 行截断 | 移除固定宽度，动态宽度 |
| `SearchBar.vue` | 固定 `height: 56px` | 使用 `min-height` |
| `FilterPicker.vue` | 固定 `height: 56px` 行 + `max-height: 300px` | 移除固定高度，使用 `flex` |

### 中优先级（页面级别）

| 页面 | 问题 | 修复方式 |
|------|------|----------|
| `index/index.vue` | 内容卡片 `height: 40px` + 2 行截断 | 移除固定高度，允许换行 |
| `user/index.vue` | 设置行 `height: 56px` | 使用 `min-height` |
| `category/index.vue` | 侧边栏项 `height: 72px`，标签 `height: 36px` | 使用 `min-height` |
| `favorites/index.vue` | 固定 `100px` 图片高度 + 2 行截断 | 移除固定高度 |
| `profile/settings/*` | 各种固定 `56px` 行 | 使用 `min-height` |

---

## 4. CSS 变量增强

在 `frontend/src/styles/variables.scss` 中补充大字模式专用变量：

```scss
// 大字模式下的间距与尺寸
:root.font-large {
  --spacing-xs: 8px;   // 增大一级
  --spacing-sm: 12px;
  --spacing-md: 16px;
  --spacing-lg: 24px;
  --spacing-xl: 32px;
  
  --component-min-height: 48px; // 最小交互区域
  --card-padding: 16px;
  --list-row-padding: 16px 12px;
}
```

---

## 5. 验证要点

1. **无截断** — 大字模式下所有文本完整显示，无 `...` 截断
2. **无溢出** — 无横向滚动条意外出现，无内容溢出容器
3. **可点击** — 所有按钮、列表行可点击区域不小于 44x44px（WCAG）
4. **可滚动** — 页面可正常滚动，内容不互相遮挡

---

## 6. 待实现

- [ ] 修改共享组件（HdButton、HdTag、RecipeCard 等）
- [ ] 修改高风险页面（index、user、category、favorites 等）
- [ ] 补充大字模式 CSS 变量
- [ ] 验证所有页面在大字模式下的可用性

---

## 7. 技术说明

- **框架**: Taro 3.x + Vue 3
- **状态**: Pinia `accessibility.ts` store 提供 `isLargeFont` 布尔值
- **样式**: SCSS，使用 CSS 变量驱动字号缩放
- **兼容性**: 微信小程序 + 抖音小程序