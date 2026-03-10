import { get, post, del } from '@/utils/request'

export interface Recipe {
  id: number
  name: string
  description: string
  cover_image: string
  crowd_tags: string[]
  efficacy_tags: string[]
  solar_term_tags?: string[]
  rating: number
  view_count: number
  favorite_count: number
  comment_count: number
}

export interface RecipeDetail extends Recipe {
  images?: string[]
  video_url?: string
  video_duration?: number
  nutrition?: {
    calories?: number
    protein?: number
    fat?: number
    carbs?: number
  }
  ingredients: Ingredient[]
  steps: Step[]
  isFavorited: boolean
}

export interface Ingredient {
  id: number
  name: string
  amount: string
  image?: string
  sort_order: number
}

export interface Step {
  id: number
  step_order: number
  description: string
  image?: string
}

export interface RecipeListParams {
  page?: number
  pageSize?: number
  crowd?: string
  efficacy?: string
  solarTerm?: string
  keyword?: string
  sortBy?: 'recommend' | 'hot' | 'newest' | 'rating'
}

// 获取配方列表
export const getRecipes = (params?: RecipeListParams) => {
  return get<{ list: Recipe[]; pagination: any }>('/recipes', params, false)
}

// 获取配方详情
export const getRecipeDetail = (id: number | string) => {
  return get<RecipeDetail>(`/recipes/${id}`, undefined, false)
}

// 收藏配方
export const favoriteRecipe = (id: number | string) => {
  return post<{ isFavorited: boolean }>(`/recipes/${id}/favorite`)
}

// 取消收藏
export const unfavoriteRecipe = (id: number | string) => {
  return del<{ isFavorited: boolean }>(`/recipes/${id}/favorite`)
}
