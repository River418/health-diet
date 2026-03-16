/**
 * 字体大小响应式组合式函数
 * 确保页面能够响应全局字体大小变化
 */
import Taro from '@tarojs/taro'
import { onMounted, onUnmounted } from 'vue'
import { useAccessibilityStore } from '../stores/accessibility'

export function useFontSize() {
  const accessibilityStore = useAccessibilityStore()
  let unsubscribe: (() => void) | null = null

  // 应用字体大小到当前页面
  const applyFontSizeToPage = () => {
    const isLarge = accessibilityStore.isLargeFont
    const scale = accessibilityStore.scaleRatio

    Taro.nextTick(() => {
      // 方法1: 尝试使用 page 选择器
      const query = Taro.createSelectorQuery()
      query.select('page').node()
      query.exec((res) => {
        if (res && res[0] && res[0].node) {
          const pageNode = res[0].node
          // 使用 _setStyle 或直接操作 style
          if (isLarge) {
            pageNode.style?.setProperty('--font-scale', String(scale))
            pageNode.style?.setProperty('--root-font-size', '18px')
          } else {
            pageNode.style?.setProperty('--font-scale', '1')
            pageNode.style?.setProperty('--root-font-size', '16px')
          }
        }
      })

      // 方法2: 在 Web/H5 环境下操作 document
      try {
        if (typeof document !== 'undefined' && document.documentElement) {
          document.documentElement.style.setProperty('--font-scale', String(scale))
          document.documentElement.style.setProperty('--root-font-size', accessibilityStore.rootFontSize)
        }
      } catch (e) {
        // 忽略错误
      }
    })
  }

  // 监听字体大小变化事件
  const onFontSizeChange = (data: { scale: number; fontSize: string }) => {
    console.log('字体大小变化:', data)
    applyFontSizeToPage()
  }

  onMounted(() => {
    // 立即应用当前字体大小
    applyFontSizeToPage()

    // 订阅全局字体大小变化事件
    Taro.eventCenter.on('accessibility:fontSizeChanged', onFontSizeChange)
    unsubscribe = () => {
      Taro.eventCenter.off('accessibility:fontSizeChanged', onFontSizeChange)
    }
  })

  onUnmounted(() => {
    // 取消订阅
    if (unsubscribe) {
      unsubscribe()
    }
    Taro.eventCenter.off('accessibility:fontSizeChanged', onFontSizeChange)
  })

  return {
    applyFontSizeToPage,
    scaleRatio: accessibilityStore.scaleRatio,
    isLargeFont: accessibilityStore.isLargeFont,
    rootFontSize: accessibilityStore.rootFontSize
  }
}
