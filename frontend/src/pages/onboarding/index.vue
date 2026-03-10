<template>
  <view class="onboarding-page" :class="{ 'onboarding-page--high-contrast': accessibilityStore.highContrast }">
    <!-- 跳过按钮 -->
    <view class="onboarding-page__skip" v-if="currentPage < 3">
      <text class="onboarding-page__skip-text" @click="skipOnboarding">{{ $t('onboarding.skip') }}</text>
    </view>
    
    <!-- 引导内容区域 -->
    <swiper 
      class="onboarding-page__swiper" 
      :current="currentPage - 1"
      @change="onSwiperChange"
      :circular="false"
      :indicator-dots="false"
    >
      <!-- 第1页：产品简介 -->
      <swiper-item class="onboarding-page__slide">
        <view class="onboarding-page__content">
          <view class="onboarding-page__illustration">
            <view class="onboarding-page__icon-wrapper onboarding-page__icon-wrapper--primary">
              <text class="onboarding-page__icon">🌿</text>
            </view>
          </view>
          <text class="onboarding-page__title">{{ $t('onboarding.page1.title') }}</text>
          <text class="onboarding-page__subtitle">{{ $t('onboarding.page1.subtitle') }}</text>
          <text class="onboarding-page__desc">{{ $t('onboarding.page1.desc') }}</text>
        </view>
      </swiper-item>
      
      <!-- 第2页：核心功能 -->
      <swiper-item class="onboarding-page__slide">
        <view class="onboarding-page__content">
          <view class="onboarding-page__illustration">
            <view class="onboarding-page__icon-wrapper onboarding-page__icon-wrapper--secondary">
              <text class="onboarding-page__icon">📚</text>
            </view>
          </view>
          <text class="onboarding-page__title">{{ $t('onboarding.page2.title') }}</text>
          <view class="onboarding-page__features">
            <view class="onboarding-page__feature-item">
              <text class="onboarding-page__feature-icon">🔍</text>
              <text class="onboarding-page__feature-text">{{ $t('onboarding.page2.feature1') }}</text>
            </view>
            <view class="onboarding-page__feature-item">
              <text class="onboarding-page__feature-icon">📅</text>
              <text class="onboarding-page__feature-text">{{ $t('onboarding.page2.feature2') }}</text>
            </view>
            <view class="onboarding-page__feature-item">
              <text class="onboarding-page__feature-icon">❤️</text>
              <text class="onboarding-page__feature-text">{{ $t('onboarding.page2.feature3') }}</text>
            </view>
          </view>
        </view>
      </swiper-item>
      
      <!-- 第3页：免责声明 -->
      <swiper-item class="onboarding-page__slide">
        <view class="onboarding-page__content">
          <view class="onboarding-page__illustration">
            <view class="onboarding-page__icon-wrapper onboarding-page__icon-wrapper--warning">
              <text class="onboarding-page__icon">⚠️</text>
            </view>
          </view>
          <text class="onboarding-page__title">{{ $t('onboarding.page3.title') }}</text>
          <text class="onboarding-page__desc">{{ $t('onboarding.page3.desc') }}</text>
          <view class="onboarding-page__disclaimer-box">
            <text class="onboarding-page__disclaimer-text">{{ $t('disclaimer.text') }}</text>
          </view>
          <view class="onboarding-page__agreement">
            <view class="onboarding-page__checkbox" :class="{ 'onboarding-page__checkbox--checked': agreed }" @click="toggleAgreement">
              <text v-if="agreed" class="onboarding-page__checkbox-icon">✓</text>
            </view>
            <text class="onboarding-page__agreement-text">{{ $t('onboarding.agreement') }}</text>
          </view>
        </view>
      </swiper-item>
    </swiper>
    
    <!-- 页码指示器 -->
    <view class="onboarding-page__indicators">
      <view 
        v-for="i in 3" 
        :key="i"
        class="onboarding-page__indicator"
        :class="{ 'onboarding-page__indicator--active': currentPage === i }"
      />
    </view>
    
    <!-- 底部按钮 -->
    <view class="onboarding-page__footer">
      <hd-button
        v-if="currentPage < 3"
        type="primary"
        size="large"
        block
        @click="nextPage"
      >
        {{ $t('onboarding.next') }}
      </hd-button>
      <hd-button
        v-else
        type="primary"
        size="large"
        block
        :disabled="!agreed"
        @click="completeOnboarding"
      >
        {{ $t('onboarding.start') }}
      </hd-button>
    </view>
  </view>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import Taro from '@tarojs/taro'
import { useI18n } from 'vue-i18n'
import { useAccessibilityStore } from '@/stores/accessibility'
import HdButton from '@/components/common/HdButton.vue'

const { t: $t } = useI18n()
const accessibilityStore = useAccessibilityStore()

const currentPage = ref(1)
const agreed = ref(false)

const onSwiperChange = (e: any) => {
  currentPage.value = e.detail.current + 1
}

const nextPage = () => {
  if (currentPage.value < 3) {
    currentPage.value++
  }
}

const skipOnboarding = () => {
  Taro.showModal({
    title: $t('onboarding.skipConfirmTitle'),
    content: $t('onboarding.skipConfirmContent'),
    confirmText: $t('common.confirm'),
    cancelText: $t('common.cancel'),
    success: (res) => {
      if (res.confirm) {
        completeOnboarding()
      }
    }
  })
}

const toggleAgreement = () => {
  agreed.value = !agreed.value
}

const completeOnboarding = () => {
  // 保存已完成引导的状态
  Taro.setStorageSync('onboardingCompleted', true)
  Taro.setStorageSync('onboardingCompletedAt', new Date().toISOString())
  
  // 跳转到首页
  Taro.switchTab({
    url: '/pages/index/index'
  })
}
</script>

<style lang="scss">
@import '@/styles/variables.scss';

.onboarding-page {
  min-height: 100vh;
  background: linear-gradient(180deg, #FFFFFF 0%, #F5F5F5 100%);
  display: flex;
  flex-direction: column;
  position: relative;
  
  &--high-contrast {
    background: #000000;
    
    .onboarding-page__title {
      color: #FFFFFF;
    }
    
    .onboarding-page__subtitle,
    .onboarding-page__desc {
      color: #FFFFFF;
    }
    
    .onboarding-page__feature-text {
      color: #FFFFFF;
    }
    
    .onboarding-page__disclaimer-box {
      background: #000000;
      border: 2px solid #FFFF00;
    }
    
    .onboarding-page__disclaimer-text {
      color: #FFFF00;
    }
    
    .onboarding-page__agreement-text {
      color: #FFFFFF;
    }
  }
  
  &__skip {
    position: absolute;
    top: 44px;
    right: 16px;
    z-index: 10;
    
    &-text {
      font-size: $font-size-base;
      color: $text-secondary;
      padding: 8px 16px;
    }
  }
  
  &__swiper {
    flex: 1;
    height: calc(100vh - 180px);
  }
  
  &__slide {
    display: flex;
    align-items: center;
    justify-content: center;
  }
  
  &__content {
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 0 40px;
    text-align: center;
  }
  
  &__illustration {
    margin-bottom: 40px;
  }
  
  &__icon-wrapper {
    width: 120px;
    height: 120px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    
    &--primary {
      background: linear-gradient(135deg, $brand-primary 0%, $brand-dark 100%);
    }
    
    &--secondary {
      background: linear-gradient(135deg, $accent-blue 0%, darken($accent-blue, 15%) 100%);
    }
    
    &--warning {
      background: linear-gradient(135deg, $warning 0%, darken($warning, 15%) 100%);
    }
  }
  
  &__icon {
    font-size: 60px;
  }
  
  &__title {
    font-size: 24px;
    font-weight: $font-weight-bold;
    color: $text-primary;
    margin-bottom: 16px;
  }
  
  &__subtitle {
    font-size: $font-size-lg;
    color: $brand-primary;
    font-weight: $font-weight-medium;
    margin-bottom: 12px;
  }
  
  &__desc {
    font-size: $font-size-base;
    color: $text-secondary;
    line-height: 1.6;
  }
  
  &__features {
    width: 100%;
    margin-top: 24px;
  }
  
  &__feature-item {
    display: flex;
    align-items: center;
    padding: 16px;
    background: rgba($brand-primary, 0.05);
    border-radius: $radius-lg;
    margin-bottom: 12px;
  }
  
  &__feature-icon {
    font-size: 24px;
    margin-right: 16px;
  }
  
  &__feature-text {
    font-size: $font-size-base;
    color: $text-primary;
    font-weight: $font-weight-medium;
  }
  
  &__disclaimer-box {
    background: #FFF3CD;
    border-radius: $radius-lg;
    padding: 16px;
    margin-top: 24px;
    width: 100%;
  }
  
  &__disclaimer-text {
    font-size: $font-size-sm;
    color: #856404;
    line-height: 1.5;
    text-align: left;
  }
  
  &__agreement {
    display: flex;
    align-items: center;
    margin-top: 24px;
    
    &-text {
      font-size: $font-size-sm;
      color: $text-secondary;
      margin-left: 8px;
    }
  }
  
  &__checkbox {
    width: 20px;
    height: 20px;
    border: 2px solid $brand-primary;
    border-radius: $radius-sm;
    display: flex;
    align-items: center;
    justify-content: center;
    transition: all 0.2s ease;
    
    &--checked {
      background: $brand-primary;
    }
    
    &-icon {
      color: #fff;
      font-size: 12px;
      font-weight: bold;
    }
  }
  
  &__indicators {
    display: flex;
    justify-content: center;
    gap: 8px;
    padding: 24px 0;
  }
  
  &__indicator {
    width: 8px;
    height: 8px;
    border-radius: 50%;
    background: $bg-divider;
    transition: all 0.3s ease;
    
    &--active {
      width: 24px;
      border-radius: 4px;
      background: $brand-primary;
    }
  }
  
  &__footer {
    padding: 0 24px 48px;
  }
}
</style>
