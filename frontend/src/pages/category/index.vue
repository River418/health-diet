<template>
  <view class="category-page">
    <!-- 导航栏 -->
    <view class="category-page__nav">
      <text class="category-page__nav-back" @click="handleBack">⌫</text>
      <text class="category-page__nav-title">{{ $t('category.title') }}</text>
      <text class="category-page__nav-search" @click="goToSearch">🔍</text>
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
              :style="{ backgroundColor: item.bgColor }"
              @click="goToRecipeList('crowd', item.key)"
            >
              <text class="category-page__crowd-icon">{{ item.icon }}</text>
              <text class="category-page__crowd-name">{{ item.name }}</text>
              <text class="category-page__crowd-desc">{{ item.desc }}</text>
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
              <text class="category-page__solar-season-name">{{ season.name }}</text>
              <view class="category-page__solar-tags">
                <view
                  v-for="term in season.terms"
                  :key="term.key"
                  class="category-page__solar-tag"
                  :class="{ 'is-active': selectedSolar === term.key }"
                  @click="selectSolarTerm(term.key)"
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
              :style="{ backgroundColor: item.bgColor }"
              @click="goToRecipeList('efficacy', item.key)"
            >
              <text class="category-page__efficacy-icon">{{ item.icon }}</text>
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
              @click="goToRecipeList('ingredient', item.key)"
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
              @click="goToRecipeList('ingredient', item.key)"
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

const { t: $t } = useI18n()

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

// 人群分类
const crowdCategories = computed(() => [
  { key: 'elderly', icon: '🧓', name: $t('category.elderly'), desc: $t('category.elderlyDesc'), bgColor: '#E8F5E9' },
  { key: 'office', icon: '💼', name: $t('category.office'), desc: $t('category.officeDesc'), bgColor: '#E3F2FD' },
  { key: 'female', icon: '👩', name: $t('category.female'), desc: $t('category.femaleDesc'), bgColor: '#FCE4EC' },
  { key: 'children', icon: '👶', name: $t('category.children'), desc: $t('category.childrenDesc'), bgColor: '#FFF3E0' },
  { key: 'general', icon: '👨‍👩‍👧‍👦', name: $t('category.general'), desc: $t('category.generalDesc'), bgColor: '#F5F5F5' }
])

// 当前节气
const currentSolar = computed(() => ({
  icon: '🌸',
  name: $t('solar.惊蛰'),
  desc: $t('solar.惊蛰Desc')
}))

// 二十四节气
const solarTerms = computed(() => [
  {
    name: $t('season.spring'),
    terms: [
      { key: 'lichun', name: $t('solar.立春') },
      { key: 'yushui', name: $t('solar.雨水') },
      { key: 'jingzhe', name: $t('solar.惊蛰') },
      { key: 'chunfen', name: $t('solar.春分') },
      { key: 'qingming', name: $t('solar.清明') },
      { key: 'guyu', name: $t('solar.谷雨') }
    ]
  },
  {
    name: $t('season.summer'),
    terms: [
      { key: 'lixia', name: $t('solar.立夏') },
      { key: 'xiaoman', name: $t('solar.小满') },
      { key: 'mangzhong', name: $t('solar.芒种') },
      { key: 'xiazhi', name: $t('solar.夏至') },
      { key: 'xiaoshu', name: $t('solar.小暑') },
      { key: 'dashu', name: $t('solar.大暑') }
    ]
  },
  {
    name: $t('season.autumn'),
    terms: [
      { key: 'liqiu', name: $t('solar.立秋') },
      { key: 'chushu', name: $t('solar.处暑') },
      { key: 'bailu', name: $t('solar.白露') },
      { key: 'qiufen', name: $t('solar.秋分') },
      { key: 'hanlu', name: $t('solar.寒露') },
      { key: 'shuangjiang', name: $t('solar.霜降') }
    ]
  },
  {
    name: $t('season.winter'),
    terms: [
      { key: 'lidong', name: $t('solar.立冬') },
      { key: 'xiaoxue', name: $t('solar.小雪') },
      { key: 'daxue', name: $t('solar.大雪') },
      { key: 'dongzhi', name: $t('solar.冬至') },
      { key: 'xiaohan', name: $t('solar.小寒') },
      { key: 'dahan', name: $t('solar.大寒') }
    ]
  }
])

// 功效分类
const efficacyCategories = computed(() => [
  { key: 'blood', icon: '🩸', name: $t('efficacy.blood'), bgColor: '#FCE4EC' },
  { key: 'stomach', icon: '🍚', name: $t('efficacy.stomach'), bgColor: '#E8F5E9' },
  { key: 'sleep', icon: '🌙', name: $t('efficacy.sleep'), bgColor: '#EDE7F6' },
  { key: 'beauty', icon: '✨', name: $t('efficacy.beauty'), bgColor: '#FCE4EC' },
  { key: 'heat', icon: '🔥', name: $t('efficacy.heat'), bgColor: '#FFEBEE' },
  { key: 'lung', icon: '🫁', name: $t('efficacy.lung'), bgColor: '#E3F2FD' },
  { key: 'kidney', icon: '💪', name: $t('efficacy.kidney'), bgColor: '#FFF3E0' },
  { key: 'dampness', icon: '💧', name: $t('efficacy.dampness'), bgColor: '#E0F2F1' },
  { key: 'pressure', icon: '🩺', name: $t('efficacy.pressure'), bgColor: '#E8EAF6' },
  { key: 'immune', icon: '🛡️', name: $t('efficacy.immune'), bgColor: '#E8F5E9' }
])

// 常见食材
const commonIngredients = ref([
  { key: 'hongzao', name: '红枣', image: '/assets/images/ingredients/hongzao.png' },
  { key: 'gouqi', name: '枸杞', image: '/assets/images/ingredients/gouqi.png' },
  { key: 'shanyao', name: '山药', image: '/assets/images/ingredients/shanyao.png' },
  { key: 'yiner', name: '银耳', image: '/assets/images/ingredients/yiner.png' },
  { key: 'lianzi', name: '莲子', image: '/assets/images/ingredients/lianzi.png' },
  { key: 'baihe', name: '百合', image: '/assets/images/ingredients/baihe.png' }
])

// 药食同源
const medicinalIngredients = ref([
  { key: 'danggui', name: '当归', image: '/assets/images/ingredients/danggui.png' },
  { key: 'huangqi', name: '黄芪', image: '/assets/images/ingredients/huangqi.png' },
  { key: 'dangshen', name: '党参', image: '/assets/images/ingredients/dangshen.png' },
  { key: 'goji', name: '枸杞', image: '/assets/images/ingredients/gouqi.png' },
  { key: 'redDate', name: '红枣', image: '/assets/images/ingredients/hongzao.png' },
  { key: 'yam', name: '山药', image: '/assets/images/ingredients/shanyao.png' }
])

// 切换分类
const switchTab = (key: string) => {
  currentTab.value = key
}

// 选择节气
const selectSolarTerm = (key: string) => {
  selectedSolar.value = key
  goToRecipeList('solar', key)
}

// 跳转配方列表
const goToRecipeList = (type: string, key: string) => {
  Taro.navigateTo({
    url: `/pages/recipe/list/index?${type}=${key}`
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

// 返回
const handleBack = () => {
  Taro.navigateBack()
}
</script>

<style lang="scss">
@import '@/styles/variables.scss';

.category-page {
  min-height: 100vh;
  background: $bg-gray;
  display: flex;
  flex-direction: column;
  
  &__nav {
    height: 44px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 16px;
    background: #fff;
    box-shadow: 0 1px 0 $bg-divider;
    
    &-back,
    &-search {
      font-size: 24px;
      color: $text-primary;
      padding: 8px;
    }
    
    &-title {
      font-size: 18px;
      font-weight: $font-weight-medium;
      color: $text-primary;
    }
  }
  
  &__content {
    flex: 1;
    display: flex;
    overflow: hidden;
  }
  
  &__sidebar {
    width: 80px;
    background: $bg-gray;
    flex-shrink: 0;
    
    &-item {
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      height: 72px;
      cursor: pointer;
      position: relative;
      
      &.is-active {
        background: #fff;
        
        &::before {
          content: '';
          position: absolute;
          left: 0;
          top: 50%;
          transform: translateY(-50%);
          width: 3px;
          height: 24px;
          background: $brand-primary;
          border-radius: 0 2px 2px 0;
        }
        
        .category-page__sidebar-icon,
        .category-page__sidebar-text {
          color: $brand-primary;
        }
      }
    }
    
    &-icon {
      font-size: 24px;
      margin-bottom: 4px;
    }
    
    &-text {
      font-size: 13px;
      color: $text-tertiary;
    }
  }
  
  &__main {
    flex: 1;
    padding: 16px;
  }
  
  &__panel {
    &-title {
      font-size: 16px;
      font-weight: $font-weight-medium;
      color: $text-primary;
      margin-bottom: 16px;
    }
  }
  
  // 人群分类
  &__crowd-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 12px;
  }
  
  &__crowd-card {
    border-radius: 12px;
    padding: 16px;
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    cursor: pointer;
    
    &:active {
      opacity: 0.8;
    }
  }
  
  &__crowd-icon {
    font-size: 32px;
    margin-bottom: 8px;
  }
  
  &__crowd-name {
    font-size: 15px;
    font-weight: $font-weight-medium;
    color: $text-primary;
    margin-bottom: 4px;
  }
  
  &__crowd-desc {
    font-size: 12px;
    color: $text-secondary;
  }
  
  // 当前节气
  &__current-solar {
    margin-bottom: 24px;
    
    &-bg {
      background: linear-gradient(135deg, $brand-primary, $brand-dark);
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
      font-weight: $font-weight-bold;
      color: #fff;
      margin-bottom: 8px;
    }
    
    &-desc {
      font-size: 14px;
      color: rgba(255, 255, 255, 0.9);
      margin-bottom: 16px;
    }
    
    &-btn {
      padding: 8px 20px;
      border: 1px solid #fff;
      border-radius: 20px;
      
      &-text {
        font-size: 14px;
        color: #fff;
      }
    }
  }
  
  // 二十四节气
  &__solar-section {
    .category-page__panel-title {
      margin-top: 24px;
    }
  }
  
  &__solar-season {
    margin-bottom: 16px;
    
    &-name {
      font-size: 14px;
      font-weight: $font-weight-medium;
      color: $text-secondary;
      margin-bottom: 12px;
      display: block;
    }
  }
  
  &__solar-tags {
    display: flex;
    flex-wrap: wrap;
    gap: 8px;
  }
  
  &__solar-tag {
    padding: 8px 16px;
    background: #fff;
    border-radius: 8px;
    font-size: 13px;
    color: $text-primary;
    cursor: pointer;
    
    &:active,
    &.is-active {
      background: $brand-primary;
      color: #fff;
    }
  }
  
  // 功效分类
  &__efficacy-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 12px;
  }
  
  &__efficacy-card {
    border-radius: 12px;
    padding: 20px 16px;
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    cursor: pointer;
    
    &:active {
      opacity: 0.8;
    }
  }
  
  &__efficacy-icon {
    font-size: 32px;
    margin-bottom: 8px;
  }
  
  &__efficacy-name {
    font-size: 15px;
    font-weight: $font-weight-medium;
    color: $text-primary;
  }
  
  // 食材分类
  &__ingredient-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 12px;
  }
  
  &__ingredient-card {
    background: #fff;
    border-radius: 8px;
    overflow: hidden;
    cursor: pointer;
    
    &:active {
      opacity: 0.8;
    }
  }
  
  &__ingredient-image {
    width: 100%;
    padding-top: 100%;
    background: $bg-gray;
  }
  
  &__ingredient-name {
    display: block;
    text-align: center;
    padding: 8px;
    font-size: 14px;
    color: $text-primary;
  }
}
</style>
