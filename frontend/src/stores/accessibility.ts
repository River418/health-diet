import { defineStore } from 'pinia'
import { ref, computed } from 'vue'
import Taro from '@tarojs/taro'

export type FontSize = 'normal' | 'large'

export const useAccessibilityStore = defineStore('accessibility', () => {
  // 字体大小设置: normal | large
  const fontSize = ref<FontSize>('normal')
  
  // 高对比度模式
  const highContrast = ref(false)
  
  // 跟随系统字体大小
  const followSystemFont = ref(false)
  
  // 语音辅助开关
  const voiceAssist = ref(false)
  
  // 计算属性：是否是大字体模式
  const isLargeFont = computed(() => fontSize.value === 'large')
  
  // 计算属性：根字体大小
  const rootFontSize = computed(() => {
    if (fontSize.value === 'large') {
      return '18px' // 大字体模式
    }
    return '16px' // 标准字体
  })
  
  // 计算属性：缩放比例
  const scaleRatio = computed(() => {
    return fontSize.value === 'large' ? 1.125 : 1
  })
  
  // 初始化设置
  const initSettings = () => {
    // 从本地存储读取设置
    const storedFontSize = Taro.getStorageSync('accessibility_fontSize') as FontSize
    const storedHighContrast = Taro.getStorageSync('accessibility_highContrast')
    const storedFollowSystem = Taro.getStorageSync('accessibility_followSystem')
    const storedVoiceAssist = Taro.getStorageSync('accessibility_voiceAssist')
    
    if (storedFontSize) {
      fontSize.value = storedFontSize
    }
    if (storedHighContrast !== '') {
      highContrast.value = storedHighContrast === true || storedHighContrast === 'true'
    }
    if (storedFollowSystem !== '') {
      followSystemFont.value = storedFollowSystem === true || storedFollowSystem === 'true'
    }
    if (storedVoiceAssist !== '') {
      voiceAssist.value = storedVoiceAssist === true || storedVoiceAssist === 'true'
    }
    
    // 如果跟随系统字体大小
    if (followSystemFont.value) {
      checkSystemFontSize()
    }
  }
  
  // 检查系统字体大小
  const checkSystemFontSize = () => {
    try {
      // 获取系统字体大小设置
      const systemInfo = Taro.getSystemInfoSync()
      // 根据系统字体大小判断
      // 注意：小程序无法直接获取系统字体大小设置，这里使用屏幕宽度作为参考
      // 或者可以通过 wx.getSetting 获取
      const fontSizeSetting = (systemInfo as any).fontSizeSetting
      if (fontSizeSetting && fontSizeSetting > 16) {
        fontSize.value = 'large'
      }
    } catch (e) {
      console.log('获取系统字体大小失败', e)
    }
  }
  
  // 设置字体大小
  const setFontSize = (size: FontSize) => {
    fontSize.value = size
    Taro.setStorageSync('accessibility_fontSize', size)
    
    // 如果手动设置字体大小，关闭跟随系统
    if (followSystemFont.value) {
      followSystemFont.value = false
      Taro.setStorageSync('accessibility_followSystem', false)
    }
    
    // 应用字体大小
    applyFontSize()
  }
  
  // 切换高对比度模式
  const toggleHighContrast = () => {
    highContrast.value = !highContrast.value
    Taro.setStorageSync('accessibility_highContrast', highContrast.value)
  }
  
  // 设置高对比度模式
  const setHighContrast = (value: boolean) => {
    highContrast.value = value
    Taro.setStorageSync('accessibility_highContrast', value)
  }
  
  // 切换跟随系统字体大小
  const toggleFollowSystem = () => {
    followSystemFont.value = !followSystemFont.value
    Taro.setStorageSync('accessibility_followSystem', followSystemFont.value)
    
    if (followSystemFont.value) {
      checkSystemFontSize()
      applyFontSize()
    }
  }
  
  // 设置跟随系统字体大小
  const setFollowSystem = (value: boolean) => {
    followSystemFont.value = value
    Taro.setStorageSync('accessibility_followSystem', value)
    
    if (value) {
      checkSystemFontSize()
      applyFontSize()
    }
  }
  
  // 切换语音辅助
  const toggleVoiceAssist = () => {
    voiceAssist.value = !voiceAssist.value
    Taro.setStorageSync('accessibility_voiceAssist', voiceAssist.value)
  }
  
  // 设置语音辅助
  const setVoiceAssist = (value: boolean) => {
    voiceAssist.value = value
    Taro.setStorageSync('accessibility_voiceAssist', value)
  }
  
  // 应用字体大小到页面
  // 通过触发全局事件，让各个页面组件响应字体大小变化
  const applyFontSize = () => {
    const scale = scaleRatio.value
    const isLarge = fontSize.value === 'large'
    
    // 保存到 storage，供页面加载时读取
    Taro.setStorageSync('font_size_scale', String(scale))
    Taro.setStorageSync('font_size_class', isLarge ? 'font-large' : '')
    
    // 在 Web/H5 环境下，操作 document.documentElement
    try {
      if (typeof document !== 'undefined' && document.documentElement) {
        document.documentElement.style.setProperty('--font-scale', String(scale))
        document.documentElement.style.setProperty('--root-font-size', rootFontSize.value)
        
        // 添加/移除 class
        if (isLarge) {
          document.documentElement.classList.add('font-large')
        } else {
          document.documentElement.classList.remove('font-large')
        }
      }
    } catch (e) {
      // 忽略非 H5 环境的错误
    }
    
    // 触发全局事件，让所有页面组件响应字体大小变化
    // 各页面通过 usePageFontSize composable 监听此事件
    Taro.eventCenter.trigger('accessibility:fontSizeChanged', { 
      scale, 
      fontSize: fontSize.value,
      isLarge
    })
  }
  
  // 获取字体大小对应的数值
  const getFontSizeValue = (baseSize: number): number => {
    return Math.round(baseSize * scaleRatio.value)
  }
  
  // 语音播报
  const speak = (text: string) => {
    if (!voiceAssist.value) return
    
    try {
      Taro.createInnerAudioContext()
      console.log('语音播报:', text)
    } catch (e) {
      console.log('语音播报失败', e)
    }
  }
  
  return {
    fontSize,
    highContrast,
    followSystemFont,
    voiceAssist,
    isLargeFont,
    rootFontSize,
    scaleRatio,
    initSettings,
    setFontSize,
    toggleHighContrast,
    setHighContrast,
    toggleFollowSystem,
    setFollowSystem,
    toggleVoiceAssist,
    setVoiceAssist,
    applyFontSize,
    getFontSizeValue,
    speak
  }
})
