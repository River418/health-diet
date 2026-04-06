<template>
  <view class="home-page" :class="fontLargeClass">
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
                :src="getBannerImageUrl(banner)"
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
        <view class="home-page__recipe-grid">
          <recipe-card
            v-for="recipe in recommendRecipes.slice(0, 4)"
            :key="recipe.id"
            :recipe="recipe"
            @click="goToRecipeDetail(recipe.id)"
          />
        </view>
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
        <view class="home-page__content-grid">
          <view
            v-for="(item, index) in contentList"
            :key="index"
            class="home-page__content-card"
            @click="goToContentDetail(item)"
          >
            <view class="home-page__content-image-wrapper">
              <image
                class="home-page__content-card-image"
                :src="getContentImageUrl(item)"
                mode="aspectFill"
              />
              <view v-if="item.type === 'video'" class="home-page__content-video-icon">▶</view>
            </view>
            <view class="home-page__content-card-info">
              <text class="home-page__content-card-title">{{ item.title }}</text>
              <view class="home-page__content-card-footer">
                <text class="home-page__content-card-author">{{ item.author || '养生堂' }}</text>
                <text class="home-page__content-card-views">{{ item.viewCount || 0 }}次阅读</text>
              </view>
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
import RecipeCard from '@/components/business/RecipeCard.vue'
import HdDisclaimer from '@/components/common/HdDisclaimer.vue'
import { getBanners, getRecommendRecipes, getContentList } from '@/api/home'
import { DEFAULT_IMAGES, getImageUrl } from '@/utils/image'
import { usePageFontSize } from '@/composables'

const { t: $t } = useI18n()
const { fontLargeClass } = usePageFontSize()

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
  if (item.id) {
    Taro.navigateTo({
      url: `/pages/content/detail/index?id=${item.id}`
    })
  } else if (item.source_url) {
    Taro.setClipboardData({
      data: item.source_url,
      success: () => {
        Taro.showToast({
          title: '链接已复制',
          icon: 'success'
        })
      }
    })
  }
}

// 获取内容图片 URL
const getContentImageUrl = (item: any) => {
  return getImageUrl(item.cover_image || item.image, 'content')
}

// 获取 Banner 图片 URL
const getBannerImageUrl = (banner: any) => {
  return getImageUrl(banner.image, 'banner')
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
  background: #F8F9FA;
  display: flex;
  flex-direction: column;
  
  &__scroll {
    flex: 1;
    min-height: 0;  // 允许 flex item 收缩，避免固定高度
  }
  
  // Banner区域
  &__banner {
    padding: 16px;
    
    &-item {
      position: relative;
      width: 100%;
      height: 100%;
      border-radius: 12px;
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
      padding: 16px;
      background: linear-gradient(to top, rgba(0,0,0,0.6), transparent);
    }
    
    &-title {
      font-size: 18px;
      font-weight: 600;
      color: #FFFFFF;
      margin-bottom: 4px;
    }
    
    &-subtitle {
      font-size: 12px;
      color: rgba(255,255,255,0.9);
    }
  }
  
  &__swiper {
    height: calc((100vw - 32px) * 9 / 16);
    border-radius: 12px;
    overflow: hidden;
  }
  
  // 区块样式
  &__section {
    margin-bottom: 24px;
    
    &-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 0 16px;
      margin-bottom: 12px;
    }
    
    &-title {
      font-size: 18px;
      font-weight: 600;
      color: #333333;
    }
    
    &-more {
      font-size: 14px;
      color: #999999;
      display: flex;
      align-items: center;
      gap: 4px;
      
      &-icon {
        font-size: 12px;
      }
    }
  }
  
  // 推荐配方网格
  &__recipe-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 16px;
    padding: 0 16px;
  }
  
  // 养生资讯网格
  &__content-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 16px;
    padding: 0 16px;
  }
  
  &__content-card {
    background: #FFFFFF;
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 2px 8px rgba(0,0,0,0.05);
    
    &:active {
      transform: translateY(2px);
    }
  }
  
  &__content-image-wrapper {
    position: relative;
    width: 100%;
    padding-top: 75%; // 4:3
  }
  
  &__content-card-image {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
  }
  
  &__content-video-icon {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 32px;
    height: 32px;
    background: rgba(255,255,255,0.8);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    color: $brand-primary;
    font-size: 14px;
    padding-left: 2px;
  }
  
  &__content-card-info {
    padding: 10px;
  }
  
  &__content-card-title {
    font-size: 14px;
    font-weight: 500;
    color: #333333;
    line-height: 1.4;
    height: 40px;
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    margin-bottom: 8px;
  }
  
  &__content-card-footer {
    display: flex;
    justify-content: space-between;
    align-items: center;
  }
  
  &__content-card-author,
  &__content-card-views {
    font-size: 11px;
    color: #999999;
  }
  
  // 免责声明
  &__disclaimer {
    margin: 0 16px 24px;
  }
  
  // 加载状态
  &__loading-more,
  &__no-more {
    text-align: center;
    padding: 16px;
  }
  
  &__loading-text,
  &__no-more-text {
    font-size: 13px;
    color: #999999;
  }
}
</style>
