<template>
  <view class="user-page">
    <scroll-view scroll-y class="user-page__scroll">
      <!-- 用户信息卡片 -->
      <view class="user-page__header">
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
              <text v-if="userStore.isLoggedIn" class="user-page__arrow">></text>
            </text>
          </view>
        </view>
        
        <!-- 数据统计 -->
        <view class="user-page__stats">
          <view class="user-page__stat" @click="goToFavorites">
            <text class="user-page__stat-icon">📋</text>
            <text class="user-page__stat-label">{{ $t('user.favorites') }}</text>
            <text class="user-page__stat-value">{{ stats.favorites }}</text>
          </view>
          <view class="user-page__stat" @click="goToHistory">
            <text class="user-page__stat-icon">❤️</text>
            <text class="user-page__stat-label">{{ $t('user.history') }}</text>
            <text class="user-page__stat-value">{{ stats.history }}</text>
          </view>
          <view class="user-page__stat" @click="goToFollowing">
            <text class="user-page__stat-icon">👁</text>
            <text class="user-page__stat-label">{{ $t('user.following') }}</text>
            <text class="user-page__stat-value">{{ stats.following }}</text>
          </view>
        </view>
      </view>
      
      <!-- 功能设置 -->
      <view class="user-page__section">
        <view class="user-page__section-title">{{ $t('user.settings') }}</view>
        <view class="user-page__list">
          <view class="user-page__list-item" @click="showLanguagePicker">
            <text class="user-page__list-icon">🌐</text>
            <text class="user-page__list-text">{{ $t('user.language') }}</text>
            <text class="user-page__list-value">{{ currentLanguage }}</text>
            <text class="user-page__list-arrow">></text>
          </view>
          <view class="user-page__list-item" @click="goToNotifications">
            <text class="user-page__list-icon">🔔</text>
            <text class="user-page__list-text">{{ $t('user.notifications') }}</text>
            <text class="user-page__list-arrow">></text>
          </view>
          <view class="user-page__list-item">
            <text class="user-page__list-icon">👴</text>
            <text class="user-page__list-text">{{ $t('user.largeFont') }}</text>
            <switch
              class="user-page__list-switch"
              :checked="largeFont"
              color="#4CAF50"
              @change="toggleLargeFont"
            />
          </view>
          <view class="user-page__list-item">
            <text class="user-page__list-icon">🌙</text>
            <text class="user-page__list-text">{{ $t('user.darkMode') }}</text>
            <switch
              class="user-page__list-switch"
              :checked="darkMode"
              color="#4CAF50"
              @change="toggleDarkMode"
            />
          </view>
        </view>
      </view>
      
      <!-- 帮助与关于 -->
      <view class="user-page__section">
        <view class="user-page__list">
          <view class="user-page__list-item" @click="goToHelp">
            <text class="user-page__list-icon">❓</text>
            <text class="user-page__list-text">{{ $t('user.help') }}</text>
            <text class="user-page__list-arrow">></text>
          </view>
          <view class="user-page__list-item" @click="goToAbout">
            <text class="user-page__list-icon">ℹ️</text>
            <text class="user-page__list-text">{{ $t('user.about') }}</text>
            <text class="user-page__list-arrow">></text>
          </view>
          <view class="user-page__list-item" @click="goToAgreement">
            <text class="user-page__list-icon">📄</text>
            <text class="user-page__list-text">{{ $t('user.agreement') }}</text>
            <text class="user-page__list-arrow">></text>
          </view>
          <view class="user-page__list-item" @click="goToPrivacy">
            <text class="user-page__list-icon">🔒</text>
            <text class="user-page__list-text">{{ $t('user.privacy') }}</text>
            <text class="user-page__list-arrow">></text>
          </view>
        </view>
      </view>
      
      <!-- 免责声明 -->
      <hd-disclaimer class="user-page__disclaimer" />
      
      <!-- 退出登录 -->
      <view v-if="userStore.isLoggedIn" class="user-page__logout">
        <hd-button
          type="danger"
          size="large"
          block
          :text="$t('user.logout')"
          @click="handleLogout"
        />
      </view>
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
import HdButton from '@/components/common/HdButton.vue'
import { useUserStore } from '@/store/user'

const { t: $t, locale } = useI18n()
const userStore = useUserStore()

// 数据
const userInfo = computed(() => userStore.userInfo)
const defaultAvatar = '/assets/images/avatar-default.png'
const largeFont = ref(false)
const darkMode = ref(false)
const showLanguageModal = ref(false)

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
  favorites: 0,
  history: 0,
  following: 0
})

// 获取用户统计
const fetchUserStats = async () => {
  if (!userStore.isLoggedIn) return
  
  try {
    // TODO: 调用API获取统计数据
    stats.value = {
      favorites: 12,
      history: 28,
      following: 5
    }
  } catch (error) {
    console.error('获取用户统计失败', error)
  }
}

// 登录点击
const handleLoginClick = () => {
  if (!userStore.isLoggedIn) {
    Taro.navigateTo({
      url: '/pages/login/index'
    })
  }
}

// 跳转到个人资料
const goToProfile = () => {
  if (!userStore.isLoggedIn) {
    Taro.navigateTo({
      url: '/pages/login/index'
    })
    return
  }
  Taro.navigateTo({
    url: '/pages/user/profile/index'
  })
}

// 跳转到收藏
const goToFavorites = () => {
  if (!userStore.isLoggedIn) {
    Taro.navigateTo({
      url: '/pages/login/index'
    })
    return
  }
  Taro.navigateTo({
    url: '/pages/user/favorites/index'
  })
}

// 跳转到历史
const goToHistory = () => {
  if (!userStore.isLoggedIn) {
    Taro.navigateTo({
      url: '/pages/login/index'
    })
    return
  }
  Taro.navigateTo({
    url: '/pages/user/history/index'
  })
}

// 跳转到关注
const goToFollowing = () => {
  Taro.showToast({
    title: '敬请期待',
    icon: 'none'
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
    url: '/pages/user/settings/notifications'
  })
}

// 切换大字模式
const toggleLargeFont = (e: any) => {
  largeFont.value = e.detail.value
  Taro.setStorageSync('largeFont', largeFont.value)
  // TODO: 应用大字模式
}

// 切换夜间模式
const toggleDarkMode = (e: any) => {
  darkMode.value = e.detail.value
  Taro.setStorageSync('darkMode', darkMode.value)
  // TODO: 应用夜间模式
}

// 跳转到帮助
const goToHelp = () => {
  Taro.navigateTo({
    url: '/pages/user/help/index'
  })
}

// 跳转到关于
const goToAbout = () => {
  Taro.navigateTo({
    url: '/pages/user/about/index'
  })
}

// 跳转到用户协议
const goToAgreement = () => {
  Taro.navigateTo({
    url: '/pages/user/agreement/index'
  })
}

// 跳转到隐私政策
const goToPrivacy = () => {
  Taro.navigateTo({
    url: '/pages/user/privacy/index'
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
  // 从存储中读取设置
  largeFont.value = Taro.getStorageSync('largeFont') || false
  darkMode.value = Taro.getStorageSync('darkMode') || false
  
  fetchUserStats()
})
</script>

<style lang="scss">
@import '@/styles/variables.scss';

.user-page {
  min-height: 100vh;
  background: $bg-gray;
  
  &__scroll {
    min-height: 100vh;
    padding-bottom: 32px;
  }
  
  &__header {
    background: linear-gradient(135deg, $brand-primary, $brand-dark);
    padding: 24px 16px;
    margin-bottom: 16px;
  }
  
  &__user-card {
    display: flex;
    align-items: center;
    gap: 16px;
    margin-bottom: 24px;
  }
  
  &__avatar-wrapper {
    width: 72px;
    height: 72px;
    border-radius: 50%;
    border: 2px solid #fff;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    overflow: hidden;
  }
  
  &__avatar {
    width: 100%;
    height: 100%;
  }
  
  &__user-info {
    flex: 1;
  }
  
  &__nickname {
    font-size: 20px;
    font-weight: $font-weight-bold;
    color: #fff;
    margin-bottom: 4px;
    display: block;
  }
  
  &__login-tip {
    font-size: 14px;
    color: rgba(255, 255, 255, 0.8);
    display: flex;
    align-items: center;
    gap: 4px;
  }
  
  &__arrow {
    font-size: 14px;
  }
  
  &__stats {
    display: flex;
    justify-content: space-around;
    background: rgba(255, 255, 255, 0.1);
    border-radius: 12px;
    padding: 16px 0;
  }
  
  &__stat {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 4px;
    cursor: pointer;
    
    &:active {
      opacity: 0.7;
    }
    
    &-icon {
      font-size: 24px;
    }
    
    &-label {
      font-size: 12px;
      color: rgba(255, 255, 255, 0.8);
    }
    
    &-value {
      font-size: 20px;
      font-weight: $font-weight-bold;
      color: #fff;
    }
  }
  
  &__section {
    background: #fff;
    margin: 0 16px 16px;
    border-radius: 12px;
    overflow: hidden;
    
    &-title {
      font-size: 14px;
      font-weight: $font-weight-medium;
      color: $text-tertiary;
      padding: 12px 16px;
      background: $bg-gray;
    }
  }
  
  &__list {
    &-item {
      display: flex;
      align-items: center;
      height: 56px;
      padding: 0 16px;
      border-bottom: 1px solid $bg-divider;
      
      &:last-child {
        border-bottom: none;
      }
      
      &:active {
        background: $bg-gray;
      }
    }
    
    &-icon {
      font-size: 20px;
      margin-right: 12px;
    }
    
    &-text {
      flex: 1;
      font-size: 15px;
      color: $text-primary;
    }
    
    &-value {
      font-size: 14px;
      color: $text-tertiary;
      margin-right: 8px;
    }
    
    &-arrow {
      font-size: 16px;
      color: $text-tertiary;
    }
    
    &-switch {
      transform: scale(0.8);
    }
  }
  
  &__disclaimer {
    margin: 0 16px 16px;
  }
  
  &__logout {
    margin: 0 16px;
  }
  
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
      background: #fff;
      border-radius: 16px 16px 0 0;
      padding-bottom: env(safe-area-inset-bottom);
    }
    
    &-header {
      display: flex;
      flex-direction: column;
      align-items: center;
      padding: 16px;
    }
    
    &-indicator {
      width: 36px;
      height: 4px;
      background: #ddd;
      border-radius: 2px;
      margin-bottom: 16px;
    }
    
    &-title {
      font-size: 16px;
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
      height: 56px;
      padding: 0 16px;
      
      &.is-active {
        background: $bg-gray;
      }
      
      &-text {
        font-size: 15px;
        color: $text-primary;
      }
      
      &-check {
        font-size: 20px;
        color: $brand-primary;
      }
    }
    
    &-footer {
      padding: 8px 16px 16px;
    }
    
    &-cancel {
      height: 48px;
      display: flex;
      align-items: center;
      justify-content: center;
      background: $bg-gray;
      border-radius: 8px;
      
      &-text {
        font-size: 15px;
        color: $text-primary;
      }
    }
  }
}
</style>
