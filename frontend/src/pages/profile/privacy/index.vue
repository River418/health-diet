<template>
  <view class="privacy-page" :class="fontLargeClass">
    <scroll-view scroll-y class="privacy-page__scroll">
      <view class="privacy-page__content">
        <text class="privacy-page__title">隐私政策</text>
        <text class="privacy-page__text">
          Health-Diet食疗养生小程序非常重视用户的隐私保护。

          一、信息收集
          1. 我们收集的信息包括：
             - 用户基本信息（昵称、头像）
             - 使用记录（收藏、浏览历史）
             - 设备信息

          2. 信息收集目的：
             - 提供个性化服务
             - 改进产品体验
             - 保障账号安全

          二、信息使用
          1. 我们承诺不会将您的个人信息出售给第三方。
          2. 仅在以下情况下可能共享信息：
             - 获得您的明确授权
             - 法律法规要求
             - 保护我们的合法权益

          三、信息安全
          1. 我们采用加密技术保护您的个人信息。
          2. 定期对系统进行安全评估。

          四、用户权利
          1. 您有权查看、修改、删除您的个人信息。
          2. 您有权注销账号。

          五、联系我们
          如有任何隐私相关问题，请联系：privacy@health-diet.com
        </text>
      </view>
    </scroll-view>
  </view>
</template>

<script setup lang="ts">
import { usePageFontSize } from '@/composables'
const { fontLargeClass } = usePageFontSize()
</script>

<style lang="scss">
@import '@/styles/variables.scss';

.privacy-page {
  min-height: 100vh;
  background: #fff;
  
  &__scroll {
    min-height: 100vh;
  }
  
  &__content {
    padding: 24px 16px;
  }
  
  &__title {
    display: block;
    font-size: 20px;
    font-weight: $font-weight-bold;
    color: $text-primary;
    margin-bottom: 24px;
    text-align: center;
  }
  
  &__text {
    display: block;
    font-size: 14px;
    color: $text-primary;
    line-height: 1.8;
    white-space: pre-wrap;
  }
}
</style>
