<template>
  <view class="recipe-card" @click="handleClick">
    <view class="recipe-card__image-wrapper">
      <image
        class="recipe-card__image"
        :src="coverImageUrl"
        mode="aspectFill"
        lazy-load
      />
    </view>
    <view class="recipe-card__content">
      <text class="recipe-card__title">{{ recipe.name }}</text>
      <view class="recipe-card__stats">
        <text class="recipe-card__stat">
          <text class="recipe-card__stat-icon">⭐</text>
          {{ recipe.rating || '4.8' }}
        </text>
        <text class="recipe-card__stat">
          <text class="recipe-card__stat-icon">💬</text>
          {{ formatNumber(recipe.commentCount || 0) }}
        </text>
        <text class="recipe-card__stat">
          <text class="recipe-card__stat-icon">❤️</text>
          {{ formatNumber(recipe.favoriteCount || 0) }}
        </text>
      </view>
      <view v-if="recipe.tags && recipe.tags.length" class="recipe-card__tags">
        <hd-tag
          v-for="(tag, index) in recipe.tags.slice(0, 2)"
          :key="index"
          :text="tag"
          type="secondary"
          size="small"
        />
      </view>
    </view>
  </view>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import HdTag from '@/components/common/HdTag.vue'
import { DEFAULT_IMAGES, getImageUrl } from '@/utils/image'

interface Recipe {
  id: number
  name: string
  coverImage?: string
  cover_image?: string
  rating?: number
  commentCount?: number
  favoriteCount?: number
  tags?: string[]
}

interface Props {
  recipe: Recipe
}

const props = defineProps<Props>()

const defaultImage = DEFAULT_IMAGES.recipe

const emit = defineEmits<{
  click: [id: number]
}>()

const handleClick = () => {
  emit('click', props.recipe.id)
}

const coverImageUrl = computed(() => {
  return getImageUrl(props.recipe.coverImage || props.recipe.cover_image, 'recipe')
})

const formatNumber = (num: number): string => {
  if (num >= 10000) {
    return (num / 10000).toFixed(1) + 'w'
  }
  if (num >= 1000) {
    return (num / 1000).toFixed(1) + 'k'
  }
  return num.toString()
}
</script>

<style lang="scss">
@import '@/styles/variables.scss';

.recipe-card {
  background: $bg-card;
  border-radius: $radius-xl;
  overflow: hidden;
  
  &:active {
    transform: scale(0.98);
  }
  
  &__image-wrapper {
    width: 100%;
    padding-top: 56.25%; // 16:9
    position: relative;
    overflow: hidden;
  }
  
  &__image {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
  }
  
  &__content {
    padding: 12px;
  }
  
  &__title {
    display: block;
    font-size: 15px;
    font-weight: $font-weight-medium;
    color: $text-primary;
    margin-bottom: 8px;
    line-height: 1.4;
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
  }
  
  &__stats {
    display: flex;
    gap: 12px;
    margin-bottom: 8px;
  }
  
  &__stat {
    font-size: 12px;
    color: $text-tertiary;
    display: flex;
    align-items: center;
    gap: 4px;
    
    &-icon {
      font-size: 10px;
    }
  }
  
  &__tags {
    display: flex;
    flex-wrap: wrap;
    gap: 8px;
  }
}
</style>
