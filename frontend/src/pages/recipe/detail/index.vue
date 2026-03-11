<template>
  <view class="recipe-detail-page">
    <!-- 顶部导航栏（滚动后显示） -->
    <view class="recipe-detail-page__nav" :class="{ 'recipe-detail-page__nav--visible': navVisible }">
      <view class="recipe-detail-page__nav-back" @click="handleBack">
        <text class="recipe-detail-page__nav-icon">‹</text>
      </view>
      <text class="recipe-detail-page__nav-title">{{ $t('recipe.detail') }}</text>
      <view class="recipe-detail-page__nav-actions">
        <view class="recipe-detail-page__nav-btn" @click="toggleFavorite">
          <text class="recipe-detail-page__nav-icon" :class="{ 'is-active': isFavorited }">
            {{ isFavorited ? '★' : '☆' }}
          </text>
        </view>
        <view class="recipe-detail-page__nav-btn" @click="handleShare">
          <text class="recipe-detail-page__nav-icon">↗</text>
        </view>
      </view>
    </view>
    
    <!-- 内容区 -->
    <scroll-view
      scroll-y
      class="recipe-detail-page__scroll"
      :scroll-top="scrollTop"
      @scroll="onScroll"
    >
      <!-- 封面区域（沉浸式大图） -->
      <view class="recipe-detail-page__cover">
        <image
          class="recipe-detail-page__cover-image"
          :src="recipe.coverImage || defaultImage"
          mode="aspectFill"
          @click="previewImage"
        />
        <view class="recipe-detail-page__cover-overlay">
          <view class="recipe-detail-page__cover-info">
            <text class="recipe-detail-page__cover-title">{{ recipe.name }}</text>
            <view class="recipe-detail-page__cover-meta">
              <view class="recipe-detail-page__cover-rating">
                <text class="recipe-detail-page__cover-star">★</text>
                <text class="recipe-detail-page__cover-score">{{ recipe.rating || '4.8' }}</text>
              </view>
              <text class="recipe-detail-page__cover-count">{{ recipe.favoriteCount || 0 }}人收藏</text>
            </view>
          </view>
        </view>
      </view>
      
      <!-- 配方信息 -->
      <view class="recipe-detail-page__info">
        <text class="recipe-detail-page__name">{{ recipe.name }}</text>
        <view class="recipe-detail-page__meta">
          <view class="recipe-detail-page__rating">
            <text class="recipe-detail-page__rating-star">★</text>
            <text class="recipe-detail-page__rating-score">{{ recipe.rating || '4.8' }}</text>
            <text class="recipe-detail-page__rating-count">({{ recipe.commentCount || 0 }}人评价)</text>
          </view>
          <view class="recipe-detail-page__difficulty">
            <text class="recipe-detail-page__difficulty-label">难度：</text>
            <text class="recipe-detail-page__difficulty-value">{{ recipe.difficulty || '简单' }}</text>
          </view>
        </view>
        <view v-if="recipe.tags && recipe.tags.length" class="recipe-detail-page__tags">
          <text
            v-for="(tag, index) in recipe.tags"
            :key="index"
            class="recipe-detail-page__tag"
          >{{ tag }}</text>
        </view>
      </view>
      
      <!-- 营养价值 -->
      <view class="recipe-detail-page__nutrition">
        <view class="recipe-detail-page__nutrition-item">
          <text class="recipe-detail-page__nutrition-value">{{ recipe.calories || 120 }}</text>
          <text class="recipe-detail-page__nutrition-unit">kcal</text>
          <text class="recipe-detail-page__nutrition-label">热量</text>
        </view>
        <view class="recipe-detail-page__nutrition-divider"></view>
        <view class="recipe-detail-page__nutrition-item">
          <text class="recipe-detail-page__nutrition-value">{{ recipe.protein || 3 }}</text>
          <text class="recipe-detail-page__nutrition-unit">g</text>
          <text class="recipe-detail-page__nutrition-label">蛋白质</text>
        </view>
        <view class="recipe-detail-page__nutrition-divider"></view>
        <view class="recipe-detail-page__nutrition-item">
          <text class="recipe-detail-page__nutrition-value">{{ recipe.fat || 2 }}</text>
          <text class="recipe-detail-page__nutrition-unit">g</text>
          <text class="recipe-detail-page__nutrition-label">脂肪</text>
        </view>
        <view class="recipe-detail-page__nutrition-divider"></view>
        <view class="recipe-detail-page__nutrition-item">
          <text class="recipe-detail-page__nutrition-value">{{ recipe.carbs || 25 }}</text>
          <text class="recipe-detail-page__nutrition-unit">g</text>
          <text class="recipe-detail-page__nutrition-label">碳水</text>
        </view>
      </view>
      
      <!-- 食材清单 -->
      <view class="recipe-detail-page__section">
        <view class="recipe-detail-page__section-header">
          <view class="recipe-detail-page__section-title">
            <text class="recipe-detail-page__section-icon">📋</text>
            {{ $t('recipe.ingredients') }}
            <text class="recipe-detail-page__section-subtitle">({{ recipe.servings || 3 }}人份)</text>
          </view>
          <text class="recipe-detail-page__section-action" @click="toggleIngredients">
            {{ showAllIngredients ? $t('common.collapse') : $t('common.expand') }}
          </text>
        </view>
        <view class="recipe-detail-page__ingredients">
          <view
            v-for="(item, index) in displayedIngredients"
            :key="index"
            class="recipe-detail-page__ingredient"
          >
            <image
              class="recipe-detail-page__ingredient-image"
              :src="item.image || defaultIngredientImage"
              mode="aspectFill"
            />
            <view class="recipe-detail-page__ingredient-info">
              <text class="recipe-detail-page__ingredient-name">{{ item.name }}</text>
              <text class="recipe-detail-page__ingredient-amount">{{ item.amount }}</text>
            </view>
            <text v-if="item.remark" class="recipe-detail-page__ingredient-remark">{{ item.remark }}</text>
          </view>
        </view>
        <view class="recipe-detail-page__buy-btn" @click="goToBuyIngredients">
          <text class="recipe-detail-page__buy-btn-text">{{ $t('recipe.buyIngredients') }}</text>
        </view>
      </view>
      
      <!-- 制作步骤 -->
      <view class="recipe-detail-page__section">
        <view class="recipe-detail-page__section-header">
          <view class="recipe-detail-page__section-title">
            <text class="recipe-detail-page__section-icon">📝</text>
            {{ $t('recipe.steps') }}
          </view>
        </view>
        <view class="recipe-detail-page__steps">
          <view
            v-for="(step, index) in recipe.steps"
            :key="index"
            class="recipe-detail-page__step"
          >
            <view class="recipe-detail-page__step-number">{{ index + 1 }}</view>
            <view class="recipe-detail-page__step-content">
              <text class="recipe-detail-page__step-desc">{{ step.description }}</text>
              <image
                v-if="step.image"
                class="recipe-detail-page__step-image"
                :src="step.image"
                mode="widthFix"
                @click="previewStepImage(step.image)"
              />
            </view>
          </view>
        </view>
      </view>
      
      <!-- 用户评论 -->
      <view class="recipe-detail-page__section">
        <view class="recipe-detail-page__section-header">
          <view class="recipe-detail-page__section-title">
            <text class="recipe-detail-page__section-icon">💬</text>
            {{ $t('recipe.comments') }}
            <text class="recipe-detail-page__section-count">({{ recipe.commentCount || 0 }})</text>
          </view>
          <text class="recipe-detail-page__section-action" @click="goToAllComments">
            {{ $t('common.viewAll') }}
          </text>
        </view>
        <view class="recipe-detail-page__comments">
          <view
            v-for="(comment, index) in comments.slice(0, 3)"
            :key="index"
            class="recipe-detail-page__comment"
          >
            <image
              class="recipe-detail-page__comment-avatar"
              :src="comment.userAvatar || defaultAvatar"
              mode="aspectFill"
            />
            <view class="recipe-detail-page__comment-content">
              <view class="recipe-detail-page__comment-header">
                <text class="recipe-detail-page__comment-name">{{ comment.userName }}</text>
                <view class="recipe-detail-page__comment-rating">
                  <text v-for="n in (comment.rating || 5)" :key="n" class="recipe-detail-page__comment-star">★</text>
                </view>
              </view>
              <text class="recipe-detail-page__comment-text">{{ comment.content }}</text>
              <text class="recipe-detail-page__comment-time">{{ comment.createTime }}</text>
            </view>
          </view>
        </view>
      </view>
      
      <!-- 相关推荐 -->
      <view class="recipe-detail-page__section">
        <view class="recipe-detail-page__section-header">
          <view class="recipe-detail-page__section-title">
            <text class="recipe-detail-page__section-icon">📖</text>
            {{ $t('recipe.related') }}
          </view>
        </view>
        <scroll-view scroll-x class="recipe-detail-page__related-scroll" show-scrollbar="false">
          <view class="recipe-detail-page__related-list">
            <recipe-card-horizontal
              v-for="item in relatedRecipes"
              :key="item.id"
              :recipe="item"
              @click="goToRecipeDetail"
            />
          </view>
        </scroll-view>
      </view>
      
      <!-- 底部免责声明 -->
      <hd-disclaimer class="recipe-detail-page__disclaimer" />
      
      <!-- 底部占位（为底部操作栏留空间） -->
      <view class="recipe-detail-page__footer-placeholder"></view>
    </scroll-view>
    
    <!-- 底部操作栏 -->
    <view class="recipe-detail-page__footer">
      <view class="recipe-detail-page__footer-actions">
        <view class="recipe-detail-page__footer-action" @click="toggleFavorite">
          <text class="recipe-detail-page__footer-action-icon" :class="{ 'is-active': isFavorited }">
            {{ isFavorited ? '★' : '☆' }}
          </text>
          <text class="recipe-detail-page__footer-action-text">{{ $t('recipe.favorite') }}</text>
        </view>
        <view class="recipe-detail-page__footer-action" @click="showCommentInput">
          <text class="recipe-detail-page__footer-action-icon">💬</text>
          <text class="recipe-detail-page__footer-action-text">{{ $t('recipe.comment') }}</text>
        </view>
      </view>
      <view class="recipe-detail-page__footer-btn" @click="showCommentInput">
        <text class="recipe-detail-page__footer-btn-text">{{ $t('comment.write') }}</text>
      </view>
    </view>
  </view>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import { useI18n } from 'vue-i18n'
import Taro from '@tarojs/taro'
import HdDisclaimer from '@/components/common/HdDisclaimer.vue'
import RecipeCardHorizontal from '@/components/business/RecipeCardHorizontal.vue'
import { getRecipeDetail, getRecipeComments, getRelatedRecipes } from '@/api/recipe'
import { useUserStore } from '@/stores/user'

const { t: $t } = useI18n()
const userStore = useUserStore()

// 页面参数
const recipeId = ref<number>(0)

// 数据
const recipe = ref<any>({
  name: '红枣银耳莲子羹',
  coverImage: '/assets/images/recipes/hongzao-yiner.jpg',
  rating: 4.9,
  commentCount: 128,
  favoriteCount: 1200,
  difficulty: '简单',
  servings: 3,
  tags: ['滋阴润燥', '养颜美容', '秋季推荐'],
  calories: 120,
  protein: 3,
  fat: 2,
  carbs: 25,
  ingredients: [
    { name: '银耳', amount: '20g', remark: '干', image: '/assets/images/ingredients/yiner.png' },
    { name: '红枣', amount: '10颗', remark: '去核', image: '/assets/images/ingredients/hongzao.png' },
    { name: '莲子', amount: '15g', remark: '去芯', image: '/assets/images/ingredients/lianzi.png' },
    { name: '冰糖', amount: '适量', remark: '根据个人口味', image: '/assets/images/ingredients/bingtang.png' },
    { name: '枸杞', amount: '10g', remark: '', image: '/assets/images/ingredients/gouqi.png' }
  ],
  steps: [
    { description: '银耳提前2小时用冷水泡发，泡发后撕成小朵，去除根部硬蒂。', image: '/assets/images/steps/step1.jpg' },
    { description: '红枣洗净去核，莲子洗净去芯，枸杞用清水冲洗备用。', image: '/assets/images/steps/step2.jpg' },
    { description: '将银耳放入锅中，加入适量清水，大火煮沸后转小火炖煮30分钟。', image: '/assets/images/steps/step3.jpg' },
    { description: '加入红枣、莲子继续炖煮20分钟，至银耳出胶、莲子软烂。', image: '/assets/images/steps/step4.jpg' },
    { description: '最后加入冰糖和枸杞，煮5分钟即可关火。', image: '/assets/images/steps/step5.jpg' }
  ]
})
const comments = ref<any[]>([
  {
    userName: '养生达人',
    userAvatar: '/assets/images/avatars/user1.png',
    rating: 5,
    content: '真的很好喝，坚持喝了两周，感觉皮肤都变好了！推荐给姐妹们。',
    createTime: '2天前'
  },
  {
    userName: '美食爱好者',
    userAvatar: '/assets/images/avatars/user2.png',
    rating: 5,
    content: '做法简单，味道清甜，老人小孩都爱喝。',
    createTime: '5天前'
  },
  {
    userName: '健康生活',
    userAvatar: '/assets/images/avatars/user3.png',
    rating: 4,
    content: '不错，就是银耳要炖久一点才会出胶。',
    createTime: '1周前'
  }
])
const relatedRecipes = ref<any[]>([
  { id: 2, name: '山药薏米粥', coverImage: '/assets/images/recipes/shanyao-yimi.jpg', rating: 4.8, tags: ['健脾祛湿'] },
  { id: 3, name: '枸杞菊花茶', coverImage: '/assets/images/recipes/gouqi-juhua.jpg', rating: 4.7, tags: ['养肝明目'] },
  { id: 4, name: '当归红枣乌鸡汤', coverImage: '/assets/images/recipes/danggui-wuji.jpg', rating: 4.9, tags: ['补气养血'] }
])
const isFavorited = ref(false)
const showAllIngredients = ref(false)
const navVisible = ref(false)
const scrollTop = ref(0)

const defaultImage = '/assets/images/recipe-default.png'
const defaultIngredientImage = '/assets/images/ingredient-default.png'
const defaultAvatar = '/assets/images/avatar-default.png'

// 显示的食材
const displayedIngredients = computed(() => {
  if (!recipe.value.ingredients) return []
  if (showAllIngredients.value) {
    return recipe.value.ingredients
  }
  return recipe.value.ingredients.slice(0, 5)
})

// 获取配方详情
const fetchRecipeDetail = async (id: number) => {
  try {
    const res = await getRecipeDetail(id)
    if (res.data) {
      recipe.value = { ...recipe.value, ...res.data }
      isFavorited.value = res.data?.isFavorited || false
    }
  } catch (error) {
    console.error('获取配方详情失败', error)
  }
}

// 获取评论
const fetchComments = async (id: number) => {
  try {
    const res = await getRecipeComments(id, { page: 1, size: 10 })
    if (res.data?.list) {
      comments.value = res.data.list
    }
  } catch (error) {
    console.error('获取评论失败', error)
  }
}

// 获取相关推荐
const fetchRelatedRecipes = async (id: number) => {
  try {
    const res = await getRelatedRecipes(id)
    if (res.data) {
      relatedRecipes.value = res.data
    }
  } catch (error) {
    console.error('获取相关推荐失败', error)
  }
}

// 滚动监听
const onScroll = (e: any) => {
  const scrollY = e.detail.scrollTop
  navVisible.value = scrollY > 200
}

// 返回
const handleBack = () => {
  Taro.navigateBack()
}

// 收藏
const toggleFavorite = async () => {
  if (!userStore.isLoggedIn) {
    Taro.navigateTo({ url: '/pages/login/index' })
    return
  }
  
  try {
    isFavorited.value = !isFavorited.value
    Taro.showToast({
      title: isFavorited.value ? $t('recipe.favorited') : $t('recipe.cancelFavorite'),
      icon: 'success'
    })
  } catch (error) {
    console.error('收藏失败', error)
  }
}

// 分享
const handleShare = () => {
  Taro.showShareMenu({
    withShareTicket: true,
    menus: ['shareAppMessage', 'shareTimeline']
  })
}

// 展开/收起食材
const toggleIngredients = () => {
  showAllIngredients.value = !showAllIngredients.value
}

// 购买食材
const goToBuyIngredients = () => {
  Taro.showToast({
    title: '功能开发中',
    icon: 'none'
  })
}

// 预览图片
const previewImage = () => {
  if (recipe.value.coverImage) {
    Taro.previewImage({
      urls: [recipe.value.coverImage]
    })
  }
}

// 预览步骤图片
const previewStepImage = (url: string) => {
  Taro.previewImage({
    urls: [url]
  })
}

// 查看全部评论
const goToAllComments = () => {
  Taro.navigateTo({
    url: `/pages/recipe/comments/index?id=${recipeId.value}`
  })
}

// 显示评论输入
const showCommentInput = () => {
  if (!userStore.isLoggedIn) {
    Taro.navigateTo({ url: '/pages/login/index' })
    return
  }
  // TODO: 显示评论输入框
  Taro.showToast({
    title: '评论功能开发中',
    icon: 'none'
  })
}

// 跳转配方详情
const goToRecipeDetail = (id: number) => {
  Taro.navigateTo({
    url: `/pages/recipe/detail/index?id=${id}`
  })
}

onMounted(() => {
  const instance = Taro.getCurrentInstance()
  const id = instance.router?.params?.id
  if (id) {
    recipeId.value = parseInt(id)
    fetchRecipeDetail(recipeId.value)
    fetchComments(recipeId.value)
    fetchRelatedRecipes(recipeId.value)
  }
})
</script>

<style lang="scss">
@import '@/styles/variables.scss';

.recipe-detail-page {
  min-height: 100vh;
  background: $bg-page;
  display: flex;
  flex-direction: column;
  
  // 导航栏
  &__nav {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    height: $nav-height;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 $spacing-md;
    background: transparent;
    z-index: 100;
    transition: background $duration-normal $ease-standard;
    
    &--visible {
      background: rgba(255, 255, 255, 0.95);
      backdrop-filter: blur(10px);
      box-shadow: $shadow-level-1;
      
      .recipe-detail-page__nav-title,
      .recipe-detail-page__nav-icon {
        color: $text-primary;
      }
    }
    
    &-back {
      width: 36px;
      height: 36px;
      display: flex;
      align-items: center;
      justify-content: center;
      background: rgba(0, 0, 0, 0.3);
      border-radius: 50%;
    }
    
    &-title {
      font-size: $font-size-lg;
      font-weight: $font-weight-medium;
      color: transparent;
    }
    
    &-actions {
      display: flex;
      gap: $spacing-xs;
    }
    
    &-btn {
      width: 36px;
      height: 36px;
      display: flex;
      align-items: center;
      justify-content: center;
      background: rgba(0, 0, 0, 0.3);
      border-radius: 50%;
    }
    
    &-icon {
      font-size: 20px;
      color: #fff;
      
      &.is-active {
        color: $accent-orange;
      }
    }
  }
  
  &__scroll {
    flex: 1;
  }
  
  // 封面区域（沉浸式大图）
  &__cover {
    position: relative;
    width: 100%;
    height: 320px;
    overflow: hidden;
    
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
      background: linear-gradient(to top, rgba(0,0,0,0.7), transparent);
    }
    
    &-info {
      display: flex;
      flex-direction: column;
      gap: $spacing-xs;
    }
    
    &-title {
      font-size: $font-size-xl;
      font-weight: $font-weight-bold;
      color: #fff;
    }
    
    &-meta {
      display: flex;
      align-items: center;
      gap: $spacing-md;
    }
    
    &-rating {
      display: flex;
      align-items: center;
      gap: $spacing-xs;
    }
    
    &-star {
      color: $accent-orange;
      font-size: $font-size-sm;
    }
    
    &-score {
      font-size: $font-size-md;
      font-weight: $font-weight-medium;
      color: $accent-orange;
    }
    
    &-count {
      font-size: $font-size-sm;
      color: rgba(255,255,255,0.8);
    }
  }
  
  // 配方信息
  &__info {
    background: $bg-card;
    padding: $spacing-lg;
    margin-bottom: $spacing-sm;
  }
  
  &__name {
    font-size: $font-size-xl;
    font-weight: $font-weight-bold;
    color: $text-primary;
    margin-bottom: $spacing-md;
    display: block;
  }
  
  &__meta {
    display: flex;
    align-items: center;
    gap: $spacing-lg;
    margin-bottom: $spacing-md;
  }
  
  &__rating {
    display: flex;
    align-items: center;
    gap: $spacing-xs;
    
    &-star {
      color: $accent-orange;
      font-size: $font-size-sm;
    }
    
    &-score {
      font-size: $font-size-md;
      font-weight: $font-weight-medium;
      color: $accent-orange;
      font-family: $font-family-number;
    }
    
    &-count {
      font-size: $font-size-sm;
      color: $text-tertiary;
    }
  }
  
  &__difficulty {
    display: flex;
    align-items: center;
    
    &-label {
      font-size: $font-size-sm;
      color: $text-secondary;
    }
    
    &-value {
      font-size: $font-size-sm;
      color: $brand-primary;
    }
  }
  
  &__tags {
    display: flex;
    flex-wrap: wrap;
    gap: $spacing-sm;
  }
  
  &__tag {
    display: inline-flex;
    align-items: center;
    padding: 6px 12px;
    border-radius: $radius-full;
    font-size: $font-size-xs;
    background: $brand-primary-10;
    color: $brand-primary;
  }
  
  // 营养价值
  &__nutrition {
    display: flex;
    align-items: center;
    justify-content: space-around;
    background: $bg-card;
    padding: $spacing-lg;
    margin-bottom: $spacing-sm;
    
    &-item {
      display: flex;
      flex-direction: column;
      align-items: center;
      gap: 2px;
    }
    
    &-value {
      font-size: $font-size-xl;
      font-weight: $font-weight-bold;
      color: $brand-primary;
      font-family: $font-family-number;
    }
    
    &-unit {
      font-size: $font-size-xs;
      color: $brand-primary;
      margin-top: -4px;
    }
    
    &-label {
      font-size: $font-size-xs;
      color: $text-tertiary;
      margin-top: $spacing-xs;
    }
    
    &-divider {
      width: 1px;
      height: 40px;
      background: $border-color;
    }
  }
  
  // 区块样式
  &__section {
    background: $bg-card;
    margin-bottom: $spacing-sm;
    padding: $spacing-lg;
    
    &-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: $spacing-lg;
    }
    
    &-title {
      display: flex;
      align-items: center;
      gap: $spacing-xs;
      font-size: $font-size-lg;
      font-weight: $font-weight-bold;
      color: $text-primary;
    }
    
    &-icon {
      font-size: $font-size-md;
    }
    
    &-subtitle {
      font-size: $font-size-sm;
      font-weight: $font-weight-normal;
      color: $text-tertiary;
      margin-left: $spacing-xs;
    }
    
    &-count {
      font-size: $font-size-sm;
      font-weight: $font-weight-normal;
      color: $text-tertiary;
      margin-left: $spacing-xs;
    }
    
    &-action {
      font-size: $font-size-sm;
      color: $brand-primary;
    }
  }
  
  // 食材清单
  &__ingredients {
    display: flex;
    flex-direction: column;
    gap: $spacing-md;
    margin-bottom: $spacing-lg;
  }
  
  &__ingredient {
    display: flex;
    align-items: center;
    gap: $spacing-md;
    padding-bottom: $spacing-md;
    border-bottom: 1px solid $border-color;
    
    &:last-child {
      border-bottom: none;
      padding-bottom: 0;
    }
    
    &-image {
      width: 48px;
      height: 48px;
      border-radius: $radius-md;
      background: $bg-hover;
    }
    
    &-info {
      flex: 1;
      display: flex;
      flex-direction: column;
      gap: 2px;
    }
    
    &-name {
      font-size: $font-size-base;
      font-weight: $font-weight-medium;
      color: $text-primary;
    }
    
    &-amount {
      font-size: $font-size-sm;
      color: $text-secondary;
    }
    
    &-remark {
      font-size: $font-size-xs;
      color: $text-tertiary;
    }
  }
  
  &__buy-btn {
    height: $btn-height-md;
    background: $brand-primary-10;
    border-radius: $radius-full;
    display: flex;
    align-items: center;
    justify-content: center;
    
    &-text {
      font-size: $font-size-base;
      font-weight: $font-weight-medium;
      color: $brand-primary;
    }
    
    &:active {
      background: $brand-primary-20;
    }
  }
  
  // 制作步骤
  &__steps {
    display: flex;
    flex-direction: column;
    gap: $spacing-lg;
  }
  
  &__step {
    display: flex;
    gap: $spacing-md;
    
    &-number {
      width: 28px;
      height: 28px;
      background: $brand-primary;
      color: #fff;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: $font-size-sm;
      font-weight: $font-weight-bold;
      flex-shrink: 0;
    }
    
    &-content {
      flex: 1;
    }
    
    &-desc {
      font-size: $font-size-base;
      color: $text-primary;
      line-height: $line-height-normal;
      display: block;
      margin-bottom: $spacing-sm;
    }
    
    &-image {
      width: 100%;
      border-radius: $radius-md;
    }
  }
  
  // 用户评论
  &__comments {
    display: flex;
    flex-direction: column;
    gap: $spacing-lg;
  }
  
  &__comment {
    display: flex;
    gap: $spacing-md;
    
    &-avatar {
      width: 40px;
      height: 40px;
      border-radius: 50%;
      background: $bg-hover;
      flex-shrink: 0;
    }
    
    &-content {
      flex: 1;
    }
    
    &-header {
      display: flex;
      align-items: center;
      justify-content: space-between;
      margin-bottom: $spacing-xs;
    }
    
    &-name {
      font-size: $font-size-sm;
      font-weight: $font-weight-medium;
      color: $text-primary;
    }
    
    &-rating {
      display: flex;
      gap: 1px;
    }
    
    &-star {
      font-size: 10px;
      color: $accent-orange;
    }
    
    &-text {
      font-size: $font-size-base;
      color: $text-primary;
      line-height: $line-height-normal;
      margin-bottom: $spacing-xs;
      display: block;
    }
    
    &-time {
      font-size: $font-size-xs;
      color: $text-tertiary;
    }
  }
  
  // 相关推荐
  &__related-scroll {
    white-space: nowrap;
  }
  
  &__related-list {
    display: flex;
    gap: $spacing-md;
    padding-bottom: $spacing-xs;
  }
  
  // 免责声明
  &__disclaimer {
    margin: 0 $spacing-lg $spacing-lg;
  }
  
  &__footer-placeholder {
    height: 80px;
  }
  
  // 底部操作栏
  &__footer {
    position: fixed;
    bottom: 0;
    left: 0;
    right: 0;
    height: 64px;
    background: $bg-card;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 $spacing-lg;
    padding-bottom: env(safe-area-inset-bottom);
    box-shadow: 0 -2px 10px rgba(0, 0, 0, 0.05);
    z-index: 100;
    
    &-actions {
      display: flex;
      gap: $spacing-lg;
    }
    
    &-action {
      display: flex;
      flex-direction: column;
      align-items: center;
      gap: 2px;
      min-width: 48px;
      
      &-icon {
        font-size: 24px;
        color: $text-tertiary;
        
        &.is-active {
          color: $accent-orange;
        }
      }
      
      &-text {
        font-size: 10px;
        color: $text-tertiary;
      }
    }
    
    &-btn {
      flex: 1;
      max-width: 200px;
      height: 44px;
      background: $brand-primary;
      border-radius: $radius-full;
      display: flex;
      align-items: center;
      justify-content: center;
      margin-left: $spacing-lg;
      box-shadow: $shadow-brand;
      
      &-text {
        font-size: $font-size-base;
        font-weight: $font-weight-medium;
        color: #fff;
      }
      
      &:active {
        background: $brand-dark;
        transform: scale(0.98);
      }
    }
  }
}
</style>
