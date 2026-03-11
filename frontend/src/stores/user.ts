import { defineStore } from 'pinia'
import { ref, computed } from 'vue'
import Taro from '@tarojs/taro'

export interface UserInfo {
  id: number
  nickname: string
  avatar: string
  language: string
}

export const useUserStore = defineStore('user', () => {
  // State
  const token = ref<string>('')
  const userInfo = ref<UserInfo | null>(null)
  const isLoggedIn = computed(() => !!token.value)

  // Actions
  const setToken = (newToken: string) => {
    token.value = newToken
    Taro.setStorageSync('token', newToken)
  }

  const setUserInfo = (info: UserInfo) => {
    userInfo.value = info
    Taro.setStorageSync('userInfo', info)
  }

  const initFromStorage = () => {
    const storedToken = Taro.getStorageSync('token')
    const storedUserInfo = Taro.getStorageSync('userInfo')
    if (storedToken) {
      token.value = storedToken
    }
    if (storedUserInfo) {
      userInfo.value = storedUserInfo
    }
  }

  const logout = () => {
    token.value = ''
    userInfo.value = null
    Taro.removeStorageSync('token')
    Taro.removeStorageSync('userInfo')
  }

  const updateLanguage = (lang: string) => {
    if (userInfo.value) {
      userInfo.value.language = lang
      Taro.setStorageSync('userInfo', userInfo.value)
    }
    Taro.setStorageSync('language', lang)
  }

  return {
    token,
    userInfo,
    isLoggedIn,
    setToken,
    setUserInfo,
    initFromStorage,
    logout,
    updateLanguage
  }
})
