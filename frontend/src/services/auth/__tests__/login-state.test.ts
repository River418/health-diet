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
