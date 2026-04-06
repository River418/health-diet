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
  min-height: 56px;
  padding: $spacing-sm $spacing-lg;
  box-sizing: border-box;
  background: #FFFFFF;
  display: flex;
  align-items: center;
  gap: $spacing-md;
  
  &--sticky {
    position: sticky;
    top: 0;
    z-index: 100;
    box-shadow: 0 2px 8px rgba(0,0,0,0.05);
  }
  
  &__brand {
    display: flex;
    align-items: center;
    gap: $spacing-sm;
    flex-shrink: 0;
  }
  
  &__logo {
    width: 28px;
    height: 28px;
    background: linear-gradient(135deg, $brand-primary, $brand-light);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    
    &-icon {
      font-size: $font-size-sm;
    }
  }
  
  &__brand-text {
    font-size: $font-size-md;
    font-weight: $font-weight-bold;
    color: $brand-primary;
  }
  
  &__input-wrapper {
    flex: 1;
    min-height: 40px;
    background: #F5F5F5;
    border-radius: 20px;
    display: flex;
    align-items: center;
    padding: 8px $spacing-md;
    box-sizing: border-box;
    gap: $spacing-xs;
    
    &:active {
      background: $bg-divider;
    }
  }
  
  &__icon {
    font-size: $font-size-base;
    color: #999999;
  }
  
  &__placeholder {
    font-size: $font-size-sm;
    color: #999999;
    line-height: 1.4;
  }
}
</style>
