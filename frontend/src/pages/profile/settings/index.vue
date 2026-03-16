<template>
  <view class="settings-page" :class="fontLargeClass">
    <!-- 账号与安全 -->
    <view class="settings-page__section">
      <view class="settings-page__section-title">{{ $t('settings.account') }}</view>
      <view class="settings-page__list">
        <view class="settings-page__list-item" @click="goToProfile">
          <text class="settings-page__list-icon">👤</text>
          <text class="settings-page__list-text">{{ $t('user.profile') }}</text>
          <text class="settings-page__list-arrow">></text>
        </view>
      </view>
    </view>
    
    <!-- 通用设置 -->
    <view class="settings-page__section">
      <view class="settings-page__section-title">{{ $t('settings.general') }}</view>
      <view class="settings-page__list">
        <view class="settings-page__list-item" @click="goToLanguage">
          <text class="settings-page__list-icon">🌐</text>
          <text class="settings-page__list-text">{{ $t('user.language') }}</text>
          <text class="settings-page__list-value">{{ currentLanguage }}</text>
          <text class="settings-page__list-arrow">></text>
        </view>
        <view class="settings-page__list-item" @click="goToNotifications">
          <text class="settings-page__list-icon">🔔</text>
          <text class="settings-page__list-text">{{ $t('user.notifications') }}</text>
          <text class="settings-page__list-arrow">></text>
        </view>
        <view class="settings-page__list-item" @click="goToAccessibility">
          <text class="settings-page__list-icon">♿</text>
          <text class="settings-page__list-text">{{ $t('accessibility.title') }}</text>
          <text v-if="accessibilityStore.isLargeFont || accessibilityStore.highContrast" class="settings-page__list-badge">{{ $t('settings.enabled') }}</text>
          <text class="settings-page__list-arrow">></text>
        </view>
      </view>
    </view>
    
    <!-- 关于与帮助 -->
    <view class="settings-page__section">
      <view class="settings-page__section-title">{{ $t('settings.about') }}</view>
      <view class="settings-page__list">
        <view class="settings-page__list-item" @click="viewOnboarding">
          <text class="settings-page__list-icon">📖</text>
          <text class="settings-page__list-text">{{ $t('settings.viewOnboarding') }}</text>
          <text class="settings-page__list-arrow">></text>
        </view>
        <view class="settings-page__list-item" @click="goToHelp">
          <text class="settings-page__list-icon">❓</text>
          <text class="settings-page__list-text">{{ $t('user.help') }}</text>
          <text class="settings-page__list-arrow">></text>
        </view>
        <view class="settings-page__list-item" @click="goToAbout">
          <text class="settings-page__list-icon">ℹ️</text>
          <text class="settings-page__list-text">{{ $t('user.about') }}</text>
          <text class="settings-page__list-arrow">></text>
        </view>
        <view class="settings-page__list-item" @click="goToAgreement">
          <text class="settings-page__list-icon">📄</text>
          <text class="settings-page__list-text">{{ $t('user.agreement') }}</text>
          <text class="settings-page__list-arrow">></text>
        </view>
        <view class="settings-page__list-item" @click="goToPrivacy">
          <text class="settings-page__list-icon">🔒</text>
          <text class="settings-page__list-text">{{ $t('user.privacy') }}</text>
          <text class="settings-page__list-arrow">></text>
        </view>
      </view>
    </view>
    
    <!-- 退出登录 -->
    <view v-if="isLoggedIn" class="settings-page__section">
      <view class="settings-page__logout" @click="handleLogout">
        <text class="settings-page__logout-text">{{ $t('user.logout') }}</text>
      </view>
    </view>
  </view>
</template>

<script setup lang="ts">
import { ref, computed } from 'vue'
import { useI18n } from 'vue-i18n'
import Taro from '@tarojs/taro'
import { useAccessibilityStore } from '@/stores/accessibility'
import { usePageFontSize } from '@/composables'

const { t: $t, locale } = useI18n()
const accessibilityStore = useAccessibilityStore()
const { fontLargeClass } = usePageFontSize()

const isLoggedIn = ref(false) // 实际项目中应从用户状态获取

// 当前语言显示
const currentLanguage = computed(() => {
  const langMap: Record<string, string> = {
    'zh-CN': $t('language.zhCN'),
    'zh-TW': $t('language.zhTW'),
    'en': $t('language.en')
  }
  return langMap[locale.value] || $t('language.zhCN')
})

// 跳转到个人资料
const goToProfile = () => {
  Taro.navigateTo({
    url: '/pages/profile/profile/index'
  })
}

// 跳转到语言设置
const goToLanguage = () => {
  Taro.showActionSheet({
    itemList: [$t('language.zhCN'), $t('language.zhTW'), $t('language.en')],
    success: (res) => {
      const langMap = ['zh-CN', 'zh-TW', 'en']
      const selectedLang = langMap[res.tapIndex]
      locale.value = selectedLang
      Taro.setStorageSync('language', selectedLang)
      Taro.showToast({
        title: $t('user.languageChanged'),
        icon: 'success'
      })
    }
  })
}

// 跳转到通知设置
const goToNotifications = () => {
  Taro.navigateTo({
    url: '/pages/profile/settings/notifications'
  })
}

// 跳转到适老化设置
const goToAccessibility = () => {
  Taro.navigateTo({
    url: '/pages/profile/settings/accessibility'
  })
}

// 查看引导页
const viewOnboarding = () => {
  Taro.navigateTo({
    url: '/pages/onboarding/index'
  })
}

// 跳转到帮助
const goToHelp = () => {
  Taro.navigateTo({
    url: '/pages/profile/help/index'
  })
}

// 跳转到关于
const goToAbout = () => {
  Taro.navigateTo({
    url: '/pages/profile/about/index'
  })
}

// 跳转到用户协议
const goToAgreement = () => {
  Taro.navigateTo({
    url: '/pages/profile/agreement/index'
  })
}

// 跳转到隐私政策
const goToPrivacy = () => {
  Taro.navigateTo({
    url: '/pages/profile/privacy/index'
  })
}

// 退出登录
const handleLogout = () => {
  Taro.showModal({
    title: $t('common.confirm'),
    content: $t('user.logoutConfirm'),
    confirmText: $t('common.confirm'),
    cancelText: $t('common.cancel'),
    success: (res) => {
      if (res.confirm) {
        // 执行退出登录逻辑
        Taro.showToast({
          title: $t('user.logoutSuccess'),
          icon: 'success'
        })
        setTimeout(() => {
          Taro.reLaunch({
            url: '/pages/login/index'
          })
        }, 1500)
      }
    }
  })
}
</script>

<style lang="scss">
@import '@/styles/variables.scss';

.settings-page {
  min-height: 100vh;
  background: $bg-page;
  padding: 16px 0;
  
  &__section {
    background: #fff;
    margin: 0 16px 16px;
    border-radius: 12px;
    overflow: hidden;
    
    &:last-child {
      margin-bottom: 0;
    }
  }
  
  &__section-title {
    font-size: $font-size-sm;
    color: $text-secondary;
    padding: 12px 16px 8px;
    font-weight: $font-weight-medium;
  }
  
  &__list {
    &-item {
      display: flex;
      align-items: center;
      height: 56px;
      padding: 0 16px;
      
      &:active {
        background: $bg-page;
      }
      
      &:not(:last-child) {
        border-bottom: 1px solid $bg-divider;
      }
    }
    
    &-icon {
      font-size: 20px;
      margin-right: 12px;
      width: 24px;
      text-align: center;
    }
    
    &-text {
      flex: 1;
      font-size: 15px;
      color: $text-primary;
    }
    
    &-value {
      font-size: $font-size-sm;
      color: $text-secondary;
      margin-right: 4px;
    }
    
    &-badge {
      font-size: 11px;
      color: $brand-primary;
      background: rgba($brand-primary, 0.1);
      padding: 2px 8px;
      border-radius: 10px;
      margin-right: 4px;
    }
    
    &-arrow {
      font-size: 16px;
      color: $text-tertiary;
    }
  }
  
  &__logout {
    display: flex;
    align-items: center;
    justify-content: center;
    height: 56px;
    
    &:active {
      background: $bg-page;
    }
    
    &-text {
      font-size: 15px;
      color: $error;
      font-weight: $font-weight-medium;
    }
  }
}
</style>
