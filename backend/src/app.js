/**
 * Health-Diet 后端服务入口
 * PRD 技术栈: Node.js + Express + MySQL + Redis
 */

const express = require('express');
const cors = require('cors');
const helmet = require('helmet');
const compression = require('compression');
const rateLimit = require('express-rate-limit');
require('dotenv').config();

const config = require('./config');
const { createPool, createRedisClient } = require('./config/database');
const logger = require('./utils/logger');

// 导入路由
const authRoutes = require('./routes/auth');
const userRoutes = require('./routes/user');
const recipeRoutes = require('./routes/recipe');
const categoryRoutes = require('./routes/category');
const commentRoutes = require('./routes/comment');
const contentRoutes = require('./routes/content');
const searchRoutes = require('./routes/search');

const app = express();

// 创建数据库连接池
const dbPool = createPool();
const redisClient = createRedisClient();

// 中间件
app.use(helmet());
app.use(cors({
  origin: process.env.CORS_ORIGIN || '*',
  methods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'],
  allowedHeaders: ['Content-Type', 'Authorization']
}));
app.use(compression());

// 限流配置
const limiter = rateLimit({
  windowMs: 15 * 60 * 1000, // 15分钟
  max: 1000, // 每IP最多1000请求
  message: {
    success: false,
    error: '请求过于频繁，请稍后再试',
    code: 'RATE_LIMIT_EXCEEDED'
  }
});
app.use(limiter);

// 请求体解析
app.use(express.json({ limit: '10mb' }));
app.use(express.urlencoded({ extended: true, limit: '10mb' }));

// 数据库连接中间件
app.use((req, res, next) => {
  req.db = dbPool;
  req.redis = redisClient;
  next();
});

// 请求日志
app.use((req, res, next) => {
  logger.info(`${req.method} ${req.path}`, {
    ip: req.ip,
    userAgent: req.get('user-agent')
  });
  next();
});

// 健康检查
app.get('/api/v1/health', (req, res) => {
  res.json({
    success: true,
    data: {
      status: 'healthy',
      timestamp: new Date().toISOString(),
      version: '1.0.0'
    }
  });
});

// API 路由
app.use('/api/v1/auth', authRoutes);
app.use('/api/v1/users', userRoutes);
app.use('/api/v1/recipes', recipeRoutes);
app.use('/api/v1/categories', categoryRoutes);
app.use('/api/v1/comments', commentRoutes);
app.use('/api/v1/contents', contentRoutes);
app.use('/api/v1/search', searchRoutes);

// 404 处理
app.use((req, res) => {
  res.status(404).json({
    success: false,
    error: '接口不存在',
    code: 'NOT_FOUND'
  });
});

// 错误处理
app.use((err, req, res, next) => {
  logger.error('Server Error:', err);
  
  res.status(err.status || 500).json({
    success: false,
    error: err.message || '服务器内部错误',
    code: err.code || 'INTERNAL_ERROR'
  });
});

// 启动服务器
const startServer = async () => {
  try {
    // 连接 Redis
    await redisClient.connect();
    
    app.listen(config.server.port, config.server.host, () => {
      logger.info(`Server running on http://${config.server.host}:${config.server.port}`);
    });
  } catch (error) {
    logger.error('Failed to start server:', error);
    process.exit(1);
  }
};

// 优雅关闭
process.on('SIGTERM', async () => {
  logger.info('SIGTERM received, shutting down gracefully');
  await redisClient.quit();
  await dbPool.end();
  process.exit(0);
});

process.on('SIGINT', async () => {
  logger.info('SIGINT received, shutting down gracefully');
  await redisClient.quit();
  await dbPool.end();
  process.exit(0);
});

startServer();

module.exports = app;
