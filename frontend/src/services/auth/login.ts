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