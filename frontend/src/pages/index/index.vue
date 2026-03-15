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
          :circular="true"
        >
          <swiper-item
            v-for="(banner, index) in banners"
            :key="index"
            @click="handleBannerClick(banner)"
          >
            <view class="home-page__banner-item">
              <image
                class="home-page__banner-image"
                :src="banner.image"
                mode="aspectFill"
              />
              <view class="home-page__banner-overlay">
                <text class="home-page__banner-title">{{ banner.title }}</text>
                <text v-if="banner.subtitle" class="home-page__banner-subtitle">{{ banner.subtitle }}</text>
              </view>
            </view>
          </swiper-item>
        </swiper>
      </view>
      
      <!-- 金刚位分类入口 -->
      <king-kong @click="handleKingKongClick" />
      
      <!-- 推荐配方 -->
      <view class="home-page__section">
        <view class="home-page__section-header">
          <text class="home-page__section-title">{{ $t('home.recommend') }}</text>
          <text class="home-page__section-more" @click="goToMoreRecipes">
            {{ $t('common.more') }}
            <text class="home-page__section-more-icon">></text>
          </text>
        </view>
        <scroll-view scroll-x class="home-page__recipe-scroll" show-scrollbar="false">
          <view class="home-page__recipe-list">
            <recipe-card-horizontal
              v-for="recipe in recommendRecipes"
              :key="recipe.id"
              :recipe="recipe"
              @click="goToRecipeDetail"
            />
          </view>
        </scroll-view>
      </view>
      
      <!-- 养生资讯 -->
      <view class="home-page__section">
        <view class="home-page__section-header">
          <text class="home-page__section-title">{{ $t('home.content') }}</text>
          <text class="home-page__section-more" @click="goToMoreContent">
            {{ $t('common.more') }}
            <text class="home-page__section-more-icon">></text>
          </text>
        </view>
        <view class="home-page__content-list">
          <view
            v-for="(item, index) in contentList"
            :key="index"
            class="home-page__content-item"
            @click="goToContentDetail(item)"
          >
            <image
              class="home-page__content-image"
              :src="item.image"
              mode="aspectFill"
            />
            <view class="home-page__content-info">
              <text class="home-page__content-title">{{ item.title }}</text>
              <text class="home-page__content-meta">
                {{ item.readTime }} · {{ item.viewCount }}{{ $t('common.views') }}
              </text>
            </view>
          </view>
        </view>
      </view>
      
      <!-- 底部免责声明 -->
      <hd-disclaimer class="home-page__disclaimer" />
      
      <!-- 加载更多 -->
      <view v-if="loadingMore" class="home-page__loading-more">
        <text class="home-page__loading-text">{{ $t('common.loading') }}</text>
      </view>
      <view v-else-if="noMore && contentList.length > 0" class="home-page__no-more">
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
import RecipeCardHorizontal from '@/components/business/RecipeCardHorizontal.vue'
import HdDisclaimer from '@/components/common/HdDisclaimer.vue'
import { getBanners, getRecommendRecipes, getContentList } from '@/api/home'
import { DEFAULT_IMAGES } from '@/utils/image'

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
    banners.value = res.data || [
      {
        title: '春季养肝 · 枸杞菊花茶',
        subtitle: '顺应时节，养肝明目',
        image: DEFAULT_IMAGES.banner,
        link: '/pages/recipe/detail/index?id=1'
      },
      {
        title: '滋阴润燥 · 红枣银耳羹',
        subtitle: '秋冬必备，滋润养颜',
        image: DEFAULT_IMAGES.banner,
        link: '/pages/recipe/detail/index?id=2'
      },
      {
        title: '健脾养胃 · 山药薏米粥',
        subtitle: '调理脾胃，祛湿养生',
        image: DEFAULT_IMAGES.banner,
        link: '/pages/recipe/detail/index?id=3'
      }
    ]
  } catch (error) {
    console.error('获取Banner失败', error)
  }
}

// 获取推荐配方
const fetchRecommendRecipes = async () => {
  try {
    const res = await getRecommendRecipes({ page: 1, size: 6 })
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
  background: $bg-page;
  display: flex;
  flex-direction: column;
  
  &__scroll {
    flex: 1;
    height: calc(100vh - 56px);
  }
  
  // Banner区域
  &__banner {
    padding: 0 $spacing-lg;
    margin-bottom: $spacing-md;
    
    &-item {
      position: relative;
      width: 100%;
      height: 100%;
      border-radius: $radius-lg;
      overflow: hidden;
    }
    
    &-image {
      width: 100%;
      height: 100%;
    }
    
    &-overlay {
      position: absolute;
      bottom: 0;
      left: 0;
      right: 0;
      padding: $spacing-lg;
      background: linear-gradient(to top, rgba(0,0,0,0.6), transparent);
    }
    
    &-title {
      font-size: $font-size-lg;
      font-weight: $font-weight-bold;
      color: #fff;
      margin-bottom: $spacing-xs;
    }
    
    &-subtitle {
      font-size: $font-size-sm;
      color: rgba(255,255,255,0.9);
    }
  }
  
  &__swiper {
    height: 160px;
    border-radius: $radius-lg;
    overflow: hidden;
  }
  
  // 区块样式
  &__section {
    margin-bottom: $spacing-lg;
    
    &-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 0 $spacing-lg;
      margin-bottom: $spacing-md;
    }
    
    &-title {
      font-size: $font-size-lg;
      font-weight: $font-weight-bold;
      color: $text-primary;
    }
    
    &-more {
      font-size: $font-size-sm;
      color: $text-tertiary;
      display: flex;
      align-items: center;
      gap: $spacing-xs;
      
      &-icon {
        font-size: $font-size-xs;
      }
    }
  }
  
  // 推荐配方横向滚动
  &__recipe-scroll {
    white-space: nowrap;
  }
  
  &__recipe-list {
    display: flex;
    gap: $spacing-md;
    padding: 0 $spacing-lg;
    padding-bottom: $spacing-sm;
  }
  
  // 养生资讯列表
  &__content-list {
    padding: 0 $spacing-lg;
    display: flex;
    flex-direction: column;
    gap: $spacing-md;
  }
  
  &__content-item {
    display: flex;
    gap: $spacing-md;
    background: $bg-card;
    border-radius: $radius-lg;
    padding: $spacing-md;
    box-shadow: $shadow-card;
    
    &:active {
      transform: translateY(-2px);
      box-shadow: $shadow-card-hover;
      transition: all $duration-fast $ease-standard;
    }
  }
  
  &__content-image {
    width: 80px;
    height: 80px;
    border-radius: $radius-md;
    flex-shrink: 0;
  }
  
  &__content-info {
    flex: 1;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    min-height: 80px;
  }
  
  &__content-title {
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
  
  &__content-meta {
    font-size: $font-size-xs;
    color: $text-tertiary;
  }
  
  // 免责声明
  &__disclaimer {
    margin: 0 $spacing-lg $spacing-lg;
  }
  
  // 加载状态
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
}
</style>
