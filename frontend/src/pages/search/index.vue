<template>
  <view class="search-page">
    <!-- 搜索栏 -->
    <view class="search-page__header">
      <view class="search-page__input-wrapper">
        <text class="search-page__icon">⌕</text>
        <input
          v-model="keyword"
          class="search-page__input"
          :placeholder="$t('search.placeholder')"
          confirm-type="search"
          @confirm="handleSearch"
          @input="onInput"
          focus
        />
        <text v-if="keyword" class="search-page__clear" @click="clearKeyword">✕</text>
      </view>
      <text class="search-page__cancel" @click="handleCancel">{{ $t('common.cancel') }}</text>
    </view>
    
    <!-- 搜索建议 -->
    <view v-if="suggestions.length && keyword" class="search-page__suggestions">
      <view
        v-for="(item, index) in suggestions"
        :key="index"
        class="search-page__suggestion"
        @click="selectSuggestion(item)"
      >
        <text class="search-page__suggestion-icon">⌕</text>
        <text class="search-page__suggestion-text">{{ item }}</text>
      </view>
    </view>
    
    <!-- 搜索历史 -->
    <view v-else-if="!keyword && searchHistory.length" class="search-page__section">
      <view class="search-page__section-header">
        <text class="search-page__section-title">{{ $t('search.history') }}</text>
        <text class="search-page__section-clear" @click="clearHistory">{{ $t('search.clear') }}</text>
      </view>
      <view class="search-page__tags">
        <view
          v-for="(item, index) in searchHistory"
          :key="index"
          class="search-page__tag"
          @click="quickSearch(item)"
        >
          {{ item }}
        </view>
      </view>
    </view>
    
    <!-- 热门搜索 -->
    <view v-if="!keyword" class="search-page__section">
      <view class="search-page__section-header">
        <text class="search-page__section-title">{{ $t('search.hot') }}</text>
      </view>
      <view class="search-page__tags">
        <view
          v-for="(item, index) in hotSearch"
          :key="index"
          class="search-page__tag search-page__tag--hot"
          @click="quickSearch(item)"
        >
          <text v-if="index < 3" class="search-page__tag-rank">{{ index + 1 }}</text>
          {{ item }}
        </view>
      </view>
    </view>
    
    <!-- 搜索结果 -->
    <scroll-view
      v-if="hasSearched"
      scroll-y
      class="search-page__results"
      @scrolltolower="loadMore"
    >
      <view v-if="results.length" class="search-page__result-grid">
        <recipe-card
          v-for="item in results"
          :key="item.id"
          :recipe="item"
          @click="goToRecipeDetail"
        />
      </view>
      <hd-empty
        v-else
        icon="🔍"
        :title="$t('search.noResult')"
        :desc="$t('search.tryOther')"
      />
    </scroll-view>
  </view>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { useI18n } from 'vue-i18n'
import Taro from '@tarojs/taro'
import RecipeCard from '@/components/business/RecipeCard.vue'
import HdEmpty from '@/components/common/HdEmpty.vue'
import { search, getSearchHistory, getHotSearch, clearSearchHistory } from '@/api/home'

const { t: $t } = useI18n()

// 数据
const keyword = ref('')
const suggestions = ref<string[]>([])
const searchHistory = ref<string[]>([])
const hotSearch = ref<string[]>([])
const results = ref<any[]>([])
const hasSearched = ref(false)
const page = ref(1)
const loading = ref(false)
const noMore = ref(false)

// 输入处理
const onInput = () => {
  // TODO: 调用搜索建议API
  if (keyword.value) {
    suggestions.value = [
      keyword.value + ' 配方',
      keyword.value + ' 食材',
      keyword.value + ' 功效'
    ]
  } else {
    suggestions.value = []
  }
}

// 搜索
const handleSearch = async () => {
  if (!keyword.value.trim()) return
  
  hasSearched.value = true
  page.value = 1
  noMore.value = false
  
  try {
    const res = await search({ keyword: keyword.value, page: 1, size: 10 })
    results.value = res.data?.list || []
    
    // 保存搜索历史
    saveSearchHistory(keyword.value)
  } catch (error) {
    console.error('搜索失败', error)
  }
}

// 选择建议
const selectSuggestion = (item: string) => {
  keyword.value = item
  handleSearch()
}

// 快速搜索
const quickSearch = (item: string) => {
  keyword.value = item
  handleSearch()
}

// 清除关键词
const clearKeyword = () => {
  keyword.value = ''
  suggestions.value = []
  hasSearched.value = false
  results.value = []
}

// 取消
const handleCancel = () => {
  Taro.navigateBack()
}

// 保存搜索历史
const saveSearchHistory = (kw: string) => {
  const history = Taro.getStorageSync('searchHistory') || []
  const newHistory = [kw, ...history.filter((h: string) => h !== kw)].slice(0, 10)
  Taro.setStorageSync('searchHistory', newHistory)
  searchHistory.value = newHistory
}

// 获取搜索历史
const fetchSearchHistory = () => {
  const history = Taro.getStorageSync('searchHistory') || []
  searchHistory.value = history
}

// 清除历史
const clearHistory = () => {
  Taro.showModal({
    title: $t('common.confirm'),
    content: $t('search.clear'),
    success: (res) => {
      if (res.confirm) {
        Taro.removeStorageSync('searchHistory')
        searchHistory.value = []
      }
    }
  })
}

// 获取热门搜索
const fetchHotSearch = async () => {
  try {
    const res = await getHotSearch()
    hotSearch.value = res.data || ['红枣', '枸杞', '养生茶', '补气', '美容']
  } catch (error) {
    hotSearch.value = ['红枣', '枸杞', '养生茶', '补气', '美容']
  }
}

// 加载更多
const loadMore = async () => {
  if (loading.value || noMore.value) return
  
  loading.value = true
  page.value++
  
  try {
    const res = await search({ keyword: keyword.value, page: page.value, size: 10 })
    const list = res.data?.list || []
    
    if (list.length === 0) {
      noMore.value = true
    } else {
      results.value.push(...list)
    }
  } catch (error) {
    console.error('加载更多失败', error)
  } finally {
    loading.value = false
  }
}

// 跳转配方详情
const goToRecipeDetail = (id: number) => {
  Taro.navigateTo({
    url: `/pages/recipe/detail/index?id=${id}`
  })
}

onMounted(() => {
  fetchSearchHistory()
  fetchHotSearch()
})
</script>

<style lang="scss">
@import '@/styles/variables.scss';

.search-page {
  min-height: 100vh;
  background: $bg-page;
  
  &__header {
    display: flex;
    align-items: center;
    padding: 12px 16px;
    background: #fff;
    box-shadow: 0 1px 0 $bg-divider;
  }
  
  &__input-wrapper {
    flex: 1;
    height: 40px;
    background: $bg-page;
    border-radius: 20px;
    display: flex;
    align-items: center;
    padding: 0 12px;
    gap: 8px;
  }
  
  &__icon {
    font-size: 18px;
    color: $text-tertiary;
  }
  
  &__input {
    flex: 1;
    font-size: 14px;
    color: $text-primary;
    
    &::placeholder {
      color: $text-tertiary;
    }
  }
  
  &__clear {
    font-size: 14px;
    color: $text-tertiary;
    padding: 4px;
  }
  
  &__cancel {
    font-size: 14px;
    color: $text-secondary;
    margin-left: 12px;
  }
  
  &__suggestions {
    background: #fff;
    
    .search-page__suggestion {
      display: flex;
      align-items: center;
      padding: 12px 16px;
      border-bottom: 1px solid $bg-divider;
      
      &:active {
        background: $bg-page;
      }
      
      &-icon {
        font-size: 16px;
        color: $text-tertiary;
        margin-right: 8px;
      }
      
      &-text {
        font-size: 14px;
        color: $text-primary;
      }
    }
  }
  
  &__section {
    padding: 16px;
    
    &-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 12px;
    }
    
    &-title {
      font-size: 14px;
      font-weight: $font-weight-medium;
      color: $text-secondary;
    }
    
    &-clear {
      font-size: 13px;
      color: $text-tertiary;
    }
  }
  
  &__tags {
    display: flex;
    flex-wrap: wrap;
    gap: 12px;
  }
  
  &__tag {
    padding: 8px 16px;
    background: #fff;
    border-radius: 16px;
    font-size: 13px;
    color: $text-primary;
    
    &--hot {
      display: flex;
      align-items: center;
      gap: 4px;
    }
    
    &-rank {
      width: 16px;
      height: 16px;
      background: $accent-orange;
      color: #fff;
      border-radius: 4px;
      font-size: 11px;
      display: flex;
      align-items: center;
      justify-content: center;
    }
  }
  
  &__results {
    height: calc(100vh - 65px);
  }
  
  &__result-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 16px;
    padding: 16px;
  }
}
</style>
