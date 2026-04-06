# Platform-Aware Login Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Replace the explicit login page flow with an on-demand, platform-aware login guard that automatically uses WeChat login in WeChat Mini Program builds and Douyin login in Douyin Mini Program builds.

**Architecture:** Introduce a focused auth service layer in `frontend/src/services/auth/` for platform detection, login execution, and guarded action continuation. Remove app-launch auto-login, extend the user store to persist refresh tokens, and migrate existing “go to login page” call sites to the shared guard.

**Tech Stack:** Taro 3.x, Vue 3, Pinia, TypeScript, Vitest

---

### Task 1: Normalize auth response and user-store persistence

**Files:**
- Modify: `frontend/src/api/auth.ts`
- Modify: `frontend/src/stores/user.ts`
- Modify: `frontend/src/utils/request.ts`
- Test: `frontend/src/services/auth/__tests__/login-state.test.ts`

- [ ] **Step 1: Write the failing test for token + refresh token persistence**

```ts
import { beforeEach, describe, expect, it, vi } from 'vitest'
import { createPinia, setActivePinia } from 'pinia'

const storage = new Map<string, unknown>()

vi.mock('@tarojs/taro', () => ({
  default: {
    setStorageSync: vi.fn((key: string, value: unknown) => storage.set(key, value)),
    getStorageSync: vi.fn((key: string) => storage.get(key)),
    removeStorageSync: vi.fn((key: string) => storage.delete(key))
  }
}))

import { useUserStore } from '@/stores/user'

describe('user auth persistence', () => {
  beforeEach(() => {
    storage.clear()
    setActivePinia(createPinia())
  })

  it('persists refresh token and restores it from storage', () => {
    const userStore = useUserStore()

    userStore.setAuthSession({
      token: 'token-1',
      refreshToken: 'refresh-1',
      user: {
        id: 1,
        nickname: '微信用户',
        avatar: '/avatar.png',
        language: 'zh-CN'
      }
    })

    const reloadedStore = useUserStore()
    reloadedStore.initFromStorage()

    expect(reloadedStore.token).toBe('token-1')
    expect(reloadedStore.refreshToken).toBe('refresh-1')
    expect(reloadedStore.userInfo?.nickname).toBe('微信用户')
  })
})
```

- [ ] **Step 2: Run test to verify it fails**

Run: `npm test -- login-state.test.ts`
Expected: FAIL because `setAuthSession` and `refreshToken` do not exist on the user store.

- [ ] **Step 3: Update auth API typing to match the real response shape**

```ts
import { post, type ApiResponse } from '@/utils/request'

export interface LoginUser {
  id: number
  nickname: string
  avatar: string
  language: string
}

export interface LoginPayload {
  user: LoginUser
  token: string
  refreshToken: string
  expiresIn: string
  isNewUser: boolean
}

export const wechatLogin = (code: string) => {
  return post<LoginPayload>('/auth/wechat/login', { code }, false)
}

export const douyinLogin = (code: string, anonymousCode?: string) => {
  return post<LoginPayload>('/auth/douyin/login', { code, anonymous_code: anonymousCode }, false)
}
```

- [ ] **Step 4: Extend the user store with refresh-token aware session methods**

```ts
const refreshToken = ref<string>('')

const setRefreshToken = (newRefreshToken: string) => {
  refreshToken.value = newRefreshToken
  Taro.setStorageSync('refreshToken', newRefreshToken)
}

const setAuthSession = (session: {
  token: string
  refreshToken: string
  user: UserInfo
}) => {
  setToken(session.token)
  setRefreshToken(session.refreshToken)
  setUserInfo(session.user)
}

const initFromStorage = () => {
  const storedToken = Taro.getStorageSync('token')
  const storedRefreshToken = Taro.getStorageSync('refreshToken')
  const storedUserInfo = Taro.getStorageSync('userInfo')

  if (storedToken) token.value = storedToken
  if (storedRefreshToken) refreshToken.value = storedRefreshToken
  if (storedUserInfo) userInfo.value = storedUserInfo
}

const logout = () => {
  token.value = ''
  refreshToken.value = ''
  userInfo.value = null
  Taro.removeStorageSync('token')
  Taro.removeStorageSync('refreshToken')
  Taro.removeStorageSync('userInfo')
}
```

- [ ] **Step 5: Keep request refresh flow aligned with the store**

```ts
if (response.success && response.data) {
  userStore.setToken(response.data.token)
  return true
}
```

Keep the current refresh request, but replace any direct assumptions about ad-hoc storage with the updated store contract.

- [ ] **Step 6: Run test to verify it passes**

Run: `npm test -- login-state.test.ts`
Expected: PASS

- [ ] **Step 7: Commit**

```bash
git add frontend/src/api/auth.ts frontend/src/stores/user.ts frontend/src/utils/request.ts frontend/src/services/auth/__tests__/login-state.test.ts
git commit -m "refactor: normalize login session persistence"
```

### Task 2: Add platform detection and on-demand login service

**Files:**
- Create: `frontend/src/services/auth/platform.ts`
- Create: `frontend/src/services/auth/login.ts`
- Modify: `frontend/src/app.ts`
- Test: `frontend/src/services/auth/__tests__/login-service.test.ts`

- [ ] **Step 1: Write the failing tests for platform-aware login**

```ts
import { beforeEach, describe, expect, it, vi } from 'vitest'

const loginMock = vi.fn()
const wechatLoginMock = vi.fn()
const douyinLoginMock = vi.fn()
const showToastMock = vi.fn()

vi.mock('@tarojs/taro', () => ({
  default: {
    ENV_TYPE: { WEAPP: 'WEAPP', TT: 'TT' },
    getEnv: vi.fn(),
    login: loginMock,
    showToast: showToastMock
  }
}))

vi.mock('@/api/auth', () => ({
  wechatLogin: wechatLoginMock,
  douyinLogin: douyinLoginMock
}))

describe('loginByCurrentPlatform', () => {
  beforeEach(() => {
    vi.clearAllMocks()
  })

  it('uses wechat login in WEAPP env', async () => {
    const Taro = (await import('@tarojs/taro')).default
    vi.mocked(Taro.getEnv).mockReturnValue(Taro.ENV_TYPE.WEAPP)
    loginMock.mockResolvedValue({ code: 'wx-code' })
    wechatLoginMock.mockResolvedValue({ success: true, data: { token: 't', refreshToken: 'r', user: { id: 1, nickname: 'wx', avatar: '', language: 'zh-CN' }, expiresIn: '7d', isNewUser: false } })

    const { loginByCurrentPlatform } = await import('@/services/auth/login')
    const result = await loginByCurrentPlatform()

    expect(wechatLoginMock).toHaveBeenCalledWith('wx-code')
    expect(result.success).toBe(true)
  })

  it('uses douyin login in TT env', async () => {
    const Taro = (await import('@tarojs/taro')).default
    vi.mocked(Taro.getEnv).mockReturnValue(Taro.ENV_TYPE.TT)
    loginMock.mockResolvedValue({ code: 'dy-code', anonymousCode: 'anon-1' })
    douyinLoginMock.mockResolvedValue({ success: true, data: { token: 't', refreshToken: 'r', user: { id: 2, nickname: 'dy', avatar: '', language: 'zh-CN' }, expiresIn: '7d', isNewUser: true } })

    const { loginByCurrentPlatform } = await import('@/services/auth/login')
    const result = await loginByCurrentPlatform()

    expect(douyinLoginMock).toHaveBeenCalledWith('dy-code', 'anon-1')
    expect(result.success).toBe(true)
  })

  it('rejects unsupported envs', async () => {
    const Taro = (await import('@tarojs/taro')).default
    vi.mocked(Taro.getEnv).mockReturnValue('WEB' as never)

    const { loginByCurrentPlatform } = await import('@/services/auth/login')
    const result = await loginByCurrentPlatform()

    expect(result.success).toBe(false)
    expect(showToastMock).toHaveBeenCalled()
  })
})
```

- [ ] **Step 2: Run test to verify it fails**

Run: `npm test -- login-service.test.ts`
Expected: FAIL because `platform.ts` and `login.ts` do not exist.

- [ ] **Step 3: Create the platform detection helper**

```ts
import Taro from '@tarojs/taro'

export type LoginPlatform = 'wechat' | 'douyin' | 'unsupported'

export const getLoginPlatform = (): LoginPlatform => {
  const env = Taro.getEnv()

  if (env === Taro.ENV_TYPE.WEAPP) {
    return 'wechat'
  }

  if (env === Taro.ENV_TYPE.TT) {
    return 'douyin'
  }

  return 'unsupported'
}
```

- [ ] **Step 4: Create the login service with in-flight protection**

```ts
import Taro from '@tarojs/taro'
import { wechatLogin, douyinLogin } from '@/api/auth'
import { useUserStore } from '@/stores/user'
import { getLoginPlatform } from './platform'

type LoginSuccess = { success: true }
type LoginFailure = { success: false; reason: 'unsupported' | 'cancelled' | 'failed' }
export type LoginResult = LoginSuccess | LoginFailure

let inFlightLogin: Promise<LoginResult> | null = null

const runLogin = async (): Promise<LoginResult> => {
  const userStore = useUserStore()
  const platform = getLoginPlatform()

  if (platform === 'unsupported') {
    Taro.showToast({ title: '当前环境暂不支持快捷登录', icon: 'none' })
    return { success: false, reason: 'unsupported' }
  }

  try {
    const loginRes = platform === 'wechat'
      ? await Taro.login()
      : await Taro.login({ force: true })

    if (!loginRes.code) {
      Taro.showToast({ title: '授权失败，请重试', icon: 'none' })
      return { success: false, reason: 'cancelled' }
    }

    const response = platform === 'wechat'
      ? await wechatLogin(loginRes.code)
      : await douyinLogin(loginRes.code, loginRes.anonymousCode)

    if (!response.data) {
      Taro.showToast({ title: '登录失败，请稍后再试', icon: 'none' })
      return { success: false, reason: 'failed' }
    }

    userStore.setAuthSession({
      token: response.data.token,
      refreshToken: response.data.refreshToken,
      user: response.data.user
    })

    return { success: true }
  } catch (error) {
    Taro.showToast({ title: '登录失败，请稍后再试', icon: 'none' })
    return { success: false, reason: 'failed' }
  }
}

export const loginByCurrentPlatform = async (): Promise<LoginResult> => {
  if (!inFlightLogin) {
    inFlightLogin = runLogin().finally(() => {
      inFlightLogin = null
    })
  }

  return inFlightLogin
}
```

- [ ] **Step 5: Remove app-launch auto-login and keep only storage hydration**

Replace the current `getRunEnv` + `autoLogin` block in `frontend/src/app.ts` with this simpler launch behavior:

```ts
async onLaunch() {
  const userStore = useUserStore()
  userStore.initFromStorage()

  const storedLang = Taro.getStorageSync('language')
  if (storedLang) {
    i18n.global.locale.value = storedLang
  }

  const accessibilityStore = useAccessibilityStore()
  accessibilityStore.initSettings()
  accessibilityStore.applyFontSize()
  accessibilityStore.applyDarkMode()

  const onboardingCompleted = Taro.getStorageSync('onboardingCompleted')
  if (!onboardingCompleted) {
    Taro.navigateTo({ url: '/pages/onboarding/index' })
  }
}
```

- [ ] **Step 6: Run test to verify it passes**

Run: `npm test -- login-service.test.ts`
Expected: PASS

- [ ] **Step 7: Commit**

```bash
git add frontend/src/services/auth/platform.ts frontend/src/services/auth/login.ts frontend/src/app.ts frontend/src/services/auth/__tests__/login-service.test.ts
git commit -m "feat: add platform-aware login service"
```

### Task 3: Add requireLogin guard and migrate business entry points

**Files:**
- Create: `frontend/src/services/auth/requireLogin.ts`
- Modify: `frontend/src/pages/recipe/detail/index.vue`
- Modify: `frontend/src/pages/recipe/comments/index.vue`
- Modify: `frontend/src/pages/user/index.vue`
- Modify: `frontend/src/pages/login/index.vue`
- Modify: `frontend/src/pages/profile/settings/index.vue`
- Test: `frontend/src/services/auth/__tests__/require-login.test.ts`

- [ ] **Step 1: Write the failing tests for guarded action continuation**

```ts
import { beforeEach, describe, expect, it, vi } from 'vitest'

const loginByCurrentPlatformMock = vi.fn()

vi.mock('@/services/auth/login', () => ({
  loginByCurrentPlatform: loginByCurrentPlatformMock
}))

vi.mock('@/stores/user', () => ({
  useUserStore: () => ({
    isLoggedIn: false
  })
}))

describe('withLoginGuard', () => {
  beforeEach(() => {
    vi.clearAllMocks()
  })

  it('runs the action after login succeeds', async () => {
    const action = vi.fn()
    loginByCurrentPlatformMock.mockResolvedValue({ success: true })

    const { withLoginGuard } = await import('@/services/auth/requireLogin')
    await withLoginGuard(action)

    expect(action).toHaveBeenCalledTimes(1)
  })

  it('does not run the action after login fails', async () => {
    const action = vi.fn()
    loginByCurrentPlatformMock.mockResolvedValue({ success: false, reason: 'failed' })

    const { withLoginGuard } = await import('@/services/auth/requireLogin')
    await withLoginGuard(action)

    expect(action).not.toHaveBeenCalled()
  })
})
```

- [ ] **Step 2: Run test to verify it fails**

Run: `npm test -- require-login.test.ts`
Expected: FAIL because `requireLogin.ts` does not exist.

- [ ] **Step 3: Implement the shared login guard**

```ts
import { useUserStore } from '@/stores/user'
import { loginByCurrentPlatform } from './login'

export const requireLogin = async (): Promise<boolean> => {
  const userStore = useUserStore()

  if (userStore.isLoggedIn) {
    return true
  }

  const result = await loginByCurrentPlatform()
  return result.success
}

export const withLoginGuard = async (action: () => void | Promise<void>) => {
  const passed = await requireLogin()

  if (!passed) {
    return false
  }

  await action()
  return true
}
```

- [ ] **Step 4: Replace page-level login redirects with the guard**

Use this pattern in `recipe/detail` and `recipe/comments`:

```ts
import { withLoginGuard } from '@/services/auth/requireLogin'

const toggleFavorite = async () => {
  await withLoginGuard(async () => {
    isFavorited.value = !isFavorited.value
    Taro.showToast({
      title: isFavorited.value ? $t('recipe.favorited') : $t('recipe.cancelFavorite'),
      icon: 'success'
    })
  })
}

const showCommentInput = async () => {
  await withLoginGuard(async () => {
    Taro.showModal({
      title: $t('comment.write'),
      editable: true,
      placeholderText: $t('comment.placeholder'),
      success: async (res) => {
        if (res.confirm && res.content) {
          await submitComment(recipeId.value, { content: res.content, rating: 5 })
        }
      }
    })
  })
}
```

Apply the same principle to:

- `frontend/src/pages/user/index.vue`
  - Add the missing `handleLoginClick`
  - Make `goToProfile` check login before navigation
- `frontend/src/pages/login/index.vue`
  - Remove dual-platform buttons
  - On page enter or CTA click, call `loginByCurrentPlatform()` directly as a fallback page
- `frontend/src/pages/profile/settings/index.vue`
  - Replace post-logout `reLaunch('/pages/login/index')` with `reLaunch('/pages/user/index')`

- [ ] **Step 5: Update the login page to act as a fallback, not a chooser**

Replace the explicit platform handlers with a single flow:

```ts
import { onMounted, ref } from 'vue'
import { loginByCurrentPlatform } from '@/services/auth/login'

const loading = ref(false)

const runLogin = async () => {
  if (loading.value) return
  loading.value = true

  const result = await loginByCurrentPlatform()

  if (result.success) {
    Taro.showToast({ title: $t('login.success'), icon: 'success' })
    setTimeout(() => {
      Taro.switchTab({ url: '/pages/user/index' })
    }, 1200)
  }

  loading.value = false
}

onMounted(() => {
  void runLogin()
})
```

- [ ] **Step 6: Run test to verify it passes**

Run: `npm test -- require-login.test.ts`
Expected: PASS

- [ ] **Step 7: Commit**

```bash
git add frontend/src/services/auth/requireLogin.ts frontend/src/pages/recipe/detail/index.vue frontend/src/pages/recipe/comments/index.vue frontend/src/pages/user/index.vue frontend/src/pages/login/index.vue frontend/src/pages/profile/settings/index.vue frontend/src/services/auth/__tests__/require-login.test.ts
git commit -m "feat: gate protected actions behind platform login"
```

### Task 4: Add test tooling and final verification

**Files:**
- Modify: `frontend/package.json`
- Create: `frontend/vitest.config.ts`
- Create: `frontend/src/services/auth/__tests__/test-setup.ts`

- [ ] **Step 1: Write the failing test command expectation**

Run: `npm test`
Expected: FAIL because the `test` script does not exist yet.

- [ ] **Step 2: Add the test runner dependencies and scripts**

Update `frontend/package.json` with:

```json
{
  "scripts": {
    "test": "vitest run",
    "test:watch": "vitest"
  },
  "devDependencies": {
    "vitest": "^2.1.9"
  }
}
```

- [ ] **Step 3: Add a minimal Vitest config with the existing alias**

```ts
import { defineConfig } from 'vitest/config'
import { fileURLToPath, URL } from 'node:url'

export default defineConfig({
  test: {
    globals: true,
    setupFiles: ['./src/services/auth/__tests__/test-setup.ts']
  },
  resolve: {
    alias: {
      '@': fileURLToPath(new URL('./src', import.meta.url))
    }
  }
})
```

- [ ] **Step 4: Add shared test cleanup**

```ts
import { afterEach, vi } from 'vitest'

afterEach(() => {
  vi.clearAllMocks()
  vi.resetModules()
})
```

- [ ] **Step 5: Run the full auth test suite**

Run: `npm test -- src/services/auth/__tests__/login-state.test.ts src/services/auth/__tests__/login-service.test.ts src/services/auth/__tests__/require-login.test.ts`
Expected: PASS

- [ ] **Step 6: Run lint for the frontend package**

Run: `npm run lint`
Expected: PASS

- [ ] **Step 7: Build each supported target**

Run: `npm run build:weapp`
Expected: PASS

Run: `npm run build:tt`
Expected: PASS

- [ ] **Step 8: Commit**

```bash
git add frontend/package.json frontend/vitest.config.ts frontend/src/services/auth/__tests__/test-setup.ts
git commit -m "test: add coverage for platform login flow"
```

## Self-Review Notes

- Spec coverage: the plan removes chooser-style login, adds platform-aware on-demand login, migrates existing login entry points, persists refresh tokens, and verifies WeChat/Douyin flows.
- Placeholder scan: no `TODO`/`TBD` placeholders remain in implementation steps.
- Type consistency: `LoginPayload`, `setAuthSession`, `loginByCurrentPlatform`, and `withLoginGuard` are used consistently across tasks.
