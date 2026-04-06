<template>
  <view class="category-page" :class="fontLargeClass">
    <!-- 导航栏 -->
    <view class="category-page__nav">
      <text class="category-page__nav-title">{{ $t('category.title') }}</text>
      <view class="category-page__nav-search" @click="goToSearch">
        <text class="category-page__nav-search-icon">⌕</text>
      </view>
    </view>
    
    <!-- 分类内容区 -->
    <view class="category-page__content">
      <!-- 左侧分类导航 -->
      <view class="category-page__sidebar">
        <view
          v-for="tab in tabs"
          :key="tab.key"
          class="category-page__sidebar-item"
          :class="{ 'is-active': currentTab === tab.key }"
          @click="switchTab(tab.key)"
        >
          <text class="category-page__sidebar-icon">{{ tab.icon }}</text>
          <text class="category-page__sidebar-text">{{ tab.name }}</text>
        </view>
      </view>
      
      <!-- 右侧内容区 -->
      <scroll-view scroll-y class="category-page__main">
        <!-- 人群分类 -->
        <view v-if="currentTab === 'crowd'" class="category-page__panel">
          <view class="category-page__panel-title">{{ $t('category.crowdTitle') }}</view>
          <view class="category-page__crowd-grid">
            <view
              v-for="item in crowdCategories"
              :key="item.key"
              class="category-page__crowd-card"
              :style="{ '--card-color': item.color }"
              @click="goToRecipeList('crowd', item)"
            >
              <view class="category-page__crowd-icon-wrapper" :style="{ background: item.color }">
                <text class="category-page__crowd-icon">{{ item.icon }}</text>
              </view>
              <view class="category-page__crowd-info">
                <text class="category-page__crowd-name">{{ item.name }}</text>
                <text class="category-page__crowd-desc">{{ item.desc }}</text>
              </view>
            </view>
          </view>
        </view>
        
        <!-- 节气分类 -->
        <view v-if="currentTab === 'solar'" class="category-page__panel">
          <!-- 当前节气 -->
          <view class="category-page__current-solar">
            <view class="category-page__current-solar-bg">
              <text class="category-page__current-solar-icon">{{ currentSolar.icon }}</text>
              <text class="category-page__current-solar-name">{{ currentSolar.name }}</text>
              <text class="category-page__current-solar-desc">{{ currentSolar.desc }}</text>
              <view class="category-page__current-solar-btn" @click="goToSolarDetail">
                <text class="category-page__current-solar-btn-text">{{ $t('category.viewSolarRecipes') }}</text>
              </view>
            </view>
          </view>
          
          <!-- 二十四节气 -->
          <view class="category-page__solar-section">
            <view class="category-page__panel-title">{{ $t('category.allSolarTerms') }}</view>
            <view v-for="season in solarTerms" :key="season.name" class="category-page__solar-season">
              <view class="category-page__solar-season-header">
                <text class="category-page__solar-season-name">{{ season.name }}</text>
              </view>
              <view class="category-page__solar-tags">
                <view
                  v-for="term in season.terms"
                  :key="term.key"
                  class="category-page__solar-tag"
                  :class="{ 'is-active': selectedSolar === term.key }"
                  @click="selectSolarTerm(term)"
                >
                  {{ term.name }}
                </view>
              </view>
            </view>
          </view>
        </view>
        
        <!-- 功效分类 -->
        <view v-if="currentTab === 'efficacy'" class="category-page__panel">
          <view class="category-page__panel-title">{{ $t('category.efficacyTitle') }}</view>
          <view class="category-page__efficacy-grid">
            <view
              v-for="item in efficacyCategories"
              :key="item.key"
              class="category-page__efficacy-card"
              :style="{ '--card-color': item.color }"
              @click="goToRecipeList('efficacy', item)"
            >
              <view class="category-page__efficacy-icon-wrapper" :style="{ background: item.color }">
                <text class="category-page__efficacy-icon">{{ item.icon }}</text>
              </view>
              <text class="category-page__efficacy-name">{{ item.name }}</text>
            </view>
          </view>
        </view>
        
        <!-- 食材分类 -->
        <view v-if="currentTab === 'ingredient'" class="category-page__panel">
          <view class="category-page__panel-title">{{ $t('category.commonIngredients') }}</view>
          <view class="category-page__ingredient-grid">
            <view
              v-for="item in commonIngredients"
              :key="item.key"
              class="category-page__ingredient-card"
              @click="goToRecipeList('ingredient', item)"
            >
              <image
                class="category-page__ingredient-image"
                :src="item.image"
                mode="aspectFill"
              />
              <text class="category-page__ingredient-name">{{ item.name }}</text>
            </view>
          </view>

          <view class="category-page__panel-title" style="margin-top: 24px;">{{ $t('category.medicinalIngredients') }}</view>
          <view class="category-page__ingredient-grid">
            <view
              v-for="item in medicinalIngredients"
              :key="item.key"
              class="category-page__ingredient-card"
              @click="goToRecipeList('ingredient', item)"
            >
              <image
                class="category-page__ingredient-image"
                :src="item.image"
                mode="aspectFill"
              />
              <text class="category-page__ingredient-name">{{ item.name }}</text>
            </view>
          </view>
        </view>
      </scroll-view>
    </view>
  </view>
</template>

<script setup lang="ts">
import { ref, computed } from 'vue'
import { useI18n } from 'vue-i18n'
import Taro from '@tarojs/taro'
import { DEFAULT_IMAGES } from '@/utils/image'
import { usePageFontSize } from '@/composables'

const { t: $t } = useI18n()
const { fontLargeClass } = usePageFontSize()

// 当前选中的分类
const currentTab = ref('crowd')
const selectedSolar = ref('')

// 分类标签
const tabs = computed(() => [
  { key: 'crowd', icon: '👥', name: $t('category.crowd') },
  { key: 'solar', icon: '🌸', name: $t('category.solarTerm') },
  { key: 'efficacy', icon: '💊', name: $t('category.efficacy') },
  { key: 'ingredient', icon: '🥬', name: $t('category.ingredient') }
])

// 人群分类（带彩色标签）
// 注意：filterValue 是后端 API 需要的筛选值
const crowdCategories = computed(() => [
  {
    key: 'elderly',
    icon: '🧓',
    name: $t('category.elderly'),
    desc: '针对50+人群',
    filterValue: '中老年',
    color: '#E8F5E9'
  },
  {
    key: 'office',
    icon: '💼',
    name: $t('category.office'),
    desc: '缓解亚健康',
    filterValue: '白领',
    color: '#E3F2FD'
  },
  {
    key: 'female',
    icon: '👩',
    name: $t('category.female'),
    desc: '调理气血',
    filterValue: '女性',
    color: '#FCE4EC'
  },
  {
    key: 'children',
    icon: '👶',
    name: $t('category.children'),
    desc: '健康成长',
    filterValue: '儿童',
    color: '#FFF3E0'
  },
  {
    key: 'general',
    icon: '👨‍👩‍👧‍👦',
    name: $t('category.general'),
    desc: '适合全家',
    filterValue: '通用',
    color: '#F5F5F5'
  }
])

// 当前节气
const currentSolar = computed(() => ({
  icon: '🌸',
  name: $t('solar.惊蛰'),
  desc: '春雷响，万物生'
}))

// 二十四节气
// 注意：filterValue 是后端 API 需要的筛选值（节气名称）
const solarTerms = computed(() => [
  {
    name: '春季',
    terms: [
      { key: 'lichun', name: '立春', filterValue: '立春' },
      { key: 'yushui', name: '雨水', filterValue: '雨水' },
      { key: 'jingzhe', name: '惊蛰', filterValue: '惊蛰' },
      { key: 'chunfen', name: '春分', filterValue: '春分' },
      { key: 'qingming', name: '清明', filterValue: '清明' },
      { key: 'guyu', name: '谷雨', filterValue: '谷雨' }
    ]
  },
  {
    name: '夏季',
    terms: [
      { key: 'lixia', name: '立夏', filterValue: '立夏' },
      { key: 'xiaoman', name: '小满', filterValue: '小满' },
      { key: 'mangzhong', name: '芒种', filterValue: '芒种' },
      { key: 'xiazhi', name: '夏至', filterValue: '夏至' },
      { key: 'xiaoshu', name: '小暑', filterValue: '小暑' },
      { key: 'dashu', name: '大暑', filterValue: '大暑' }
    ]
  },
  {
    name: '秋季',
    terms: [
      { key: 'liqiu', name: '立秋', filterValue: '立秋' },
      { key: 'chushu', name: '处暑', filterValue: '处暑' },
      { key: 'bailu', name: '白露', filterValue: '白露' },
      { key: 'qiufen', name: '秋分', filterValue: '秋分' },
      { key: 'hanlu', name: '寒露', filterValue: '寒露' },
      { key: 'shuangjiang', name: '霜降', filterValue: '霜降' }
    ]
  },
  {
    name: '冬季',
    terms: [
      { key: 'lidong', name: '立冬', filterValue: '立冬' },
      { key: 'xiaoxue', name: '小雪', filterValue: '小雪' },
      { key: 'daxue', name: '大雪', filterValue: '大雪' },
      { key: 'dongzhi', name: '冬至', filterValue: '冬至' },
      { key: 'xiaohan', name: '小寒', filterValue: '小寒' },
      { key: 'dahan', name: '大寒', filterValue: '大寒' }
    ]
  }
])

// 功效分类
// 注意：filterValue 是后端 API 需要的筛选值
const efficacyCategories = computed(() => [
  { key: 'blood', icon: '🩸', name: '补气养血', filterValue: '补气养血', color: '#FCE4EC' },
  { key: 'stomach', icon: '🍚', name: '健脾养胃', filterValue: '健脾养胃', color: '#E8F5E9' },
  { key: 'sleep', icon: '🌙', name: '安神助眠', filterValue: '安神助眠', color: '#EDE7F6' },
  { key: 'beauty', icon: '✨', name: '美容养颜', filterValue: '美容养颜', color: '#FCE4EC' },
  { key: 'heat', icon: '🔥', name: '清热解毒', filterValue: '清热解毒', color: '#FFEBEE' },
  { key: 'lung', icon: '🫁', name: '润肺止咳', filterValue: '润肺止咳', color: '#E3F2FD' },
  { key: 'kidney', icon: '💪', name: '补肾壮阳', filterValue: '补肾壮阳', color: '#FFF3E0' },
  { key: 'dampness', icon: '💧', name: '祛湿排毒', filterValue: '祛湿排毒', color: '#E0F2F1' },
  { key: 'pressure', icon: '🩺', name: '降压降脂', filterValue: '降压降脂', color: '#E8EAF6' },
  { key: 'immune', icon: '🛡️', name: '增强免疫', filterValue: '增强免疫', color: '#E8F5E9' }
])

// 常见食材
const commonIngredients = ref([
  { key: 'hongzao', name: '红枣', image: DEFAULT_IMAGES.ingredient },
  { key: 'gouqi', name: '枸杞', image: DEFAULT_IMAGES.ingredient },
  { key: 'shanyao', name: '山药', image: DEFAULT_IMAGES.ingredient },
  { key: 'yiner', name: '银耳', image: DEFAULT_IMAGES.ingredient },
  { key: 'lianzi', name: '莲子', image: DEFAULT_IMAGES.ingredient },
  { key: 'baihe', name: '百合', image: DEFAULT_IMAGES.ingredient }
])

// 药食同源
const medicinalIngredients = ref([
  { key: 'danggui', name: '当归', image: DEFAULT_IMAGES.ingredient },
  { key: 'huangqi', name: '黄芪', image: DEFAULT_IMAGES.ingredient },
  { key: 'dangshen', name: '党参', image: DEFAULT_IMAGES.ingredient },
  { key: 'goji', name: '枸杞', image: DEFAULT_IMAGES.ingredient },
  { key: 'redDate', name: '红枣', image: DEFAULT_IMAGES.ingredient },
  { key: 'yam', name: '山药', image: DEFAULT_IMAGES.ingredient }
])

// 切换分类
const switchTab = (key: string) => {
  currentTab.value = key
}

// 选择节气
const selectSolarTerm = (term: any) => {
  selectedSolar.value = term.key
  goToRecipeList('solar', term)
}

// 跳转配方列表
const goToRecipeList = (type: string, item: any) => {
  // 将前端type映射到后端参数名
  const paramMapping: Record<string, string> = {
    'crowd': 'crowd',
    'solar': 'solarTerm',
    'efficacy': 'efficacy',
    'ingredient': 'ingredient'
  }
  const paramName = paramMapping[type] || type
  // 使用 filterValue 作为 API 筛选值（后端期望的格式），如果没有则使用 key
  // 注意：不再在这里 encode，让 Taro.navigateTo 自己处理
  const value = item.filterValue || item.key || item.name
  Taro.navigateTo({
    url: `/pages/recipe/list/index?${paramName}=${value}`
  })
}

// 跳转节气详情
const goToSolarDetail = () => {
  Taro.navigateTo({
    url: `/pages/recipe/list/index?solar=current`
  })
}

// 跳转搜索
const goToSearch = () => {
  Taro.navigateTo({
    url: '/pages/search/index'
  })
}
</script>

<style lang="scss">
@import '@/styles/variables.scss';

.category-page {
  min-height: 100vh;
  background: #FFFFFF;
  display: flex;
  flex-direction: column;
  
  // 导航栏
  &__nav {
    height: 44px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 16px;
    background: #FFFFFF;
    border-bottom: 1px solid #EEEEEE;
    
    &-title {
      font-size: 18px;
      font-weight: 600;
      color: #333333;
    }
    
    &-search {
      width: 32px;
      height: 32px;
      display: flex;
      align-items: center;
      justify-content: center;
      
      &-icon {
        font-size: 24px;
        color: #333333;
      }
    }
  }
  
  &__content {
    flex: 1;
    display: flex;
    overflow: hidden;
  }
  
  // 左侧分类导航
  &__sidebar {
    width: 80px;
    background: #F5F5F5;
    flex-shrink: 0;
    
    &-item {
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      min-height: 72px;
      padding: $spacing-sm $spacing-xs;
      box-sizing: border-box;
      cursor: pointer;
      position: relative;
      transition: all 0.2s ease;
      
      &.is-active {
        background: #FFFFFF;
        
        &::before {
          content: '';
          position: absolute;
          left: 0;
          top: 50%;
          transform: translateY(-50%);
          width: 3px;
          height: 24px;
          background: #4CAF50;
        }
        
        .category-page__sidebar-icon,
        .category-page__sidebar-text {
          color: #4CAF50;
        }
      }
    }
    
    &-icon {
      font-size: 24px;
      margin-bottom: 4px;
      color: #999999;
    }
    
    &-text {
      font-size: 13px;
      color: #999999;
    }
  }
  
  // 右侧内容区
  &__main {
    flex: 1;
    padding: 16px;
    background: #FFFFFF;
  }
  
  &__panel {
    &-title {
      font-size: 16px;
      font-weight: 600;
      color: #333333;
      margin-bottom: 16px;
      display: block;
    }
  }
  
  // 人群分类
  &__crowd-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 16px;
  }
  
  &__crowd-card {
    background: #FFFFFF;
    border-radius: 12px;
    padding: 16px;
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    box-shadow: 0 2px 4px rgba(0,0,0,0.08);
    
    &:active {
      transform: scale(0.98);
    }
  }
  
  &__crowd-icon-wrapper {
    width: 48px;
    height: 48px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: 8px;
  }
  
  &__crowd-icon {
    font-size: 28px;
  }
  
  &__crowd-name {
    font-size: 15px;
    font-weight: 600;
    color: #333333;
    margin-bottom: 2px;
  }
  
  &__crowd-desc {
    font-size: 13px;
    color: #999999;
  }
  
  // 当前节气
  &__current-solar {
    margin-bottom: 24px;
    
    &-bg {
      background: linear-gradient(135deg, #4CAF50, #388E3C);
      border-radius: 12px;
      padding: 24px;
      display: flex;
      flex-direction: column;
      align-items: center;
      text-align: center;
    }
    
    &-icon {
      font-size: 64px;
      margin-bottom: 8px;
    }
    
    &-name {
      font-size: 24px;
      font-weight: 700;
      color: #FFFFFF;
      margin-bottom: 4px;
    }
    
    &-desc {
      font-size: 14px;
      color: rgba(255, 255, 255, 0.9);
      margin-bottom: 16px;
    }
    
    &-btn {
      padding: 6px 16px;
      border: 1px solid rgba(255, 255, 255, 0.8);
      border-radius: 100px;
      
      &-text {
        font-size: 14px;
        color: #FFFFFF;
      }
    }
  }
  
  &__solar-season {
    margin-bottom: 20px;
    
    &-header {
      margin-bottom: 10px;
    }
    
    &-name {
      font-size: 14px;
      font-weight: 600;
      color: #333333;
    }
  }
  
  &__solar-tags {
    display: flex;
    flex-wrap: wrap;
    gap: 12px;
  }
  
  &__solar-tag {
    width: calc(25% - 9px);
    min-height: 36px;
    padding: 8px 4px;
    display: flex;
    align-items: center;
    justify-content: center;
    background: #F5F5F5;
    border-radius: 8px;
    font-size: 13px;
    color: #333333;
    box-sizing: border-box;
    
    &.is-active {
      background: #4CAF50;
      color: #FFFFFF;
    }
  }
  
  // 功效分类
  &__efficacy-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 16px;
  }
  
  &__efficacy-card {
    background: #FFFFFF;
    border-radius: 12px;
    padding: 16px;
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    box-shadow: 0 2px 4px rgba(0,0,0,0.08);
    
    &:active {
      transform: scale(0.98);
    }
  }
  
  &__efficacy-icon-wrapper {
    width: 48px;
    height: 48px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: 8px;
    background: #F5F5F5;
  }
  
  &__efficacy-icon {
    font-size: 28px;
  }
  
  &__efficacy-name {
    font-size: 15px;
    font-weight: 500;
    color: #333333;
  }
  
  // 食材分类
  &__ingredient-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 11px;
  }
  
  &__ingredient-card {
    background: #FFFFFF;
    border-radius: 8px;
    overflow: hidden;
    box-shadow: 0 1px 3px rgba(0,0,0,0.08);
    padding: 8px;
    display: flex;
    flex-direction: column;
    align-items: center;
  }
  
  &__ingredient-image {
    width: 100%;
    aspect-ratio: 1;
    border-radius: 8px;
    background: #F5F5F5;
    margin-bottom: 6px;
  }
  
  &__ingredient-name {
    font-size: 14px;
    color: #333333;
    text-align: center;
  }
}
</style>
