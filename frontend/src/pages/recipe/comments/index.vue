<template>
  <view class="comments-page">
    <!-- 评论列表 -->
    <scroll-view
      scroll-y
      class="comments-page__scroll"
      :refresher-enabled="true"
      :refresher-triggered="refreshing"
      @refresherrefresh="onRefresh"
      @scrolltolower="onLoadMore"
    >
      <view v-if="loading && !comments.length" class="comments-page__loading">
        <hd-skeleton type="list" :rows="5" />
      </view>
      
      <view v-else-if="comments.length" class="comments-page__list">
        <view
          v-for="(comment, index) in comments"
          :key="index"
          class="comments-page__item"
        >
          <image
            class="comments-page__avatar"
            :src="comment.userAvatar || defaultAvatar"
            mode="aspectFill"
          />
          <view class="comments-page__content">
            <view class="comments-page__header">
              <text class="comments-page__name">{{ comment.userName }}</text>
              <text class="comments-page__rating">{{ '⭐'.repeat(comment.rating || 5) }}</text>
            </view>
            <text class="comments-page__text">{{ comment.content }}</text>
            <view v-if="comment.images && comment.images.length" class="comments-page__images">
              <image
                v-for="(img, imgIndex) in comment.images"
                :key="imgIndex"
                class="comments-page__image"
                :src="img"
                mode="aspectFill"
                @click="previewImage(comment.images, imgIndex)"
              />
            </view>
            <view class="comments-page__footer">
              <text class="comments-page__time">{{ comment.createTime }}</text>
              <view class="comments-page__actions">
                <text class="comments-page__action" @click="likeComment(comment)">
                  👍 {{ comment.likeCount || 0 }}
                </text>
                <text class="comments-page__action" @click="replyComment(comment)">
                  💬 回复
                </text>
              </view>
            </view>
          </view>
        </view>
      </view>
      
      <hd-empty
        v-else
        icon="💬"
        :title="$t('comment.noComments')"
      />
      
      <!-- 加载更多 -->
      <view v-if="loadingMore" class="comments-page__loading-more">
        <text class="comments-page__loading-text">{{ $t('common.loading') }}</text>
      </view>
      <view v-else-if="noMore && comments.length" class="comments-page__no-more">
        <text class="comments-page__no-more-text">{{ $t('common.noMore') }}</text>
      </view>
    </scroll-view>
    
    <!-- 底部输入栏 -->
    <view class="comments-page__footer-bar">
      <view class="comments-page__input-wrapper" @click="showCommentInput">
        <text class="comments-page__input-placeholder">{{ $t('comment.placeholder') }}</text>
      </view>
      <text class="comments-page__submit-btn" @click="showCommentInput">
        {{ $t('comment.submit') }}
      </text>
    </view>
  </view>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { useI18n } from 'vue-i18n'
import Taro from '@tarojs/taro'
import HdSkeleton from '@/components/common/HdSkeleton.vue'
import HdEmpty from '@/components/common/HdEmpty.vue'
import { getRecipeComments, submitComment } from '@/api/recipe'
import { useUserStore } from '@/store/user'

const { t: $t } = useI18n()
const userStore = useUserStore()

// 页面参数
const recipeId = ref<number>(0)

// 数据
const comments = ref<any[]>([])
const loading = ref(false)
const refreshing = ref(false)
const loadingMore = ref(false)
const noMore = ref(false)
const page = ref(1)
const defaultAvatar = '/assets/images/avatar-default.png'

// 获取评论列表
const fetchComments = async (isLoadMore = false) => {
  if (loading.value || loadingMore.value) return
  
  if (isLoadMore) {
    loadingMore.value = true
  } else {
    loading.value = true
  }
  
  try {
    const res = await getRecipeComments(recipeId.value, { page: page.value, size: 10 })
    const list = res.data?.list || []
    
    if (isLoadMore) {
      comments.value.push(...list)
    } else {
      comments.value = list
    }
    
    if (list.length < 10) {
      noMore.value = true
    }
  } catch (error) {
    console.error('获取评论失败', error)
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
  await fetchComments(false)
  refreshing.value = false
}

// 加载更多
const onLoadMore = () => {
  if (noMore.value) return
  page.value++
  fetchComments(true)
}

// 预览图片
const previewImage = (images: string[], current: number) => {
  Taro.previewImage({
    urls: images,
    current: images[current]
  })
}

// 点赞评论
const likeComment = (comment: any) => {
  if (!userStore.isLoggedIn) {
    Taro.navigateTo({ url: '/pages/login/index' })
    return
  }
  // TODO: 调用点赞API
  comment.likeCount = (comment.likeCount || 0) + 1
}

// 回复评论
const replyComment = (comment: any) => {
  if (!userStore.isLoggedIn) {
    Taro.navigateTo({ url: '/pages/login/index' })
    return
  }
  showCommentInput()
}

// 显示评论输入
const showCommentInput = () => {
  if (!userStore.isLoggedIn) {
    Taro.navigateTo({ url: '/pages/login/index' })
    return
  }
  
  Taro.showModal({
    title: $t('comment.write'),
    editable: true,
    placeholderText: $t('comment.placeholder'),
    success: async (res) => {
      if (res.confirm && res.content) {
        try {
          await submitComment(recipeId.value, { content: res.content, rating: 5 })
          Taro.showToast({
            title: $t('comment.submitSuccess'),
            icon: 'success'
          })
          onRefresh()
        } catch (error) {
          Taro.showToast({
            title: $t('error.server'),
            icon: 'none'
          })
        }
      }
    }
  })
}

onMounted(() => {
  const instance = Taro.getCurrentInstance()
  const id = instance.router?.params?.id
  if (id) {
    recipeId.value = parseInt(id)
    fetchComments()
  }
})
</script>

<style lang="scss">
@import '@/styles/variables.scss';

.comments-page {
  min-height: 100vh;
  background: $bg-gray;
  display: flex;
  flex-direction: column;
  
  &__scroll {
    flex: 1;
    padding-bottom: 56px;
  }
  
  &__loading {
    padding: 16px;
  }
  
  &__list {
    background: #fff;
  }
  
  &__item {
    display: flex;
    padding: 16px;
    border-bottom: 1px solid $bg-divider;
  }
  
  &__avatar {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    margin-right: 12px;
    background: $bg-gray;
  }
  
  &__content {
    flex: 1;
  }
  
  &__header {
    display: flex;
    align-items: center;
    gap: 8px;
    margin-bottom: 4px;
  }
  
  &__name {
    font-size: 14px;
    font-weight: $font-weight-medium;
    color: $text-primary;
  }
  
  &__rating {
    font-size: 12px;
  }
  
  &__text {
    font-size: 14px;
    color: $text-primary;
    line-height: 1.5;
    margin-bottom: 8px;
    display: block;
  }
  
  &__images {
    display: flex;
    gap: 8px;
    margin-bottom: 8px;
  }
  
  &__image {
    width: 80px;
    height: 80px;
    border-radius: 8px;
    background: $bg-gray;
  }
  
  &__footer {
    display: flex;
    justify-content: space-between;
    align-items: center;
  }
  
  &__time {
    font-size: 12px;
    color: $text-tertiary;
  }
  
  &__actions {
    display: flex;
    gap: 16px;
  }
  
  &__action {
    font-size: 12px;
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
  
  &__footer-bar {
    position: fixed;
    bottom: 0;
    left: 0;
    right: 0;
    height: 56px;
    background: #fff;
    display: flex;
    align-items: center;
    padding: 0 16px;
    gap: 12px;
    box-shadow: 0 -1px 0 $bg-divider;
  }
  
  &__input-wrapper {
    flex: 1;
    height: 40px;
    background: $bg-gray;
    border-radius: 20px;
    display: flex;
    align-items: center;
    padding: 0 16px;
  }
  
  &__input-placeholder {
    font-size: 14px;
    color: $text-tertiary;
  }
  
  &__submit-btn {
    font-size: 14px;
    color: $brand-primary;
    font-weight: $font-weight-medium;
  }
}
</style>
