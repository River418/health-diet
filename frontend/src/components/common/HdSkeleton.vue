<template>
  <view class="hd-skeleton" :class="`hd-skeleton--${type}`">
    <!-- 卡片骨架 -->
    <template v-if="type === 'card'">
      <view class="hd-skeleton__card">
        <view class="hd-skeleton__image"></view>
        <view class="hd-skeleton__content">
          <view class="hd-skeleton__title"></view>
          <view class="hd-skeleton__line"></view>
          <view class="hd-skeleton__line--short"></view>
        </view>
      </view>
    </template>
    
    <!-- 列表骨架 -->
    <template v-if="type === 'list'">
      <view v-for="i in rows" :key="i" class="hd-skeleton__list-item">
        <view class="hd-skeleton__avatar"></view>
        <view class="hd-skeleton__lines">
          <view class="hd-skeleton__line"></view>
          <view class="hd-skeleton__line--short"></view>
        </view>
      </view>
    </template>
    
    <!-- 详情骨架 -->
    <template v-if="type === 'detail'">
      <view class="hd-skeleton__detail">
        <view class="hd-skeleton__banner"></view>
        <view class="hd-skeleton__content">
          <view class="hd-skeleton__title--large"></view>
          <view class="hd-skeleton__line"></view>
          <view class="hd-skeleton__line"></view>
          <view class="hd-skeleton__line--short"></view>
        </view>
      </view>
    </template>
    
    <!-- 金刚位骨架 -->
    <template v-if="type === 'kingkong'">
      <view class="hd-skeleton__kingkong">
        <view v-for="i in 8" :key="i" class="hd-skeleton__kingkong-item">
          <view class="hd-skeleton__kingkong-icon"></view>
          <view class="hd-skeleton__kingkong-text"></view>
        </view>
      </view>
    </template>
  </view>
</template>

<script setup lang="ts">
interface Props {
  type?: 'card' | 'list' | 'detail' | 'kingkong'
  rows?: number
}

withDefaults(defineProps<Props>(), {
  type: 'card',
  rows: 3
})
</script>

<style lang="scss">
@import '@/styles/variables.scss';

.hd-skeleton {
  // 基础动画
  &__image,
  &__avatar,
  &__banner,
  &__icon,
  &__title,
  &__title--large,
  &__line,
  &__line--short,
  &__kingkong-icon,
  &__kingkong-text {
    background: linear-gradient(90deg, #f0f0f0 25%, #e0e0e0 50%, #f0f0f0 75%);
    background-size: 200% 100%;
    animation: hd-skeleton-loading 1.5s infinite;
    border-radius: 4px;
  }
  
  // 卡片骨架
  &__card {
    background: #fff;
    border-radius: 12px;
    overflow: hidden;
    margin-bottom: 16px;
  }
  
  &__image {
    width: 100%;
    padding-top: 56.25%;
    border-radius: 0;
  }
  
  &__content {
    padding: 12px;
  }
  
  // 列表骨架
  &__list-item {
    display: flex;
    align-items: center;
    padding: 12px 16px;
    background: #fff;
    margin-bottom: 1px;
  }
  
  &__avatar {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    margin-right: 12px;
    flex-shrink: 0;
  }
  
  &__lines {
    flex: 1;
  }
  
  // 详情骨架
  &__detail {
    background: #fff;
  }
  
  &__banner {
    width: 100%;
    padding-top: 56.25%;
    border-radius: 0;
  }
  
  // 通用元素
  &__title {
    height: 16px;
    margin-bottom: 12px;
    width: 60%;
    
    &--large {
      height: 24px;
      margin-bottom: 16px;
      width: 80%;
    }
  }
  
  &__line {
    height: 14px;
    margin-bottom: 8px;
    width: 100%;
    
    &--short {
      height: 14px;
      margin-bottom: 8px;
      width: 40%;
    }
  }
  
  // 金刚位骨架
  &__kingkong {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 16px;
    padding: 16px;
    background: #fff;
    
    &-item {
      display: flex;
      flex-direction: column;
      align-items: center;
    }
    
    &-icon {
      width: 48px;
      height: 48px;
      border-radius: 12px;
      margin-bottom: 8px;
    }
    
    &-text {
      width: 48px;
      height: 12px;
    }
  }
}

@keyframes hd-skeleton-loading {
  0% {
    background-position: 200% 0;
  }
  100% {
    background-position: -200% 0;
  }
}
</style>
