import { get, post } from '@/utils/request'

// 获取Banner列表 - 使用 recipes 接口模拟
export const getBanners = () => {
  return get('/recipes?page=1&size=3').then(res => ({
    success: true,
    data: [
      {
        title: '春季养肝 · 枸杞菊花茶',
        subtitle: '顺应时节，养肝明目',
        image: res.data?.list?.[0]?.cover_image || '',
        link: `/pages/recipe/detail/index?id=${res.data?.list?.[0]?.id || 1}`
      },
      {
        title: '滋阴润燥 · 红枣银耳羹',
        subtitle: '秋冬必备，滋润养颜',
        image: res.data?.list?.[1]?.cover_image || '',
        link: `/pages/recipe/detail/index?id=${res.data?.list?.[1]?.id || 2}`
      },
      {
        title: '健脾养胃 · 山药薏米粥',
        subtitle: '调理脾胃，祛湿养生',
        image: res.data?.list?.[2]?.cover_image || '',
        link: `/pages/recipe/detail/index?id=${res.data?.list?.[2]?.id || 3}`
      }
    ]
  }))
}

// 获取推荐配方 - 使用 recipes 接口
export const getRecommendRecipes = (params: { page?: number; size?: number }) => {
  return get(`/recipes?page=${params.page || 1}&size=${params.size || 6}`)
}

// 获取热门配方 - 使用 recipes 接口
export const getHotRecipes = (params: { page?: number; size?: number }) => {
  return get(`/recipes?page=${params.page || 1}&size=${params.size || 6}`)
}

// 获取内容列表 - 使用 contents 接口
export const getContentList = (params: { page?: number; size?: number }) => {
  return get(`/contents?page=${params.page || 1}&size=${params.size || 10}`)
}

// 搜索 - 使用 search 接口
export const search = (params: { keyword: string; page?: number; size?: number }) => {
  return get(`/search?keyword=${encodeURIComponent(params.keyword)}&page=${params.page || 1}&size=${params.size || 10}`)
}

// 获取搜索历史 - 暂不支持
export const getSearchHistory = () => {
  return Promise.resolve({ success: true, data: [] })
}

// 清除搜索历史 - 暂不支持
export const clearSearchHistory = () => {
  return Promise.resolve({ success: true })
}

// 获取热门搜索 - 暂不支持
export const getHotSearch = () => {
  return Promise.resolve({ success: true, data: [] })
}
