import { ref, computed, onMounted, onUnmounted } from 'vue'
import Taro from '@tarojs/taro'
import { useAccessibilityStore } from '../stores/accessibility'

export function useTheme() {
  const accessibilityStore = useAccessibilityStore()
  const isDarkMode = ref(accessibilityStore.isDarkMode)

  const darkModeClass = computed(() => {
    return isDarkMode.value ? 'dark-mode' : ''
  })

  const handleDarkModeChange = (data: { isDark: boolean }) => {
    isDarkMode.value = data.isDark
  }

  const applyTheme = () => {
    isDarkMode.value = accessibilityStore.isDarkMode
  }

  onMounted(() => {
    applyTheme()
    Taro.eventCenter.on('accessibility:darkModeChanged', handleDarkModeChange)
  })

  onUnmounted(() => {
    Taro.eventCenter.off('accessibility:darkModeChanged', handleDarkModeChange)
  })

  return {
    darkModeClass,
    isDarkMode,
    applyTheme
  }
}
