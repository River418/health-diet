# 大字模式与夜间模式 实现计划

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 完善用户页 Tab 中的大字模式和夜间模式功能，实现跨平台（微信小程序、H5、App）即时切换效果。

**Architecture:** 基于 CSS 变量 + class 切换的主题系统。通过 Pinia store 管理主题状态，CSS 变量实现颜色响应，`page.dark-mode` class 覆盖浅色变量，所有页面通过 composable 获取主题 class 绑定。Taro 跨平台兼容：小程序通过 `page` 选择器，H5 通过 `:root` + DOM 操作。

**Tech Stack:** Taro 3.6.23 + Vue 3 + Pinia + SCSS + CSS Custom Properties

---

## 文件结构总览

### 新建文件
- `frontend/src/composables/useTheme.ts` — 深色模式 composable，提供 `darkModeClass` 响应式绑定

### 修改文件
- `frontend/src/styles/variables.scss` — 添加深色模式 SCSS 颜色变量
- `frontend/src/styles/index.scss` — 添加 CSS 变量主题系统 + 深色模式样式
- `frontend/src/stores/accessibility.ts` — 扩展 darkMode 状态和管理方法
- `frontend/src/composables/index.ts` — 导出 `useTheme`
- `frontend/src/app.ts` — 初始化时应用深色模式
- `frontend/src/pages/user/index.vue` — 连接 store，修复 toggle
- `frontend/src/pages/profile/settings/notifications.vue` — 补充字体大小支持

---

### Task 1: 添加深色模式 SCSS 颜色变量

**Files:**
- Modify: `frontend/src/styles/variables.scss:205-208`

- [ ] **Step 1: 在 variables.scss 末尾添加深色模式颜色变量**

在文件末尾（`$category-general: #9E9E9E;` 之后）添加：

```scss
// --------------------------------------------
// 14. 深色模式颜色（Material Design 动态深色方案）
// 基于橄榄绿主色 #6B8E23 生成
// --------------------------------------------
$dark-bg-page: #12130e;              // 深色页面背景
$dark-bg-card: #1e1f19;              // 深色卡片背景
$dark-bg-surface-low: #262720;       // 深色低层表面
$dark-bg-surface-high: #2e2f27;      // 深色高层表面
$dark-bg-surface-highest: #36372e;   // 深色最高层表面
$dark-bg-divider: #2a2b24;           // 深色分割线
$dark-bg-hover: #2a2b24;             // 深色悬浮

$dark-text-primary: #e3e4d8;         // 深色主文字
$dark-text-secondary: #c6c7bb;       // 深色次要文字
$dark-text-tertiary: #a9aa9e;        // 深色三级文字
$dark-text-disabled: #5a5b52;        // 深色禁用文字

$dark-border-color: #44453c;         // 深色边框
$dark-brand-primary: #8BAF4A;        // 深色主色（提亮以适应深色背景）
$dark-brand-light: #a3c45e;          // 深色主色浅
$dark-brand-primary-10: rgba(139, 175, 74, 0.15);

$dark-accent-orange: #FFB74D;        // 深色暖橙
$dark-accent-orange-10: rgba(255, 183, 77, 0.15);
$dark-accent-blue: #90CAF9;          // 深色天蓝
$dark-accent-blue-10: rgba(144, 202, 249, 0.15);
$dark-accent-pink: #F8BBD0;          // 深色粉色
$dark-accent-pink-10: rgba(248, 187, 208, 0.15);
$dark-accent-yellow: #FFE082;        // 深色暖黄
$dark-accent-yellow-10: rgba(255, 224, 130, 0.15);

$dark-success: #66BB6A;              // 深色成功
$dark-warning: #FFCA28;              // 深色警告
$dark-error: #EF5350;                // 深色错误
$dark-info: #64B5F6;                 // 深色信息
```

**Expected:** 文件末尾新增约 30 行深色模式颜色定义。

---

### Task 2: 添加 CSS 变量主题系统

**Files:**
- Modify: `frontend/src/styles/index.scss:1-44`

- [ ] **Step 1: 将 index.scss 中的根元素样式替换为 CSS 变量系统**

将文件开头的根元素样式（第 12-44 行）替换为：

```scss
// --------------------------------------------
// 根元素 CSS 变量（浅色模式默认值）
// --------------------------------------------
:root,
page {
  // 字体缩放
  --font-scale: 1;
  --root-font-size: 16px;

  // 背景颜色
  --bg-page: #{$bg-page};
  --bg-card: #{$bg-card};
  --bg-divider: #{$bg-divider};
  --bg-hover: #{$bg-hover};
  --bg-surface-low: #{$bg-surface-low};
  --bg-surface-high: #{$bg-surface-high};
  --bg-surface-highest: #{$bg-surface-highest};

  // 文字颜色
  --text-primary: #{$text-primary};
  --text-secondary: #{$text-secondary};
  --text-tertiary: #{$text-tertiary};
  --text-disabled: #{$text-disabled};

  // 品牌色
  --brand-primary: #{$brand-primary};
  --brand-light: #{$brand-light};
  --brand-dark: #{$brand-dark};
  --brand-primary-10: #{$brand-primary-10};

  // 辅助色
  --accent-orange: #{$accent-orange};
  --accent-orange-10: #{$accent-orange-10};
  --accent-yellow: #{$accent-yellow};
  --accent-yellow-10: #{$accent-yellow-10};
  --accent-blue: #{$accent-blue};
  --accent-blue-10: #{$accent-blue-10};
  --accent-pink: #{$accent-pink};
  --accent-pink-10: #{$accent-pink-10};

  // 功能色
  --success: #{$success};
  --warning: #{$warning};
  --error: #{$error};
  --info: #{$info};

  // 边框
  --border-color: #{$border-color};
}

// --------------------------------------------
// 大字模式
// --------------------------------------------
page.font-large,
.font-large {
  --font-scale: 1.125;
  --root-font-size: 18px;
}

.font-large {
  font-size: $font-size-base;

  text,
  view,
  label {
    font-size: inherit;
  }
}

// --------------------------------------------
// 深色模式
// --------------------------------------------
page.dark-mode,
.dark-mode {
  --bg-page: #{$dark-bg-page};
  --bg-card: #{$dark-bg-card};
  --bg-divider: #{$dark-bg-divider};
  --bg-hover: #{$dark-bg-hover};
  --bg-surface-low: #{$dark-bg-surface-low};
  --bg-surface-high: #{$dark-bg-surface-high};
  --bg-surface-highest: #{$dark-bg-surface-highest};

  --text-primary: #{$dark-text-primary};
  --text-secondary: #{$dark-text-secondary};
  --text-tertiary: #{$dark-text-tertiary};
  --text-disabled: #{$dark-text-disabled};

  --brand-primary: #{$dark-brand-primary};
  --brand-light: #{$dark-brand-light};
  --brand-primary-10: #{$dark-brand-primary-10};

  --accent-orange: #{$dark-accent-orange};
  --accent-orange-10: #{$dark-accent-orange-10};
  --accent-blue: #{$dark-accent-blue};
  --accent-blue-10: #{$dark-accent-blue-10};
  --accent-pink: #{$dark-accent-pink};
  --accent-pink-10: #{$dark-accent-pink-10};
  --accent-yellow: #{$dark-accent-yellow};
  --accent-yellow-10: #{$dark-accent-yellow-10};

  --success: #{$dark-success};
  --warning: #{$dark-warning};
  --error: #{$dark-error};
  --info: #{$dark-info};

  --border-color: #{$dark-border-color};
}

// --------------------------------------------
// 大字模式 + 深色模式 叠加
// --------------------------------------------
page.font-large.dark-mode,
.font-large.dark-mode {
  --font-scale: 1.125;
  --root-font-size: 18px;
}

// --------------------------------------------
// 页面基础样式
// --------------------------------------------
page {
  font-family: $font-family-base;
  font-size: $font-size-base;
  line-height: $line-height-normal;
  color: var(--text-primary);
  background-color: var(--bg-page);
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
```

- [ ] **Step 2: 将 index.scss 中剩余硬编码颜色改为 CSS 变量**

将文件中所有使用 SCSS 变量的颜色引用改为使用 CSS 变量（通过 `var()`），确保主题切换时自动响应。需要替换的部分：

```scss
// 文本样式
.text-primary { color: var(--text-primary); }
.text-secondary { color: var(--text-secondary); }
.text-tertiary { color: var(--text-tertiary); }
.text-disabled { color: var(--text-disabled); }
.text-brand { color: var(--brand-primary); }
.text-accent { color: var(--accent-orange); }

// 主色调背景
.bg-brand { background-color: var(--brand-primary); }
.bg-brand-light { background-color: var(--brand-light); }
.bg-brand-dark { background-color: var(--brand-dark); }
.bg-page { background-color: var(--bg-page); }
.bg-card { background-color: var(--bg-card); }

// 按钮样式
&-primary {
  height: $btn-height-lg;
  background-color: var(--brand-primary);
  color: #fff;
  box-shadow: $shadow-brand;

  &:active {
    background-color: var(--brand-dark);
    transform: scale(0.96);
  }
}

&-secondary {
  height: $btn-height-lg;
  background-color: var(--bg-card);
  border: 1px solid var(--brand-primary);
  color: var(--brand-primary);

  &:active {
    background-color: var(--brand-primary-10);
  }
}

&-text {
  height: auto;
  padding: $spacing-sm $spacing-md;
  background: transparent;
  color: var(--brand-primary);
  font-size: $font-size-sm;

  &:active {
    color: var(--brand-dark);
  }
}

// 标签样式
&-primary {
  background-color: var(--brand-primary-10);
  color: var(--brand-primary);
}

&-secondary {
  background-color: var(--accent-orange-10);
  color: var(--accent-orange);
}

&-info {
  background-color: var(--accent-blue-10);
  color: var(--accent-blue);
}

&-efficacy {
  padding: 6px 12px;
  border-radius: $radius-full;
  background-color: var(--brand-primary-10);
  color: var(--brand-primary);
}

// 分类筛选标签
&-default {
  background: var(--bg-card);
  border: 1px solid var(--border-color);
  color: var(--text-tertiary);
}

&-active {
  background: var(--brand-primary);
  border: 1px solid var(--brand-primary);
  color: #fff;
}

// 安全提示
.disclaimer {
  background-color: var(--bg-surface-high);

  &__icon {
    color: var(--warning);
  }

  &__text {
    color: var(--warning);
  }
}

// 加载状态
.skeleton {
  background: linear-gradient(90deg, var(--bg-divider) 25%, var(--bg-hover) 50%, var(--bg-divider) 75%);
}

// 空状态
&__icon {
  color: var(--text-disabled);
}

&__title {
  color: var(--text-primary);
}

&__desc {
  color: var(--text-tertiary);
}

// 金刚位
.kingkong {
  background: var(--bg-card);

  &__text {
    color: var(--text-primary);
  }
}

// 列表
.list {
  background: var(--bg-card);

  &-item {
    &:not(:last-child) {
      background: var(--bg-surface-low);
    }

    &:active {
      background: var(--bg-hover);
    }

    &__text {
      color: var(--text-primary);
    }

    &__value {
      color: var(--text-tertiary);
    }

    &__arrow {
      color: var(--text-tertiary);
    }
  }
}

// 评分
.rating {
  &__star {
    color: var(--accent-orange);
  }

  &__score {
    color: var(--accent-orange);
  }

  &__count {
    color: var(--text-tertiary);
  }
}

// 步骤引导
.step {
  &__number {
    background: var(--brand-primary);
  }

  &__title {
    color: var(--text-primary);
  }

  &__desc {
    color: var(--text-secondary);
  }
}

// 聚焦样式
:focus-visible {
  outline: 2px solid var(--brand-primary);
  outline-offset: 2px;
}
```

**Expected:** `index.scss` 全面使用 CSS 变量，深色模式通过 `page.dark-mode` 自动覆盖。

---

### Task 3: 扩展 accessibility store 添加深色模式

**Files:**
- Modify: `frontend/src/stores/accessibility.ts`

- [ ] **Step 1: 添加 darkMode 状态和相关方法**

在 `voiceAssist` ref 之后添加：

```typescript
// 深色模式
const darkMode = ref(false)

// 计算属性：是否是深色模式
const isDarkMode = computed(() => darkMode.value)
```

- [ ] **Step 2: 在 initSettings() 中加载深色模式设置**

在 `initSettings()` 方法中，读取语音辅助设置之后添加：

```typescript
const storedDarkMode = Taro.getStorageSync('accessibility_darkMode')
if (storedDarkMode !== '') {
  darkMode.value = storedDarkMode === true || storedDarkMode === 'true'
}
```

- [ ] **Step 3: 添加 setDarkMode() 和 toggleDarkMode() 方法**

在 `setVoiceAssist()` 方法之后添加：

```typescript
// 设置深色模式
const setDarkMode = (enabled: boolean) => {
  darkMode.value = enabled
  Taro.setStorageSync('accessibility_darkMode', enabled)
  applyDarkMode()
}

// 切换深色模式
const toggleDarkMode = () => {
  darkMode.value = !darkMode.value
  Taro.setStorageSync('accessibility_darkMode', darkMode.value)
  applyDarkMode()
}
```

- [ ] **Step 4: 添加 applyDarkMode() 方法**

在 `applyFontSize()` 方法之后添加：

```typescript
// 应用深色模式到页面
const applyDarkMode = () => {
  const isDark = darkMode.value

  // 保存到 storage，供页面加载时读取
  Taro.setStorageSync('dark_mode_class', isDark ? 'dark-mode' : '')

  // 在 Web/H5 环境下，操作 document.documentElement
  try {
    if (typeof document !== 'undefined' && document.documentElement) {
      if (isDark) {
        document.documentElement.classList.add('dark-mode')
      } else {
        document.documentElement.classList.remove('dark-mode')
      }
    }
  } catch (e) {
    // 忽略非 H5 环境的错误
  }

  // 更新 TabBar 样式
  try {
    if (isDark) {
      Taro.setTabBarStyle({
        color: '#a9aa9e',
        selectedColor: '#8BAF4A',
        backgroundColor: '#1e1f19'
      })
    } else {
      Taro.setTabBarStyle({
        color: '#999999',
        selectedColor: '#6B8E23',
        backgroundColor: '#fefdf1'
      })
    }
  } catch (e) {
    // TabBar 可能还未初始化，忽略
  }

  // 触发全局事件，让所有页面组件响应深色模式变化
  Taro.eventCenter.trigger('accessibility:darkModeChanged', {
    isDark,
    darkMode: darkMode.value
  })
}
```

- [ ] **Step 5: 更新 return 对象**

将 return 对象更新为：

```typescript
return {
  fontSize,
  highContrast,
  followSystemFont,
  voiceAssist,
  darkMode,
  isLargeFont,
  isDarkMode,
  rootFontSize,
  scaleRatio,
  initSettings,
  setFontSize,
  toggleHighContrast,
  setHighContrast,
  toggleFollowSystem,
  setFollowSystem,
  toggleVoiceAssist,
  setVoiceAssist,
  setDarkMode,
  toggleDarkMode,
  applyFontSize,
  applyDarkMode,
  getFontSizeValue,
  speak
}
```

**Expected:** Store 完整管理深色模式状态，支持持久化、TabBar 样式更新和事件通知。

---

### Task 4: 创建 useTheme composable

**Files:**
- Create: `frontend/src/composables/useTheme.ts`
- Modify: `frontend/src/composables/index.ts`

- [ ] **Step 1: 创建 useTheme.ts**

```typescript
import { ref, computed, onMounted, onUnmounted } from 'vue'
import Taro from '@tarojs/taro'
import { useAccessibilityStore } from '../stores/accessibility'

export function useTheme() {
  const accessibilityStore = useAccessibilityStore()
  const isDarkMode = ref(accessibilityStore.isDarkMode)

  const darkModeClass = computed(() => {
    return isDarkMode.value ? 'dark-mode' : ''
  })

  const handleDarkModeChange = (data: { isDark: boolean }) => {
    isDarkMode.value = data.isDark
  }

  const applyTheme = () => {
    isDarkMode.value = accessibilityStore.isDarkMode
  }

  onMounted(() => {
    applyTheme()
    Taro.eventCenter.on('accessibility:darkModeChanged', handleDarkModeChange)
  })

  onUnmounted(() => {
    Taro.eventCenter.off('accessibility:darkModeChanged', handleDarkModeChange)
  })

  return {
    darkModeClass,
    isDarkMode,
    applyTheme
  }
}
```

- [ ] **Step 2: 在 composables/index.ts 中导出 useTheme**

将 `frontend/src/composables/index.ts` 更新为：

```typescript
export { useSceneGuide } from './useSceneGuide'
export { usePageFontSize } from './usePageFontSize'
export { useTheme } from './useTheme'
```

**Expected:** `useTheme` composable 可供所有页面使用，自动响应主题变化。

---

### Task 5: 更新 app.ts 初始化深色模式

**Files:**
- Modify: `frontend/src/app.ts:45-51`

- [ ] **Step 1: 在 onLaunch 中应用深色模式**

将 `onLaunch` 中的初始化部分（第 45-51 行）更新为：

```typescript
// 初始化适老化设置
const accessibilityStore = useAccessibilityStore()
accessibilityStore.initSettings()

// 应用字体大小设置到页面
accessibilityStore.applyFontSize()

// 应用深色模式设置到页面
accessibilityStore.applyDarkMode()
```

**Expected:** 应用启动时正确加载并应用深色模式设置。

---

### Task 6: 修复 user/index.vue 连接 store

**Files:**
- Modify: `frontend/src/pages/user/index.vue`

- [ ] **Step 1: 更新 imports**

将 script 部分的 imports（第 204-210 行）更新为：

```typescript
import { ref, computed, onMounted } from 'vue'
import { useI18n } from 'vue-i18n'
import Taro from '@tarojs/taro'
import HdDisclaimer from '@/components/common/HdDisclaimer.vue'
import { useUserStore } from '@/stores/user'
import { useAccessibilityStore } from '@/stores/accessibility'
import { DEFAULT_IMAGES } from '@/utils/image'
import { usePageFontSize, useTheme } from '@/composables'
```

- [ ] **Step 2: 初始化 store 和移除本地状态**

将第 212-220 行更新为：

```typescript
const { t: $t, locale } = useI18n()
const userStore = useUserStore()
const accessibilityStore = useAccessibilityStore()
const { fontLargeClass } = usePageFontSize()
const { darkModeClass } = useTheme()

// 数据
const userInfo = computed(() => userStore.userInfo)
const defaultAvatar = DEFAULT_IMAGES.avatar
const showLanguageModal = ref(false)
```

**移除**: `const largeFont = ref(false)` 和 `const darkMode = ref(false)`

- [ ] **Step 3: 添加 computed 绑定到 store**

在 `showLanguageModal` 之后添加：

```typescript
// 绑定到 store 状态
const largeFont = computed({
  get: () => accessibilityStore.isLargeFont,
  set: (value: boolean) => {
    accessibilityStore.setFontSize(value ? 'large' : 'normal')
  }
})

const darkMode = computed({
  get: () => accessibilityStore.isDarkMode,
  set: (value: boolean) => {
    accessibilityStore.setDarkMode(value)
  }
})
```

- [ ] **Step 4: 更新 toggle 函数**

将 `toggleLargeFont` 和 `toggleDarkMode` 函数（第 376-388 行）替换为：

```typescript
// 切换大字模式
const toggleLargeFont = (e: any) => {
  accessibilityStore.setFontSize(e.detail.value ? 'large' : 'normal')
}

// 切换夜间模式
const toggleDarkMode = (e: any) => {
  accessibilityStore.setDarkMode(e.detail.value)
}
```

- [ ] **Step 5: 移除 onMounted 中的本地存储读取**

将 `onMounted` 函数（第 435-441 行）更新为：

```typescript
onMounted(() => {
  fetchUserStats()
})
```

**移除**: `largeFont.value = Taro.getStorageSync('largeFont') || false` 和 `darkMode.value = Taro.getStorageSync('darkMode') || false`

- [ ] **Step 6: 更新模板根元素绑定**

将模板第 2 行更新为：

```vue
<view class="user-page" :class="[fontLargeClass, darkModeClass]">
```

**Expected:** 用户页的 toggle 现在直接连接 store，切换即时生效，所有页面通过事件同步更新。

---

### Task 7: 修复 notifications.vue 添加字体支持

**Files:**
- Modify: `frontend/src/pages/profile/settings/notifications.vue`

- [ ] **Step 1: 添加 usePageFontSize 支持**

在 `<script setup>` 中添加：

```typescript
import { usePageFontSize } from '@/composables'

const { fontLargeClass } = usePageFontSize()
```

- [ ] **Step 2: 更新模板根元素**

将根元素更新为：

```vue
<view class="notifications-page" :class="fontLargeClass">
```

**Expected:** notifications 页面现在支持大字模式。

---

### Task 8: 验证构建和跨平台兼容

**Files:**
- All modified files

- [ ] **Step 1: 运行 lint 检查**

```bash
cd frontend && npm run lint
```

- [ ] **Step 2: 尝试 H5 开发构建**

```bash
cd frontend && npm run dev:h5
```

验证无编译错误。

- [ ] **Step 3: 尝试微信小程序构建**

```bash
cd frontend && npm run build:weapp
```

验证无编译错误。

**Expected:** 所有构建成功，无 TypeScript 或 SCSS 错误。

---

## 跨平台兼容性说明

### CSS 变量支持
- **微信小程序**: 基础库 2.13.0+ 支持 CSS 变量（Taro 3.6.23 默认要求基础库 >= 2.13.0）
- **H5**: 完全支持
- **App (iOS/Android)**: Taro 编译到原生时 CSS 变量支持有限，通过 class 切换作为 fallback

### 主题切换机制
1. **H5**: `document.documentElement.classList` 添加/移除 `dark-mode` class，CSS 变量自动响应
2. **小程序**: 通过 `page.dark-mode` 选择器，Taro 编译时 `page` 对应小程序页面根节点
3. **事件通知**: `Taro.eventCenter.trigger/on/off` 跨平台统一 API，所有页面实时响应

### Storage 键名统一
- `accessibility_fontSize` — 字体大小
- `accessibility_darkMode` — 深色模式
- `accessibility_highContrast` — 高对比度
- `accessibility_followSystem` — 跟随系统
- `accessibility_voiceAssist` — 语音辅助

所有键名使用 `accessibility_` 前缀，避免冲突。

---

## 测试验证清单

完成实施后，手动验证以下场景：

1. **大字模式**
   - [ ] 用户页切换大字模式，当前页面立即生效
   - [ ] 切换到其他页面，大字模式保持
   - [ ] 切换回正常字体，所有页面恢复
   - [ ] 重启应用，设置保持

2. **夜间模式**
   - [ ] 用户页切换夜间模式，当前页面立即生效
   - [ ] TabBar 颜色同步变化
   - [ ] 切换到其他页面，深色模式保持
   - [ ] 所有页面元素（卡片、文字、图标、分割线）颜色正确
   - [ ] 切换回浅色模式，所有页面恢复
   - [ ] 重启应用，设置保持

3. **组合模式**
   - [ ] 同时开启大字 + 深色模式，两个效果叠加
   - [ ] 分别关闭，互不影响

4. **跨平台**
   - [ ] H5 模式正常工作
   - [ ] 微信小程序模式正常工作
   - [ ] 抖音小程序模式（如需要）
