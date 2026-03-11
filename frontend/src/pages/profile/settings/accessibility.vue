<template>
  <view 
    class="accessibility-page" 
    :class="{ 
      'accessibility-page--large-font': accessibilityStore.isLargeFont,
      'accessibility-page--high-contrast': accessibilityStore.highContrast 
    }"
  >
    <!-- 页面标题 -->
    <view class="accessibility-page__header">
      <text class="accessibility-page__title">{{ $t('accessibility.title') }}</text>
      <text class="accessibility-page__subtitle">{{ $t('accessibility.subtitle') }}</text>
    </view>
    
    <!-- 字体大小设置 -->
    <view class="accessibility-page__section">
      <view class="accessibility-page__section-title">{{ $t('accessibility.fontSize') }}</view>
      <view class="accessibility-page__font-preview">
        <text class="accessibility-page__preview-text" :style="previewStyle">{{ $t('accessibility.previewText') }}</text>
      </view>
      <view class="accessibility-page__font-options">
        <view 
          class="accessibility-page__font-option"
          :class="{ 'accessibility-page__font-option--active': accessibilityStore.fontSize === 'normal' }"
          @click="setFontSize('normal')"
        >
          <text class="accessibility-page__font-label">{{ $t('accessibility.fontNormal') }}</text>
          <text class="accessibility-page__font-sample accessibility-page__font-sample--normal">Aa</text>
          <view v-if="accessibilityStore.fontSize === 'normal'" class="accessibility-page__check">
            <text class="accessibility-page__check-icon">✓</text>
          </view>
        </view>
        <view 
          class="accessibility-page__font-option"
          :class="{ 'accessibility-page__font-option--active': accessibilityStore.fontSize === 'large' }"
          @click="setFontSize('large')"
        >
          <text class="accessibility-page__font-label">{{ $t('accessibility.fontLarge') }}</text>
          <text class="accessibility-page__font-sample accessibility-page__font-sample--large">Aa</text>
          <view v-if="accessibilityStore.fontSize === 'large'" class="accessibility-page__check">
            <text class="accessibility-page__check-icon">✓</text>
          </view>
        </view>
      </view>
    </view>
    
    <!-- 跟随系统设置 -->
    <view class="accessibility-page__section">
      <view class="accessibility-page__list">
        <view class="accessibility-page__list-item">
          <view class="accessibility-page__list-content">
            <text class="accessibility-page__list-icon">📱</text>
            <view class="accessibility-page__list-text">
              <text class="accessibility-page__list-title">{{ $t('accessibility.followSystem') }}</text>
              <text class="accessibility-page__list-desc">{{ $t('accessibility.followSystemDesc') }}</text>
            </view>
          </view>
          <switch 
            class="accessibility-page__switch"
            :checked="accessibilityStore.followSystemFont"
            @change="onFollowSystemChange"
            color="#4CAF50"
          />
        </view>
      </view>
    </view>
    
    <!-- 高对比度模式 -->
    <view class="accessibility-page__section">
      <view class="accessibility-page__section-title">{{ $t('accessibility.visual') }}</view>
      <view class="accessibility-page__list">
        <view class="accessibility-page__list-item">
          <view class="accessibility-page__list-content">
            <text class="accessibility-page__list-icon">🎨</text>
            <view class="accessibility-page__list-text">
              <text class="accessibility-page__list-title">{{ $t('accessibility.highContrast') }}</text>
              <text class="accessibility-page__list-desc">{{ $t('accessibility.highContrastDesc') }}</text>
            </view>
          </view>
          <switch 
            class="accessibility-page__switch"
            :checked="accessibilityStore.highContrast"
            @change="onHighContrastChange"
            color="#4CAF50"
          />
        </view>
      </view>
      
      <!-- 高对比度预览 -->
      <view v-if="accessibilityStore.highContrast" class="accessibility-page__contrast-preview">
        <view class="accessibility-page__contrast-box">
          <text class="accessibility-page__contrast-text">{{ $t('accessibility.contrastPreview') }}</text>
        </view>
      </view>
    </view>
    
    <!-- 语音辅助 -->
    <view class="accessibility-page__section">
      <view class="accessibility-page__section-title">{{ $t('accessibility.audio') }}</view>
      <view class="accessibility-page__list">
        <view class="accessibility-page__list-item">
          <view class="accessibility-page__list-content">
            <text class="accessibility-page__list-icon">🔊</text>
            <view class="accessibility-page__list-text">
              <text class="accessibility-page__list-title">{{ $t('accessibility.voiceAssist') }}</text>
              <text class="accessibility-page__list-desc">{{ $t('accessibility.voiceAssistDesc') }}</text>
            </view>
          </view>
          <switch 
            class="accessibility-page__switch"
            :checked="accessibilityStore.voiceAssist"
            @change="onVoiceAssistChange"
            color="#4CAF50"
          />
        </view>
      </view>
      
      <!-- 语音测试按钮 -->
      <view v-if="accessibilityStore.voiceAssist" class="accessibility-page__voice-test">
        <hd-button 
          type="outline" 
          size="medium"
          icon="🔊"
          @click="testVoice"
        >
          {{ $t('accessibility.testVoice') }}
        </hd-button>
      </view>
    </view>
    
    <!-- 提示信息 -->
    <view class="accessibility-page__tips">
      <text class="accessibility-page__tips-icon">💡</text>
      <text class="accessibility-page__tips-text">{{ $t('accessibility.tips') }}</text>
    </view>
  </view>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { useI18n } from 'vue-i18n'
import Taro from '@tarojs/taro'
import { useAccessibilityStore, FontSize } from '@/stores/accessibility'
import HdButton from '@/components/common/HdButton.vue'

const { t: $t } = useI18n()
const accessibilityStore = useAccessibilityStore()

// 预览文本样式
const previewStyle = computed(() => {
  const scale = accessibilityStore.scaleRatio
  return {
    fontSize: `${16 * scale}px`,
    lineHeight: `${1.6 * scale}`
  }
})

// 设置字体大小
const setFontSize = (size: FontSize) => {
  accessibilityStore.setFontSize(size)
  Taro.showToast({
    title: $t('accessibility.fontSizeChanged'),
    icon: 'success',
    duration: 1500
  })
}

// 跟随系统字体大小切换
const onFollowSystemChange = (e: any) => {
  const value = e.detail.value
  accessibilityStore.setFollowSystem(value)
  Taro.showToast({
    title: value ? $t('accessibility.followSystemOn') : $t('accessibility.followSystemOff'),
    icon: 'none',
    duration: 1500
  })
}

// 高对比度切换
const onHighContrastChange = (e: any) => {
  const value = e.detail.value
  accessibilityStore.setHighContrast(value)
  Taro.showToast({
    title: value ? $t('accessibility.highContrastOn') : $t('accessibility.highContrastOff'),
    icon: 'none',
    duration: 1500
  })
}

// 语音辅助切换
const onVoiceAssistChange = (e: any) => {
  const value = e.detail.value
  accessibilityStore.setVoiceAssist(value)
  Taro.showToast({
    title: value ? $t('accessibility.voiceAssistOn') : $t('accessibility.voiceAssistOff'),
    icon: 'none',
    duration: 1500
  })
}

// 测试语音
const testVoice = () => {
  const testText = $t('accessibility.testVoiceText')
  accessibilityStore.speak(testText)
  Taro.showToast({
    title: $t('accessibility.voicePlaying'),
    icon: 'none',
    duration: 2000
  })
}
</script>

<style lang="scss">
@import '@/styles/variables.scss';

.accessibility-page {
  min-height: 100vh;
  background: $bg-page;
  padding-bottom: 32px;
  
  // 大字体模式
  &--large-font {
    .accessibility-page__title {
      font-size: 22px;
    }
    
    .accessibility-page__subtitle,
    .accessibility-page__section-title,
    .accessibility-page__list-title {
      font-size: 17px;
    }
    
    .accessibility-page__list-desc,
    .accessibility-page__tips-text {
      font-size: 15px;
    }
    
    .accessibility-page__preview-text {
      font-size: 18px !important;
    }
  }
  
  // 高对比度模式
  &--high-contrast {
    background: #000000;
    
    .accessibility-page__header,
    .accessibility-page__section {
      background: #000000;
      border: 2px solid #FFFFFF;
    }
    
    .accessibility-page__title,
    .accessibility-page__section-title,
    .accessibility-page__list-title {
      color: #FFFFFF;
    }
    
    .accessibility-page__subtitle,
    .accessibility-page__list-desc {
      color: #FFFFFF;
    }
    
    .accessibility-page__font-preview {
      background: #000000;
      border: 2px solid #FFFFFF;
    }
    
    .accessibility-page__preview-text {
      color: #FFFFFF;
    }
    
    .accessibility-page__font-option {
      background: #000000;
      border: 2px solid #FFFFFF;
      
      &--active {
        background: #000000;
        border-color: #FFFF00;
      }
    }
    
    .accessibility-page__font-label {
      color: #FFFFFF;
    }
    
    .accessibility-page__tips {
      background: #000000;
      border: 2px solid #FFFF00;
    }
    
    .accessibility-page__tips-text {
      color: #FFFF00;
    }
  }
  
  &__header {
    background: #fff;
    padding: 24px 16px;
    margin-bottom: 16px;
  }
  
  &__title {
    font-size: $font-size-xl;
    font-weight: $font-weight-bold;
    color: $text-primary;
    display: block;
    margin-bottom: 8px;
  }
  
  &__subtitle {
    font-size: $font-size-sm;
    color: $text-secondary;
  }
  
  &__section {
    background: #fff;
    margin: 0 16px 16px;
    border-radius: $radius-lg;
    padding: 16px;
  }
  
  &__section-title {
    font-size: $font-size-base;
    font-weight: $font-weight-bold;
    color: $text-primary;
    margin-bottom: 16px;
  }
  
  &__font-preview {
    background: $bg-page;
    border-radius: $radius-md;
    padding: 20px;
    margin-bottom: 16px;
    text-align: center;
  }
  
  &__preview-text {
    font-size: $font-size-base;
    color: $text-primary;
    line-height: 1.6;
  }
  
  &__font-options {
    display: flex;
    gap: 12px;
  }
  
  &__font-option {
    flex: 1;
    background: $bg-page;
    border-radius: $radius-md;
    padding: 16px;
    display: flex;
    flex-direction: column;
    align-items: center;
    position: relative;
    border: 2px solid transparent;
    transition: all 0.2s ease;
    
    &--active {
      background: rgba($brand-primary, 0.1);
      border-color: $brand-primary;
    }
    
    &:active {
      transform: scale(0.98);
    }
  }
  
  &__font-label {
    font-size: $font-size-sm;
    color: $text-secondary;
    margin-bottom: 8px;
  }
  
  &__font-sample {
    font-weight: $font-weight-bold;
    color: $text-primary;
    
    &--normal {
      font-size: 20px;
    }
    
    &--large {
      font-size: 26px;
    }
  }
  
  &__check {
    position: absolute;
    top: 8px;
    right: 8px;
    width: 18px;
    height: 18px;
    background: $brand-primary;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    
    &-icon {
      color: #fff;
      font-size: 10px;
      font-weight: bold;
    }
  }
  
  &__list {
    &-item {
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 12px 0;
      
      &:first-child {
        padding-top: 0;
      }
      
      &:last-child {
        padding-bottom: 0;
      }
    }
    
    &-content {
      display: flex;
      align-items: center;
      flex: 1;
    }
    
    &-icon {
      font-size: 24px;
      margin-right: 12px;
    }
    
    &-text {
      display: flex;
      flex-direction: column;
    }
    
    &-title {
      font-size: $font-size-base;
      color: $text-primary;
      font-weight: $font-weight-medium;
      margin-bottom: 4px;
    }
    
    &-desc {
      font-size: $font-size-sm;
      color: $text-secondary;
    }
  }
  
  &__switch {
    transform: scale(0.9);
  }
  
  &__contrast-preview {
    margin-top: 16px;
    padding-top: 16px;
    border-top: 1px solid $bg-divider;
  }
  
  &__contrast-box {
    background: #000000;
    border: 3px solid #FFFF00;
    border-radius: $radius-md;
    padding: 16px;
  }
  
  &__contrast-text {
    color: #FFFF00;
    font-size: $font-size-base;
    font-weight: $font-weight-bold;
  }
  
  &__voice-test {
    margin-top: 16px;
    padding-top: 16px;
    border-top: 1px solid $bg-divider;
    display: flex;
    justify-content: center;
  }
  
  &__tips {
    background: #E8F5E9;
    border-radius: $radius-md;
    padding: 12px 16px;
    margin: 0 16px;
    display: flex;
    align-items: flex-start;
    
    &-icon {
      font-size: 16px;
      margin-right: 8px;
      margin-top: 2px;
    }
    
    &-text {
      flex: 1;
      font-size: $font-size-sm;
      color: $brand-dark;
      line-height: 1.5;
    }
  }
}
</style>
