import { get } from '@/utils/request'

export interface Category {
  id: number
  name: string
  type: 'crowd' | 'solar_term' | 'efficacy' | 'ingredient'
  icon?: string
  sort_order: number
}

export interface KingKongItem {
  id: number
  name: string
  icon: string
  action_type: 'filter' | 'page' | 'url'
  action_value: string
  filter_config?: Record<string, string>
}

// 获取分类列表
export const getCategories = (type?: string) => {
  return get<Category[] | Record<string, Category[]>>('/categories', { type }, false)
}

// 获取金刚位配置
export const getKingKongConfig = () => {
  return get<KingKongItem[]>('/categories/kingkong', undefined, false)
}
