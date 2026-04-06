<template>
  <view 
    class="hd-btn"
    :class="[
      `hd-btn--${type}`,
      `hd-btn--${size}`,
      { 
        'hd-btn--block': block,
        'hd-btn--disabled': disabled,
        'hd-btn--loading': loading
      }
    ]"
    :style="customStyle"
    @click="handleClick"
  >
    <text v-if="loading" class="hd-btn__loading"></text>
    <text class="hd-btn__text">{{ text }}</text>
  </view>
</template>

<script setup lang="ts">
import { computed } from 'vue'

type ButtonType = 'primary' | 'secondary' | 'outline' | 'text' | 'danger'
type ButtonSize = 'small' | 'medium' | 'large'

interface Props {
  text: string
  type?: ButtonType
  size?: ButtonSize
  block?: boolean
  disabled?: boolean
  loading?: boolean
  customStyle?: string
}

const props = withDefaults(defineProps<Props>(), {
  type: 'primary',
  size: 'medium',
  block: false,
  disabled: false,
  loading: false
})

const emit = defineEmits<{
  click: []
}>()

const handleClick = () => {
  if (props.disabled || props.loading) return
  emit('click')
}
</script>

<style lang="scss">
@import '@/styles/variables.scss';

.hd-btn {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  box-sizing: border-box;
  border-radius: $radius-full;
  font-weight: $font-weight-medium;
  transition: all $duration-fast $ease-standard;
  cursor: pointer;
  
  &:active:not(&--disabled):not(&--loading) {
    transform: scale(0.98);
  }
  
  &--disabled {
    opacity: 0.5;
    cursor: not-allowed;
  }
  
  &--loading {
    cursor: not-allowed;
  }
  
  // 尺寸
  &--small {
    min-height: $btn-height-sm;
    padding: 8px $spacing-lg;
    font-size: $font-size-sm;
    line-height: 1.5;
  }
  
  &--medium {
    min-height: $btn-height-md;
    padding: 12px $spacing-xl;
    font-size: $font-size-base;
    line-height: 1.5;
  }
  
  &--large {
    min-height: $btn-height-lg;
    padding: 14px $spacing-xxl;
    font-size: $font-size-md;
    line-height: 1.5;
  }
  
  // 块级
  &--block {
    width: 100%;
    display: flex;
  }
  
  // 类型
  &--primary {
    background: $brand-primary;
    color: #fff;
    box-shadow: $shadow-brand;
    
    &:active:not(&--disabled):not(&--loading) {
      background: $brand-dark;
    }
  }
  
  &--secondary {
    background: $brand-primary-10;
    color: $brand-primary;
    
    &:active:not(&--disabled):not(&--loading) {
      background: $brand-primary-20;
    }
  }
  
  &--outline {
    background: transparent;
    border: 1px solid $brand-primary;
    color: $brand-primary;
    
    &:active:not(&--disabled):not(&--loading) {
      background: $brand-primary-10;
    }
  }
  
  &--text {
    background: transparent;
    color: $brand-primary;
    padding: 0;
    height: auto;
    
    &:active:not(&--disabled):not(&--loading) {
      color: $brand-dark;
    }
  }
  
  &--danger {
    background: $error;
    color: #fff;
    
    &:active:not(&--disabled):not(&--loading) {
      opacity: 0.8;
    }
  }
  
  // 加载动画
  &__loading {
    width: 16px;
    height: 16px;
    border: 2px solid currentColor;
    border-top-color: transparent;
    border-radius: 50%;
    animation: btn-loading 1s linear infinite;
    margin-right: $spacing-xs;
  }
  
  &__text {
    line-height: inherit;
  }
}

@keyframes btn-loading {
  from {
    transform: rotate(0deg);
  }
  to {
    transform: rotate(360deg);
  }
}
</style>
