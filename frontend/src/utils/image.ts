/**
 * 图片工具函数
 * 提供图片加载失败时的 fallback 处理
 */

// 图片服务器基础 URL（不带 /api/v1）
const IMAGE_BASE_URL = process.env.TARO_APP_API_URL 
  ? process.env.TARO_APP_API_URL.replace('/api/v1', '')
  : 'http://localhost:3001'

// 默认占位图（使用在线占位图服务）
export const DEFAULT_IMAGES = {
  // 食谱封面默认图 - 使用纯色占位
  recipe: 'data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iNDAwIiBoZWlnaHQ9IjMwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMTAwJSIgaGVpZ2h0PSIxMDAlIiBmaWxsPSIjZjBmMGYwIi8+PHRleHQgeD0iNTAlIiB5PSI1MCUiIGZvbnQtZmFtaWx5PSJBcmlhbCIgZm9udC1zaXplPSIxOCIgZmlsbD0iIzk5OSIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZHk9Ii4zZW0iPueFp+WbvuaYpeivgmNvdmVyPC90ZXh0Pjwvc3ZnPg==',
  // 食材默认图
  ingredient: 'data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTAwIiBoZWlnaHQ9IjEwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMTAwJSIgaGVpZ2h0PSIxMDAlIiBmaWxsPSIjZThmNWVhIi8+PHRleHQgeD0iNTAlIiB5PSI1MCUiIGZvbnQtZmFtaWx5PSJBcmlhbCIgZm9udC1zaXplPSIxNCIgZmlsbD0iIzY2NyIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZHk9Ii4zZW0iPueFpzwvdGV4dD48L3N2Zz4=',
  // 用户头像默认图
  avatar: 'data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTAwIiBoZWlnaHQ9IjEwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48Y2lyY2xlIGN4PSI1MCIgY3k9IjUwIiByPSI1MCIgZmlsbD0iI2UwZTBlMCIvPjx0ZXh0IHg9IjUwJSIgeT0iNTAlIiBmb250LWZhbWlseT0iQXJpYWwiIGZvbnQtc2l6ZT0iNDAiIGZpbGw9IiM5OTkiIHRleHQtYW5jaG9yPSJtaWRkbGUiIGR5PSIuM2VtIj7lnIg8L3RleHQ+PC9zdmc+',
  // 步骤图片默认图
  step: 'data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iNDAwIiBoZWlnaHQ9IjMwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMTAwJSIgaGVpZ2h0PSIxMDAlIiBmaWxsPSIjZjhmOGY4Ii8+PHRleHQgeD0iNTAlIiB5PSI1MCUiIGZvbnQtZmFtaWx5PSJBcmlhbCIgZm9udC1zaXplPSIxNiIgZmlsbD0iIzk5OSIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZHk9Ii4zZW0iPueFp+WbvuaYpeivgjwvdGV4dD48L3N2Zz4=',
  // Banner 默认图
  banner: 'data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iNzUwIiBoZWlnaHQ9IjQwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMTAwJSIgaGVpZ2h0PSIxMDAlIiBmaWxsPSIjZjBmMGYwIi8+PHRleHQgeD0iNTAlIiB5PSI1MCUiIGZvbnQtZmFtaWx5PSJBcmlhbCIgZm9udC1zaXplPSIyNCIgZmlsbD0iIzk5OSIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZHk9Ii4zZW0iPmJhbm5lcjwvdGV4dD48L3N2Zz4=',
  // 内容封面默认图
  content: 'data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTAwIiBoZWlnaHQ9IjEwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cmVjdCB3aWR0aD0iMTAwJSIgaGVpZ2h0PSIxMDAlIiBmaWxsPSIjZTBlMGUwIi8+PHRleHQgeD0iNTAlIiB5PSI1MCUiIGZvbnQtZmFtaWx5PSJBcmlhbCIgZm9udC1zaXplPSIxNCIgZmlsbD0iIzk5OSIgdGV4dC1hbmNob3I9Im1pZGRsZSIgZHk9Ii4zZW0iPuaWh+ahozwvdGV4dD48L3N2Zz4='
}

/**
 * 获取完整的图片 URL
 * 处理相对路径，拼接服务器域名
 * @param url 图片 URL（可能是相对路径或完整 URL）
 * @param type 图片类型，用于返回默认占位图
 * @returns 完整的图片 URL 或默认占位图
 */
export function getImageUrl(url: string | undefined | null, type: 'recipe' | 'ingredient' | 'avatar' | 'step' | 'banner' | 'content' = 'recipe'): string {
  // 如果 URL 为空，返回默认占位图
  if (!url || url === '' || url === null || url === undefined) {
    return DEFAULT_IMAGES[type]
  }
  
  // 如果是 base64 图片，直接返回
  if (url.startsWith('data:image')) {
    return url
  }
  
  // 如果是完整的 http/https URL，直接返回
  if (url.startsWith('http://') || url.startsWith('https://')) {
    return url
  }
  
  // 如果是相对路径，拼接服务器域名
  if (url.startsWith('/')) {
    return `${IMAGE_BASE_URL}${url}`
  }
  
  // 其他情况，尝试拼接
  return `${IMAGE_BASE_URL}/${url}`
}

/**
 * 处理图片加载错误
 */
export function handleImageError(event: any, type: 'recipe' | 'ingredient' | 'avatar' | 'step' | 'banner' = 'recipe'): void {
  if (event && event.detail) {
    event.detail.src = DEFAULT_IMAGES[type]
  }
}

/**
 * 检查图片 URL 是否有效
 */
export function isValidImageUrl(url: string | undefined): boolean {
  if (!url || url === '') {
    return false
  }
  // 检查是否是 base64 图片
  if (url.startsWith('data:image')) {
    return true
  }
  // 检查是否是 http/https 链接
  if (url.startsWith('http://') || url.startsWith('https://')) {
    return true
  }
  // 检查是否是本地路径
  if (url.startsWith('/') || url.startsWith('./') || url.startsWith('../')) {
    return true
  }
  return false
}
