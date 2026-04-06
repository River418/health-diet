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
  const refreshToken = ref<string>('')
  const userInfo = ref<UserInfo | null>(null)
  const isLoggedIn = computed(() => !!token.value)

  // Actions
  const setToken = (newToken: string) => {
    token.value = newToken
    Taro.setStorageSync('token', newToken)
  }

  const setRefreshToken = (newRefreshToken: string) => {
    refreshToken.value = newRefreshToken
    Taro.setStorageSync('refreshToken', newRefreshToken)
  }

  const setUserInfo = (info: UserInfo) => {
    userInfo.value = info
    Taro.setStorageSync('userInfo', info)
  }

  const setAuthSession = (session: {
    token: string
    refreshToken: string
    user: UserInfo
  }) => {
    setToken(session.token)
    setRefreshToken(session.refreshToken)
    setUserInfo(session.user)
  }

  const initFromStorage = () => {
    const storedToken = Taro.getStorageSync('token')
    const storedRefreshToken = Taro.getStorageSync('refreshToken')
    const storedUserInfo = Taro.getStorageSync('userInfo')
    if (storedToken) {
      token.value = storedToken
    }
    if (storedRefreshToken) {
      refreshToken.value = storedRefreshToken
    }
    if (storedUserInfo) {
      userInfo.value = storedUserInfo
    }
  }

  const logout = () => {
    token.value = ''
    refreshToken.value = ''
    userInfo.value = null
    Taro.removeStorageSync('token')
    Taro.removeStorageSync('refreshToken')
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
    refreshToken,
    userInfo,
    isLoggedIn,
    setToken,
    setRefreshToken,
    setUserInfo,
    setAuthSession,
    initFromStorage,
    logout,
    updateLanguage
  }
})
