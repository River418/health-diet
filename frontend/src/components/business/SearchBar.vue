<template>
  <view class="search-bar" :class="{ 'search-bar--sticky': sticky }">
    <view class="search-bar__input-wrapper" @click="handleClick">
      <text class="search-bar__icon">⌕</text>
      <text class="search-bar__placeholder">{{ placeholder || $t('home.searchPlaceholder') }}</text>
    </view>
  </view>
</template>

<script setup lang="ts">
import { useI18n } from 'vue-i18n'

const { t: $t } = useI18n()

interface Props {
  placeholder?: string
  sticky?: boolean
}

withDefaults(defineProps<Props>(), {
  sticky: false
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

.search-bar {
  padding: 12px 16px;
  background: #fff;
  
  &--sticky {
    position: sticky;
    top: 0;
    z-index: 100;
  }
  
  &__input-wrapper {
    height: 44px;
    background: $bg-gray;
    border-radius: 22px;
    display: flex;
    align-items: center;
    padding: 0 16px;
    gap: 8px;
  }
  
  &__icon {
    font-size: 20px;
    color: $text-tertiary;
  }
  
  &__placeholder {
    font-size: 14px;
    color: $text-tertiary;
  }
}
</style>
