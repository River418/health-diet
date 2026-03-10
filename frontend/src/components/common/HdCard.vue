<template>
  <view
    class="hd-card"
    :class="{
      'hd-card--shadow': shadow,
      'hd-card--hover': hover
    }"
    :style="{ borderRadius: radius + 'px' }"
    @click="handleClick"
  >
    <view v-if="image" class="hd-card__image-wrapper">
      <image
        class="hd-card__image"
        :src="image"
        :mode="imageMode"
        @error="handleImageError"
      />
      <view v-if="videoDuration" class="hd-card__duration">
        <text class="hd-card__duration-text">{{ videoDuration }}</text>
      </view>
      <view v-if="playIcon" class="hd-card__play">
        <text class="hd-card__play-icon">▶</text>
      </view>
    </view>
    <view class="hd-card__content">
      <slot>
        <text v-if="title" class="hd-card__title">{{ title }}</text>
        <text v-if="desc" class="hd-card__desc">{{ desc }}</text>
        <view v-if="tags && tags.length" class="hd-card__tags">
          <hd-tag
            v-for="(tag, index) in tags"
            :key="index"
            :text="tag"
            type="secondary"
            size="small"
          />
        </view>
        <view v-if="stats" class="hd-card__stats">
          <text v-for="(stat, index) in stats" :key="index" class="hd-card__stat">
            {{ stat.icon }} {{ stat.value }}
          </text>
        </view>
      </slot>
    </view>
  </view>
</template>

<script setup lang="ts">
import HdTag from './HdTag.vue'

interface Stat {
  icon: string
  value: string | number
}

interface Props {
  title?: string
  desc?: string
  image?: string
  imageMode?: string
  tags?: string[]
  stats?: Stat[]
  videoDuration?: string
  playIcon?: boolean
  shadow?: boolean
  hover?: boolean
  radius?: number
}

withDefaults(defineProps<Props>(), {
  imageMode: 'aspectFill',
  shadow: true,
  hover: true,
  radius: 12
})

const emit = defineEmits<{
  click: []
  imageError: []
}>()

const handleClick = () => {
  emit('click')
}

const handleImageError = () => {
  emit('imageError')
}
</script>

<style lang="scss">
@import '@/styles/variables.scss';

.hd-card {
  background: #fff;
  overflow: hidden;
  
  &--shadow {
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  }
  
  &--hover {
    &:active {
      transform: scale(0.98);
    }
  }
  
  &__image-wrapper {
    position: relative;
    width: 100%;
    padding-top: 56.25%; // 16:9
    overflow: hidden;
  }
  
  &__image {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
  }
  
  &__duration {
    position: absolute;
    right: 8px;
    bottom: 8px;
    background: rgba(0, 0, 0, 0.6);
    border-radius: 4px;
    padding: 2px 6px;
    
    &-text {
      color: #fff;
      font-size: 12px;
    }
  }
  
  &__play {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 48px;
    height: 48px;
    background: rgba(0, 0, 0, 0.6);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    
    &-icon {
      color: #fff;
      font-size: 20px;
      margin-left: 4px;
    }
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
  
  &__desc {
    display: block;
    font-size: 13px;
    color: $text-secondary;
    margin-bottom: 8px;
    line-height: 1.4;
  }
  
  &__tags {
    display: flex;
    flex-wrap: wrap;
    gap: 8px;
    margin-bottom: 8px;
  }
  
  &__stats {
    display: flex;
    gap: 12px;
  }
  
  &__stat {
    font-size: 12px;
    color: $text-tertiary;
  }
}
</style>
