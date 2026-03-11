<template>
  <view class="hd-skeleton" :class="[`hd-skeleton--${type}`]">
    <!-- 卡片骨架屏 -->
    <template v-if="type === 'card'">
      <view class="hd-skeleton__card">
        <view class="hd-skeleton__card-image"></view>
        <view class="hd-skeleton__card-content">
          <view class="hd-skeleton__card-title"></view>
          <view class="hd-skeleton__card-meta"></view>
        </view>
      </view>
    </template>
    
    <!-- 列表骨架屏 -->
    <template v-if="type === 'list'">
      <view v-for="n in rows" :key="n" class="hd-skeleton__list-item">
        <view class="hd-skeleton__list-avatar"></view>
        <view class="hd-skeleton__list-content">
          <view class="hd-skeleton__list-title"></view>
          <view class="hd-skeleton__list-subtitle"></view>
        </view>
      </view>
    </template>
    
    <!-- 图文骨架屏 -->
    <template v-if="type === 'image'">
      <view class="hd-skeleton__image-wrapper">
        <view class="hd-skeleton__image"></view>
        <view class="hd-skeleton__image-content">
          <view class="hd-skeleton__image-title"></view>
          <view class="hd-skeleton__image-desc"></view>
        </view>
      </view>
    </template>
  </view>
</template>

<script setup lang="ts">
type SkeletonType = 'card' | 'list' | 'image'

interface Props {
  type?: SkeletonType
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
  // 通用动画
  & * {
    background: linear-gradient(90deg, $bg-divider 25%, $bg-hover 50%, $bg-divider 75%);
    background-size: 200% 100%;
    animation: skeleton-loading 1.5s infinite;
  }
  
  // 卡片骨架屏
  &__card {
    background: $bg-card;
    border-radius: $radius-lg;
    overflow: hidden;
    margin-bottom: $spacing-md;
    
    &-image {
      width: 100%;
      height: 120px;
    }
    
    &-content {
      padding: $spacing-md;
    }
    
    &-title {
      height: 18px;
      width: 70%;
      border-radius: $radius-sm;
      margin-bottom: $spacing-sm;
    }
    
    &-meta {
      height: 14px;
      width: 40%;
      border-radius: $radius-sm;
    }
  }
  
  // 列表骨架屏
  &__list-item {
    display: flex;
    align-items: center;
    gap: $spacing-md;
    padding: $spacing-md;
    background: $bg-card;
    border-radius: $radius-lg;
    margin-bottom: $spacing-md;
  }
  
  &__list-avatar {
    width: 48px;
    height: 48px;
    border-radius: 50%;
    flex-shrink: 0;
  }
  
  &__list-content {
    flex: 1;
  }
  
  &__list-title {
    height: 16px;
    width: 60%;
    border-radius: $radius-sm;
    margin-bottom: $spacing-xs;
  }
  
  &__list-subtitle {
    height: 14px;
    width: 40%;
    border-radius: $radius-sm;
  }
  
  // 图文骨架屏
  &__image-wrapper {
    display: flex;
    gap: $spacing-md;
    background: $bg-card;
    border-radius: $radius-lg;
    padding: $spacing-md;
    margin-bottom: $spacing-md;
  }
  
  &__image {
    width: 100px;
    height: 100px;
    border-radius: $radius-md;
    flex-shrink: 0;
  }
  
  &__image-content {
    flex: 1;
    display: flex;
    flex-direction: column;
    justify-content: center;
  }
  
  &__image-title {
    height: 18px;
    width: 80%;
    border-radius: $radius-sm;
    margin-bottom: $spacing-sm;
  }
  
  &__image-desc {
    height: 14px;
    width: 50%;
    border-radius: $radius-sm;
  }
}

@keyframes skeleton-loading {
  0% {
    background-position: 200% 0;
  }
  100% {
    background-position: -200% 0;
  }
}
</style>
