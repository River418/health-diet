<template>
  <view class="user-page" :class="[fontLargeClass, darkModeClass]">
    <scroll-view scroll-y class="user-page__scroll">
      <!-- 头部区域（渐变背景） -->
      <view class="user-page__header">
        <!-- 装饰性圆形 -->
        <view class="user-page__header-decoration user-page__header-decoration--1"></view>
        <view class="user-page__header-decoration user-page__header-decoration--2"></view>
        
        <!-- 用户信息 -->
        <view class="user-page__user-card" @click="goToProfile">
          <view class="user-page__avatar-wrapper">
            <image
              class="user-page__avatar"
              :src="userInfo?.avatar || defaultAvatar"
              mode="aspectFill"
            />
          </view>
          <view class="user-page__user-info">
            <text class="user-page__nickname">
              {{ userInfo?.nickname || $t('user.notLoggedIn') }}
            </text>
            <text class="user-page__login-tip" @click.stop="handleLoginClick">
              {{ userStore.isLoggedIn ? $t('user.viewProfile') : $t('user.clickToLogin') }}
              <text v-if="userStore.isLoggedIn" class="user-page__arrow">›</text>
            </text>
          </view>
        </view>
      </view>
      
      <!-- 统计数据（悬浮卡片） -->
      <view class="user-page__stats-card">
        <view class="user-page__stat" @click="goToFavorites">
          <text class="user-page__stat-value">{{ stats.favorites }}</text>
          <text class="user-page__stat-label">{{ $t('user.favorites') }}</text>
        </view>
        <view class="user-page__stat-divider"></view>
        <view class="user-page__stat" @click="goToHistory">
          <text class="user-page__stat-value">{{ stats.history }}</text>
          <text class="user-page__stat-label">{{ $t('user.history') }}</text>
        </view>
        <view class="user-page__stat-divider"></view>
        <view class="user-page__stat" @click="goToFollowing">
          <text class="user-page__stat-value">{{ stats.following }}</text>
          <text class="user-page__stat-label">{{ $t('user.following') }}</text>
        </view>
      </view>
      
      <!-- 常用功能 -->
      <view class="user-page__section">
        <view class="user-page__section-title">{{ $t('user.commonFunctions') }}</view>
        <view class="user-page__functions">
          <view class="user-page__function" @click="goToMyRecipes">
            <view class="user-page__function-icon" style="background: linear-gradient(135deg, #6B8E23, #8BAF4A);">
              <text>📝</text>
            </view>
            <text class="user-page__function-text">{{ $t('user.myRecipes') }}</text>
          </view>
          <view class="user-page__function" @click="goToMyReviews">
            <view class="user-page__function-icon" style="background: linear-gradient(135deg, #FFD54F, #FFE082);">
              <text>⭐</text>
            </view>
            <text class="user-page__function-text">{{ $t('user.myReviews') }}</text>
          </view>
          <view class="user-page__function" @click="goToHealthData">
            <view class="user-page__function-icon" style="background: linear-gradient(135deg, #64B5F6, #90CAF9);">
              <text>📊</text>
            </view>
            <text class="user-page__function-text">{{ $t('user.healthData') }}</text>
          </view>
          <view class="user-page__function" @click="goToMemberCenter">
            <view class="user-page__function-icon" style="background: linear-gradient(135deg, #F48FB1, #F8BBD9);">
              <text>🎁</text>
            </view>
            <text class="user-page__function-text">{{ $t('user.memberCenter') }}</text>
          </view>
        </view>
      </view>
      
      <!-- 设置 -->
      <view class="user-page__section">
        <view class="user-page__section-title">{{ $t('user.settings') }}</view>
        <view class="user-page__list">
          <view class="user-page__list-item" @click="goToNotifications">
            <view class="user-page__list-icon-wrapper" style="background: #FFF3E0;">
              <text class="user-page__list-icon">🔔</text>
            </view>
            <text class="user-page__list-text">{{ $t('user.notifications') }}</text>
            <text class="user-page__list-arrow">›</text>
          </view>
          <view class="user-page__list-item" @click="showLanguagePicker">
            <view class="user-page__list-icon-wrapper" style="background: #E3F2FD;">
              <text class="user-page__list-icon">🌐</text>
            </view>
            <text class="user-page__list-text">{{ $t('user.language') }}</text>
            <text class="user-page__list-value">{{ currentLanguage }}</text>
            <text class="user-page__list-arrow">›</text>
          </view>
          <view class="user-page__list-item">
            <view class="user-page__list-icon-wrapper" style="background: #E8F5E9;">
              <text class="user-page__list-icon">👁️</text>
            </view>
            <text class="user-page__list-text">{{ $t('user.largeFont') }}</text>
            <switch
              class="user-page__list-switch"
              :checked="largeFont"
              :color="$brand-primary"
              @change="toggleLargeFont"
            />
          </view>
        </view>
      </view>
      
      <!-- 帮助与反馈 -->
      <view class="user-page__section">
        <view class="user-page__list">
          <view class="user-page__list-item" @click="goToHelp">
            <view class="user-page__list-icon-wrapper" style="background: #FFF3E0;">
              <text class="user-page__list-icon">❓</text>
            </view>
            <text class="user-page__list-text">{{ $t('user.help') }}</text>
            <text class="user-page__list-arrow">›</text>
          </view>
          <view class="user-page__list-item" @click="goToAbout">
            <view class="user-page__list-icon-wrapper" style="background: #E3F2FD;">
              <text class="user-page__list-icon">ℹ️</text>
            </view>
            <text class="user-page__list-text">{{ $t('user.about') }}</text>
            <text class="user-page__list-arrow">›</text>
          </view>
          <view class="user-page__list-item" @click="goToAgreement">
            <view class="user-page__list-icon-wrapper" style="background: #E8F5E9;">
              <text class="user-page__list-icon">📄</text>
            </view>
            <text class="user-page__list-text">{{ $t('user.agreement') }}</text>
            <text class="user-page__list-arrow">›</text>
          </view>
          <view class="user-page__list-item" @click="goToPrivacy">
            <view class="user-page__list-icon-wrapper" style="background: #FCE4EC;">
              <text class="user-page__list-icon">🔒</text>
            </view>
            <text class="user-page__list-text">{{ $t('user.privacy') }}</text>
            <text class="user-page__list-arrow">›</text>
          </view>
        </view>
      </view>
      
      <!-- 免责声明 -->
      <hd-disclaimer class="user-page__disclaimer" />
      
      <!-- 退出登录 -->
      <view v-if="userStore.isLoggedIn" class="user-page__logout">
        <view class="user-page__logout-btn" @click="handleLogout">
          <text class="user-page__logout-text">{{ $t('user.logout') }}</text>
        </view>
      </view>
      
      <!-- 底部占位 -->
      <view class="user-page__bottom-placeholder"></view>
    </scroll-view>
    
    <!-- 语言选择弹窗 -->
    <view v-if="showLanguageModal" class="user-page__modal" @click="closeLanguagePicker">
      <view class="user-page__modal-content" @click.stop>
        <view class="user-page__modal-header">
          <view class="user-page__modal-indicator"></view>
          <text class="user-page__modal-title">{{ $t('user.selectLanguage') }}</text>
        </view>
        <view class="user-page__modal-list">
          <view
            v-for="lang in languages"
            :key="lang.code"
            class="user-page__modal-item"
            :class="{ 'is-active': currentLocale === lang.code }"
            @click="selectLanguage(lang.code)"
          >
            <text class="user-page__modal-item-text">{{ lang.name }}</text>
            <text v-if="currentLocale === lang.code" class="user-page__modal-item-check">✓</text>
          </view>
        </view>
        <view class="user-page__modal-footer">
          <view class="user-page__modal-cancel" @click="closeLanguagePicker">
            <text class="user-page__modal-cancel-text">{{ $t('common.cancel') }}</text>
          </view>
        </view>
      </view>
    </view>
  </view>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import { useI18n } from 'vue-i18n'
import Taro from '@tarojs/taro'
import HdDisclaimer from '@/components/common/HdDisclaimer.vue'
import { useUserStore } from '@/stores/user'
import { useAccessibilityStore } from '@/stores/accessibility'
import { DEFAULT_IMAGES } from '@/utils/image'
import { usePageFontSize } from '@/composables'
import { withLoginGuard } from '@/services/auth/requireLogin'

const { t: $t, locale } = useI18n()
const userStore = useUserStore()
const accessibilityStore = useAccessibilityStore()
const { fontLargeClass } = usePageFontSize()

// 数据
const userInfo = computed(() => userStore.userInfo)
const defaultAvatar = DEFAULT_IMAGES.avatar
const showLanguageModal = ref(false)

// 绑定到 store 状态
const largeFont = computed({
  get: () => accessibilityStore.isLargeFont,
  set: (value: boolean) => {
    accessibilityStore.setFontSize(value ? 'large' : 'normal')
  }
})

const languages = [
  { code: 'zh-CN', name: '简体中文' },
  { code: 'zh-TW', name: '繁體中文' },
  { code: 'en', name: 'English' }
]

const currentLocale = computed(() => locale.value)
const currentLanguage = computed(() => {
  const lang = languages.find(l => l.code === locale.value)
  return lang?.name || '简体中文'
})

const stats = ref({
  favorites: 12,
  history: 58,
  following: 6
})

// 获取用户统计
const fetchUserStats = async () => {
  if (!userStore.isLoggedIn) return
  
  try {
    // TODO: 调用API获取统计数据
    stats.value = {
      favorites: 12,
      history: 58,
      following: 6
    }
  } catch (error) {
    console.error('获取用户统计失败', error)
  }
}

// 登录点击
const handleLoginClick = async () => {
  if (!userStore.isLoggedIn) {
    await withLoginGuard(async () => {
      // 登录成功后刷新用户统计
      await fetchUserStats()
    })
  }
}

// 跳转到个人资料
const goToProfile = async () => {
  await withLoginGuard(async () => {
    Taro.navigateTo({
      url: '/pages/profile/profile/index'
    })
  })
}

// 跳转到收藏
const goToFavorites = async () => {
  await withLoginGuard(async () => {
    Taro.navigateTo({
      url: '/pages/profile/favorites/index'
    })
  })
}

// 跳转到历史
const goToHistory = async () => {
  await withLoginGuard(async () => {
    Taro.navigateTo({
      url: '/pages/profile/history/index'
    })
  })
}

// 跳转到关注
const goToFollowing = () => {
  Taro.showToast({
    title: '敬请期待',
    icon: 'none'
  })
}

// 常用功能
const goToMyRecipes = async () => {
  await withLoginGuard(async () => {
    Taro.showToast({ title: '功能开发中', icon: 'none' })
  })
}

const goToMyReviews = async () => {
  await withLoginGuard(async () => {
    Taro.showToast({ title: '功能开发中', icon: 'none' })
  })
}

const goToHealthData = async () => {
  await withLoginGuard(async () => {
    Taro.showToast({ title: '功能开发中', icon: 'none' })
  })
}

const goToMemberCenter = async () => {
  await withLoginGuard(async () => {
    Taro.showToast({ title: '功能开发中', icon: 'none' })
  })
}

// 显示语言选择
const showLanguagePicker = () => {
  showLanguageModal.value = true
}

// 关闭语言选择
const closeLanguagePicker = () => {
  showLanguageModal.value = false
}

// 选择语言
const selectLanguage = (code: string) => {
  locale.value = code
  userStore.updateLanguage(code)
  Taro.setStorageSync('language', code)
  showLanguageModal.value = false
  
  Taro.showToast({
    title: $t('user.languageChanged'),
    icon: 'success'
  })
}

// 跳转到通知设置
const goToNotifications = () => {
  Taro.navigateTo({
    url: '/pages/profile/settings/notifications'
  })
}

// 切换大字模式
const toggleLargeFont = (e: any) => {
  accessibilityStore.setFontSize(e.detail.value ? 'large' : 'normal')
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
    title: $t('user.logout'),
    content: $t('user.logoutConfirm'),
    success: (res) => {
      if (res.confirm) {
        userStore.logout()
        Taro.showToast({
          title: $t('user.logoutSuccess'),
          icon: 'success'
        })
      }
    }
  })
}

onMounted(() => {
  fetchUserStats()
})
</script>

<style lang="scss">
@import '@/styles/variables.scss';

.user-page {
  min-height: 100vh;
  background: var(--bg-page);
  
  &__scroll {
    min-height: 100vh;
  }
  
  // 头部区域（渐变背景）
  &__header {
    position: relative;
    background: linear-gradient(135deg, $brand-primary 0%, $brand-light 100%);
    padding: $spacing-xxxl $spacing-lg $spacing-xxl;
    overflow: hidden;
    
    // 装饰性圆形
    &-decoration {
      position: absolute;
      border-radius: 50%;
      background: rgba(255, 255, 255, 0.1);
      
      &--1 {
        width: 150px;
        height: 150px;
        top: -50px;
        right: -30px;
      }
      
      &--2 {
        width: 100px;
        height: 100px;
        bottom: 20px;
        left: -20px;
      }
    }
  }
  
  // 用户信息卡片
  &__user-card {
    display: flex;
    align-items: center;
    gap: $spacing-md;
    position: relative;
    z-index: 1;
  }
  
  &__avatar-wrapper {
    width: 72px;
    height: 72px;
    border-radius: 50%;
    border: 3px solid rgba(255, 255, 255, 0.8);
    overflow: hidden;
    background: rgba(255, 255, 255, 0.3);
  }
  
  &__avatar {
    width: 100%;
    height: 100%;
  }
  
  &__user-info {
    flex: 1;
  }
  
  &__nickname {
    font-size: $font-size-xl;
    font-weight: $font-weight-bold;
    color: #fff;
    margin-bottom: $spacing-xs;
    display: block;
    text-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
  }
  
  &__login-tip {
    font-size: $font-size-sm;
    color: rgba(255, 255, 255, 0.9);
    display: flex;
    align-items: center;
    gap: $spacing-xs;
  }
  
  &__arrow {
    font-size: $font-size-lg;
    opacity: 0.8;
  }
  
  // 统计数据（悬浮卡片）
  &__stats-card {
    display: flex;
    align-items: center;
    justify-content: space-around;
    background: $bg-card;
    border-radius: $radius-xl;
    margin: -$spacing-lg $spacing-lg $spacing-lg;
    padding: $spacing-lg 0;
    position: relative;
    z-index: 2;
  }
  
  &__stat {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: $spacing-xs;
    flex: 1;
    cursor: pointer;
    
    &:active {
      opacity: 0.7;
    }
    
    &-value {
      font-size: $font-size-xl;
      font-weight: $font-weight-bold;
      color: $brand-primary;
      font-family: $font-family-number;
    }
    
    &-label {
      font-size: $font-size-xs;
      color: $text-tertiary;
    }
    
    &-divider {
      width: 1px;
      height: 30px;
      background: $bg-surface-high;
    }
  }
  
  // 区块样式
  &__section {
    background: $bg-card;
    border-radius: $radius-xl;
    margin: 0 $spacing-lg $spacing-md;
    overflow: hidden;
    
    &-title {
      font-size: $font-size-sm;
      font-weight: $font-weight-medium;
      color: $text-tertiary;
      padding: $spacing-md $spacing-lg;
      background: $bg-surface-low;
    }
  }
  
  // 常用功能
  &__functions {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: $spacing-md;
    padding: $spacing-lg;
  }
  
  &__function {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: $spacing-sm;
    cursor: pointer;
    
    &:active {
      opacity: 0.7;
      transform: scale(0.95);
      transition: all $duration-fast $ease-standard;
    }
    
    &-icon {
      width: 48px;
      height: 48px;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 24px;
    }
    
    &-text {
      font-size: $font-size-xs;
      color: $text-primary;
    }
  }
  
  // 列表样式
  &__list {
    &-item {
      display: flex;
      align-items: center;
      min-height: 56px;
      padding: $spacing-sm $spacing-lg;
      box-sizing: border-box;
      cursor: pointer;
      
      &:not(:last-child) {
        background: $bg-surface-low;
        margin-bottom: 1px;
      }
      
      &:active {
        background: $bg-hover;
      }
    }
    
    &-icon-wrapper {
      width: 32px;
      height: 32px;
      border-radius: $radius-md;
      display: flex;
      align-items: center;
      justify-content: center;
      margin-right: $spacing-md;
    }
    
    &-icon {
      font-size: 18px;
    }
    
    &-text {
      flex: 1;
      font-size: $font-size-base;
      color: $text-primary;
    }
    
    &-value {
      font-size: $font-size-sm;
      color: $text-tertiary;
      margin-right: $spacing-xs;
    }
    
    &-arrow {
      font-size: $font-size-lg;
      color: $text-tertiary;
    }
    
    &-switch {
      transform: scale(0.8);
    }
  }
  
  // 免责声明
  &__disclaimer {
    margin: 0 $spacing-lg $spacing-md;
  }
  
  // 退出登录
  &__logout {
    margin: 0 $spacing-lg $spacing-lg;
    
    &-btn {
      min-height: $btn-height-lg;
      padding: $spacing-sm 0;
      background: $bg-card;
      border: 1px solid $error;
      border-radius: $radius-full;
      display: flex;
      align-items: center;
      justify-content: center;
      box-sizing: border-box;
      
      &:active {
        background: rgba(244, 67, 54, 0.05);
      }
    }
    
    &-text {
      font-size: $font-size-base;
      font-weight: $font-weight-medium;
      color: $error;
    }
  }
  
  &__bottom-placeholder {
    height: $spacing-lg;
  }
  
  // 语言选择弹窗
  &__modal {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: rgba(0, 0, 0, 0.5);
    z-index: 1000;
    display: flex;
    flex-direction: column;
    justify-content: flex-end;
    
    &-content {
      background: $bg-card;
      border-radius: $radius-xl $radius-xl 0 0;
      padding-bottom: $safe-area-bottom;
    }
    
    &-header {
      display: flex;
      flex-direction: column;
      align-items: center;
      padding: $spacing-lg;
    }
    
    &-indicator {
      width: 36px;
      height: 4px;
      background: $border-color;
      border-radius: 2px;
      margin-bottom: $spacing-md;
    }
    
    &-title {
      font-size: $font-size-lg;
      font-weight: $font-weight-medium;
      color: $text-primary;
    }
    
    &-list {
      max-height: 300px;
      overflow-y: auto;
    }
    
    &-item {
      display: flex;
      align-items: center;
      justify-content: space-between;
      min-height: 56px;
      padding: $spacing-sm $spacing-lg;
      box-sizing: border-box;
      cursor: pointer;
      
      &.is-active {
        background: $bg-hover;
      }
      
      &:active {
        background: $bg-hover;
      }
      
      &-text {
        font-size: $font-size-base;
        color: $text-primary;
      }
      
      &-check {
        font-size: $font-size-lg;
        color: $brand-primary;
      }
    }
    
    &-footer {
      padding: $spacing-sm $spacing-lg $spacing-lg;
    }
    
    &-cancel {
      min-height: $btn-height-lg;
      padding: $spacing-sm $spacing-lg;
      display: flex;
      align-items: center;
      justify-content: center;
      background: $bg-hover;
      border-radius: $radius-lg;
      cursor: pointer;
      box-sizing: border-box;
      
      &:active {
        background: $bg-divider;
      }
      
      &-text {
        font-size: $font-size-base;
        color: $text-primary;
      }
    }
  }
}
</style>
