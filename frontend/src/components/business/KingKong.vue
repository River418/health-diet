<template>
  <view class="kingkong">
    <view
      v-for="(item, index) in items"
      :key="index"
      class="kingkong__item"
      @click="handleClick(item)"
    >
      <view
        class="kingkong__icon"
        :style="{ background: item.gradient }"
      >
        <text class="kingkong__icon-text">{{ item.icon }}</text>
      </view>
      <text class="kingkong__text">{{ item.name }}</text>
    </view>
  </view>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { useI18n } from 'vue-i18n'

const { t } = useI18n()

interface KingKongItem {
  icon: string
  name: string
  gradient: string
  path: string
  query?: Record<string, string>
}

const items = computed<KingKongItem[]>(() => [
  {
    icon: '🧓',
    name: t('home.kingKong.elderly'),
    gradient: 'linear-gradient(135deg, #FF8C42, #FFB74D)',
    path: '/pages/recipe/list/index',
    query: { crowd: 'elderly' }
  },
  {
    icon: '💼',
    name: t('home.kingKong.office'),
    gradient: 'linear-gradient(135deg, #64B5F6, #90CAF9)',
    path: '/pages/recipe/list/index',
    query: { crowd: 'office' }
  },
  {
    icon: '🌸',
    name: t('home.kingKong.solar'),
    gradient: 'linear-gradient(135deg, #FFD54F, #FFE082)',
    path: '/pages/category/index',
    query: { tab: 'solar' }
  },
  {
    icon: '🩸',
    name: t('home.kingKong.blood'),
    gradient: 'linear-gradient(135deg, #F48FB1, #F8BBD9)',
    path: '/pages/recipe/list/index',
    query: { efficacy: 'blood' }
  },
  {
    icon: '🍚',
    name: t('home.kingKong.stomach'),
    gradient: 'linear-gradient(135deg, #81C784, #A5D6A7)',
    path: '/pages/recipe/list/index',
    query: { efficacy: 'stomach' }
  },
  {
    icon: '🌙',
    name: t('home.kingKong.sleep'),
    gradient: 'linear-gradient(135deg, #9575CD, #B39DDB)',
    path: '/pages/recipe/list/index',
    query: { efficacy: 'sleep' }
  },
  {
    icon: '✨',
    name: t('home.kingKong.beauty'),
    gradient: 'linear-gradient(135deg, #F06292, #F48FB1)',
    path: '/pages/recipe/list/index',
    query: { efficacy: 'beauty' }
  },
  {
    icon: '➕',
    name: t('home.kingKong.more'),
    gradient: 'linear-gradient(135deg, #E0E0E0, #F5F5F5)',
    path: '/pages/category/index'
  }
])

const emit = defineEmits<{
  click: [item: KingKongItem]
}>()

const handleClick = (item: KingKongItem) => {
  emit('click', item)
}
</script>

<style lang="scss">
@import '@/styles/variables.scss';

.kingkong {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: $spacing-md;
  padding: $spacing-lg;
  background: $bg-card;
  border-radius: $radius-lg;
  margin: 0 $spacing-lg $spacing-md;
  
  &__item {
    display: flex;
    flex-direction: column;
    align-items: center;
    cursor: pointer;
    
    &:active {
      opacity: 0.7;
      transform: scale(0.95);
      transition: all $duration-fast $ease-standard;
    }
  }
  
  &__icon {
    width: $icon-size-xl;
    height: $icon-size-xl;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: $spacing-sm;
    box-shadow: $shadow-level-1;
    
    &-text {
      font-size: 28px;
    }
  }
  
  &__text {
    font-size: $font-size-xs;
    color: $text-primary;
    text-align: center;
    line-height: $line-height-tight;
  }
}
</style>
