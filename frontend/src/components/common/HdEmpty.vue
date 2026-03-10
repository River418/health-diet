<template>
  <view class="hd-empty">
    <view class="hd-empty__icon">{{ icon || '📭' }}</view>
    <text class="hd-empty__title">{{ title || $t('common.noData') || '暂无数据' }}</text>
    <text v-if="desc" class="hd-empty__desc">{{ desc }}</text>
    <hd-button
      v-if="showAction"
      type="outline"
      size="medium"
      class="hd-empty__action"
      @click="handleAction"
    >
      {{ actionText || $t('common.retry') || '重试' }}
    </hd-button>
  </view>
</template>

<script setup lang="ts">
import { useI18n } from 'vue-i18n'
import HdButton from './HdButton.vue'

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
  padding: 48px 16px;
  
  &__icon {
    width: 120px;
    height: 120px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 64px;
    margin-bottom: 16px;
    background: $bg-gray;
    border-radius: 50%;
  }
  
  &__title {
    font-size: 16px;
    color: $text-primary;
    margin-bottom: 8px;
    font-weight: $font-weight-medium;
  }
  
  &__desc {
    font-size: 14px;
    color: $text-secondary;
    margin-bottom: 24px;
    text-align: center;
  }
  
  &__action {
    margin-top: 8px;
  }
}
</style>
