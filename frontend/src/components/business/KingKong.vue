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
        :style="{ backgroundColor: item.bgColor }"
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
  bgColor: string
  path: string
  query?: Record<string, string>
}

const items = computed<KingKongItem[]>(() => [
  {
    icon: '🧓',
    name: t('home.kingKong.elderly'),
    bgColor: '#E8F5E9',
    path: '/pages/recipe/list/index',
    query: { crowd: 'elderly' }
  },
  {
    icon: '💼',
    name: t('home.kingKong.office'),
    bgColor: '#E3F2FD',
    path: '/pages/recipe/list/index',
    query: { crowd: 'office' }
  },
  {
    icon: '🌸',
    name: t('home.kingKong.solar'),
    bgColor: '#FFF3E0',
    path: '/pages/category/index',
    query: { tab: 'solar' }
  },
  {
    icon: '🩸',
    name: t('home.kingKong.blood'),
    bgColor: '#FCE4EC',
    path: '/pages/recipe/list/index',
    query: { efficacy: 'blood' }
  },
  {
    icon: '🍚',
    name: t('home.kingKong.stomach'),
    bgColor: '#E8F5E9',
    path: '/pages/recipe/list/index',
    query: { efficacy: 'stomach' }
  },
  {
    icon: '🌙',
    name: t('home.kingKong.sleep'),
    bgColor: '#EDE7F6',
    path: '/pages/recipe/list/index',
    query: { efficacy: 'sleep' }
  },
  {
    icon: '✨',
    name: t('home.kingKong.beauty'),
    bgColor: '#FCE4EC',
    path: '/pages/recipe/list/index',
    query: { efficacy: 'beauty' }
  },
  {
    icon: '➕',
    name: t('home.kingKong.more'),
    bgColor: '#F5F5F5',
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
  gap: 16px;
  padding: 16px;
  background: #fff;
  border-radius: 12px;
  margin: 0 16px 16px;
  
  &__item {
    display: flex;
    flex-direction: column;
    align-items: center;
    cursor: pointer;
    
    &:active {
      opacity: 0.7;
    }
  }
  
  &__icon {
    width: 48px;
    height: 48px;
    border-radius: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: 8px;
    
    &-text {
      font-size: 28px;
    }
  }
  
  &__text {
    font-size: 13px;
    color: $text-primary;
  }
}
</style>
