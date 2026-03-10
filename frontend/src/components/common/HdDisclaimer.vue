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
  background-color: #FFF3CD;
  border: 1px solid #FFE082;
  border-radius: 8px;
  padding: 12px 16px;
  display: flex;
  align-items: flex-start;
  gap: 8px;
  
  &--fixed {
    position: fixed;
    left: 0;
    right: 0;
    z-index: 100;
  }
  
  &__icon {
    font-size: 14px;
    flex-shrink: 0;
  }
  
  &__text {
    font-size: 13px;
    color: #856404;
    line-height: 1.5;
    flex: 1;
  }
}
</style>
