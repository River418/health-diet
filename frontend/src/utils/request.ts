import Taro from '@tarojs/taro'
import { useUserStore } from '@/stores/user'

const BASE_URL = process.env.TARO_APP_API_URL || 'http://localhost:3001/api/v1'

interface RequestOptions {
  url: string
  method?: 'GET' | 'POST' | 'PUT' | 'DELETE'
  data?: any
  header?: Record<string, string>
  needAuth?: boolean
}

export interface ApiResponse<T = any> {
  success: boolean
  data?: T
  error?: string
  code?: string
}

export const request = async <T = any>(options: RequestOptions): Promise<ApiResponse<T>> => {
  const { url, method = 'GET', data, header = {}, needAuth = true } = options
  
  const requestHeader: Record<string, string> = {
    'Content-Type': 'application/json',
    ...header
  }
  
  // 添加认证token
  if (needAuth) {
    const userStore = useUserStore()
    if (userStore.token) {
      requestHeader.Authorization = `Bearer ${userStore.token}`
    }
  }
  
  // 添加语言偏好
  const userStore = useUserStore()
  requestHeader['Accept-Language'] = userStore.userInfo?.language || 'zh-CN'
  
  try {
    const res = await Taro.request({
      url: `${BASE_URL}${url}`,
      method,
      data,
      header: requestHeader
    })
    
    const response = res.data as ApiResponse<T>
    
    if (!response.success) {
      // Token过期，尝试刷新
      if (response.code === 'TOKEN_EXPIRED') {
        const refreshed = await refreshToken()
        if (refreshed) {
          // 重试原请求
          return request(options)
        }
      }
      
      throw new Error(response.error || '请求失败')
    }
    
    return response
  } catch (error) {
    console.error('Request error:', error)
    throw error
  }
}

// 刷新token
const refreshToken = async (): Promise<boolean> => {
  try {
    const userStore = useUserStore()
    const refreshToken = Taro.getStorageSync('refreshToken')
    
    if (!refreshToken) {
      userStore.logout()
      return false
    }
    
    const res = await Taro.request({
      url: `${BASE_URL}/auth/refresh`,
      method: 'POST',
      data: { refreshToken },
      header: {
        'Content-Type': 'application/json'
      }
    })
    
    const response = res.data as ApiResponse<{ token: string }>
    
    if (response.success && response.data) {
      userStore.setToken(response.data.token)
      return true
    }
    
    userStore.logout()
    return false
  } catch (error) {
    console.error('Refresh token error:', error)
    const userStore = useUserStore()
    userStore.logout()
    return false
  }
}

// 便捷方法
export const get = <T = any>(url: string, params?: any, needAuth = true) => {
  return request<T>({ url, method: 'GET', data: params, needAuth })
}

export const post = <T = any>(url: string, data?: any, needAuth = true) => {
  return request<T>({ url, method: 'POST', data, needAuth })
}

export const put = <T = any>(url: string, data?: any, needAuth = true) => {
  return request<T>({ url, method: 'PUT', data, needAuth })
}

export const del = <T = any>(url: string, needAuth = true) => {
  return request<T>({ url, method: 'DELETE', needAuth })
}
