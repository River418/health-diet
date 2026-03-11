<template>
  <view class="hd-disclaimer" :class="{ 'hd-disclaimer--fixed': fixed }">
    <text class="hd-disclaimer__icon">⚠️</text>
    <text class="hd-disclaimer__text">{{ text || $t('disclaimer.text') }}</text>
  </view>
</template>

<script setup lang="ts">
import { useI18n } from 'vue-i18n'

const { t: $t } = useI18n()

interface Props {
  text?: string
  fixed?: boolean
}

withDefaults(defineProps<Props>(), {
  fixed: false
})
</script>

<style lang="scss">
@import '@/styles/variables.scss';

.hd-disclaimer {
  background-color: #FFF8E1;
  border: 1px solid #FFE082;
  border-radius: $radius-md;
  padding: $spacing-md $spacing-lg;
  display: flex;
  align-items: flex-start;
  gap: $spacing-sm;
  
  &--fixed {
    position: fixed;
    left: $spacing-lg;
    right: $spacing-lg;
    z-index: 100;
  }
  
  &__icon {
    font-size: $font-size-sm;
    flex-shrink: 0;
    color: #F57C00;
  }
  
  &__text {
    font-size: $font-size-xs;
    color: #F57C00;
    line-height: $line-height-normal;
    flex: 1;
  }
}
</style>
