<template>
  <view class="ingredients-page" :class="fontLargeClass">
    <!-- 页面标题 -->
    <view class="ingredients-page__header">
      <text class="ingredients-page__title">{{ $t('ingredients.title') }}</text>
    </view>
    
    <!-- 食材分类 -->
    <view class="ingredients-page__categories">
      <scroll-view scroll-x class="ingredients-page__category-scroll">
        <view
          v-for="(cat, index) in categories"
          :key="index"
          class="ingredients-page__category"
          :class="{ 'ingredients-page__category--active': currentCategory === cat.id }"
          @click="selectCategory(cat.id)"
        >
          <text class="ingredients-page__category-name">{{ cat.name }}</text>
        </view>
      </scroll-view>
    </view>
    
    <!-- 食材列表 -->
    <scroll-view
      scroll-y
      class="ingredients-page__list"
      @scrolltolower="loadMore"
    >
      <view v-if="ingredients.length" class="ingredients-page__grid">
        <view
          v-for="item in ingredients"
          :key="item.id"
          class="ingredients-page__item"
          @click="goToDetail(item.id)"
        >
          <image
            class="ingredients-page__image"
            :src="item.image || '/assets/images/placeholder.png'"
            mode="aspectFill"
          />
          <view class="ingredients-page__info">
            <text class="ingredients-page__name">{{ item.name }}</text>
            <text class="ingredients-page__desc">{{ item.description || item.effect }}</text>
          </view>
        </view>
      </view>
      <hd-empty
        v-else
        icon="🥬"
        :title="$t('ingredients.empty')"
        :desc="$t('ingredients.emptyDesc')"
      />
    </scroll-view>
  </view>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { useI18n } from 'vue-i18n'
import Taro from '@tarojs/taro'
import HdEmpty from '@/components/common/HdEmpty.vue'
import { usePageFontSize } from '@/composables'

const { t: $t } = useI18n()
const { fontLargeClass } = usePageFontSize()

// 分类数据
const categories = ref([
  { id: 'all', name: '全部' },
  { id: 'vegetable', name: '蔬菜' },
  { id: 'fruit', name: '水果' },
  { id: 'meat', name: '肉类' },
  { id: 'seafood', name: '海鲜' },
  { id: 'grain', name: '谷物' },
  { id: 'herb', name: '药材' },
  { id: 'nut', name: '坚果' }
])

const currentCategory = ref('all')
const ingredients = ref<any[]>([])
const page = ref(1)
const loading = ref(false)
const noMore = ref(false)

// 选择分类
const selectCategory = (id: string) => {
  currentCategory.value = id
  page.value = 1
  noMore.value = false
  fetchIngredients()
}

// 获取食材列表
const fetchIngredients = async () => {
  if (loading.value) return
  loading.value = true
  
  try {
    // TODO: 调用真实接口获取食材数据
    const mockData: any[] = []
    
    if (page.value === 1) {
      ingredients.value = mockData
    } else {
      ingredients.value.push(...mockData)
    }
  } catch (error) {
    console.error('获取食材失败', error)
  } finally {
    loading.value = false
  }
}

// 加载更多
const loadMore = () => {
  if (noMore.value || loading.value) return
  page.value++
  fetchIngredients()
}

// 跳转详情
const goToDetail = (id: number) => {
  Taro.navigateTo({
    url: `/pages/ingredients/detail/index?id=${id}`
  })
}

onMounted(() => {
  fetchIngredients()
})
</script>

<style lang="scss">
@import '@/styles/variables.scss';

.ingredients-page {
  min-height: 100vh;
  background: $bg-page;
  
  &__header {
    padding: 16px;
    background: #fff;
    box-shadow: 0 1px 0 $bg-divider;
  }
  
  &__title {
    font-size: 20px;
    font-weight: $font-weight-bold;
    color: $text-primary;
  }
  
  &__categories {
    background: #fff;
    padding: 12px 0;
    border-bottom: 1px solid $bg-divider;
  }
  
  &__category-scroll {
    white-space: nowrap;
  }
  
  &__category {
    display: inline-block;
    padding: 8px 16px;
    margin: 0 4px;
    border-radius: 16px;
    background: $bg-page;
    
    &--active {
      background: $brand-light;

      .ingredients-page__category-name {
        color: #fff;
      }
    }
    
    &:first-child {
      margin-left: 16px;
    }
    
    &:last-child {
      margin-right: 16px;
    }
  }
  
  &__category-name {
    font-size: 14px;
    color: $text-secondary;
  }
  
  &__list {
    height: calc(100vh - 120px);
  }
  
  &__grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 16px;
    padding: 16px;
  }
  
  &__item {
    background: #fff;
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.04);
    
    &:active {
      opacity: 0.8;
    }
  }
  
  &__image {
    width: 100%;
    height: 120px;
    background: $bg-page;
  }
  
  &__info {
    padding: 12px;
  }
  
  &__name {
    font-size: 15px;
    font-weight: $font-weight-medium;
    color: $text-primary;
    margin-bottom: 4px;
  }
  
  &__desc {
    font-size: 12px;
    color: $text-secondary;
  }
}
</style>
