<template>
  <view class="hd-empty">
    <view class="hd-empty__icon-wrapper">
      <text class="hd-empty__icon">{{ icon || '📭' }}</text>
    </view>
    <text class="hd-empty__title">{{ title || $t('common.noData') }}</text>
    <text v-if="desc" class="hd-empty__desc">{{ desc }}</text>
    <view 
      v-if="showAction"
      class="hd-empty__btn"
      @click="handleAction"
    >
      <text class="hd-empty__btn-text">{{ actionText || $t('common.retry') }}</text>
    </view>
  </view>
</template>

<script setup lang="ts">
import { useI18n } from 'vue-i18n'

const { t: $t } = useI18n()

interface Props {
  icon?: string
  title?: string
  desc?: string
  showAction?: boolean
  actionText?: string
}

withDefaults(defineProps<Props>(), {
  showAction: false
})

const emit = defineEmits<{
  action: []
}>()

const handleAction = () => {
  emit('action')
}
</script>

<style lang="scss">
@import '@/styles/variables.scss';

.hd-empty {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  padding: $spacing-xxxl $spacing-lg;
  
  &__icon-wrapper {
    width: 80px;
    height: 80px;
    border-radius: 50%;
    background: $bg-hover;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: $spacing-lg;
  }
  
  &__icon {
    font-size: 40px;
    color: $text-tertiary;
  }
  
  &__title {
    font-size: $font-size-lg;
    font-weight: $font-weight-medium;
    color: $text-primary;
    margin-bottom: $spacing-xs;
  }
  
  &__desc {
    font-size: $font-size-sm;
    color: $text-tertiary;
    margin-bottom: $spacing-xl;
    text-align: center;
  }
  
  &__btn {
    height: $btn-height-md;
    padding: 0 $spacing-xl;
    background: transparent;
    border: 1px solid $brand-primary;
    border-radius: $radius-full;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    
    &:active {
      background: $brand-primary-10;
    }
    
    &-text {
      font-size: $font-size-base;
      color: $brand-primary;
    }
  }
}
</style>
