<template>
  <view
    class="hd-tag"
    :class="[
      `hd-tag--${type}`,
      `hd-tag--${size}`,
      {
        'hd-tag--selected': selected,
        'hd-tag--disabled': disabled
      }
    ]"
    @click="handleClick"
  >
    <text class="hd-tag__text">{{ text }}</text>
  </view>
</template>

<script setup lang="ts">
interface Props {
  text: string
  type?: 'primary' | 'secondary' | 'outline' | 'orange' | 'blue' | 'gray'
  size?: 'small' | 'medium' | 'large'
  selected?: boolean
  disabled?: boolean
}

const props = withDefaults(defineProps<Props>(), {
  type: 'secondary',
  size: 'medium',
  selected: false,
  disabled: false
})

const emit = defineEmits<{
  click: []
}>()

const handleClick = () => {
  if (!props.disabled) {
    emit('click')
  }
}
</script>

<style lang="scss">
@import '@/styles/variables.scss';

.hd-tag {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  border-radius: 4px;
  transition: all 0.2s ease;
  
  // 尺寸
  &--small {
    height: 20px;
    padding: 2px 8px;
    font-size: 11px;
  }
  
  &--medium {
    height: 24px;
    padding: 4px 12px;
    font-size: 12px;
  }
  
  &--large {
    height: 28px;
    padding: 4px 16px;
    font-size: 13px;
  }
  
  // 类型
  &--primary {
    background-color: $brand-primary;
    color: #fff;
  }
  
  &--secondary {
    background-color: $brand-light;
    color: $brand-primary;
  }
  
  &--outline {
    background-color: transparent;
    border: 1px solid $brand-primary;
    color: $brand-primary;
  }
  
  &--orange {
    background-color: #FFF3E0;
    color: $accent-orange;
  }
  
  &--blue {
    background-color: #E3F2FD;
    color: $accent-blue;
  }
  
  &--gray {
    background-color: $bg-gray;
    color: $text-secondary;
  }
  
  // 选中状态
  &--selected {
    background-color: $brand-primary;
    color: #fff;
  }
  
  // 禁用状态
  &--disabled {
    opacity: 0.5;
  }
  
  &__text {
    line-height: 1;
  }
}
</style>
