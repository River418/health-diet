<template>
  <view class="favorites-page">
    <!-- 顶部导航 -->
    <view class="favorites-page__nav">
      <text class="favorites-page__nav-title">
        {{ $t('favorites.title') }}
        <text class="favorites-page__nav-count" v-if="favorites.length > 0">({{ favorites.length }})</text>
      </text>
      <view class="favorites-page__nav-actions">
        <text 
          v-if="favorites.length > 0"
          class="favorites-page__nav-btn"
          @click="toggleManageMode"
        >
          {{ isManageMode ? $t('common.done') : $t('common.manage') }}
        </text>
        <text 
          v-if="favorites.length > 0 && !isManageMode"
          class="favorites-page__nav-btn"
          @click="showFilter"
        >
          {{ $t('common.filter') }}
        </text>
      </view>
    </view>
    
    <!-- 分类筛选 -->
    <view v-if="favorites.length > 0 && !isManageMode" class="favorites-page__filter">
      <scroll-view scroll-x class="favorites-page__filter-scroll" show-scrollbar="false">
        <view class="favorites-page__filter-list">
          <view
            v-for="filter in filters"
            :key="filter.key"
            class="favorites-page__filter-item"
            :class="{ 'is-active': currentFilter === filter.key }"
            @click="selectFilter(filter.key)"
          >
            {{ filter.name }}
          </view>
        </view>
      </scroll-view>
    </view>
    
    <!-- 列表 -->
    <scroll-view
      scroll-y
      class="favorites-page__scroll"
      :refresher-enabled="true"
      :refresher-triggered="refreshing"
      @refresherrefresh="onRefresh"
      @scrolltolower="onLoadMore"
    >
      <!-- 加载骨架屏 -->
      <view v-if="loading && !favorites.length" class="favorites-page__loading">
        <view v-for="n in 3" :key="n" class="favorites-page__skeleton">
          <view class="favorites-page__skeleton-image"></view>
          <view class="favorites-page__skeleton-content">
            <view class="favorites-page__skeleton-title"></view>
            <view class="favorites-page__skeleton-meta"></view>
          </view>
        </view>
      </view>
      
      <!-- 收藏列表 -->
      <view v-else-if="favorites.length" class="favorites-page__list">
        <view
          v-for="(item, index) in filteredFavorites"
          :key="item.id"
          class="favorites-page__item"
          :class="{ 'is-manage': isManageMode, 'is-selected': selectedItems.includes(item.id) }"
          @click="handleItemClick(item)"
          @longpress="handleLongPress(item)"
        >
          <!-- 选择框（管理模式） -->
          <view v-if="isManageMode" class="favorites-page__checkbox">
            <view class="favorites-page__checkbox-inner" :class="{ 'is-checked': selectedItems.includes(item.id) }">
              <text v-if="selectedItems.includes(item.id)" class="favorites-page__checkbox-check">✓</text>
            </view>
          </view>
          
          <!-- 图片 -->
          <image
            class="favorites-page__image"
            :src="item.coverImage || defaultImage"
            mode="aspectFill"
          />
          
          <!-- 内容 -->
          <view class="favorites-page__content">
            <text class="favorites-page__title">{{ item.name }}</text>
            <view class="favorites-page__meta">
              <view class="favorites-page__rating">
                <text class="favorites-page__star">★</text>
                <text class="favorites-page__score">{{ item.rating || '4.8' }}</text>
              </view>
              <view v-if="item.tags && item.tags.length" class="favorites-page__tags">
                <text
                  v-for="(tag, i) in item.tags.slice(0, 2)"
                  :key="i"
                  class="favorites-page__tag"
                >{{ tag }}</text>
              </view>
            </view>
            <text class="favorites-page__time">{{ $t('favorites.savedAt') }} {{ item.savedTime }}</text>
          </view>
          
          <!-- 取消收藏按钮（非管理模式） -->
          <view 
            v-if="!isManageMode" 
            class="favorites-page__unfavorite"
            @click.stop="unfavorite(item)"
          >
            <text class="favorites-page__unfavorite-icon">♥</text>
          </view>
        </view>
      </view>
      
      <!-- 空状态 -->
      <view v-else class="favorites-page__empty">
        <view class="favorites-page__empty-icon">♡</view>
        <text class="favorites-page__empty-title">{{ $t('favorites.emptyTitle') }}</text>
        <text class="favorites-page__empty-desc">{{ $t('favorites.emptyDesc') }}</text>
        <view class="favorites-page__empty-btn" @click="goToHome">
          <text class="favorites-page__empty-btn-text">{{ $t('favorites.goHome') }}</text>
        </view>
      </view>
      
      <!-- 加载更多 -->
      <view v-if="loadingMore" class="favorites-page__loading-more">
        <text class="favorites-page__loading-text">{{ $t('common.loading') }}</text>
      </view>
      <view v-else-if="noMore && favorites.length" class="favorites-page__no-more">
        <text class="favorites-page__no-more-text">{{ $t('common.noMore') }}</text>
      </view>
    </scroll-view>
    
    <!-- 底部操作栏（管理模式） -->
    <view v-if="isManageMode" class="favorites-page__footer">
      <view class="favorites-page__footer-select" @click="toggleSelectAll">
        <view class="favorites-page__footer-checkbox" :class="{ 'is-checked': isAllSelected }">
          <text v-if="isAllSelected" class="favorites-page__footer-checkbox-check">✓</text>
        </view>
        <text class="favorites-page__footer-select-text">
          {{ isAllSelected ? $t('common.deselectAll') : $t('common.selectAll') }}
        </text>
      </view>
      <view 
        class="favorites-page__footer-delete"
        :class="{ 'is-disabled': selectedItems.length === 0 }"
        @click="batchDelete"
      >
        <text class="favorites-page__footer-delete-text">
          {{ $t('common.delete') }}({{ selectedItems.length }})
        </text>
      </view>
    </view>
  </view>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import { useI18n } from 'vue-i18n'
import Taro from '@tarojs/taro'
import { DEFAULT_IMAGES } from '@/utils/image'

const { t: $t } = useI18n()

// 数据
const favorites = ref<any[]>([])
const loading = ref(false)
const refreshing = ref(false)
const loadingMore = ref(false)
const noMore = ref(false)
const page = ref(1)
const isManageMode = ref(false)
const selectedItems = ref<number[]>([])
const currentFilter = ref('all')

const defaultImage = DEFAULT_IMAGES.recipe

// 筛选选项
const filters = [
  { key: 'all', name: $t('favorites.filter.all') },
  { key: 'soup', name: $t('favorites.filter.soup') },
  { key: 'porridge', name: $t('favorites.filter.porridge') },
  { key: 'tea', name: $t('favorites.filter.tea') },
  { key: 'other', name: $t('favorites.filter.other') }
]

// 筛选后的收藏列表
const filteredFavorites = computed(() => {
  if (currentFilter.value === 'all') {
    return favorites.value
  }
  // 根据分类筛选
  return favorites.value.filter(item => {
    // 这里根据实际的分类字段进行筛选
    return item.category === currentFilter.value
  })
})

// 是否全选
const isAllSelected = computed(() => {
  return selectedItems.value.length === filteredFavorites.value.length && filteredFavorites.value.length > 0
})

// 获取收藏列表
const fetchFavorites = async (isLoadMore = false) => {
  if (loading.value || loadingMore.value) return
  
  if (isLoadMore) {
    loadingMore.value = true
  } else {
    loading.value = true
  }
  
  try {
    // TODO: 调用API获取收藏列表
    // const res = await getFavorites({ page: page.value, size: 10, filter: currentFilter.value })
    // const list = res.data?.list || []
    
    // 模拟数据
    const list = [
      {
        id: 1,
        name: '红枣银耳莲子羹',
        coverImage: '/assets/images/recipes/hongzao-yiner.jpg',
        rating: 4.9,
        tags: ['滋阴润燥', '养颜美容'],
        savedTime: '3天前',
        category: 'soup'
      },
      {
        id: 2,
        name: '山药薏米粥',
        coverImage: '/assets/images/recipes/shanyao-yimi.jpg',
        rating: 4.8,
        tags: ['健脾祛湿'],
        savedTime: '1周前',
        category: 'porridge'
      },
      {
        id: 3,
        name: '枸杞菊花茶',
        coverImage: '/assets/images/recipes/gouqi-juhua.jpg',
        rating: 4.7,
        tags: ['养肝明目'],
        savedTime: '2周前',
        category: 'tea'
      },
      {
        id: 4,
        name: '当归红枣乌鸡汤',
        coverImage: '/assets/images/recipes/danggui-wuji.jpg',
        rating: 4.9,
        tags: ['补气养血', '女性养生'],
        savedTime: '3周前',
        category: 'soup'
      },
      {
        id: 5,
        name: '百合莲子粥',
        coverImage: '/assets/images/recipes/baihe-lianzi.jpg',
        rating: 4.6,
        tags: ['安神助眠'],
        savedTime: '1个月前',
        category: 'porridge'
      }
    ]
    
    if (isLoadMore) {
      favorites.value.push(...list)
    } else {
      favorites.value = list
    }
    
    if (list.length < 10) {
      noMore.value = true
    }
  } catch (error) {
    console.error('获取收藏列表失败', error)
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
  await fetchFavorites(false)
  refreshing.value = false
}

// 加载更多
const onLoadMore = () => {
  if (noMore.value || isManageMode.value) return
  page.value++
  fetchFavorites(true)
}

// 切换管理模式
const toggleManageMode = () => {
  isManageMode.value = !isManageMode.value
  if (!isManageMode.value) {
    selectedItems.value = []
  }
}

// 选择筛选
const selectFilter = (key: string) => {
  currentFilter.value = key
  // 重置分页并重新加载
  page.value = 1
  noMore.value = false
  fetchFavorites(false)
}

// 显示筛选
const showFilter = () => {
  // TODO: 显示筛选弹窗
  Taro.showToast({
    title: '筛选功能开发中',
    icon: 'none'
  })
}

// 处理列表项点击
const handleItemClick = (item: any) => {
  if (isManageMode.value) {
    toggleSelection(item.id)
  } else {
    goToRecipeDetail(item.id)
  }
}

// 长按进入管理模式
const handleLongPress = (item: any) => {
  if (!isManageMode.value) {
    isManageMode.value = true
    toggleSelection(item.id)
  }
}

// 切换选中状态
const toggleSelection = (id: number) => {
  const index = selectedItems.value.indexOf(id)
  if (index > -1) {
    selectedItems.value.splice(index, 1)
  } else {
    selectedItems.value.push(id)
  }
}

// 全选/取消全选
const toggleSelectAll = () => {
  if (isAllSelected.value) {
    selectedItems.value = []
  } else {
    selectedItems.value = filteredFavorites.value.map(item => item.id)
  }
}

// 取消收藏
const unfavorite = async (item: any) => {
  Taro.showModal({
    title: $t('favorites.unfavoriteTitle'),
    content: $t('favorites.unfavoriteConfirm', { name: item.name }),
    success: (res) => {
      if (res.confirm) {
        // TODO: 调用取消收藏API
        const index = favorites.value.findIndex(f => f.id === item.id)
        if (index > -1) {
          favorites.value.splice(index, 1)
        }
        Taro.showToast({
          title: $t('favorites.unfavoriteSuccess'),
          icon: 'success'
        })
      }
    }
  })
}

// 批量删除
const batchDelete = () => {
  if (selectedItems.value.length === 0) return
  
  Taro.showModal({
    title: $t('favorites.batchDeleteTitle'),
    content: $t('favorites.batchDeleteConfirm', { count: selectedItems.value.length }),
    success: (res) => {
      if (res.confirm) {
        // TODO: 调用批量删除API
        favorites.value = favorites.value.filter(item => !selectedItems.value.includes(item.id))
        selectedItems.value = []
        isManageMode.value = false
        Taro.showToast({
          title: $t('favorites.deleteSuccess'),
          icon: 'success'
        })
      }
    }
  })
}

// 跳转配方详情
const goToRecipeDetail = (id: number) => {
  Taro.navigateTo({
    url: `/pages/recipe/detail/index?id=${id}`
  })
}

// 跳转首页
const goToHome = () => {
  Taro.switchTab({
    url: '/pages/index/index'
  })
}

onMounted(() => {
  fetchFavorites()
})
</script>

<style lang="scss">
@import '@/styles/variables.scss';

.favorites-page {
  min-height: 100vh;
  background: $bg-page;
  display: flex;
  flex-direction: column;
  
  // 顶部导航
  &__nav {
    height: $nav-height;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 $spacing-lg;
    background: $bg-card;
    box-shadow: $shadow-level-1;
    
    &-title {
      font-size: $font-size-lg;
      font-weight: $font-weight-bold;
      color: $text-primary;
    }
    
    &-count {
      font-size: $font-size-sm;
      font-weight: $font-weight-normal;
      color: $brand-primary;
      margin-left: $spacing-xs;
    }
    
    &-actions {
      display: flex;
      gap: $spacing-md;
    }
    
    &-btn {
      font-size: $font-size-sm;
      color: $brand-primary;
      cursor: pointer;
      
      &:active {
        opacity: 0.7;
      }
    }
  }
  
  // 分类筛选
  &__filter {
    background: $bg-card;
    padding: $spacing-sm 0;
    border-bottom: 1px solid $border-color;
    
    &-scroll {
      white-space: nowrap;
    }
    
    &-list {
      display: flex;
      gap: $spacing-sm;
      padding: 0 $spacing-lg;
    }
    
    &-item {
      padding: $spacing-xs $spacing-md;
      border-radius: $radius-full;
      font-size: $font-size-sm;
      background: $bg-card;
      border: 1px solid $border-color;
      color: $text-tertiary;
      cursor: pointer;
      transition: all $duration-fast $ease-standard;
      
      &.is-active {
        background: $brand-primary;
        border-color: $brand-primary;
        color: #fff;
      }
      
      &:active {
        opacity: 0.8;
      }
    }
  }
  
  &__scroll {
    flex: 1;
  }
  
  // 加载骨架屏
  &__loading {
    padding: $spacing-lg;
  }
  
  &__skeleton {
    display: flex;
    gap: $spacing-md;
    margin-bottom: $spacing-md;
    
    &-image {
      width: 100px;
      height: 100px;
      background: $bg-divider;
      border-radius: $radius-md;
      animation: skeleton-loading 1.5s infinite;
    }
    
    &-content {
      flex: 1;
      display: flex;
      flex-direction: column;
      gap: $spacing-sm;
      padding: $spacing-sm 0;
    }
    
    &-title {
      height: 20px;
      width: 70%;
      background: $bg-divider;
      border-radius: $radius-sm;
      animation: skeleton-loading 1.5s infinite;
    }
    
    &-meta {
      height: 16px;
      width: 40%;
      background: $bg-divider;
      border-radius: $radius-sm;
      animation: skeleton-loading 1.5s infinite;
    }
  }
  
  // 收藏列表
  &__list {
    padding: $spacing-lg;
    display: flex;
    flex-direction: column;
    gap: $spacing-md;
  }
  
  &__item {
    display: flex;
    gap: $spacing-md;
    background: $bg-card;
    border-radius: $radius-lg;
    padding: $spacing-md;
    box-shadow: $shadow-card;
    cursor: pointer;
    position: relative;
    transition: all $duration-fast $ease-standard;
    
    &:active {
      transform: translateY(-2px);
      box-shadow: $shadow-card-hover;
    }
    
    &.is-manage {
      padding-left: 52px;
    }
    
    &.is-selected {
      background: $brand-primary-10;
      border: 1px solid $brand-primary-20;
    }
  }
  
  // 选择框
  &__checkbox {
    position: absolute;
    left: $spacing-md;
    top: 50%;
    transform: translateY(-50%);
    
    &-inner {
      width: 24px;
      height: 24px;
      border-radius: 50%;
      border: 2px solid $border-color;
      display: flex;
      align-items: center;
      justify-content: center;
      transition: all $duration-fast $ease-standard;
      
      &.is-checked {
        background: $brand-primary;
        border-color: $brand-primary;
      }
    }
    
    &-check {
      font-size: 14px;
      color: #fff;
      font-weight: $font-weight-bold;
    }
  }
  
  // 图片
  &__image {
    width: 100px;
    height: 100px;
    border-radius: $radius-md;
    flex-shrink: 0;
    background: $bg-hover;
  }
  
  // 内容
  &__content {
    flex: 1;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    min-height: 100px;
  }
  
  &__title {
    font-size: $font-size-md;
    font-weight: $font-weight-medium;
    color: $text-primary;
    line-height: $line-height-tight;
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
  }
  
  &__meta {
    display: flex;
    align-items: center;
    gap: $spacing-sm;
  }
  
  &__rating {
    display: flex;
    align-items: center;
    gap: 2px;
  }
  
  &__star {
    color: $accent-orange;
    font-size: $font-size-sm;
  }
  
  &__score {
    font-size: $font-size-sm;
    font-weight: $font-weight-medium;
    color: $accent-orange;
  }
  
  &__tags {
    display: flex;
    gap: $spacing-xs;
  }
  
  &__tag {
    padding: 2px 6px;
    border-radius: $radius-sm;
    font-size: 10px;
    background: $brand-primary-10;
    color: $brand-primary;
  }
  
  &__time {
    font-size: $font-size-xs;
    color: $text-tertiary;
  }
  
  // 取消收藏按钮
  &__unfavorite {
    position: absolute;
    top: $spacing-md;
    right: $spacing-md;
    width: 32px;
    height: 32px;
    display: flex;
    align-items: center;
    justify-content: center;
    
    &-icon {
      font-size: 20px;
      color: $accent-orange;
    }
    
    &:active {
      opacity: 0.7;
    }
  }
  
  // 空状态
  &__empty {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    padding: $spacing-xxxl $spacing-lg;
    
    &-icon {
      width: 64px;
      height: 64px;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 40px;
      color: $text-disabled;
      margin-bottom: $spacing-lg;
    }
    
    &-title {
      font-size: $font-size-lg;
      font-weight: $font-weight-medium;
      color: $text-primary;
      margin-bottom: $spacing-xs;
    }
    
    &-desc {
      font-size: $font-size-sm;
      color: $text-tertiary;
      margin-bottom: $spacing-xl;
    }
    
    &-btn {
      height: $btn-height-lg;
      padding: 0 $spacing-xl;
      background: $brand-primary;
      border-radius: $radius-full;
      display: flex;
      align-items: center;
      justify-content: center;
      box-shadow: $shadow-brand;
      
      &:active {
        background: $brand-dark;
        transform: scale(0.98);
      }
      
      &-text {
        font-size: $font-size-base;
        font-weight: $font-weight-medium;
        color: #fff;
      }
    }
  }
  
  // 加载更多
  &__loading-more,
  &__no-more {
    text-align: center;
    padding: $spacing-lg;
  }
  
  &__loading-text,
  &__no-more-text {
    font-size: $font-size-sm;
    color: $text-tertiary;
  }
  
  // 底部操作栏
  &__footer {
    position: fixed;
    bottom: 0;
    left: 0;
    right: 0;
    height: 56px;
    background: $bg-card;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 $spacing-lg;
    padding-bottom: $safe-area-bottom;
    box-shadow: 0 -2px 10px rgba(0, 0, 0, 0.05);
    z-index: 100;
    
    &-select {
      display: flex;
      align-items: center;
      gap: $spacing-sm;
      cursor: pointer;
      
      &:active {
        opacity: 0.7;
      }
    }
    
    &-checkbox {
      width: 24px;
      height: 24px;
      border-radius: 50%;
      border: 2px solid $border-color;
      display: flex;
      align-items: center;
      justify-content: center;
      transition: all $duration-fast $ease-standard;
      
      &.is-checked {
        background: $brand-primary;
        border-color: $brand-primary;
      }
      
      &-check {
        font-size: 14px;
        color: #fff;
        font-weight: $font-weight-bold;
      }
    }
    
    &-select-text {
      font-size: $font-size-base;
      color: $text-primary;
    }
    
    &-delete {
      height: 40px;
      padding: 0 $spacing-lg;
      background: $error;
      border-radius: $radius-full;
      display: flex;
      align-items: center;
      justify-content: center;
      cursor: pointer;
      
      &.is-disabled {
        background: $text-disabled;
        cursor: not-allowed;
      }
      
      &:active:not(.is-disabled) {
        opacity: 0.8;
      }
      
      &-text {
        font-size: $font-size-base;
        font-weight: $font-weight-medium;
        color: #fff;
      }
    }
  }
}

@keyframes skeleton-loading {
  0% {
    background-position: 200% 0;
  }
  100% {
    background-position: -200% 0;
  }
}
</style>
