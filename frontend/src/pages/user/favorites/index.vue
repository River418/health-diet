<template>
  <view class="favorites-page">
    <!-- 列表 -->
    <scroll-view
      scroll-y
      class="favorites-page__scroll"
      :refresher-enabled="true"
      :refresher-triggered="refreshing"
      @refresherrefresh="onRefresh"
      @scrolltolower="onLoadMore"
    >
      <view v-if="loading && !favorites.length" class="favorites-page__loading">
        <hd-skeleton type="card" />
        <hd-skeleton type="card" />
        <hd-skeleton type="card" />
      </view>
      
      <view v-else-if="favorites.length" class="favorites-page__grid">
        <recipe-card
          v-for="item in favorites"
          :key="item.id"
          :recipe="item"
          @click="goToRecipeDetail"
        />
      </view>
      
      <hd-empty
        v-else
        icon="❤️"
        :title="$t('favorites.emptyTitle')"
        :desc="$t('favorites.emptyDesc')"
        :show-action="true"
        :action-text="$t('favorites.goHome')"
        @action="goToHome"
      />
      
      <!-- 加载更多 -->
      <view v-if="loadingMore" class="favorites-page__loading-more">
        <text class="favorites-page__loading-text">{{ $t('common.loading') }}</text>
      </view>
      <view v-else-if="noMore && favorites.length" class="favorites-page__no-more">
        <text class="favorites-page__no-more-text">{{ $t('common.noMore') }}</text>
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

const { t: $t } = useI18n()

// 数据
const favorites = ref<any[]>([])
const loading = ref(false)
const refreshing = ref(false)
const loadingMore = ref(false)
const noMore = ref(false)
const page = ref(1)

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
    // const res = await getFavorites({ page: page.value, size: 10 })
    // const list = res.data?.list || []
    
    // 模拟数据
    const list: any[] = []
    
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
  if (noMore.value) return
  page.value++
  fetchFavorites(true)
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
  background: $bg-gray;
  
  &__scroll {
    min-height: 100vh;
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
