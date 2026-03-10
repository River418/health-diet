import { get, post, put } from '@/utils/request'

// 获取用户信息
export const getUserInfo = () => {
  return get('/user/profile')
}

// 更新用户信息
export const updateUserInfo = (data: { nickname?: string; avatar?: string }) => {
  return put('/user/profile', data)
}

// 获取收藏列表
export const getFavorites = (params: { page?: number; size?: number }) => {
  return get('/user/favorites', params)
}

// 获取浏览历史
export const getHistory = (params: { page?: number; size?: number }) => {
  return get('/user/history', params)
}

// 清空浏览历史
export const clearHistory = () => {
  return post('/user/history/clear')
}

// 获取关注列表
export const getFollowing = (params: { page?: number; size?: number }) => {
  return get('/user/following', params)
}

// 更新语言设置
export const updateLanguage = (language: string) => {
  return put('/user/language', { language })
}
