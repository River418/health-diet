<template>
  <view v-if="visible" class="filter-picker" @click="handleClose">
    <view class="filter-picker__content" @click.stop>
      <view class="filter-picker__header">
        <view class="filter-picker__indicator"></view>
        <text class="filter-picker__title">{{ title }}</text>
      </view>
      
      <scroll-view scroll-y class="filter-picker__list">
        <view
          v-for="item in options"
          :key="item.value"
          class="filter-picker__item"
          :class="{ 'is-active': selectedValue === item.value }"
          @click="handleSelect(item.value)"
        >
          <text class="filter-picker__item-text">{{ item.label }}</text>
          <text v-if="selectedValue === item.value" class="filter-picker__item-check">✓</text>
        </view>
      </scroll-view>
      
      <view class="filter-picker__footer">
        <view class="filter-picker__btn filter-picker__btn--reset" @click="handleReset">
          <text class="filter-picker__btn-text">{{ $t('common.reset') }}</text>
        </view>
        <view class="filter-picker__btn filter-picker__btn--confirm" @click="handleConfirm">
          <text class="filter-picker__btn-text filter-picker__btn-text--confirm">{{ $t('common.confirm') }}</text>
        </view>
      </view>
    </view>
  </view>
</template>

<script setup lang="ts">
import { ref, watch } from 'vue'
import { useI18n } from 'vue-i18n'

interface FilterOption {
  label: string
  value: string
}

interface Props {
  visible: boolean
  title: string
  options: FilterOption[]
  modelValue?: string
}

const props = withDefaults(defineProps<Props>(), {
  visible: false,
  title: '',
  options: () => [],
  modelValue: ''
})

const emit = defineEmits<{
  (e: 'update:visible', value: boolean): void
  (e: 'update:modelValue', value: string): void
  (e: 'confirm', value: string): void
  (e: 'reset'): void
}>()

const { t: $t } = useI18n()
const selectedValue = ref(props.modelValue)

// 监听外部值变化
watch(() => props.modelValue, (newVal) => {
  selectedValue.value = newVal
})

// 选择选项
const handleSelect = (value: string) => {
  selectedValue.value = value
}

// 重置
const handleReset = () => {
  selectedValue.value = ''
  emit('reset')
}

// 确认
const handleConfirm = () => {
  emit('update:modelValue', selectedValue.value)
  emit('confirm', selectedValue.value)
  emit('update:visible', false)
}

// 关闭
const handleClose = () => {
  emit('update:visible', false)
}
</script>

<style lang="scss">
@import '@/styles/variables.scss';

.filter-picker {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(0, 0, 0, 0.5);
  z-index: 1000;
  display: flex;
  flex-direction: column;
  justify-content: flex-end;
  
  &__content {
    background: $bg-card;
    border-radius: $radius-xl $radius-xl 0 0;
    padding-bottom: $safe-area-bottom;
  }
  
  &__header {
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: $spacing-lg;
    border-bottom: 1px solid $bg-divider;
  }
  
  &__indicator {
    width: 36px;
    height: 4px;
    background: $border-color;
    border-radius: 2px;
    margin-bottom: $spacing-md;
  }
  
  &__title {
    font-size: $font-size-lg;
    font-weight: $font-weight-medium;
    color: $text-primary;
  }
  
  &__list {
    max-height: 300px;
    overflow-y: auto;
  }
  
  &__item {
    display: flex;
    align-items: center;
    justify-content: space-between;
    height: 56px;
    padding: 0 $spacing-lg;
    cursor: pointer;
    
    &.is-active {
      background: $bg-hover;
    }
    
    &:active {
      background: $bg-hover;
    }
    
    &-text {
      font-size: $font-size-base;
      color: $text-primary;
    }
    
    &-check {
      font-size: $font-size-lg;
      color: $brand-primary;
    }
  }
  
  &__footer {
    display: flex;
    gap: $spacing-md;
    padding: $spacing-md $spacing-lg $spacing-lg;
  }
  
  &__btn {
    flex: 1;
    height: $btn-height-lg;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: $radius-lg;
    cursor: pointer;
    
    &:active {
      opacity: 0.8;
    }
    
    &--reset {
      background: $bg-hover;
    }
    
    &--confirm {
      background: $brand-primary;
    }
    
    &-text {
      font-size: $font-size-base;
      color: $text-primary;
      
      &--confirm {
        color: #fff;
      }
    }
  }
}
</style>