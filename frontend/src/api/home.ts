import { get, post } from '@/utils/request'

// 获取Banner列表
export const getBanners = () => {
  return get('/home/banners')
}

// 获取推荐配方
export const getRecommendRecipes = (params: { page?: number; size?: number }) => {
  return get('/home/recommend', params)
}

// 获取热门配方
export const getHotRecipes = (params: { page?: number; size?: number }) => {
  return get('/home/hot', params)
}

// 获取内容列表
export const getContentList = (params: { page?: number; size?: number }) => {
  return get('/home/content', params)
}

// 搜索
export const search = (params: { keyword: string; page?: number; size?: number }) => {
  return get('/home/search', params)
}

// 获取搜索历史
export const getSearchHistory = () => {
  return get('/home/search/history')
}

// 清除搜索历史
export const clearSearchHistory = () => {
  return post('/home/search/history/clear')
}

// 获取热门搜索
export const getHotSearch = () => {
  return get('/home/search/hot')
}
