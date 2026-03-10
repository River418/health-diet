import { get, post } from '@/utils/request'

// 获取配方详情
export const getRecipeDetail = (id: number) => {
  return get(`/recipes/${id}`)
}

// 获取配方列表
export const getRecipeList = (params: {
  page?: number
  size?: number
  crowd?: string
  solarTerm?: string
  efficacy?: string
  ingredient?: string
}) => {
  return get('/recipes', params)
}

// 获取配方评论
export const getRecipeComments = (id: number, params: { page?: number; size?: number }) => {
  return get(`/recipes/${id}/comments`, params)
}

// 提交评论
export const submitComment = (id: number, data: { content: string; rating: number }) => {
  return post(`/recipes/${id}/comments`, data)
}

// 收藏配方
export const favoriteRecipe = (id: number) => {
  return post(`/recipes/${id}/favorite`)
}

// 取消收藏
export const unfavoriteRecipe = (id: number) => {
  return post(`/recipes/${id}/unfavorite`)
}

// 获取相关推荐
export const getRelatedRecipes = (id: number) => {
  return get(`/recipes/${id}/related`)
}

// 搜索配方
export const searchRecipes = (params: { keyword: string; page?: number; size?: number }) => {
  return get('/recipes/search', params)
}
