import Taro from '@tarojs/taro'

export type LoginPlatform = 'wechat' | 'douyin' | 'unsupported'

export const getLoginPlatform = (): LoginPlatform => {
  const env = Taro.getEnv()

  if (env === Taro.ENV_TYPE.WEAPP) {
    return 'wechat'
  }

  if (env === Taro.ENV_TYPE.TT) {
    return 'douyin'
  }

  return 'unsupported'
}