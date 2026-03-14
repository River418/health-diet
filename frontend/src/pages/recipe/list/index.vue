<template>
  <view class="recipe-list-page">
    <!-- 筛选栏 -->
    <view class="recipe-list-page__filter">
      <view
        v-for="filter in filters"
        :key="filter.key"
        class="recipe-list-page__filter-item"
        :class="{ 'is-active': getFilterValue(filter.key) }"
        @click="showFilter(filter.key)"
      >
        <text class="recipe-list-page__filter-text">{{ getFilterDisplayName(filter.key, filter.name) }}</text>
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
    
    <!-- 筛选弹窗 -->
    <filter-picker
      v-model:visible="filterPickerVisible"
      v-model="currentFilterValue"
      :title="currentFilterTitle"
      :options="currentFilterOptions"
      @confirm="handleFilterConfirm"
      @reset="handleFilterReset"
    />
  </view>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import { useI18n } from 'vue-i18n'
import Taro from '@tarojs/taro'
import RecipeCard from '@/components/business/RecipeCard.vue'
import FilterPicker from '@/components/business/FilterPicker.vue'
import HdSkeleton from '@/components/common/HdSkeleton.vue'
import HdEmpty from '@/components/common/HdEmpty.vue'
import { getRecipeList } from '@/api/recipe'
import { getCategories } from '@/api/category'

const { t: $t } = useI18n()

// 页面参数
const queryParams = ref<{
  crowd?: string
  solarTerm?: string
  efficacy?: string
  ingredient?: string
  sortBy?: string
}>({})

// 数据
const recipes = ref<any[]>([])
const loading = ref(false)
const refreshing = ref(false)
const loadingMore = ref(false)
const noMore = ref(false)
const page = ref(1)

// 分类数据
const categoryData = ref<Record<string, any[]>>({
  crowd: [],
  solarTerm: [],
  efficacy: [],
  sort: [
    { id: 'recommend', name: $t('sort.recommend') },
    { id: 'hot', name: $t('sort.hot') },
    { id: 'newest', name: $t('sort.newest') },
    { id: 'rating', name: $t('sort.rating') }
  ]
})

// 筛选器配置
const filters = ref([
  { key: 'crowd', name: $t('category.crowd') },
  { key: 'solarTerm', name: $t('category.solarTerm') },
  { key: 'efficacy', name: $t('category.efficacy') },
  { key: 'sort', name: $t('common.sort') }
])

// 筛选弹窗状态
const filterPickerVisible = ref(false)
const currentFilterKey = ref('')
const currentFilterValue = ref('')

// 当前筛选标题
const currentFilterTitle = computed(() => {
  const filter = filters.value.find(f => f.key === currentFilterKey.value)
  return filter?.name || ''
})

// 当前筛选选项
const currentFilterOptions = computed(() => {
  const key = currentFilterKey.value
  const data = categoryData.value[key] || []
  return data.map(item => ({
    label: item.name,
    value: item.id || item.code || String(item.id)
  }))
})

// 获取筛选值
const getFilterValue = (key: string) => {
  if (key === 'sort') {
    return queryParams.value.sortBy
  }
  return queryParams.value[key as keyof typeof queryParams.value]
}

// 获取筛选显示名称
const getFilterDisplayName = (key: string, defaultName: string) => {
  const value = getFilterValue(key)
  if (!value) return defaultName
  
  const data = categoryData.value[key] || []
  const item = data.find(d => (d.id || d.code || String(d.id)) === value)
  return item?.name || defaultName
}

// 获取分类数据
const fetchCategories = async () => {
  try {
    const res = await getCategories()
    if (res.success && res.data) {
      // 按类型分组存储
      if (Array.isArray(res.data)) {
        // 如果返回的是数组，需要根据 type 分组
        const grouped = res.data.reduce((acc, item) => {
          const type = item.type
          if (!acc[type]) acc[type] = []
          acc[type].push(item)
          return acc
        }, {} as Record<string, any[]>)
        
        categoryData.value = {
          ...categoryData.value,
          ...grouped
        }
      } else {
        // 如果返回的是已分组的对象
        categoryData.value = {
          ...categoryData.value,
          ...res.data
        }
      }
    }
  } catch (error) {
    console.error('获取分类数据失败', error)
  }
}

// 获取配方列表
const fetchRecipes = async (isLoadMore = false) => {
  if (loading.value || loadingMore.value) return
  
  if (isLoadMore) {
    loadingMore.value = true
  } else {
    loading.value = true
  }
  
  try {
    const params: Record<string, any> = {
      page: page.value,
      size: 10
    }
    
    // 添加筛选参数
    if (queryParams.value.crowd) params.crowd = queryParams.value.crowd
    if (queryParams.value.solarTerm) params.solarTerm = queryParams.value.solarTerm
    if (queryParams.value.efficacy) params.efficacy = queryParams.value.efficacy
    if (queryParams.value.sortBy) params.sortBy = queryParams.value.sortBy
    
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
  currentFilterKey.value = key
  currentFilterValue.value = getFilterValue(key) || ''
  filterPickerVisible.value = true
}

// 确认筛选
const handleFilterConfirm = (value: string) => {
  if (currentFilterKey.value === 'sort') {
    queryParams.value.sortBy = value
  } else {
    queryParams.value[currentFilterKey.value as keyof typeof queryParams.value] = value
  }
  
  // 重置页面并重新加载
  page.value = 1
  noMore.value = false
  recipes.value = []
  fetchRecipes()
}

// 重置筛选
const handleFilterReset = () => {
  if (currentFilterKey.value === 'sort') {
    queryParams.value.sortBy = undefined
  } else {
    queryParams.value[currentFilterKey.value as keyof typeof queryParams.value] = undefined
  }
  
  // 重置页面并重新加载
  page.value = 1
  noMore.value = false
  recipes.value = []
  fetchRecipes()
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
    solarTerm: query.solarTerm || query.solar, // 兼容旧参数
    efficacy: query.efficacy,
    ingredient: query.ingredient,
    sortBy: query.sortBy
  }
  
  // 获取分类数据
  fetchCategories()
  
  // 获取配方列表
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
      border-radius: $radius-lg;
      
      &.is-active {
        background: rgba($brand-primary, 0.1);
        
        .recipe-list-page__filter-text {
          color: $brand-primary;
        }
        
        .recipe-list-page__filter-arrow {
          color: $brand-primary;
        }
      }
      
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
