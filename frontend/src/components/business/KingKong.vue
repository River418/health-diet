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

const items = computed<KingKongItem[]>(() => ([
  {
    icon: '🧓',
    name: t('home.kingKong.elderly'),
    gradient: 'linear-gradient(135deg, #E8F5E9, #E8F5E9)',
    path: '/pages/recipe/list/index',
    query: { crowd: '中老年' }
  },
  {
    icon: '💼',
    name: t('home.kingKong.office'),
    gradient: 'linear-gradient(135deg, #E3F2FD, #E3F2FD)',
    path: '/pages/recipe/list/index',
    query: { crowd: '白领' }
  },
  {
    icon: '🌸',
    name: t('home.kingKong.solar'),
    gradient: 'linear-gradient(135deg, #FFF3E0, #FFF3E0)',
    path: '/pages/category/index',
    query: { tab: 'solar' }
  },
  {
    icon: '🩸',
    name: t('home.kingKong.blood'),
    gradient: 'linear-gradient(135deg, #FCE4EC, #FCE4EC)',
    path: '/pages/recipe/list/index',
    query: { efficacy: '补气养血' }
  },
  {
    icon: '🍚',
    name: t('home.kingKong.stomach'),
    gradient: 'linear-gradient(135deg, #E8F5E9, #E8F5E9)',
    path: '/pages/recipe/list/index',
    query: { efficacy: '健脾养胃' }
  },
  {
    icon: '🌙',
    name: t('home.kingKong.sleep'),
    gradient: 'linear-gradient(135deg, #EDE7F6, #EDE7F6)',
    path: '/pages/recipe/list/index',
    query: { efficacy: '安神助眠' }
  },
  {
    icon: '✨',
    name: t('home.kingKong.beauty'),
    gradient: 'linear-gradient(135deg, #FCE4EC, #FCE4EC)',
    path: '/pages/recipe/list/index',
    query: { efficacy: '美容养颜' }
  },
  {
    icon: '➕',
    name: t('home.kingKong.more'),
    gradient: 'linear-gradient(135deg, #F5F5F5, #F5F5F5)',
    path: '/pages/category/index'
  }
] as KingKongItem[]))

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
  padding: $spacing-md $spacing-lg;
  background: #FFFFFF;
  margin-bottom: $spacing-md;
  
  &__item {
    display: flex;
    flex-direction: column;
    align-items: center;
    cursor: pointer;
    padding: $spacing-xs 0;
    
    &:active {
      transform: scale(0.95);
      transition: all $duration-fast $ease-standard;
    }
  }
  
  &__icon {
    width: 48px;
    height: 48px;
    border-radius: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: $spacing-xs;
    
    &-text {
      font-size: 24px;
    }
  }
  
  &__text {
    font-size: 13px;
    color: #333333;
    text-align: center;
    line-height: $line-height-tight;
  }
}
</style>
