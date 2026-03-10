import { post } from '@/utils/request'

export interface LoginResult {
  user: {
    id: number
    nickname: string
    avatar: string
    language: string
  }
  token: string
  refreshToken: string
  expiresIn: string
  isNewUser: boolean
}

// 微信登录
export const wechatLogin = (code: string) => {
  return post<LoginResult>('/auth/wechat/login', { code }, false)
}

// 抖音登录
export const douyinLogin = (code: string, anonymousCode?: string) => {
  return post<LoginResult>('/auth/douyin/login', { code, anonymous_code: anonymousCode }, false)
}

// 刷新token
export const refreshToken = (refreshToken: string) => {
  return post<{ token: string; expiresIn: string }>('/auth/refresh', { refreshToken }, false)
}
