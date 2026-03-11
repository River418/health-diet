<template>
  <view 
    class="hd-card"
    :class="{ 
      'hd-card--shadow': shadow,
      'hd-card--hover': hover,
      'hd-card--border': border
    }"
    :style="customStyle"
    @click="handleClick"
  >
    <slot></slot>
  </view>
</template>

<script setup lang="ts">
interface Props {
  shadow?: boolean
  hover?: boolean
  border?: boolean
  customStyle?: string
}

withDefaults(defineProps<Props>(), {
  shadow: true,
  hover: true,
  border: false
})

const emit = defineEmits<{
  click: []
}>()

const handleClick = () => {
  emit('click')
}
</script>

<style lang="scss">
@import '@/styles/variables.scss';

.hd-card {
  background: $bg-card;
  border-radius: $radius-lg;
  padding: $spacing-lg;
  
  &--shadow {
    box-shadow: $shadow-card;
  }
  
  &--hover {
    cursor: pointer;
    
    &:active {
      transform: translateY(-2px);
      box-shadow: $shadow-card-hover;
      transition: all $duration-fast $ease-standard;
    }
  }
  
  &--border {
    border: 1px solid $border-color;
  }
}
</style>
