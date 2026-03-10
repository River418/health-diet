import { get } from '@/utils/request'

// 获取分类列表
export const getCategories = () => {
  return get('/categories')
}

// 获取人群分类
export const getCrowdCategories = () => {
  return get('/categories/crowd')
}

// 获取节气分类
export const getSolarTermCategories = () => {
  return get('/categories/solar-terms')
}

// 获取功效分类
export const getEfficacyCategories = () => {
  return get('/categories/efficacy')
}

// 获取食材分类
export const getIngredientCategories = () => {
  return get('/categories/ingredients')
}
