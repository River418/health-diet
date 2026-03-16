<template>
  <view class="content-detail-page" :class="fontLargeClass">
    <!-- 导航栏 -->
    <view class="nav-bar">
      <view class="nav-back" @click="goBack">
        <text class="nav-back-icon">←</text>
      </view>
      <text class="nav-title">资讯详情</text>
      <view class="nav-placeholder"></view>
    </view>

    <!-- 内容区域 -->
    <scroll-view class="content-scroll" scroll-y>
      <!-- 加载中 -->
      <view v-if="loading" class="loading-state">
        <text class="loading-text">加载中...</text>
      </view>

      <!-- 内容详情 -->
      <view v-else-if="content" class="content-detail">
        <!-- 标题 -->
        <view class="content-header">
          <text class="content-title">{{ content.title }}</text>
          <view class="content-meta">
            <text class="content-author">{{ content.author }}</text>
            <text class="content-date">{{ formatDate(content.published_at) }}</text>
          </view>
        </view>

        <!-- 封面图 -->
        <image
          v-if="content.cover_image"
          class="content-cover"
          :src="content.cover_image"
          mode="aspectFill"
        />

        <!-- 内容 -->
        <view class="content-body">
          <rich-text v-if="content.content" :nodes="content.content" />
          <view v-else class="content-placeholder">
            <text class="placeholder-text">{{ content.summary || '暂无详细内容' }}</text>
          </view>
        </view>

        <!-- 标签 -->
        <view v-if="content.tags && content.tags.length" class="content-tags">
          <text
            v-for="(tag, index) in content.tags"
            :key="index"
            class="content-tag"
          >{{ tag }}</text>
        </view>

        <!-- 统计 -->
        <view class="content-stats">
          <text class="stats-item">👁 {{ content.view_count || 0 }} 浏览</text>
          <text class="stats-item">❤️ {{ content.like_count || 0 }} 点赞</text>
        </view>
      </view>

      <!-- 错误状态 -->
      <view v-else class="error-state">
        <text class="error-text">内容加载失败</text>
        <view class="retry-btn" @click="fetchContentDetail">
          <text class="retry-text">重新加载</text>
        </view>
      </view>
    </scroll-view>
  </view>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import Taro from '@tarojs/taro'
import { getContentDetail } from '@/api/home'
import { usePageFontSize } from '@/composables'

const { fontLargeClass } = usePageFontSize()

// 内容数据
const content = ref<any>(null)
const loading = ref(true)

// 获取页面参数
const getPageParams = () => {
  // 优先使用 Taro router params
  const instance = Taro.getCurrentInstance()
  const query = instance.router?.params || {}
  
  // H5 模式下从 hash 获取参数作为后备
  if (typeof window !== 'undefined' && window.location) {
    const hash = window.location.hash
    if (hash) {
      const queryIndex = hash.indexOf('?')
      if (queryIndex !== -1) {
        const search = hash.substring(queryIndex + 1)
        const urlParams = new URLSearchParams(search)
        const id = urlParams.get('id')
        if (id) {
          return { id }
        }
      }
    }
  }
  
  return query
}

// 获取内容详情
const fetchContentDetail = async () => {
  const { id } = getPageParams()
  if (!id) {
    Taro.showToast({
      title: '内容ID不能为空',
      icon: 'none'
    })
    loading.value = false
    return
  }

  loading.value = true
  try {
    const res = await getContentDetail(id)
    if (res.success) {
      content.value = res.data
    } else {
      throw new Error(res.error || '获取内容失败')
    }
  } catch (error) {
    console.error('获取内容详情失败:', error)
    Taro.showToast({
      title: '获取内容失败',
      icon: 'none'
    })
  } finally {
    loading.value = false
  }
}

// 返回上一页
const goBack = () => {
  Taro.navigateBack()
}

// 格式化日期
const formatDate = (dateStr: string) => {
  if (!dateStr) return ''
  const date = new Date(dateStr)
  return `${date.getFullYear()}-${String(date.getMonth() + 1).padStart(2, '0')}-${String(date.getDate()).padStart(2, '0')}`
}

onMounted(() => {
  console.log('[ContentDetail] onMounted called')
  const pages = Taro.getCurrentPages()
  console.log('[ContentDetail] current pages:', pages.length)
  if (pages.length > 0) {
    console.log('[ContentDetail] current page options:', pages[pages.length - 1].options)
  }
  fetchContentDetail()
})
</script>

<style lang="scss">
@import '@/styles/variables.scss';

.content-detail-page {
  min-height: 100vh;
  background: $bg-page;
}

.nav-bar {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: $spacing-md $spacing-lg;
  background: $bg-card;
  border-bottom: 1px solid $border-color;

  .nav-back {
    width: 40px;
    height: 40px;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;

    &:active {
      opacity: 0.7;
    }

    .nav-back-icon {
      font-size: 24px;
      color: $text-primary;
    }
  }

  .nav-title {
    font-size: $font-size-lg;
    font-weight: $font-weight-semibold;
    color: $text-primary;
  }

  .nav-placeholder {
    width: 40px;
  }
}

.content-scroll {
  height: calc(100vh - 60px);
}

.loading-state {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 200px;

  .loading-text {
    font-size: $font-size-md;
    color: $text-secondary;
  }
}

.content-detail {
  padding: $spacing-lg;
}

.content-header {
  margin-bottom: $spacing-lg;

  .content-title {
    font-size: $font-size-xl;
    font-weight: $font-weight-bold;
    color: $text-primary;
    line-height: $line-height-normal;
    margin-bottom: $spacing-md;
  }

  .content-meta {
    display: flex;
    align-items: center;
    gap: $spacing-md;

    .content-author {
      font-size: $font-size-sm;
      color: $text-secondary;
    }

    .content-date {
      font-size: $font-size-sm;
      color: $text-tertiary;
    }
  }
}

.content-cover {
  width: 100%;
  height: 200px;
  border-radius: $radius-md;
  margin-bottom: $spacing-lg;
}

.content-body {
  margin-bottom: $spacing-lg;

  .content-placeholder {
    padding: $spacing-xl;
    background: $bg-hover;
    border-radius: $radius-md;
    text-align: center;

    .placeholder-text {
      font-size: $font-size-md;
      color: $text-secondary;
    }
  }
}

.content-tags {
  display: flex;
  flex-wrap: wrap;
  gap: $spacing-sm;
  margin-bottom: $spacing-lg;

  .content-tag {
    padding: $spacing-xs $spacing-sm;
    background: $bg-hover;
    border-radius: $radius-sm;
    font-size: $font-size-xs;
    color: $text-secondary;
  }
}

.content-stats {
  display: flex;
  gap: $spacing-lg;
  padding-top: $spacing-lg;
  border-top: 1px solid $border-color;

  .stats-item {
    font-size: $font-size-sm;
    color: $text-tertiary;
  }
}

.error-state {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  height: 300px;

  .error-text {
    font-size: $font-size-md;
    color: $text-secondary;
    margin-bottom: $spacing-lg;
  }

  .retry-btn {
    padding: $spacing-sm $spacing-xl;
    background: $brand-light;
    border-radius: $radius-md;
    cursor: pointer;

    &:active {
      opacity: 0.8;
    }

    .retry-text {
      font-size: $font-size-md;
      color: #fff;
    }
  }
}
</style>
