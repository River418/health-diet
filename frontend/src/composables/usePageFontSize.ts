import { computed, ref, onMounted, onUnmounted } from 'vue'
import Taro from '@tarojs/taro'
import { useAccessibilityStore } from '../stores/accessibility'

export function usePageFontSize() {
  const accessibilityStore = useAccessibilityStore()
  const isLargeFont = ref(accessibilityStore.isLargeFont)

  const fontLargeClass = computed(() => {
    return isLargeFont.value ? 'font-large' : ''
  })

  const handleFontSizeChange = (data: { isLarge: boolean }) => {
    isLargeFont.value = data.isLarge
  }

  const applyFontSize = () => {
    isLargeFont.value = accessibilityStore.isLargeFont
  }

  onMounted(() => {
    applyFontSize()
    Taro.eventCenter.on('accessibility:fontSizeChanged', handleFontSizeChange)
  })

  onUnmounted(() => {
    Taro.eventCenter.off('accessibility:fontSizeChanged', handleFontSizeChange)
  })

  return {
    fontLargeClass,
    isLargeFont,
    applyFontSize
  }
}
