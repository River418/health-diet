<template>
  <view class="login-page" :class="fontLargeClass">
    <!-- 顶部返回 -->
    <view class="login-page__nav">
      <text class="login-page__back" @click="handleBack">⌫</text>
    </view>
    
    <!-- Logo区域 -->
    <view class="login-page__logo">
      <view class="login-page__logo-icon">
        <text class="login-page__logo-emoji">🥗</text>
      </view>
      <text class="login-page__brand">{{ $t('app.name') }}</text>
      <text class="login-page__subtitle">{{ $t('app.slogan') }}</text>
    </view>
    
    <!-- 登录按钮区域 -->
    <view class="login-page__buttons">
      <hd-button
        type="primary"
        size="large"
        block
        icon="💬"
        :loading="loading === 'wechat'"
        :text="$t('login.wechat')"
        class="login-page__btn-wechat"
        @click="handleWechatLogin"
      />
      <hd-button
        type="primary"
        size="large"
        block
        icon="🎵"
        :loading="loading === 'douyin'"
        :text="$t('login.douyin')"
        class="login-page__btn-douyin"
        @click="handleDouyinLogin"
      />
    </view>
    
    <!-- 用户协议 -->
    <view class="login-page__agreement">
      <text class="login-page__agreement-text">{{ $t('login.agreementPrefix') }}</text>
      <text class="login-page__agreement-link" @click="openAgreement">{{ $t('login.userAgreement') }}</text>
      <text class="login-page__agreement-text">{{ $t('login.and') }}</text>
      <text class="login-page__agreement-link" @click="openPrivacy">{{ $t('login.privacyPolicy') }}</text>
    </view>
    
    <!-- 底部免责声明 -->
    <hd-disclaimer class="login-page__disclaimer" />
  </view>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import { useI18n } from 'vue-i18n'
import Taro from '@tarojs/taro'
import HdButton from '@/components/common/HdButton.vue'
import HdDisclaimer from '@/components/common/HdDisclaimer.vue'
import { useUserStore } from '@/stores/user'
import { wechatLogin, douyinLogin } from '@/api/auth'
import { usePageFontSize } from '@/composables'

const { t: $t } = useI18n()
const userStore = useUserStore()
const { fontLargeClass } = usePageFontSize()

const loading = ref<string>('')

// 微信登录
const handleWechatLogin = async () => {
  if (loading.value) return
  loading.value = 'wechat'
  
  try {
    const loginRes = await Taro.login()
    if (loginRes.code) {
      const res = await wechatLogin(loginRes.code)
      handleLoginSuccess(res)
    }
  } catch (error) {
    Taro.showToast({
      title: $t('error.network'),
      icon: 'none'
    })
  } finally {
    loading.value = ''
  }
}

// 抖音登录
const handleDouyinLogin = async () => {
  if (loading.value) return
  loading.value = 'douyin'
  
  try {
    const loginRes = await Taro.login({
      force: true
    })
    if (loginRes.code) {
      const res = await douyinLogin(loginRes.code, loginRes.anonymousCode)
      handleLoginSuccess(res)
    }
  } catch (error) {
    Taro.showToast({
      title: $t('error.network'),
      icon: 'none'
    })
  } finally {
    loading.value = ''
  }
}

// 登录成功处理
const handleLoginSuccess = (res: any) => {
  userStore.setToken(res.token)
  userStore.setUserInfo(res.user)
  
  Taro.showToast({
    title: $t('login.success'),
    icon: 'success'
  })
  
  setTimeout(() => {
    // 返回上一页或跳转到首页
    const pages = Taro.getCurrentPages()
    if (pages.length > 1) {
      Taro.navigateBack()
    } else {
      Taro.switchTab({ url: '/pages/index/index' })
    }
  }, 1500)
}

// 返回
const handleBack = () => {
  Taro.navigateBack()
}

// 打开用户协议
const openAgreement = () => {
  Taro.navigateTo({
    url: '/pages/profile/agreement/index'
  })
}

// 打开隐私政策
const openPrivacy = () => {
  Taro.navigateTo({
    url: '/pages/profile/privacy/index'
  })
}
</script>

<style lang="scss">
@import '@/styles/variables.scss';

.login-page {
  min-height: 100vh;
  background: #fff;
  display: flex;
  flex-direction: column;
  padding: 0 32px;
  
  &__nav {
    height: 44px;
    display: flex;
    align-items: center;
    padding-top: 20px;
  }
  
  &__back {
    font-size: 24px;
    color: $text-primary;
    padding: 8px;
  }
  
  &__logo {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-top: 60px;
    margin-bottom: 48px;
    
    &-icon {
      width: 100px;
      height: 100px;
      background: linear-gradient(135deg, $brand-primary, $brand-dark);
      border-radius: 24px;
      display: flex;
      align-items: center;
      justify-content: center;
      margin-bottom: 24px;
      box-shadow: 0 4px 12px rgba($brand-primary, 0.3);
    }
    
    &-emoji {
      font-size: 48px;
    }
  }
  
  &__brand {
    font-size: 24px;
    font-weight: $font-weight-bold;
    color: $text-primary;
    margin-bottom: 8px;
  }
  
  &__subtitle {
    font-size: 14px;
    color: $text-tertiary;
  }
  
  &__buttons {
    display: flex;
    flex-direction: column;
    gap: 16px;
    margin-bottom: 32px;
  }
  
  &__btn-wechat {
    background-color: #07C160 !important;
    
    &:active {
      background-color: darken(#07C160, 10%) !important;
    }
  }
  
  &__btn-douyin {
    background-color: #000000 !important;
    
    &:active {
      background-color: #333333 !important;
    }
  }
  
  &__agreement {
    text-align: center;
    margin-bottom: 32px;
    
    &-text {
      font-size: 13px;
      color: $text-tertiary;
    }
    
    &-link {
      font-size: 13px;
      color: $brand-primary;
    }
  }
  
  &__disclaimer {
    margin-top: auto;
    margin-bottom: 32px;
  }
}
</style>
