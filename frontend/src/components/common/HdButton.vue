<template>
  <button
    class="hd-btn"
    :class="[
      `hd-btn--${type}`,
      `hd-btn--${size}`,
      {
        'hd-btn--disabled': disabled || loading,
        'hd-btn--block': block
      }
    ]"
    :disabled="disabled || loading"
    @click="handleClick"
  >
    <view v-if="loading" class="hd-btn__loading">
      <view class="hd-btn__loading-spinner"></view>
    </view>
    <view v-else-if="icon" class="hd-btn__icon">
      <text class="hd-btn__icon-text">{{ icon }}</text>
    </view>
    <text class="hd-btn__text">
      <slot>{{ text }}</slot>
    </text>
  </button>
</template>

<script setup lang="ts">
interface Props {
  type?: 'primary' | 'secondary' | 'outline' | 'ghost' | 'text' | 'danger'
  size?: 'small' | 'medium' | 'large' | 'xlarge'
  disabled?: boolean
  loading?: boolean
  block?: boolean
  icon?: string
  text?: string
}

const props = withDefaults(defineProps<Props>(), {
  type: 'primary',
  size: 'medium',
  disabled: false,
  loading: false,
  block: false
})

const emit = defineEmits<{
  click: [event: Event]
}>()

const handleClick = (event: Event) => {
  if (!props.disabled && !props.loading) {
    emit('click', event)
  }
}
</script>

<style lang="scss">
@import '@/styles/variables.scss';

.hd-btn {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  border: none;
  border-radius: $radius-md;
  font-weight: $font-weight-medium;
  transition: all 0.2s ease;
  background: transparent;
  
  &::after {
    border: none;
  }
  
  &:active {
    transform: scale(0.98);
  }
  
  // 尺寸
  &--small {
    height: 32px;
    padding: 0 16px;
    font-size: $font-size-sm;
  }
  
  &--medium {
    height: 44px;
    padding: 0 24px;
    font-size: $font-size-base;
  }
  
  &--large {
    height: 52px;
    padding: 0 32px;
    font-size: $font-size-lg;
  }
  
  &--xlarge {
    height: 56px;
    padding: 0 40px;
    font-size: 17px;
  }
  
  // 类型
  &--primary {
    background-color: $brand-primary;
    color: #fff;
    
    &:active {
      background-color: $brand-dark;
    }
  }
  
  &--secondary {
    background-color: $brand-light;
    color: $brand-primary;
    
    &:active {
      background-color: darken($brand-light, 5%);
    }
  }
  
  &--outline {
    background-color: transparent;
    border: 1px solid $brand-primary;
    color: $brand-primary;
    
    &:active {
      background-color: $brand-light;
    }
  }
  
  &--ghost {
    background-color: transparent;
    color: $brand-primary;
    
    &:active {
      background-color: rgba($brand-primary, 0.1);
    }
  }
  
  &--text {
    background-color: transparent;
    color: $brand-primary;
    padding: 0;
    height: auto;
    
    &:active {
      opacity: 0.7;
    }
  }
  
  &--danger {
    background-color: $error;
    color: #fff;
    
    &:active {
      background-color: darken($error, 10%);
    }
  }
  
  // 禁用状态
  &--disabled {
    opacity: 0.5;
    pointer-events: none;
  }
  
  // 块级按钮
  &--block {
    width: 100%;
  }
  
  // 图标
  &__icon {
    margin-right: 8px;
    display: flex;
    align-items: center;
    
    &-text {
      font-size: 24px;
    }
  }
  
  // 加载动画
  &__loading {
    margin-right: 8px;
    
    &-spinner {
      width: 16px;
      height: 16px;
      border: 2px solid rgba(255, 255, 255, 0.3);
      border-top-color: #fff;
      border-radius: 50%;
      animation: hd-btn-spin 0.8s linear infinite;
    }
  }
}

@keyframes hd-btn-spin {
  to {
    transform: rotate(360deg);
  }
}
</style>
