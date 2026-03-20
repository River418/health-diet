const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');
const config = require('../config');

const adminAuthenticate = async (req, res, next) => {
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
    const decoded = jwt.verify(token, config.jwt.secret);
    
    if (decoded.type !== 'admin') {
      return res.status(403).json({
        success: false,
        error: '非管理员令牌',
        code: 'NOT_ADMIN_TOKEN'
      });
    }
    
    const adminResult = await req.db.query(
      'SELECT id, username, role, status FROM admin_users WHERE id = $1',
      [decoded.adminId]
    );
    
    if (adminResult.rows.length === 0) {
      return res.status(401).json({
        success: false,
        error: '管理员账号不存在',
        code: 'ADMIN_NOT_FOUND'
      });
    }
    
    const admin = adminResult.rows[0];
    
    if (admin.status !== 1) {
      return res.status(403).json({
        success: false,
        error: '管理员账号已被禁用',
        code: 'ADMIN_DISABLED'
      });
    }
    
    req.admin = admin;
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

const requireSuperAdmin = (req, res, next) => {
  if (req.admin.role !== 'super_admin') {
    return res.status(403).json({
      success: false,
      error: '需要超级管理员权限',
      code: 'FORBIDDEN'
    });
  }
  next();
};

module.exports = {
  adminAuthenticate,
  requireSuperAdmin
};