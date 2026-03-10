<template>
  <view class="home-page">
    <!-- 搜索栏 -->
    <search-bar sticky @click="goToSearch" />
    
    <!-- 滚动内容区 -->
    <scroll-view
      scroll-y
      class="home-page__scroll"
      :refresher-enabled="true"
      :refresher-triggered="refreshing"
      @refresherrefresh="onRefresh"
      @scrolltolower="onLoadMore"
    >
      <!-- 轮播Banner -->
      <view class="home-page__banner">
        <swiper
          class="home-page__swiper"
          :indicator-dots="true"
          :autoplay="true"
          :interval="5000"
          :duration="300"
          indicator-color="rgba(255,255,255,0.5)"
          indicator-active-color="#ffffff"
        >
          <swiper-item
            v-for="(banner, index) in banners"
            :key="index"
            @click="handleBannerClick(banner)"
          >
            <image
              class="home-page__banner-image"
              :src="banner.image"
              mode="aspectFill"
            />
          </swiper-item>
        </swiper>
      </view>
      
      <!-- 金刚位 -->
      <king-kong @click="handleKingKongClick" />
      
      <!-- 推荐配方 -->
      <view class="home-page__section">
        <view class="home-page__section-header">
          <text class="home-page__section-title">{{ $t('home.recommend') }}</text>
          <text class="home-page__section-more" @click="goToMoreRecipes">
            {{ $t('common.more') }} >
          </text>
        </view>
        <view class="home-page__recipe-grid">
          <recipe-card
            v-for="recipe in recommendRecipes"
            :key="recipe.id"
            :recipe="recipe"
            @click="goToRecipeDetail"
          />
        </view>
      </view>
      
      <!-- 养生资讯 -->
      <view class="home-page__section">
        <view class="home-page__section-header">
          <text class="home-page__section-title">{{ $t('home.content') }}</text>
          <text class="home-page__section-more" @click="goToMoreContent">
            {{ $t('common.more') }} >
          </text>
        </view>
        <view class="home-page__content-grid">
          <view
            v-for="(item, index) in contentList"
            :key="index"
            class="home-page__content-item"
            @click="goToContentDetail(item)"
          >
            <view class="home-page__content-image-wrapper">
              <image
                class="home-page__content-image"
                :src="item.image"
                mode="widthFix"
              />
              <view v-if="item.isVideo" class="home-page__content-play">
                <text class="home-page__content-play-icon">▶</text>
              </view>
            </view>
            <text class="home-page__content-title">{{ item.title }}</text>
            <text class="home-page__content-source">{{ item.source }}</text>
          </view>
        </view>
      </view>
      
      <!-- 底部免责声明 -->
      <hd-disclaimer class="home-page__disclaimer" />
      
      <!-- 加载更多 -->
      <view v-if="loadingMore" class="home-page__loading-more">
        <text class="home-page__loading-text">{{ $t('common.loading') }}</text>
      </view>
      <view v-else-if="noMore" class="home-page__no-more">
        <text class="home-page__no-more-text">{{ $t('common.noMore') }}</text>
      </view>
    </scroll-view>
  </view>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { useI18n } from 'vue-i18n'
import Taro from '@tarojs/taro'
import SearchBar from '@/components/business/SearchBar.vue'
import KingKong from '@/components/business/KingKong.vue'
import RecipeCard from '@/components/business/RecipeCard.vue'
import HdDisclaimer from '@/components/common/HdDisclaimer.vue'
import { getBanners, getRecommendRecipes, getContentList } from '@/api/home'

const { t: $t } = useI18n()

// 数据
const banners = ref<any[]>([])
const recommendRecipes = ref<any[]>([])
const contentList = ref<any[]>([])
const refreshing = ref(false)
const loadingMore = ref(false)
const noMore = ref(false)
const page = ref(1)

// 获取Banner
const fetchBanners = async () => {
  try {
    const res = await getBanners()
    banners.value = res.data || []
  } catch (error) {
    console.error('获取Banner失败', error)
  }
}

// 获取推荐配方
const fetchRecommendRecipes = async () => {
  try {
    const res = await getRecommendRecipes({ page: 1, size: 4 })
    recommendRecipes.value = res.data?.list || []
  } catch (error) {
    console.error('获取推荐配方失败', error)
  }
}

// 获取内容列表
const fetchContentList = async (isLoadMore = false) => {
  if (loadingMore.value || noMore.value) return
  
  if (isLoadMore) {
    loadingMore.value = true
  }
  
  try {
    const res = await getContentList({ page: page.value, size: 10 })
    const list = res.data?.list || []
    
    if (isLoadMore) {
      contentList.value.push(...list)
    } else {
      contentList.value = list
    }
    
    if (list.length < 10) {
      noMore.value = true
    }
  } catch (error) {
    console.error('获取内容列表失败', error)
  } finally {
    loadingMore.value = false
  }
}

// 下拉刷新
const onRefresh = async () => {
  refreshing.value = true
  page.value = 1
  noMore.value = false
  
  await Promise.all([
    fetchBanners(),
    fetchRecommendRecipes(),
    fetchContentList(false)
  ])
  
  refreshing.value = false
}

// 加载更多
const onLoadMore = () => {
  page.value++
  fetchContentList(true)
}

// 跳转搜索
const goToSearch = () => {
  Taro.navigateTo({
    url: '/pages/search/index'
  })
}

// Banner点击
const handleBannerClick = (banner: any) => {
  if (banner.link) {
    Taro.navigateTo({
      url: banner.link
    })
  }
}

// 金刚位点击
const handleKingKongClick = (item: any) => {
  if (item.query) {
    const query = Object.entries(item.query)
      .map(([key, value]) => `${key}=${value}`)
      .join('&')
    Taro.navigateTo({
      url: `${item.path}?${query}`
    })
  } else {
    Taro.switchTab({
      url: item.path
    })
  }
}

// 跳转配方详情
const goToRecipeDetail = (id: number) => {
  Taro.navigateTo({
    url: `/pages/recipe/detail/index?id=${id}`
  })
}

// 更多配方
const goToMoreRecipes = () => {
  Taro.switchTab({
    url: '/pages/category/index'
  })
}

// 更多内容
const goToMoreContent = () => {
  Taro.showToast({
    title: '敬请期待',
    icon: 'none'
  })
}

// 内容详情
const goToContentDetail = (item: any) => {
  if (item.link) {
    Taro.navigateTo({
      url: item.link
    })
  }
}

onMounted(() => {
  fetchBanners()
  fetchRecommendRecipes()
  fetchContentList()
})
</script>

<style lang="scss">
@import '@/styles/variables.scss';

.home-page {
  min-height: 100vh;
  background: $bg-gray;
  display: flex;
  flex-direction: column;
  
  &__scroll {
    flex: 1;
    height: calc(100vh - 56px);
  }
  
  &__banner {
    padding: 0 16px;
    margin-bottom: 16px;
  }
  
  &__swiper {
    height: 200px;
    border-radius: 12px;
    overflow: hidden;
  }
  
  &__banner-image {
    width: 100%;
    height: 100%;
  }
  
  &__section {
    margin-bottom: 16px;
    
    &-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 0 16px;
      margin-bottom: 12px;
    }
    
    &-title {
      font-size: 18px;
      font-weight: $font-weight-bold;
      color: $text-primary;
    }
    
    &-more {
      font-size: 14px;
      color: $text-tertiary;
    }
  }
  
  &__recipe-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 16px;
    padding: 0 16px;
  }
  
  &__content-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 16px;
    padding: 0 16px;
  }
  
  &__content-item {
    background: #fff;
    border-radius: 8px;
    overflow: hidden;
    
    &:active {
      opacity: 0.8;
    }
  }
  
  &__content-image-wrapper {
    position: relative;
    width: 100%;
    min-height: 120px;
  }
  
  &__content-image {
    width: 100%;
    display: block;
  }
  
  &__content-play {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 40px;
    height: 40px;
    background: rgba(0, 0, 0, 0.6);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    
    &-icon {
      color: #fff;
      font-size: 16px;
      margin-left: 2px;
    }
  }
  
  &__content-title {
    display: block;
    font-size: 14px;
    color: $text-primary;
    padding: 8px 12px 4px;
    line-height: 1.4;
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
  }
  
  &__content-source {
    display: block;
    font-size: 12px;
    color: $text-tertiary;
    padding: 0 12px 12px;
  }
  
  &__disclaimer {
    margin: 16px;
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
