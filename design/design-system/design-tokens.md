# Health-Diet 设计系统规范

## 1. 设计概述

Health-Diet 是一款面向中老年和白领群体的养生食疗配方查询小程序。设计系统遵循**简洁、温暖、专业**的原则，兼顾年轻用户的审美偏好和中老年用户的可读性需求。

### 1.1 设计原则
- **清晰易读**：大字号、高对比度，确保中老年用户轻松阅读
- **温暖亲和**：绿色主色调传递健康、自然的品牌调性
- **简洁高效**：信息层级清晰，减少认知负担
- **适老友好**：支持大字模式，触控区域充足

---

## 2. 色彩系统 (Color System)

### 2.1 主色调 (Primary Colors)

| 名称 | 色值 | 用途 |
|------|------|------|
| Primary | `#4CAF50` | 主按钮、标签、选中状态、品牌标识 |
| Primary Dark | `#388E3C` | 按钮按下状态、Hover状态 |
| Primary Light | `#C8E6C9` | 背景、边框、轻量强调 |
| Primary Lighter | `#E8F5E9` | 浅色背景、选中背景 |

### 2.2 辅助色 (Secondary Colors)

| 名称 | 色值 | 用途 |
|------|------|------|
| Secondary Orange | `#FF9800` | 评分、收藏、强调、热度标识 |
| Secondary Blue | `#2196F3` | 链接、信息提示、可点击文字 |
| Secondary Red | `#F44336` | 错误、删除、警告、取消操作 |
| Secondary Purple | `#9C27B0` | 特殊标签、VIP标识 |

### 2.3 语义色 (Semantic Colors)

| 名称 | 色值 | 用途 |
|------|------|------|
| Success | `#4CAF50` | 成功提示、完成状态 |
| Warning | `#FF9800` | 警告提示、注意事项 |
| Error | `#F44336` | 错误提示、失败状态 |
| Info | `#2196F3` | 信息提示、帮助说明 |

### 2.4 中性色 (Neutral Colors)

| 名称 | 色值 | 用途 |
|------|------|------|
| Text Primary | `#333333` | 主标题、重要文字 |
| Text Secondary | `#666666` | 正文、描述文字 |
| Text Tertiary | `#999999` | 辅助信息、时间、提示 |
| Text Disabled | `#CCCCCC` | 禁用状态、不可点击 |
| Border | `#EEEEEE` | 分割线、边框、描边 |
| Background | `#F5F5F5` | 页面背景、列表背景 |
| Surface | `#FFFFFF` | 卡片背景、内容区、浮层 |

### 2.5 特殊用途色

| 名称 | 色值 | 用途 |
|------|------|------|
| Disclaimer BG | `#FFF3CD` | 免责声明背景 |
| Disclaimer Border | `#FFE082` | 免责声明边框 |
| Disclaimer Text | `#856404` | 免责声明文字 |
| Mask | `rgba(0,0,0,0.5)` | 遮罩层、弹窗背景 |
| Shadow | `rgba(0,0,0,0.1)` | 阴影颜色 |

---

## 3. 字体系统 (Typography)

### 3.1 字体族

```css
/* 中文 */
font-family: -apple-system, BlinkMacSystemFont, "PingFang SC", "Hiragino Sans GB", "Microsoft YaHei", "Helvetica Neue", sans-serif;

/* 英文/数字 */
font-family: "SF Pro Display", "SF Pro Text", "Roboto", "Helvetica Neue", Arial, sans-serif;
```

### 3.2 字号规范 (标准模式)

| 级别 | 字号 | 字重 | 行高 | 用途 |
|------|------|------|------|------|
| Display | 28px | Bold (700) | 1.3 | 页面大标题、品牌展示 |
| H1 | 24px | Bold (700) | 1.4 | 页面标题、重要标题 |
| H2 | 20px | Semibold (600) | 1.4 | 卡片标题、模块标题 |
| H3 | 18px | Medium (500) | 1.5 | 列表标题、小标题 |
| Body Large | 16px | Regular (400) | 1.6 | 重要正文、按钮文字 |
| Body | 14px | Regular (400) | 1.6 | 正文内容、描述 |
| Caption | 12px | Regular (400) | 1.5 | 辅助信息、标签、时间 |
| Small | 10px | Regular (400) | 1.4 | 角标、最小文字 |

### 3.3 字号规范 (大字模式 - 适老化)

| 级别 | 字号 | 字重 | 行高 | 用途 |
|------|------|------|------|------|
| Display | 32px | Bold (700) | 1.3 | 页面大标题 |
| H1 | 28px | Bold (700) | 1.4 | 页面标题 |
| H2 | 24px | Semibold (600) | 1.4 | 卡片标题 |
| H3 | 22px | Medium (500) | 1.5 | 列表标题 |
| Body Large | 20px | Regular (400) | 1.6 | 重要正文 |
| Body | 18px | Regular (400) | 1.6 | 正文内容 |
| Caption | 16px | Regular (400) | 1.5 | 辅助信息 |
| Small | 14px | Regular (400) | 1.4 | 角标 |

### 3.4 字体使用规范

| 场景 | 字号 | 字重 | 颜色 |
|------|------|------|------|
| 导航栏标题 | 18px | Semibold | Text Primary |
| 页面标题 | 20px | Bold | Text Primary |
| 卡片标题 | 16px | Semibold | Text Primary |
| 正文内容 | 14px | Regular | Text Secondary |
| 按钮文字 | 16px | Medium | 根据按钮类型 |
| 标签文字 | 12px | Medium | 根据标签类型 |
| 辅助说明 | 12px | Regular | Text Tertiary |
| 时间/来源 | 11px | Regular | Text Tertiary |

---

## 4. 间距系统 (Spacing System)

### 4.1 基础间距 (8pt Grid)

| Token | 值 | 用途 |
|-------|------|------|
| space-1 | 4px | 图标与文字间距、紧凑内联间距 |
| space-2 | 8px | 小元素间距、紧凑布局 |
| space-3 | 12px | 标准元素间距 |
| space-4 | 16px | 默认间距、卡片内边距 |
| space-5 | 20px | 中等间距 |
| space-6 | 24px | 模块间距、区块间距 |
| space-8 | 32px | 大间距、section间距 |
| space-10 | 40px | 超大间距、页面边距 |
| space-12 | 48px | 特殊大间距 |

### 4.2 页面边距

| 场景 | 值 | 说明 |
|------|------|------|
| 页面水平边距 | 16px | 标准页面左右边距 |
| 页面水平边距(平板) | 24px | 大屏设备边距 |
| 内容区最大宽度 | 750px | 内容区最大宽度限制 |

### 4.3 组件间距

| 组件 | 内边距 | 外边距 |
|------|--------|--------|
| 卡片 | 16px | 12px 0 |
| 列表项 | 16px | 0 |
| 按钮(标准) | 12px 24px | 8px |
| 按钮(大) | 16px 32px | 12px |
| 输入框 | 12px 16px | 16px 0 |
| 标签 | 4px 12px | 4px |

---

## 5. 圆角系统 (Border Radius)

| Token | 值 | 用途 |
|-------|------|------|
| radius-sm | 4px | 标签、小按钮、紧凑元素 |
| radius-md | 8px | 卡片、输入框、图片 |
| radius-lg | 12px | 大按钮、弹窗、浮层 |
| radius-xl | 16px | 特殊卡片、模态框 |
| radius-full | 9999px | 胶囊按钮、头像、圆形元素 |
| radius-circle | 50% | 正圆形元素 |

---

## 6. 阴影系统 (Shadow System)

| Token | 值 | 用途 |
|-------|------|------|
| shadow-sm | `0 1px 2px rgba(0,0,0,0.05)` | 轻微阴影、内阴影 |
| shadow-md | `0 2px 4px rgba(0,0,0,0.1)` | 卡片默认阴影 |
| shadow-lg | `0 4px 8px rgba(0,0,0,0.1)` | 悬浮卡片、下拉菜单 |
| shadow-xl | `0 8px 16px rgba(0,0,0,0.1)` | 弹窗、模态框 |
| shadow-2xl | `0 16px 32px rgba(0,0,0,0.15)` | 特殊强调、抽屉 |

---

## 7. 图标系统 (Icon System)

### 7.1 图标尺寸

| 尺寸 | 值 | 用途 |
|------|------|------|
| Icon XS | 12px | 内联小图标、角标 |
| Icon SM | 16px | 紧凑空间、列表辅助 |
| Icon MD | 20px | 按钮内图标、导航 |
| Icon LG | 24px | 标准图标、金刚位 |
| Icon XL | 32px | 大按钮、功能入口 |
| Icon 2XL | 48px | 金刚位、大功能入口 |
| Icon 3XL | 64px | 空状态、引导页 |

### 7.2 图标风格
- 线性图标 (Outline): 默认使用，简洁清晰
- 填充图标 (Filled): 选中状态、强调状态
- 双色图标: 金刚位、特殊功能入口

### 7.3 金刚位图标 (48px)
- 中老年养生: 👴 老人图标
- 白领调理: 💼 公文包图标
- 节气养生: 🌸 花朵/节气图标
- 补气养血: 🩸 血滴/心脏图标
- 健脾养胃: 🍚 米饭/胃图标
- 安神助眠: 🌙 月亮/睡眠图标
- 美容养颜: ✨ 美容/面膜图标
- 更多分类: ➕ 更多/网格图标

---

## 8. 动画与过渡 (Animation)

### 8.1 过渡时长

| Token | 值 | 用途 |
|-------|------|------|
| duration-fast | 150ms | 快速反馈、hover效果 |
| duration-normal | 300ms | 标准过渡、页面切换 |
| duration-slow | 500ms | 复杂动画、强调效果 |

### 8.2 缓动函数

| Token | 值 | 用途 |
|-------|------|------|
| ease-default | `cubic-bezier(0.4, 0, 0.2, 1)` | 标准过渡 |
| ease-in | `cubic-bezier(0.4, 0, 1, 1)` | 进入动画 |
| ease-out | `cubic-bezier(0, 0, 0.2, 1)` | 退出动画 |
| ease-bounce | `cubic-bezier(0.68, -0.55, 0.265, 1.55)` | 弹性效果 |

### 8.3 页面转场

| 转场 | 动画 | 时长 | 缓动 |
|------|------|------|------|
| Push | 从右向左滑入 | 300ms | ease-default |
| Pop | 从左向右滑出 | 300ms | ease-default |
| Modal | 从底部向上滑入 | 300ms | ease-out |
| Fade | 淡入淡出 | 200ms | ease-default |
| Scale | 缩放出现 | 300ms | ease-bounce |

---

## 9. 响应式断点

| 断点 | 宽度 | 设备类型 |
|------|------|---------|
| Mobile SM | < 360px | 小屏手机 |
| Mobile MD | 360px - 400px | 标准手机 |
| Mobile LG | 400px - 450px | 大屏手机 |
| Tablet | > 450px | 平板设备 |

---

## 10. 设计Token汇总

### 10.1 CSS Variables

```css
:root {
  /* Colors - Primary */
  --color-primary: #4CAF50;
  --color-primary-dark: #388E3C;
  --color-primary-light: #C8E6C9;
  --color-primary-lighter: #E8F5E9;
  
  /* Colors - Secondary */
  --color-secondary-orange: #FF9800;
  --color-secondary-blue: #2196F3;
  --color-secondary-red: #F44336;
  --color-secondary-purple: #9C27B0;
  
  /* Colors - Semantic */
  --color-success: #4CAF50;
  --color-warning: #FF9800;
  --color-error: #F44336;
  --color-info: #2196F3;
  
  /* Colors - Neutral */
  --color-text-primary: #333333;
  --color-text-secondary: #666666;
  --color-text-tertiary: #999999;
  --color-text-disabled: #CCCCCC;
  --color-border: #EEEEEE;
  --color-background: #F5F5F5;
  --color-surface: #FFFFFF;
  
  /* Spacing */
  --space-1: 4px;
  --space-2: 8px;
  --space-3: 12px;
  --space-4: 16px;
  --space-5: 20px;
  --space-6: 24px;
  --space-8: 32px;
  --space-10: 40px;
  
  /* Border Radius */
  --radius-sm: 4px;
  --radius-md: 8px;
  --radius-lg: 12px;
  --radius-xl: 16px;
  --radius-full: 9999px;
  
  /* Shadows */
  --shadow-sm: 0 1px 2px rgba(0,0,0,0.05);
  --shadow-md: 0 2px 4px rgba(0,0,0,0.1);
  --shadow-lg: 0 4px 8px rgba(0,0,0,0.1);
  --shadow-xl: 0 8px 16px rgba(0,0,0,0.1);
  
  /* Typography */
  --font-family: -apple-system, BlinkMacSystemFont, "PingFang SC", "Hiragino Sans GB", "Microsoft YaHei", sans-serif;
  
  /* Animation */
  --duration-fast: 150ms;
  --duration-normal: 300ms;
  --duration-slow: 500ms;
}
```

---

## 11. 适老化设计规范

### 11.1 大字模式
- 所有字号提升 2-4px
- 按钮高度最低 56px
- 点击区域增大 20%
- 行高保持 1.5-1.6

### 11.2 高对比度
- 文字对比度 ≥ 4.5:1
- 重要按钮使用填充样式
- 避免使用纯灰色按钮

### 11.3 触控友好
- 按钮最小尺寸 44x44px (标准) / 56x56px (大字模式)
- 列表项高度最低 56px
- 增加元素间距，避免误触

### 11.4 视觉清晰
- 图标尺寸不小于 24px
- 重要信息使用图标+文字组合
- 避免使用纯图标按钮

---

*文档版本: v1.0*  
*创建时间: 2026-03-10*  
*适用项目: Health-Diet 食疗养生小程序*
