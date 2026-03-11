<template>
  <view class="search-bar" :class="{ 'search-bar--sticky': sticky }">
    <!-- 品牌Logo区域 -->
    <view class="search-bar__brand">
      <view class="search-bar__logo">
        <text class="search-bar__logo-icon">🌿</text>
      </view>
      <text class="search-bar__brand-text">食疗有方</text>
    </view>
    
    <!-- 搜索输入框 -->
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
  padding: $spacing-md $spacing-lg;
  background: $bg-card;
  
  &--sticky {
    position: sticky;
    top: 0;
    z-index: 100;
    box-shadow: $shadow-level-1;
  }
  
  &__brand {
    display: flex;
    align-items: center;
    gap: $spacing-sm;
    margin-bottom: $spacing-md;
  }
  
  &__logo {
    width: 32px;
    height: 32px;
    background: linear-gradient(135deg, $brand-primary, $brand-light);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    
    &-icon {
      font-size: 18px;
    }
  }
  
  &__brand-text {
    font-size: $font-size-lg;
    font-weight: $font-weight-bold;
    color: $brand-primary;
  }
  
  &__input-wrapper {
    height: $input-height;
    background: $bg-hover;
    border-radius: $radius-full;
    display: flex;
    align-items: center;
    padding: 0 $spacing-lg;
    gap: $spacing-sm;
    
    &:active {
      background: $bg-divider;
    }
  }
  
  &__icon {
    font-size: $font-size-lg;
    color: $text-tertiary;
  }
  
  &__placeholder {
    font-size: $font-size-base;
    color: $text-tertiary;
  }
}
</style>
