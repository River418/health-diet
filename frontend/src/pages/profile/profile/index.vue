<template>
  <view class="profile-page">
    <view class="profile-page__section">
      <view class="profile-page__avatar-item" @click="changeAvatar">
        <text class="profile-page__label">头像</text>
        <view class="profile-page__avatar-wrapper">
          <image
            class="profile-page__avatar"
            :src="userInfo.avatar || defaultAvatar"
            mode="aspectFill"
          />
        </view>
        <text class="profile-page__arrow">></text>
      </view>
      
      <view class="profile-page__item" @click="editNickname">
        <text class="profile-page__label">昵称</text>
        <text class="profile-page__value">{{ userInfo.nickname || '未设置' }}</text>
        <text class="profile-page__arrow">></text>
      </view>
    </view>
    
    <view class="profile-page__section">
      <view class="profile-page__item">
        <text class="profile-page__label">用户ID</text>
        <text class="profile-page__value">{{ userInfo.id || '-' }}</text>
      </view>
      
      <view class="profile-page__item">
        <text class="profile-page__label">注册时间</text>
        <text class="profile-page__value">{{ userInfo.createTime || '-' }}</text>
      </view>
    </view>
  </view>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import Taro from '@tarojs/taro'
import { useUserStore } from '@/store/user'
import { getUserInfo } from '@/api/user'

const userStore = useUserStore()

const userInfo = ref<any>({})
const defaultAvatar = '/assets/images/avatar-default.png'

// 获取用户信息
const fetchUserInfo = async () => {
  try {
    const res = await getUserInfo()
    userInfo.value = res.data || {}
  } catch (error) {
    console.error('获取用户信息失败', error)
  }
}

// 更换头像
const changeAvatar = () => {
  Taro.showActionSheet({
    itemList: ['从相册选择', '拍照'],
    success: (res) => {
      if (res.tapIndex === 0) {
        // 从相册选择
        Taro.chooseImage({
          count: 1,
          sourceType: ['album'],
          success: (res) => {
            // TODO: 上传图片
            console.log(res.tempFilePaths[0])
          }
        })
      } else if (res.tapIndex === 1) {
        // 拍照
        Taro.chooseImage({
          count: 1,
          sourceType: ['camera'],
          success: (res) => {
            // TODO: 上传图片
            console.log(res.tempFilePaths[0])
          }
        })
      }
    }
  })
}

// 编辑昵称
const editNickname = () => {
  Taro.showModal({
    title: '修改昵称',
    editable: true,
    placeholderText: '请输入昵称',
    success: (res) => {
      if (res.confirm && res.content) {
        // TODO: 调用API更新昵称
        userInfo.value.nickname = res.content
        Taro.showToast({
          title: '修改成功',
          icon: 'success'
        })
      }
    }
  })
}

onMounted(() => {
  fetchUserInfo()
})
</script>

<style lang="scss">
@import '@/styles/variables.scss';

.profile-page {
  min-height: 100vh;
  background: $bg-page;
  padding-top: 16px;
  
  &__section {
    background: #fff;
    margin: 0 16px 16px;
    border-radius: 12px;
    overflow: hidden;
  }
  
  &__avatar-item {
    display: flex;
    align-items: center;
    height: 80px;
    padding: 0 16px;
    border-bottom: 1px solid $bg-divider;
    
    &:active {
      background: $bg-page;
    }
  }
  
  &__item {
    display: flex;
    align-items: center;
    height: 56px;
    padding: 0 16px;
    border-bottom: 1px solid $bg-divider;
    
    &:last-child {
      border-bottom: none;
    }
    
    &:active {
      background: $bg-page;
    }
  }
  
  &__label {
    font-size: 15px;
    color: $text-primary;
    width: 80px;
  }
  
  &__value {
    flex: 1;
    font-size: 15px;
    color: $text-secondary;
    text-align: right;
    margin-right: 8px;
  }
  
  &__avatar-wrapper {
    flex: 1;
    display: flex;
    justify-content: flex-end;
    margin-right: 8px;
  }
  
  &__avatar {
    width: 56px;
    height: 56px;
    border-radius: 50%;
    background: $bg-page;
  }
  
  &__arrow {
    font-size: 16px;
    color: $text-tertiary;
  }
}
</style>
