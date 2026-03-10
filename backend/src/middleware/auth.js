/**
 * 认证中间件
 * PRD 3.1.1 微信登录 / 3.1.2 抖音登录
 */

const jwt = require('jsonwebtoken');
const config = require('../config');

/**
 * JWT Token 验证中间件
 */
const authenticate = async (req, res, next) => {
  try {
    const authHeader = req.headers.authorization;
    
    if (!authHeader || !authHeader.startsWith('Bearer ')) {
      return res.status(401).json({
        success: false,
        error: '未提供认证令牌',
        code: 'UNAUTHORIZED'
      });
    }
    
    const token = authHeader.substring(7);
    
    // 验证 Token
    const decoded = jwt.verify(token, config.jwt.secret);
    
    // BUG-004 修复: 统一使用 PostgreSQL 的 query 方法而不是 MySQL 的 execute
    const usersResult = await req.db.query(
      'SELECT id, nickname, avatar, language, status FROM users WHERE id = $1',
      [decoded.userId]
    );
    const users = usersResult.rows;
    
    if (users.length === 0) {
      return res.status(401).json({
        success: false,
        error: '用户不存在',
        code: 'USER_NOT_FOUND'
      });
    }
    
    const user = users[0];
    
    if (user.status === 0) {
      return res.status(403).json({
        success: false,
        error: '账号已被禁用',
        code: 'ACCOUNT_DISABLED'
      });
    }
    
    req.user = user;
    next();
  } catch (error) {
    if (error.name === 'TokenExpiredError') {
      return res.status(401).json({
        success: false,
        error: '令牌已过期',
        code: 'TOKEN_EXPIRED'
      });
    }
    
    if (error.name === 'JsonWebTokenError') {
      return res.status(401).json({
        success: false,
        error: '无效的令牌',
        code: 'INVALID_TOKEN'
      });
    }
    
    return res.status(500).json({
      success: false,
      error: '认证失败',
      code: 'AUTH_FAILED'
    });
  }
};

/**
 * 可选认证中间件
 * 用户已登录时设置 req.user，未登录时也允许访问
 */
const optionalAuth = async (req, res, next) => {
  try {
    const authHeader = req.headers.authorization;
    
    if (!authHeader || !authHeader.startsWith('Bearer ')) {
      return next();
    }
    
    const token = authHeader.substring(7);
    const decoded = jwt.verify(token, config.jwt.secret);
    
    // BUG-004 修复: 统一使用 PostgreSQL 的 query 方法而不是 MySQL 的 execute
    const usersResult = await req.db.query(
      'SELECT id, nickname, avatar, language FROM users WHERE id = $1 AND status = 1',
      [decoded.userId]
    );
    const users = usersResult.rows;
    
    if (users.length > 0) {
      req.user = users[0];
    }
    
    next();
  } catch (error) {
    next();
  }
};

module.exports = {
  authenticate,
  optionalAuth
};
