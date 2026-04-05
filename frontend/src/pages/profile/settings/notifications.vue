<template>
  <view class="notifications-page" :class="fontLargeClass">
    <view class="notifications-page__section">
      <view class="notifications-page__list">
        <view class="notifications-page__list-item">
          <text class="notifications-page__list-text">接收推送通知</text>
          <switch
            class="notifications-page__list-switch"
            :checked="pushEnabled"
            color="#4CAF50"
            @change="togglePush"
          />
        </view>
        <view class="notifications-page__list-item">
          <text class="notifications-page__list-text">新配方推荐</text>
          <switch
            class="notifications-page__list-switch"
            :checked="recipeEnabled"
            color="#4CAF50"
            @change="toggleRecipe"
          />
        </view>
        <view class="notifications-page__list-item">
          <text class="notifications-page__list-text">评论回复</text>
          <switch
            class="notifications-page__list-switch"
            :checked="commentEnabled"
            color="#4CAF50"
            @change="toggleComment"
          />
        </view>
      </view>
    </view>
  </view>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import Taro from '@tarojs/taro'
import { usePageFontSize } from '@/composables'

const { fontLargeClass } = usePageFontSize()

const pushEnabled = ref(true)
const recipeEnabled = ref(true)
const commentEnabled = ref(true)

const togglePush = (e: any) => {
  pushEnabled.value = e.detail.value
  Taro.setStorageSync('pushEnabled', pushEnabled.value)
}

const toggleRecipe = (e: any) => {
  recipeEnabled.value = e.detail.value
  Taro.setStorageSync('recipeEnabled', recipeEnabled.value)
}

const toggleComment = (e: any) => {
  commentEnabled.value = e.detail.value
  Taro.setStorageSync('commentEnabled', commentEnabled.value)
}
</script>

<style lang="scss">
@import '@/styles/variables.scss';

.notifications-page {
  min-height: 100vh;
  background: $bg-page;
  padding-top: 16px;
  
  &__section {
    background: #fff;
    margin: 0 16px;
    border-radius: 12px;
    overflow: hidden;
  }
  
  &__list {
    &-item {
      display: flex;
      align-items: center;
      justify-content: space-between;
      height: 56px;
      padding: 0 16px;
      border-bottom: 1px solid $bg-divider;
      
      &:last-child {
        border-bottom: none;
      }
    }
    
    &-text {
      font-size: 15px;
      color: $text-primary;
    }
    
    &-switch {
      transform: scale(0.8);
    }
  }
}
</style>
