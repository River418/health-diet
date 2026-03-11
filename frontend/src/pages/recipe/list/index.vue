<template>
  <view class="recipe-list-page">
    <!-- 筛选栏 -->
    <view class="recipe-list-page__filter">
      <view
        v-for="filter in filters"
        :key="filter.key"
        class="recipe-list-page__filter-item"
        @click="showFilter(filter.key)"
      >
        <text class="recipe-list-page__filter-text">{{ filter.name }}</text>
        <text class="recipe-list-page__filter-arrow">▼</text>
      </view>
    </view>
    
    <!-- 列表 -->
    <scroll-view
      scroll-y
      class="recipe-list-page__scroll"
      :refresher-enabled="true"
      :refresher-triggered="refreshing"
      @refresherrefresh="onRefresh"
      @scrolltolower="onLoadMore"
    >
      <view v-if="loading && !recipes.length" class="recipe-list-page__loading">
        <hd-skeleton type="card" />
        <hd-skeleton type="card" />
        <hd-skeleton type="card" />
      </view>
      
      <view v-else-if="recipes.length" class="recipe-list-page__grid">
        <recipe-card
          v-for="recipe in recipes"
          :key="recipe.id"
          :recipe="recipe"
          @click="goToRecipeDetail"
        />
      </view>
      
      <hd-empty
        v-else
        icon="📋"
        :title="$t('common.noData')"
        :desc="$t('search.tryOther')"
      />
      
      <!-- 加载更多 -->
      <view v-if="loadingMore" class="recipe-list-page__loading-more">
        <text class="recipe-list-page__loading-text">{{ $t('common.loading') }}</text>
      </view>
      <view v-else-if="noMore && recipes.length" class="recipe-list-page__no-more">
        <text class="recipe-list-page__no-more-text">{{ $t('common.noMore') }}</text>
      </view>
    </scroll-view>
  </view>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { useI18n } from 'vue-i18n'
import Taro from '@tarojs/taro'
import RecipeCard from '@/components/business/RecipeCard.vue'
import HdSkeleton from '@/components/common/HdSkeleton.vue'
import HdEmpty from '@/components/common/HdEmpty.vue'
import { getRecipeList } from '@/api/recipe'

const { t: $t } = useI18n()

// 页面参数
const queryParams = ref<{
  crowd?: string
  solar?: string
  efficacy?: string
  ingredient?: string
}>({})

// 数据
const recipes = ref<any[]>([])
const loading = ref(false)
const refreshing = ref(false)
const loadingMore = ref(false)
const noMore = ref(false)
const page = ref(1)

// 筛选器
const filters = ref([
  { key: 'crowd', name: $t('category.crowd') },
  { key: 'solar', name: $t('category.solarTerm') },
  { key: 'efficacy', name: $t('category.efficacy') },
  { key: 'sort', name: $t('common.sort') }
])

// 获取配方列表
const fetchRecipes = async (isLoadMore = false) => {
  if (loading.value || loadingMore.value) return
  
  if (isLoadMore) {
    loadingMore.value = true
  } else {
    loading.value = true
  }
  
  try {
    const params = {
      page: page.value,
      size: 10,
      ...queryParams.value
    }
    
    const res = await getRecipeList(params)
    const list = res.data?.list || []
    
    if (isLoadMore) {
      recipes.value.push(...list)
    } else {
      recipes.value = list
    }
    
    if (list.length < 10) {
      noMore.value = true
    }
  } catch (error) {
    console.error('获取配方列表失败', error)
    Taro.showToast({
      title: $t('error.network'),
      icon: 'none'
    })
  } finally {
    loading.value = false
    loadingMore.value = false
  }
}

// 下拉刷新
const onRefresh = async () => {
  refreshing.value = true
  page.value = 1
  noMore.value = false
  await fetchRecipes(false)
  refreshing.value = false
}

// 加载更多
const onLoadMore = () => {
  if (noMore.value) return
  page.value++
  fetchRecipes(true)
}

// 显示筛选
const showFilter = (key: string) => {
  Taro.showToast({
    title: '筛选功能开发中',
    icon: 'none'
  })
}

// 跳转配方详情
const goToRecipeDetail = (id: number) => {
  Taro.navigateTo({
    url: `/pages/recipe/detail/index?id=${id}`
  })
}

onMounted(() => {
  // 获取页面参数
  const instance = Taro.getCurrentInstance()
  const query = instance.router?.params || {}
  
  queryParams.value = {
    crowd: query.crowd,
    solar: query.solar,
    efficacy: query.efficacy,
    ingredient: query.ingredient
  }
  
  fetchRecipes()
})
</script>

<style lang="scss">
@import '@/styles/variables.scss';

.recipe-list-page {
  min-height: 100vh;
  background: $bg-page;
  display: flex;
  flex-direction: column;
  
  &__filter {
    display: flex;
    justify-content: space-around;
    align-items: center;
    height: 48px;
    background: #fff;
    box-shadow: 0 1px 0 $bg-divider;
    
    &-item {
      display: flex;
      align-items: center;
      gap: 4px;
      padding: 8px 16px;
      
      &:active {
        opacity: 0.7;
      }
    }
    
    &-text {
      font-size: 14px;
      color: $text-primary;
    }
    
    &-arrow {
      font-size: 10px;
      color: $text-tertiary;
    }
  }
  
  &__scroll {
    flex: 1;
  }
  
  &__loading {
    padding: 16px;
  }
  
  &__grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 16px;
    padding: 16px;
  }
  
  &__loading-more,
  &__no-more {
    text-align: center;
    padding: 16px;
  }
  
  &__loading-text,
  &__no-more-text {
    font-size: 14px;
    color: $text-tertiary;
  }
}
</style>
