<template>
  <view class="recipe-card-h" @click="handleClick">
    <view class="recipe-card-h__image-wrapper">
      <image
        class="recipe-card-h__image"
        :src="coverImageUrl"
        mode="aspectFill"
        lazy-load
      />
      <view v-if="recipe.isHot" class="recipe-card-h__badge">
        <text class="recipe-card-h__badge-text">{{ $t('common.hot') }}</text>
      </view>
    </view>
    <view class="recipe-card-h__content">
      <text class="recipe-card-h__title">{{ recipe.name }}</text>
      <view class="recipe-card-h__rating">
        <text class="recipe-card-h__star">★</text>
        <text class="recipe-card-h__score">{{ recipe.rating || '4.8' }}</text>
      </view>
      <view v-if="recipe.tags && recipe.tags.length" class="recipe-card-h__tags">
        <text
          v-for="(tag, index) in recipe.tags.slice(0, 2)"
          :key="index"
          class="recipe-card-h__tag"
        >{{ tag }}</text>
      </view>
    </view>
  </view>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { useI18n } from 'vue-i18n'
import { DEFAULT_IMAGES, getImageUrl } from '@/utils/image'

const { t: $t } = useI18n()

interface Recipe {
  id: number
  name: string
  coverImage?: string
  cover_image?: string
  rating?: number
  tags?: string[]
  isHot?: boolean
  favoriteCount?: number
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
</script>

<style lang="scss">
@import '@/styles/variables.scss';

.recipe-card-h {
  width: 160px;
  background: $bg-card;
  border-radius: $radius-xl;
  overflow: hidden;
  flex-shrink: 0;
  
  &:active {
    transform: scale(0.98);
    transition: transform $duration-fast $ease-standard;
  }
  
  &__image-wrapper {
    position: relative;
    width: 100%;
    height: 120px;
    overflow: hidden;
  }
  
  &__image {
    width: 100%;
    height: 100%;
  }
  
  &__badge {
    position: absolute;
    top: $spacing-xs;
    left: $spacing-xs;
    background: $accent-orange;
    border-radius: $radius-full;
    padding: 2px $spacing-xs;
    
    &-text {
      font-size: 10px;
      color: #fff;
      font-weight: $font-weight-medium;
    }
  }
  
  &__content {
    padding: $spacing-md;
  }
  
  &__title {
    display: block;
    font-size: $font-size-md;
    font-weight: $font-weight-medium;
    color: $text-primary;
    margin-bottom: $spacing-xs;
    line-height: $line-height-tight;
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
  }
  
  &__rating {
    display: flex;
    align-items: center;
    gap: $spacing-xs;
    margin-bottom: $spacing-xs;
  }
  
  &__star {
    color: $accent-orange;
    font-size: $font-size-sm;
  }
  
  &__score {
    font-size: $font-size-sm;
    font-weight: $font-weight-medium;
    color: $accent-orange;
    font-family: $font-family-number;
  }
  
  &__tags {
    display: flex;
    flex-wrap: wrap;
    gap: $spacing-xs;
  }
  
  &__tag {
    display: inline-flex;
    align-items: center;
    padding: 2px $spacing-xs;
    border-radius: $radius-full;
    font-size: 10px;
    background: $brand-primary-10;
    color: $brand-primary;
  }
}
</style>
