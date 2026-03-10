/**
 * 全局配置
 * PRD 技术约束: Node.js >= 18.x LTS
 */

const path = require('path');

const config = {
  // 服务器配置
  server: {
    port: process.env.PORT || 3000,
    host: process.env.HOST || '0.0.0.0',
    env: process.env.NODE_ENV || 'development'
  },
  
  // JWT 配置
  jwt: {
    secret: process.env.JWT_SECRET || 'health-diet-secret-key',
    expiresIn: process.env.JWT_EXPIRES_IN || '2h',
    refreshExpiresIn: process.env.JWT_REFRESH_EXPIRES_IN || '7d'
  },
  
  // 微信小程序配置
  wechat: {
    appId: process.env.WECHAT_APP_ID || '',
    appSecret: process.env.WECHAT_APP_SECRET || ''
  },
  
  // 抖音小程序配置
  douyin: {
    appId: process.env.DOUYIN_APP_ID || '',
    appSecret: process.env.DOUYIN_APP_SECRET || ''
  },
  
  // 文件上传配置
  upload: {
    maxSize: 10 * 1024 * 1024, // 10MB
    allowedTypes: ['image/jpeg', 'image/png', 'image/gif', 'video/mp4'],
    uploadDir: path.join(__dirname, '../../uploads')
  },
  
  // 分页配置
  pagination: {
    defaultPage: 1,
    defaultPageSize: 20,
    maxPageSize: 100
  },
  
  // 缓存配置
  cache: {
    ttl: 3600, // 1小时
    prefix: 'health-diet:'
  },
  
  // 日志配置
  log: {
    level: process.env.LOG_LEVEL || 'info',
    dir: path.join(__dirname, '../../logs')
  },
  
  // 消息队列配置
  mq: {
    enabled: process.env.MQ_ENABLED === 'true',
    url: process.env.MQ_URL || 'amqp://localhost',
    queues: {
      contentAudit: 'content.audit',
      notification: 'notification',
      dataSync: 'data.sync',
      cacheWarmup: 'cache.warmup',
      logProcess: 'log.process'
    }
  },
  
  // 支持的语言
  languages: ['zh-CN', 'zh-TW', 'en'],
  defaultLanguage: 'zh-CN'
};

module.exports = config;
