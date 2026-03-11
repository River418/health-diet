<template>
  <view class="agreement-page">
    <scroll-view scroll-y class="agreement-page__scroll">
      <view class="agreement-page__content">
        <text class="agreement-page__title">用户协议</text>
        <text class="agreement-page__text">
          欢迎使用Health-Diet食疗养生小程序！

          一、服务条款
          1. 本小程序提供食疗养生配方查询、收藏、分享等服务。
          2. 用户在使用本服务时，应当遵守相关法律法规。

          二、用户行为规范
          1. 用户应当提供真实、准确的个人信息。
          2. 用户不得发布违法违规内容。
          3. 用户应当尊重他人知识产权。

          三、免责声明
          1. 本小程序提供的食疗配方仅供参考，不能替代专业医疗建议。
          2. 如有身体不适，请及时就医。
          3. 因使用本小程序内容导致的任何损失，我们不承担责任。

          四、协议修改
          我们有权随时修改本协议，修改后的协议将在本页面公布。

          五、联系我们
          如有任何问题，请联系：support@health-diet.com
        </text>
      </view>
    </scroll-view>
  </view>
</template>

<script setup lang="ts">
</script>

<style lang="scss">
@import '@/styles/variables.scss';

.agreement-page {
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
