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
              <view class="category-page__crowd-icon-wrapper" :style="{ background: item.gradient }">
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
              <view class="category-page__efficacy-icon-wrapper" :style="{ background: item.gradient }">
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
    desc: $t('category.elderlyDesc'),
    filterValue: '中老年',
    color: '#FF8C42',
    gradient: 'linear-gradient(135deg, #FF8C42, #FFB74D)'
  },
  {
    key: 'office',
    icon: '💼',
    name: $t('category.office'),
    desc: $t('category.officeDesc'),
    filterValue: '白领',
    color: '#64B5F6',
    gradient: 'linear-gradient(135deg, #64B5F6, #90CAF9)'
  },
  {
    key: 'female',
    icon: '👩',
    name: $t('category.female'),
    desc: $t('category.femaleDesc'),
    filterValue: '女性',
    color: '#F48FB1',
    gradient: 'linear-gradient(135deg, #F48FB1, #F8BBD9)'
  },
  {
    key: 'children',
    icon: '👶',
    name: $t('category.children'),
    desc: $t('category.childrenDesc'),
    filterValue: '儿童',
    color: '#FFD54F',
    gradient: 'linear-gradient(135deg, #FFD54F, #FFE082)'
  },
  {
    key: 'general',
    icon: '👨‍👩‍👧‍👦',
    name: $t('category.general'),
    desc: $t('category.generalDesc'),
    filterValue: '通用',
    color: '#81C784',
    gradient: 'linear-gradient(135deg, #81C784, #A5D6A7)'
  }
])

// 当前节气
const currentSolar = computed(() => ({
  icon: '🌸',
  name: $t('solar.惊蛰'),
  desc: $t('solar.惊蛰Desc')
}))

// 二十四节气
// 注意：filterValue 是后端 API 需要的筛选值（节气名称）
const solarTerms = computed(() => [
  {
    name: $t('season.spring'),
    terms: [
      { key: 'lichun', name: $t('solar.立春'), filterValue: '立春' },
      { key: 'yushui', name: $t('solar.雨水'), filterValue: '雨水' },
      { key: 'jingzhe', name: $t('solar.惊蛰'), filterValue: '惊蛰' },
      { key: 'chunfen', name: $t('solar.春分'), filterValue: '春分' },
      { key: 'qingming', name: $t('solar.清明'), filterValue: '清明' },
      { key: 'guyu', name: $t('solar.谷雨'), filterValue: '谷雨' }
    ]
  },
  {
    name: $t('season.summer'),
    terms: [
      { key: 'lixia', name: $t('solar.立夏'), filterValue: '立夏' },
      { key: 'xiaoman', name: $t('solar.小满'), filterValue: '小满' },
      { key: 'mangzhong', name: $t('solar.芒种'), filterValue: '芒种' },
      { key: 'xiazhi', name: $t('solar.夏至'), filterValue: '夏至' },
      { key: 'xiaoshu', name: $t('solar.小暑'), filterValue: '小暑' },
      { key: 'dashu', name: $t('solar.大暑'), filterValue: '大暑' }
    ]
  },
  {
    name: $t('season.autumn'),
    terms: [
      { key: 'liqiu', name: $t('solar.立秋'), filterValue: '立秋' },
      { key: 'chushu', name: $t('solar.处暑'), filterValue: '处暑' },
      { key: 'bailu', name: $t('solar.白露'), filterValue: '白露' },
      { key: 'qiufen', name: $t('solar.秋分'), filterValue: '秋分' },
      { key: 'hanlu', name: $t('solar.寒露'), filterValue: '寒露' },
      { key: 'shuangjiang', name: $t('solar.霜降'), filterValue: '霜降' }
    ]
  },
  {
    name: $t('season.winter'),
    terms: [
      { key: 'lidong', name: $t('solar.立冬'), filterValue: '立冬' },
      { key: 'xiaoxue', name: $t('solar.小雪'), filterValue: '小雪' },
      { key: 'daxue', name: $t('solar.大雪'), filterValue: '大雪' },
      { key: 'dongzhi', name: $t('solar.冬至'), filterValue: '冬至' },
      { key: 'xiaohan', name: $t('solar.小寒'), filterValue: '小寒' },
      { key: 'dahan', name: $t('solar.大寒'), filterValue: '大寒' }
    ]
  }
])

// 功效分类
// 注意：filterValue 是后端 API 需要的筛选值
const efficacyCategories = computed(() => [
  {
    key: 'blood',
    icon: '🩸',
    name: $t('efficacy.blood'),
    filterValue: '补气养血',
    color: '#F48FB1',
    gradient: 'linear-gradient(135deg, #F48FB1, #F8BBD9)'
  },
  {
    key: 'stomach',
    icon: '🍚',
    name: $t('efficacy.stomach'),
    filterValue: '健脾养胃',
    color: '#81C784',
    gradient: 'linear-gradient(135deg, #81C784, #A5D6A7)'
  },
  {
    key: 'sleep',
    icon: '🌙',
    name: $t('efficacy.sleep'),
    filterValue: '安神助眠',
    color: '#9575CD',
    gradient: 'linear-gradient(135deg, #9575CD, #B39DDB)'
  },
  {
    key: 'beauty',
    icon: '✨',
    name: $t('efficacy.beauty'),
    filterValue: '美容养颜',
    color: '#F06292',
    gradient: 'linear-gradient(135deg, #F06292, #F48FB1)'
  },
  {
    key: 'heat',
    icon: '🔥',
    name: $t('efficacy.heat'),
    filterValue: '清热解毒',
    color: '#FF8C42',
    gradient: 'linear-gradient(135deg, #FF8C42, #FFB74D)'
  },
  {
    key: 'lung',
    icon: '🫁',
    name: $t('efficacy.lung'),
    filterValue: '润肺止咳',
    color: '#64B5F6',
    gradient: 'linear-gradient(135deg, #64B5F6, #90CAF9)'
  },
  {
    key: 'kidney',
    icon: '💪',
    name: $t('efficacy.kidney'),
    filterValue: '补肾壮阳',
    color: '#FFD54F',
    gradient: 'linear-gradient(135deg, #FFD54F, #FFE082)'
  },
  {
    key: 'dampness',
    icon: '💧',
    name: $t('efficacy.dampness'),
    filterValue: '祛湿排毒',
    color: '#4DD0E1',
    gradient: 'linear-gradient(135deg, #4DD0E1, #80DEEA)'
  },
  {
    key: 'pressure',
    icon: '🩺',
    name: $t('efficacy.pressure'),
    filterValue: '降压降脂',
    color: '#7986CB',
    gradient: 'linear-gradient(135deg, #7986CB, #9FA8DA)'
  },
  {
    key: 'immune',
    icon: '🛡️',
    name: $t('efficacy.immune'),
    filterValue: '增强免疫',
    color: '#A1887F',
    gradient: 'linear-gradient(135deg, #A1887F, #BCAAA4)'
  }
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
  background: $bg-page;
  display: flex;
  flex-direction: column;
  
  // 导航栏
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
    
    &-search {
      width: 36px;
      height: 36px;
      display: flex;
      align-items: center;
      justify-content: center;
      background: $bg-hover;
      border-radius: 50%;
      cursor: pointer;
      
      &:active {
        background: $bg-divider;
      }
      
      &-icon {
        font-size: $font-size-lg;
        color: $text-tertiary;
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
    background: $bg-page;
    flex-shrink: 0;
    border-right: 1px solid $border-color;
    
    &-item {
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      height: 72px;
      cursor: pointer;
      position: relative;
      transition: all $duration-fast $ease-standard;
      
      &.is-active {
        background: $bg-card;
        
        &::before {
          content: '';
          position: absolute;
          left: 0;
          top: 50%;
          transform: translateY(-50%);
          width: 3px;
          height: 24px;
          background: linear-gradient(180deg, $brand-primary, $brand-light);
          border-radius: 0 2px 2px 0;
        }
        
        .category-page__sidebar-icon,
        .category-page__sidebar-text {
          color: $brand-primary;
        }
      }
      
      &:active {
        opacity: 0.7;
      }
    }
    
    &-icon {
      font-size: 24px;
      margin-bottom: $spacing-xs;
      color: $text-tertiary;
      transition: color $duration-fast $ease-standard;
    }
    
    &-text {
      font-size: $font-size-xs;
      color: $text-tertiary;
      transition: color $duration-fast $ease-standard;
    }
  }
  
  // 右侧内容区
  &__main {
    flex: 1;
    padding: $spacing-lg;
  }
  
  &__panel {
    &-title {
      font-size: $font-size-md;
      font-weight: $font-weight-bold;
      color: $text-primary;
      margin-bottom: $spacing-md;
    }
  }
  
  // 人群分类
  &__crowd-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: $spacing-md;
  }
  
  &__crowd-card {
    background: $bg-card;
    border-radius: $radius-lg;
    padding: $spacing-lg;
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    cursor: pointer;
    box-shadow: $shadow-card;
    border-left: 3px solid var(--card-color);
    
    &:active {
      transform: translateY(-2px);
      box-shadow: $shadow-card-hover;
      transition: all $duration-fast $ease-standard;
    }
  }
  
  &__crowd-icon-wrapper {
    width: 48px;
    height: 48px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: $spacing-sm;
    box-shadow: $shadow-level-1;
  }
  
  &__crowd-icon {
    font-size: 28px;
  }
  
  &__crowd-info {
    display: flex;
    flex-direction: column;
    gap: 2px;
  }
  
  &__crowd-name {
    font-size: $font-size-base;
    font-weight: $font-weight-medium;
    color: $text-primary;
  }
  
  &__crowd-desc {
    font-size: $font-size-xs;
    color: $text-tertiary;
  }
  
  // 当前节气
  &__current-solar {
    margin-bottom: $spacing-xl;
    
    &-bg {
      background: linear-gradient(135deg, $brand-primary, $brand-light);
      border-radius: $radius-lg;
      padding: $spacing-xl;
      display: flex;
      flex-direction: column;
      align-items: center;
      text-align: center;
      box-shadow: $shadow-brand;
    }
    
    &-icon {
      font-size: 64px;
      margin-bottom: $spacing-xs;
    }
    
    &-name {
      font-size: $font-size-xl;
      font-weight: $font-weight-bold;
      color: #fff;
      margin-bottom: $spacing-xs;
    }
    
    &-desc {
      font-size: $font-size-sm;
      color: rgba(255, 255, 255, 0.9);
      margin-bottom: $spacing-md;
    }
    
    &-btn {
      padding: $spacing-xs $spacing-lg;
      border: 1px solid rgba(255, 255, 255, 0.8);
      border-radius: $radius-full;
      cursor: pointer;
      
      &:active {
        background: rgba(255, 255, 255, 0.2);
      }
      
      &-text {
        font-size: $font-size-sm;
        color: #fff;
      }
    }
  }
  
  // 二十四节气
  &__solar-section {
    .category-page__panel-title {
      margin-top: $spacing-xl;
    }
  }
  
  &__solar-season {
    margin-bottom: $spacing-lg;
    
    &-header {
      display: flex;
      align-items: center;
      margin-bottom: $spacing-sm;
    }
    
    &-name {
      font-size: $font-size-sm;
      font-weight: $font-weight-medium;
      color: $text-secondary;
      padding: $spacing-xs $spacing-sm;
      background: $bg-hover;
      border-radius: $radius-sm;
    }
  }
  
  &__solar-tags {
    display: flex;
    flex-wrap: wrap;
    gap: $spacing-xs;
  }
  
  &__solar-tag {
    padding: $spacing-sm $spacing-md;
    background: $bg-card;
    border-radius: $radius-md;
    font-size: $font-size-sm;
    color: $text-primary;
    cursor: pointer;
    box-shadow: $shadow-level-1;
    transition: all $duration-fast $ease-standard;
    
    &:active,
    &.is-active {
      background: $brand-primary;
      color: #fff;
      box-shadow: $shadow-brand;
    }
  }
  
  // 功效分类
  &__efficacy-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: $spacing-md;
  }
  
  &__efficacy-card {
    background: $bg-card;
    border-radius: $radius-lg;
    padding: $spacing-xl $spacing-lg;
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    cursor: pointer;
    box-shadow: $shadow-card;
    border-top: 3px solid var(--card-color);
    
    &:active {
      transform: translateY(-2px);
      box-shadow: $shadow-card-hover;
      transition: all $duration-fast $ease-standard;
    }
  }
  
  &__efficacy-icon-wrapper {
    width: 48px;
    height: 48px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: $spacing-sm;
    box-shadow: $shadow-level-1;
  }
  
  &__efficacy-icon {
    font-size: 28px;
  }
  
  &__efficacy-name {
    font-size: $font-size-base;
    font-weight: $font-weight-medium;
    color: $text-primary;
  }
  
  // 食材分类
  &__ingredient-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: $spacing-md;
  }
  
  &__ingredient-card {
    background: $bg-card;
    border-radius: $radius-md;
    overflow: hidden;
    cursor: pointer;
    box-shadow: $shadow-card;
    
    &:active {
      transform: scale(0.98);
      transition: transform $duration-fast $ease-standard;
    }
  }
  
  &__ingredient-image {
    width: 100%;
    aspect-ratio: 1;
    background: $bg-hover;
  }
  
  &__ingredient-name {
    display: block;
    text-align: center;
    padding: $spacing-sm;
    font-size: $font-size-sm;
    color: $text-primary;
  }
}
</style>
