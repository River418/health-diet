/**
 * 日志工具
 * PRD 技术约束: Winston 日志库
 */

const winston = require('winston');
const path = require('path');
const config = require('../config');

const { combine, timestamp, printf, colorize, json } = winston.format;

// 自定义格式
const customFormat = printf(({ level, message, timestamp, ...metadata }) => {
  let msg = `${timestamp} [${level}]: ${message}`;
  if (Object.keys(metadata).length > 0) {
    msg += ` ${JSON.stringify(metadata)}`;
  }
  return msg;
});

// 创建日志目录
const logDir = config.log.dir;

// 日志配置
const logger = winston.createLogger({
  level: config.log.level,
  defaultMeta: { service: 'health-diet-backend' },
  transports: [
    // 控制台输出
    new winston.transports.Console({
      format: combine(
        colorize(),
        timestamp({ format: 'YYYY-MM-DD HH:mm:ss' }),
        customFormat
      )
    }),
    // 文件输出 - 所有日志
    new winston.transports.File({
      filename: path.join(logDir, 'combined.log'),
      format: combine(
        timestamp({ format: 'YYYY-MM-DD HH:mm:ss' }),
        json()
      )
    }),
    // 文件输出 - 错误日志
    new winston.transports.File({
      filename: path.join(logDir, 'error.log'),
      level: 'error',
      format: combine(
        timestamp({ format: 'YYYY-MM-DD HH:mm:ss' }),
        json()
      )
    })
  ]
});

module.exports = logger;
