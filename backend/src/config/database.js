/**
 * 数据库配置
 * PRD 技术约束: PostgreSQL + Redis
 */

const { Pool } = require('pg');
const redis = require('redis');

// PostgreSQL 配置
const dbConfig = {
  host: process.env.DB_HOST || 'localhost',
  port: process.env.DB_PORT || 5432,
  user: process.env.DB_USER || 'postgres',
  password: process.env.DB_PASSWORD || '',
  database: process.env.DB_NAME || 'health_diet',
  // 连接池配置
  max: 20,
  min: 5,
  acquireTimeoutMillis: 30000,
  idleTimeoutMillis: 30000,
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

// 创建 PostgreSQL 连接池
const createPool = () => {
  const pool = new Pool(dbConfig);
  
  pool.on('error', (err) => {
    console.error('PostgreSQL Pool Error:', err);
  });
  
  pool.on('connect', () => {
    console.log('PostgreSQL Pool Connected');
  });
  
  return pool;
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
