/**
 * 数据库配置
 * PRD 技术约束: MySQL/PostgreSQL + Redis
 */

const mysql = require('mysql2/promise');
const redis = require('redis');

// MySQL 配置
const dbConfig = {
  host: process.env.DB_HOST || 'localhost',
  port: process.env.DB_PORT || 3306,
  user: process.env.DB_USER || 'root',
  password: process.env.DB_PASSWORD || '',
  database: process.env.DB_NAME || 'health_diet',
  charset: 'utf8mb4',
  collation: 'utf8mb4_unicode_ci',
  // 连接池配置
  pool: {
    min: 5,
    max: 20,
    acquireTimeoutMillis: 30000,
    idleTimeoutMillis: 30000
  },
  // 查询超时
  queryTimeout: 30000
};

// Redis 配置
const redisConfig = {
  host: process.env.REDIS_HOST || 'localhost',
  port: process.env.REDIS_PORT || 6379,
  password: process.env.REDIS_PASSWORD || undefined,
  db: process.env.REDIS_DB || 0,
  retryStrategy: (times) => {
    const delay = Math.min(times * 50, 2000);
    return delay;
  }
};

// 创建 MySQL 连接池
const createPool = () => {
  return mysql.createPool(dbConfig);
};

// 创建 Redis 客户端
const createRedisClient = () => {
  const client = redis.createClient(redisConfig);
  
  client.on('error', (err) => {
    console.error('Redis Client Error:', err);
  });
  
  client.on('connect', () => {
    console.log('Redis Client Connected');
  });
  
  return client;
};

module.exports = {
  dbConfig,
  redisConfig,
  createPool,
  createRedisClient
};
