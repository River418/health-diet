<template>
  <view class="help-page">
    <view class="help-page__section">
      <view class="help-page__section-title">常见问题</view>
      <view class="help-page__list">
        <view class="help-page__list-item" @click="showFAQ('如何使用')">
          <text class="help-page__list-text">如何使用食疗配方？</text>
          <text class="help-page__list-arrow">></text>
        </view>
        <view class="help-page__list-item" @click="showFAQ('收藏')">
          <text class="help-page__list-text">如何收藏喜欢的配方？</text>
          <text class="help-page__list-arrow">></text>
        </view>
        <view class="help-page__list-item" @click="showFAQ('分享')">
          <text class="help-page__list-text">如何分享给朋友？</text>
          <text class="help-page__list-arrow">></text>
        </view>
      </view>
    </view>
    
    <view class="help-page__section">
      <view class="help-page__section-title">反馈问题</view>
      <view class="help-page__feedback">
        <textarea
          v-model="feedback"
          class="help-page__textarea"
          placeholder="请描述您遇到的问题..."
          maxlength="500"
        />
        <hd-button
          type="primary"
          size="large"
          block
          text="提交反馈"
          @click="submitFeedback"
        />
      </view>
    </view>
  </view>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import Taro from '@tarojs/taro'
import HdButton from '@/components/common/HdButton.vue'

const feedback = ref('')

const showFAQ = (title: string) => {
  Taro.showToast({
    title: '功能开发中',
    icon: 'none'
  })
}

const submitFeedback = () => {
  if (!feedback.value.trim()) {
    Taro.showToast({
      title: '请输入反馈内容',
      icon: 'none'
    })
    return
  }
  
  // TODO: 调用API提交反馈
  Taro.showToast({
    title: '提交成功',
    icon: 'success'
  })
  feedback.value = ''
}
</script>

<style lang="scss">
@import '@/styles/variables.scss';

.help-page {
  min-height: 100vh;
  background: $bg-page;
  padding: 16px;
  
  &__section {
    background: #fff;
    border-radius: 12px;
    overflow: hidden;
    margin-bottom: 16px;
    
    &-title {
      font-size: 14px;
      font-weight: $font-weight-medium;
      color: $text-secondary;
      padding: 12px 16px;
      background: $bg-page;
    }
  }
  
  &__list {
    &-item {
      display: flex;
      align-items: center;
      justify-content: space-between;
      height: 56px;
      padding: 0 16px;
      border-bottom: 1px solid $bg-divider;
      
      &:last-child {
        border-bottom: none;
      }
      
      &:active {
        background: $bg-page;
      }
    }
    
    &-text {
      font-size: 15px;
      color: $text-primary;
    }
    
    &-arrow {
      font-size: 16px;
      color: $text-tertiary;
    }
  }
  
  &__feedback {
    padding: 16px;
  }
  
  &__textarea {
    width: 100%;
    height: 120px;
    background: $bg-page;
    border-radius: 8px;
    padding: 12px;
    font-size: 14px;
    color: $text-primary;
    margin-bottom: 16px;
    box-sizing: border-box;
  }
}
</style>
