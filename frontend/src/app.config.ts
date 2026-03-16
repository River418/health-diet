import { Config } from '@tarojs/taro'

const config: Config = {
  pages: [
    'pages/index/index',
    'pages/category/index',
    'pages/user/index',
    'pages/login/index',
    'pages/onboarding/index',
    'pages/search/index',
    'pages/ingredients/index'
  ],
  window: {
    backgroundTextStyle: 'light',
    navigationBarBackgroundColor: '#4CAF50',
    navigationBarTitleText: 'Health-Diet',
    navigationBarTextStyle: 'white'
  },
  tabBar: {
    color: '#999999',
    selectedColor: '#4CAF50',
    backgroundColor: '#ffffff',
    borderStyle: 'black',
    list: [
      {
        pagePath: 'pages/index/index',
        text: '首页',
        iconPath: 'assets/icons/home.png',
        selectedIconPath: 'assets/icons/home-active.png'
      },
      {
        pagePath: 'pages/category/index',
        text: '分类',
        iconPath: 'assets/icons/category.png',
        selectedIconPath: 'assets/icons/category-active.png'
      },
      {
        pagePath: 'pages/user/index',
        text: '我的',
        iconPath: 'assets/icons/user.png',
        selectedIconPath: 'assets/icons/user-active.png'
      }
    ]
  },
  subpackages: [
    {
      root: 'pages/recipe',
      pages: [
        'detail/index',
        'list/index',
        'comments/index'
      ]
    },
    {
      root: 'pages/profile',
      pages: [
        'favorites/index',
        'history/index',
        'settings/index',
        'settings/notifications',
        'settings/accessibility',
        'profile/index',
        'about/index',
        'help/index',
        'agreement/index',
        'privacy/index'
      ]
    },
    {
      root: 'pages/content',
      pages: [
        'detail/index'
      ]
    }
  ],
  permission: {
    'scope.userLocation': {
      desc: '您的位置信息将用于小程序位置接口的效果展示'
    }
  },
  requiredBackgroundModes: ['audio'],
  cloud: true
}

export default config
