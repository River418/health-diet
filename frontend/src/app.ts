import { createApp } from 'vue'
import { createPinia } from 'pinia'
import { createI18n } from 'vue-i18n'
import Taro from '@tarojs/taro'

import './styles/index.scss'

// 导入语言文件
import zhCN from './locales/zh-CN.json'
import zhTW from './locales/zh-TW.json'
import en from './locales/en.json'

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

const App = createApp({
  onShow(options) {
    console.log('App onShow', options)
  },
  onLaunch() {
    console.log('App onLaunch')
    // 检查本地存储的语言设置
    const storedLang = Taro.getStorageSync('language')
    if (storedLang) {
      i18n.global.locale.value = storedLang
    }
  }
})

App.use(createPinia())
App.use(i18n)

export default App
