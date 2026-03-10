import { ref } from 'vue'
import Taro from '@tarojs/taro'

// 场景类型
export type SceneType = 'favorite' | 'share' | 'comment'

// 场景引导配置
interface SceneGuideConfig {
  key: string
  title: string
  content: string
  icon: string
}

// 场景引导映射
const sceneGuideMap: Record<SceneType, SceneGuideConfig> = {
  favorite: {
    key: 'scene_guide_favorite',
    title: '收藏功能',
    content: '收藏喜欢的配方，方便随时查看。收藏的配方可以在"我的"页面中找到。',
    icon: '❤️'
  },
  share: {
    key: 'scene_guide_share',
    title: '分享功能',
    content: '将配方分享给好友，一起享受健康生活。支持分享到微信好友、朋友圈等。',
    icon: '📤'
  },
  comment: {
    key: 'scene_guide_comment',
    title: '评论功能',
    content: '分享您的使用体验，帮助其他用户更好地了解这个配方。',
    icon: '💬'
  }
}

/**
 * 场景化引导 composable
 * 用于在首次执行特定操作时显示引导提示
 */
export function useSceneGuide() {
  const isShowing = ref(false)
  
  /**
   * 检查并显示场景引导
   * @param scene 场景类型
   * @returns 是否显示了引导
   */
  const checkAndShowGuide = async (scene: SceneType): Promise<boolean> => {
    const config = sceneGuideMap[scene]
    const hasShown = Taro.getStorageSync(config.key)
    
    if (hasShown) {
      return false
    }
    
    isShowing.value = true
    
    await new Promise<void>((resolve) => {
      Taro.showModal({
        title: `${config.icon} ${config.title}`,
        content: config.content,
        confirmText: '知道了',
        showCancel: false,
        success: () => {
          // 标记已显示
          Taro.setStorageSync(config.key, true)
          resolve()
        }
      })
    })
    
    isShowing.value = false
    return true
  }
  
  /**
   * 重置场景引导（用于测试）
   * @param scene 场景类型，不传则重置所有
   */
  const resetGuide = (scene?: SceneType) => {
    if (scene) {
      const config = sceneGuideMap[scene]
      Taro.removeStorageSync(config.key)
    } else {
      // 重置所有场景引导
      Object.values(sceneGuideMap).forEach(config => {
        Taro.removeStorageSync(config.key)
      })
    }
  }
  
  /**
   * 获取场景引导状态
   * @param scene 场景类型
   * @returns 是否已显示过引导
   */
  const getGuideStatus = (scene: SceneType): boolean => {
    const config = sceneGuideMap[scene]
    return !!Taro.getStorageSync(config.key)
  }
  
  return {
    isShowing,
    checkAndShowGuide,
    resetGuide,
    getGuideStatus
  }
}

export default useSceneGuide
