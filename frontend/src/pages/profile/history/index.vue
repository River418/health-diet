<template>
  <view class="history-page" :class="fontLargeClass">
    <!-- 列表 -->
    <scroll-view
      scroll-y
      class="history-page__scroll"
      :refresher-enabled="true"
      :refresher-triggered="refreshing"
      @refresherrefresh="onRefresh"
      @scrolltolower="onLoadMore"
    >
      <view v-if="loading && !history.length" class="history-page__loading">
        <hd-skeleton type="list" :rows="5" />
      </view>
      
      <view v-else-if="history.length" class="history-page__list">
        <view
          v-for="item in history"
          :key="item.id"
          class="history-page__item"
          @click="goToRecipeDetail(item.id)"
        >
          <image
            class="history-page__image"
            :src="item.coverImage"
            mode="aspectFill"
          />
          <view class="history-page__info">
            <text class="history-page__name">{{ item.name }}</text>
            <text class="history-page__time">{{ item.viewTime }}</text>
          </view>
          <text class="history-page__arrow">></text>
        </view>
      </view>
      
      <hd-empty
        v-else
        icon="👁"
        :title="$t('history.emptyTitle')"
        :desc="$t('history.emptyDesc')"
        :show-action="true"
        :action-text="$t('history.goHome')"
        @action="goToHome"
      />
      
      <!-- 加载更多 -->
      <view v-if="loadingMore" class="history-page__loading-more">
        <text class="history-page__loading-text">{{ $t('common.loading') }}</text>
      </view>
      <view v-else-if="noMore && history.length" class="history-page__no-more">
        <text class="history-page__no-more-text">{{ $t('common.noMore') }}</text>
      </view>
    </scroll-view>
    
    <!-- 清空按钮 -->
    <view v-if="history.length" class="history-page__footer">
      <hd-button
        type="outline"
        size="large"
        block
        :text="$t('history.clear')"
        @click="clearHistory"
      />
    </view>
  </view>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { useI18n } from 'vue-i18n'
import Taro from '@tarojs/taro'
import HdSkeleton from '@/components/common/HdSkeleton.vue'
import HdEmpty from '@/components/common/HdEmpty.vue'
import HdButton from '@/components/common/HdButton.vue'
import { usePageFontSize } from '@/composables'

const { t: $t } = useI18n()
const { fontLargeClass } = usePageFontSize()

// 数据
const history = ref<any[]>([])
const loading = ref(false)
const refreshing = ref(false)
const loadingMore = ref(false)
const noMore = ref(false)
const page = ref(1)

// 获取浏览历史
const fetchHistory = async (isLoadMore = false) => {
  if (loading.value || loadingMore.value) return
  
  if (isLoadMore) {
    loadingMore.value = true
  } else {
    loading.value = true
  }
  
  try {
    // TODO: 调用API获取浏览历史
    // const res = await getHistory({ page: page.value, size: 10 })
    // const list = res.data?.list || []
    
    // 模拟数据
    const list: any[] = []
    
    if (isLoadMore) {
      history.value.push(...list)
    } else {
      history.value = list
    }
    
    if (list.length < 10) {
      noMore.value = true
    }
  } catch (error) {
    console.error('获取浏览历史失败', error)
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
  await fetchHistory(false)
  refreshing.value = false
}

// 加载更多
const onLoadMore = () => {
  if (noMore.value) return
  page.value++
  fetchHistory(true)
}

// 清空历史
const clearHistory = () => {
  Taro.showModal({
    title: $t('common.confirm'),
    content: $t('history.clearConfirm'),
    success: (res) => {
      if (res.confirm) {
        // TODO: 调用API清空历史
        history.value = []
        Taro.showToast({
          title: $t('history.cleared'),
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
  fetchHistory()
})
</script>

<style lang="scss">
@import '@/styles/variables.scss';

.history-page {
  min-height: 100vh;
  background: $bg-page;
  display: flex;
  flex-direction: column;
  
  &__scroll {
    flex: 1;
  }
  
  &__loading {
    padding: 16px;
  }
  
  &__list {
    background: #fff;
  }
  
  &__item {
    display: flex;
    align-items: center;
    padding: 12px 16px;
    border-bottom: 1px solid $bg-divider;
    
    &:active {
      background: $bg-page;
    }
  }
  
  &__image {
    width: 80px;
    height: 60px;
    border-radius: 8px;
    margin-right: 12px;
    background: $bg-page;
  }
  
  &__info {
    flex: 1;
    display: flex;
    flex-direction: column;
    gap: 4px;
  }
  
  &__name {
    font-size: 15px;
    color: $text-primary;
    font-weight: $font-weight-medium;
  }
  
  &__time {
    font-size: 12px;
    color: $text-tertiary;
  }
  
  &__arrow {
    font-size: 16px;
    color: $text-tertiary;
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
  
  &__footer {
    padding: 16px;
    background: #fff;
    box-shadow: 0 -1px 0 $bg-divider;
  }
}
</style>
