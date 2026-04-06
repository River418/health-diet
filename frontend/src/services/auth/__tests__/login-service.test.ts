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

vi.mock('@/stores/user', () => ({
  useUserStore: () => ({
    setAuthSession: vi.fn()
  })
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