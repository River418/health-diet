<template>
  <view 
    class="hd-tag"
    :class="[`hd-tag--${type}`, `hd-tag--${size}`, { 'hd-tag--round': round }]"
  >
    <text class="hd-tag__text">{{ text }}</text>
  </view>
</template>

<script setup lang="ts">
type TagType = 'primary' | 'secondary' | 'success' | 'warning' | 'error' | 'info'
type TagSize = 'small' | 'medium' | 'large'

interface Props {
  text: string
  type?: TagType
  size?: TagSize
  round?: boolean
}

withDefaults(defineProps<Props>(), {
  type: 'primary',
  size: 'medium',
  round: false
})
</script>

<style lang="scss">
@import '@/styles/variables.scss';

.hd-tag {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  
  &__text {
    line-height: 1;
  }
  
  // 尺寸
  &--small {
    padding: 2px 6px;
    font-size: 10px;
    border-radius: $radius-sm;
  }
  
  &--medium {
    padding: 4px 8px;
    font-size: $font-size-xs;
    border-radius: $radius-sm;
  }
  
  &--large {
    padding: 6px 12px;
    font-size: $font-size-sm;
    border-radius: $radius-md;
  }
  
  // 圆角
  &--round {
    &.hd-tag--small {
      border-radius: 10px;
    }
    
    &.hd-tag--medium {
      border-radius: $radius-full;
    }
    
    &.hd-tag--large {
      border-radius: $radius-full;
    }
  }
  
  // 类型
  &--primary {
    background: $brand-primary-10;
    color: $brand-primary;
  }
  
  &--secondary {
    background: $accent-orange-10;
    color: $accent-orange;
  }
  
  &--success {
    background: rgba(76, 175, 80, 0.1);
    color: $success;
  }
  
  &--warning {
    background: rgba(255, 152, 0, 0.1);
    color: $warning;
  }
  
  &--error {
    background: rgba(244, 67, 54, 0.1);
    color: $error;
  }
  
  &--info {
    background: rgba(33, 150, 243, 0.1);
    color: $info;
  }
}
</style>
