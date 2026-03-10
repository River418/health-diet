<template>
  <view class="recipe-detail-page">
    <!-- 顶部免责声明 -->
    <hd-disclaimer v-if="showTopDisclaimer" class="recipe-detail-page__top-disclaimer" />
    
    <!-- 导航栏 -->
    <view class="recipe-detail-page__nav" :class="{ 'recipe-detail-page__nav--visible': navVisible }">
      <text class="recipe-detail-page__nav-back" @click="handleBack">⌫</text>
      <text class="recipe-detail-page__nav-title">{{ $t('recipe.detail') }}</text>
      <view class="recipe-detail-page__nav-actions">
        <text class="recipe-detail-page__nav-icon" @click="toggleFavorite">
          {{ isFavorited ? '★' : '☆' }}
        </text>
        <text class="recipe-detail-page__nav-icon" @click="handleShare">↗</text>
      </view>
    </view>
    
    <!-- 内容区 -->
    <scroll-view
      scroll-y
      class="recipe-detail-page__scroll"
      :scroll-top="scrollTop"
      @scroll="onScroll"
    >
      <!-- 封面区域 -->
      <view class="recipe-detail-page__cover">
        <image
          class="recipe-detail-page__cover-image"
          :src="recipe.coverImage || defaultImage"
          mode="aspectFill"
          @click="previewImage"
        />
        <view v-if="recipe.videoUrl" class="recipe-detail-page__cover-play" @click="playVideo">
          <text class="recipe-detail-page__cover-play-icon">▶</text>
        </view>
      </view>
      
      <!-- 配方信息 -->
      <view class="recipe-detail-page__info">
        <text class="recipe-detail-page__name">{{ recipe.name }}</text>
        <view class="recipe-detail-page__meta">
          <text class="recipe-detail-page__rating">
            <text class="recipe-detail-page__rating-star">⭐</text>
            {{ recipe.rating || '4.8' }}
            <text class="recipe-detail-page__rating-count">({{ recipe.commentCount || 0 }}人评价)</text>
          </text>
          <text class="recipe-detail-page__favorite">❤️ {{ recipe.favoriteCount || 0 }}</text>
        </view>
        <view v-if="recipe.tags && recipe.tags.length" class="recipe-detail-page__tags">
          <hd-tag
            v-for="(tag, index) in recipe.tags"
            :key="index"
            :text="tag"
            type="secondary"
            size="medium"
          />
        </view>
      </view>
      
      <!-- 食材清单 -->
      <view class="recipe-detail-page__section">
        <view class="recipe-detail-page__section-header">
          <text class="recipe-detail-page__section-title">📋 {{ $t('recipe.ingredients') }}</text>
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
              <text v-if="showAllIngredients && item.effect" class="recipe-detail-page__ingredient-effect">
                {{ item.effect }}
              </text>
            </view>
          </view>
        </view>
      </view>
      
      <!-- 制作步骤 -->
      <view class="recipe-detail-page__section">
        <view class="recipe-detail-page__section-header">
          <text class="recipe-detail-page__section-title">📝 {{ $t('recipe.steps') }}</text>
        </view>
        <view class="recipe-detail-page__steps">
          <view
            v-for="(step, index) in recipe.steps"
            :key="index"
            class="recipe-detail-page__step"
          >
            <view class="recipe-detail-page__step-number">{{ index + 1 }}</view>
            <view class="recipe-detail-page__step-content">
              <text class="recipe-detail-page__step-title">{{ step.title }}</text>
              <image
                v-if="step.image"
                class="recipe-detail-page__step-image"
                :src="step.image"
                mode="widthFix"
                @click="previewStepImage(step.image)"
              />
              <text class="recipe-detail-page__step-desc">{{ step.description }}</text>
            </view>
          </view>
        </view>
      </view>
      
      <!-- 视频教程 -->
      <view v-if="recipe.videoUrl" class="recipe-detail-page__section">
        <view class="recipe-detail-page__section-header">
          <text class="recipe-detail-page__section-title">🎬 {{ $t('recipe.video') }}</text>
        </view>
        <view class="recipe-detail-page__video">
          <video
            class="recipe-detail-page__video-player"
            :src="recipe.videoUrl"
            :poster="recipe.coverImage"
            controls
            object-fit="cover"
          />
        </view>
      </view>
      
      <!-- 用户评论 -->
      <view class="recipe-detail-page__section">
        <view class="recipe-detail-page__section-header">
          <text class="recipe-detail-page__section-title">💬 {{ $t('recipe.comments') }}</text>
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
                <text class="recipe-detail-page__comment-rating">{{ '⭐'.repeat(comment.rating || 5) }}</text>
              </view>
              <text class="recipe-detail-page__comment-text">{{ comment.content }}</text>
              <text class="recipe-detail-page__comment-time">{{ comment.createTime }}</text>
            </view>
          </view>
        </view>
        <view v-if="comments.length > 3" class="recipe-detail-page__view-all" @click="goToAllComments">
          <text class="recipe-detail-page__view-all-text">
            {{ $t('recipe.viewAllComments', { count: recipe.commentCount }) }}
          </text>
        </view>
      </view>
      
      <!-- 相关推荐 -->
      <view class="recipe-detail-page__section">
        <view class="recipe-detail-page__section-header">
          <text class="recipe-detail-page__section-title">📖 {{ $t('recipe.related') }}</text>
        </view>
        <view class="recipe-detail-page__related">
          <recipe-card
            v-for="item in relatedRecipes"
            :key="item.id"
            :recipe="item"
            @click="goToRecipeDetail"
          />
        </view>
      </view>
      
      <!-- 底部免责声明 -->
      <hd-disclaimer class="recipe-detail-page__bottom-disclaimer" />
    </scroll-view>
    
    <!-- 底部操作栏 -->
    <view class="recipe-detail-page__footer">
      <view class="recipe-detail-page__footer-comment" @click="showCommentInput">
        <text class="recipe-detail-page__footer-comment-icon">✏️</text>
        <text class="recipe-detail-page__footer-comment-text">{{ $t('comment.write') }}</text>
      </view>
      <view class="recipe-detail-page__footer-actions">
        <view class="recipe-detail-page__footer-action" @click="toggleFavorite">
          <text class="recipe-detail-page__footer-action-icon" :class="{ 'is-active': isFavorited }">
            {{ isFavorited ? '★' : '☆' }}
          </text>
          <text class="recipe-detail-page__footer-action-text">{{ $t('recipe.favorite') }}</text>
        </view>
        <view class="recipe-detail-page__footer-action" @click="handleShare">
          <text class="recipe-detail-page__footer-action-icon">↗</text>
          <text class="recipe-detail-page__footer-action-text">{{ $t('recipe.share') }}</text>
        </view>
      </view>
    </view>
  </view>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import { useI18n } from 'vue-i18n'
import Taro from '@tarojs/taro'
import HdTag from '@/components/common/HdTag.vue'
import HdDisclaimer from '@/components/common/HdDisclaimer.vue'
import RecipeCard from '@/components/business/RecipeCard.vue'
import { getRecipeDetail, getRecipeComments, getRelatedRecipes } from '@/api/recipe'
import { useUserStore } from '@/store/user'

const { t: $t } = useI18n()
const userStore = useUserStore()

// 页面参数
const recipeId = ref<number>(0)

// 数据
const recipe = ref<any>({})
const comments = ref<any[]>([])
const relatedRecipes = ref<any[]>([])
const isFavorited = ref(false)
const showAllIngredients = ref(false)
const showTopDisclaimer = ref(true)
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
    recipe.value = res.data || {}
    isFavorited.value = res.data?.isFavorited || false
  } catch (error) {
    console.error('获取配方详情失败', error)
    Taro.showToast({
      title: $t('error.server'),
      icon: 'none'
    })
  }
}

// 获取评论
const fetchComments = async (id: number) => {
  try {
    const res = await getRecipeComments(id, { page: 1, size: 10 })
    comments.value = res.data?.list || []
  } catch (error) {
    console.error('获取评论失败', error)
  }
}

// 获取相关推荐
const fetchRelatedRecipes = async (id: number) => {
  try {
    const res = await getRelatedRecipes(id)
    relatedRecipes.value = res.data || []
  } catch (error) {
    console.error('获取相关推荐失败', error)
  }
}

// 滚动监听
const onScroll = (e: any) => {
  const scrollY = e.detail.scrollTop
  navVisible.value = scrollY > 200
  showTopDisclaimer.value = scrollY < 100
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
    // TODO: 调用收藏API
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
  // TODO: 调用分享API
}

// 展开/收起食材
const toggleIngredients = () => {
  showAllIngredients.value = !showAllIngredients.value
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

// 播放视频
const playVideo = () => {
  // 视频已在video组件中处理
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
  background: $bg-gray;
  display: flex;
  flex-direction: column;
  
  &__top-disclaimer {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    z-index: 101;
  }
  
  &__nav {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    height: 44px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 16px;
    background: transparent;
    z-index: 100;
    transition: background 0.3s;
    
    &--visible {
      background: #fff;
      box-shadow: 0 1px 0 $bg-divider;
      
      .recipe-detail-page__nav-title,
      .recipe-detail-page__nav-back,
      .recipe-detail-page__nav-icon {
        color: $text-primary;
      }
    }
    
    &-back,
    &-icon {
      font-size: 24px;
      color: #fff;
      padding: 8px;
    }
    
    &-title {
      font-size: 18px;
      font-weight: $font-weight-medium;
      color: transparent;
    }
    
    &-actions {
      display: flex;
      gap: 8px;
    }
  }
  
  &__scroll {
    flex: 1;
    padding-bottom: 56px;
  }
  
  &__cover {
    position: relative;
    width: 100%;
    padding-top: 56.25%;
    background: $bg-gray;
    
    &-image {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
    }
    
    &-play {
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      width: 64px;
      height: 64px;
      background: rgba(0, 0, 0, 0.6);
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      
      &-icon {
        color: #fff;
        font-size: 28px;
        margin-left: 4px;
      }
    }
  }
  
  &__info {
    background: #fff;
    padding: 16px;
    margin-bottom: 12px;
  }
  
  &__name {
    font-size: 22px;
    font-weight: $font-weight-bold;
    color: $text-primary;
    margin-bottom: 12px;
    display: block;
  }
  
  &__meta {
    display: flex;
    align-items: center;
    gap: 16px;
    margin-bottom: 12px;
  }
  
  &__rating {
    display: flex;
    align-items: center;
    gap: 4px;
    font-size: 16px;
    color: $accent-orange;
    
    &-star {
      font-size: 14px;
    }
    
    &-count {
      font-size: 13px;
      color: $text-tertiary;
    }
  }
  
  &__favorite {
    font-size: 13px;
    color: $text-tertiary;
  }
  
  &__tags {
    display: flex;
    flex-wrap: wrap;
    gap: 8px;
  }
  
  &__section {
    background: #fff;
    margin-bottom: 12px;
    padding: 16px;
    
    &-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 16px;
    }
    
    &-title {
      font-size: 18px;
      font-weight: $font-weight-medium;
      color: $text-primary;
    }
    
    &-action {
      font-size: 14px;
      color: $brand-primary;
    }
  }
  
  &__ingredients {
    display: flex;
    flex-direction: column;
    gap: 12px;
  }
  
  &__ingredient {
    display: flex;
    align-items: center;
    gap: 12px;
    padding-bottom: 12px;
    border-bottom: 1px solid $bg-divider;
    
    &:last-child {
      border-bottom: none;
      padding-bottom: 0;
    }
    
    &-image {
      width: 56px;
      height: 56px;
      border-radius: 8px;
      background: $bg-gray;
    }
    
    &-info {
      flex: 1;
      display: flex;
      flex-direction: column;
      gap: 4px;
    }
    
    &-name {
      font-size: 15px;
      font-weight: $font-weight-medium;
      color: $text-primary;
    }
    
    &-amount {
      font-size: 14px;
      color: $text-secondary;
    }
    
    &-effect {
      font-size: 12px;
      color: $text-tertiary;
    }
  }
  
  &__steps {
    display: flex;
    flex-direction: column;
    gap: 16px;
  }
  
  &__step {
    display: flex;
    gap: 12px;
    background: $bg-gray;
    border-radius: 12px;
    padding: 16px;
    
    &-number {
      width: 28px;
      height: 28px;
      background: $brand-primary;
      color: #fff;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 14px;
      font-weight: $font-weight-bold;
      flex-shrink: 0;
    }
    
    &-content {
      flex: 1;
    }
    
    &-title {
      font-size: 16px;
      font-weight: $font-weight-medium;
      color: $text-primary;
      margin-bottom: 8px;
      display: block;
    }
    
    &-image {
      width: 100%;
      border-radius: 8px;
      margin-bottom: 8px;
    }
    
    &-desc {
      font-size: 15px;
      color: $text-primary;
      line-height: 1.6;
    }
  }
  
  &__video {
    border-radius: 12px;
    overflow: hidden;
    
    &-player {
      width: 100%;
      height: 200px;
    }
  }
  
  &__comments {
    display: flex;
    flex-direction: column;
    gap: 16px;
  }
  
  &__comment {
    display: flex;
    gap: 12px;
    
    &-avatar {
      width: 40px;
      height: 40px;
      border-radius: 50%;
      background: $bg-gray;
    }
    
    &-content {
      flex: 1;
    }
    
    &-header {
      display: flex;
      align-items: center;
      gap: 8px;
      margin-bottom: 4px;
    }
    
    &-name {
      font-size: 14px;
      font-weight: $font-weight-medium;
      color: $text-primary;
    }
    
    &-rating {
      font-size: 12px;
    }
    
    &-text {
      font-size: 14px;
      color: $text-primary;
      line-height: 1.5;
      margin-bottom: 4px;
      display: block;
    }
    
    &-time {
      font-size: 12px;
      color: $text-tertiary;
    }
  }
  
  &__view-all {
    text-align: center;
    padding-top: 16px;
    border-top: 1px solid $bg-divider;
    margin-top: 16px;
    
    &-text {
      font-size: 14px;
      color: $text-tertiary;
    }
  }
  
  &__related {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 16px;
  }
  
  &__bottom-disclaimer {
    margin: 16px;
  }
  
  &__footer {
    position: fixed;
    bottom: 0;
    left: 0;
    right: 0;
    height: 56px;
    background: #fff;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 16px;
    box-shadow: 0 -1px 0 $bg-divider;
    z-index: 100;
    
    &-comment {
      flex: 1;
      height: 40px;
      background: $brand-primary;
      border-radius: 20px;
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 8px;
      margin-right: 16px;
      
      &-icon {
        font-size: 16px;
      }
      
      &-text {
        font-size: 14px;
        color: #fff;
      }
    }
    
    &-actions {
      display: flex;
      gap: 16px;
    }
    
    &-action {
      display: flex;
      flex-direction: column;
      align-items: center;
      gap: 4px;
      
      &-icon {
        font-size: 24px;
        color: $text-tertiary;
        
        &.is-active {
          color: $accent-orange;
        }
      }
      
      &-text {
        font-size: 11px;
        color: $text-tertiary;
      }
    }
  }
}
</style>
