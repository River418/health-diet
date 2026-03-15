const config = {
  projectName: 'health-diet',
  date: '2026-3-10',
  designWidth: 750,
  deviceRatio: {
    640: 2.34 / 2,
    750: 1,
    828: 1.81 / 2
  },
  sourceRoot: 'src',
  outputRoot: 'dist',
  plugins: [],
  defineConstants: {
  },
  alias: {
    '@': require('path').resolve(__dirname, '..', 'src')
  },
  copy: {
    patterns: [
    ],
    options: {
    }
  },
  framework: 'vue3',
  compiler: 'webpack5',
  cache: {
    enable: false // Webpack 持久化缓存配置，建议开启
  },
  mini: {
    webpackChain(chain) {
      chain.performance.hints(false)
      chain.set('ignoreWarnings', [
        /taro-video-core\.js/,
        {
          module: /node_modules[\\/]@tarojs[\\/]components/
        },
        /taro_app_library.*remoteEntry/,
        /EnvironmentNotSupportAsyncWarning/,
        {
          message: /async\/await.*external.*script/
        }
      ])
    },
    postcss: {
      pxtransform: {
        enable: true,
        config: {
          selectorBlackList: ['nut-']
        }
      },
      url: {
        enable: true,
        config: {
          limit: 1024 // 设定转换尺寸上限
        }
      },
      cssModules: {
        enable: false, // 默认为 false，如需使用 css modules 功能，则设为 true
        config: {
          namingPattern: 'module', // 转换模式，取值为 global/module
          generateScopedName: '[name]__[local]___[hash:base64:5]'
        }
      }
    }
  },
  h5: {
    publicPath: '/',
    staticDirectory: 'static',
    esnextModules: ['nutui-taro'],
    router: {
      mode: 'hash'
    },
    devServer: {
      proxy: {
        '/api': {
          target: 'http://localhost:3001',
          changeOrigin: true
        }
      }
    },
    // 禁用整理特定的 Webpack 编译警告
    webpackChain(chain) {
      chain.performance.hints(false)
      chain.set('ignoreWarnings', [
        /taro-video-core\.js/,
        { module: /node_modules[\\/]@tarojs[\\/]components/ },
        /taro_app_library.*remoteEntry/,
        /EnvironmentNotSupportAsyncWarning/,
        { message: /async\/await.*external.*script/ },
        { message: /webpackExports/ }
      ])
    },
    postcss: {
      autoprefixer: {
        enable: true,
        config: {
        }
      },
      cssModules: {
        enable: false, // 默认为 false，如需使用 css modules 功能，则设为 true
        config: {
          namingPattern: 'module', // 转换模式，取值为 global/module
          generateScopedName: '[name]__[local]___[hash:base64:5]'
        }
      }
    }
  },
  rn: {
    appName: 'taroDemo',
    postcss: {
      cssModules: {
        enable: false
      }
    }
  }
}

module.exports = function (merge) {
  if (process.env.NODE_ENV === 'development') {
    return merge({}, config, require('./dev'))
  }
  return merge({}, config, require('./prod'))
}
