<template>
  <view class="about-page">
    <view class="about-page__logo">
      <view class="about-page__logo-icon">
        <text class="about-page__logo-emoji">🥗</text>
      </view>
      <text class="about-page__name">Health-Diet</text>
      <text class="about-page__version">Version 1.0.0</text>
    </view>
    
    <view class="about-page__section">
      <view class="about-page__list">
        <view class="about-page__list-item">
          <text class="about-page__list-text">官方网站</text>
          <text class="about-page__list-value">www.health-diet.com</text>
        </view>
        <view class="about-page__list-item">
          <text class="about-page__list-text">客服邮箱</text>
          <text class="about-page__list-value">support@health-diet.com</text>
        </view>
      </view>
    </view>
    
    <view class="about-page__footer">
      <text class="about-page__copyright">© 2026 Health-Diet. All rights reserved.</text>
    </view>
  </view>
</template>

<script setup lang="ts">
</script>

<style lang="scss">
@import '@/styles/variables.scss';

.about-page {
  min-height: 100vh;
  background: $bg-gray;
  padding: 48px 16px;
  
  &__logo {
    display: flex;
    flex-direction: column;
    align-items: center;
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
  
  &__name {
    font-size: 24px;
    font-weight: $font-weight-bold;
    color: $text-primary;
    margin-bottom: 8px;
  }
  
  &__version {
    font-size: 14px;
    color: $text-tertiary;
  }
  
  &__section {
    background: #fff;
    border-radius: 12px;
    overflow: hidden;
    margin-bottom: 32px;
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
    }
    
    &-text {
      font-size: 15px;
      color: $text-primary;
    }
    
    &-value {
      font-size: 14px;
      color: $text-tertiary;
    }
  }
  
  &__footer {
    text-align: center;
  }
  
  &__copyright {
    font-size: 12px;
    color: $text-tertiary;
  }
}
</style>
