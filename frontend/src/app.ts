import { createApp } from 'vue'
import { createPinia } from 'pinia'
import { createI18n } from 'vue-i18n'
import Taro from '@tarojs/taro'

import './styles/index.scss'

// 导入语言文件
import zhCN from './locales/zh-CN.json'
import zhTW from './locales/zh-TW.json'
import en from './locales/en.json'

// 导入 stores
import { useAccessibilityStore } from './stores/accessibility'

// 创建 i18n 实例
const i18n = createI18n({
  legacy: false,
  locale: 'zh-CN',
  fallbackLocale: 'zh-CN',
  messages: {
    'zh-CN': zhCN,
    'zh-TW': zhTW,
    'en': en
  }
})

// 创建 Pinia 实例
const pinia = createPinia()

// 创建 Vue 应用
const App = createApp({
  onShow(options: Record<string, unknown>) {
    console.log('App onShow', options)
  },
  async onLaunch() {
    console.log('App onLaunch')
    
    // 检查本地存储的语言设置
    const storedLang = Taro.getStorageSync('language')
    if (storedLang) {
      i18n.global.locale.value = storedLang
    }
    
    // 初始化适老化设置
    const accessibilityStore = useAccessibilityStore()
    accessibilityStore.initSettings()
    
    // 检查是否需要显示引导页
    const onboardingCompleted = Taro.getStorageSync('onboardingCompleted')
    if (!onboardingCompleted) {
      // 首次启动，跳转到引导页
      Taro.navigateTo({
        url: '/pages/onboarding/index'
      })
    }
  }
})

// 挂载插件
App.use(pinia)
App.use(i18n)

export default App
