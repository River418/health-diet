const express = require('express');
const router = express.Router();
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');
const config = require('../../config');
const { adminAuthenticate, requireSuperAdmin } = require('../../middleware/adminAuth');

router.post('/login', async (req, res) => {
  try {
    const { username, password } = req.body;
    
    if (!username || !password) {
      return res.status(400).json({
        success: false,
        error: '用户名和密码为必填项',
        code: 'MISSING_CREDENTIALS'
      });
    }
    
    const adminResult = await req.db.query(
      'SELECT id, username, password_hash, role, status FROM admin_users WHERE username = $1',
      [username]
    );
    
    if (adminResult.rows.length === 0) {
      return res.status(401).json({
        success: false,
        error: '用户名或密码错误',
        code: 'INVALID_CREDENTIALS'
      });
    }
    
    const admin = adminResult.rows[0];
    
    if (admin.status !== 1) {
      return res.status(403).json({
        success: false,
        error: '账号已被禁用',
        code: 'ACCOUNT_DISABLED'
      });
    }
    
    const isValidPassword = await bcrypt.compare(password, admin.password_hash);
    
    if (!isValidPassword) {
      return res.status(401).json({
        success: false,
        error: '用户名或密码错误',
        code: 'INVALID_CREDENTIALS'
      });
    }
    
    const token = jwt.sign(
      { adminId: admin.id, type: 'admin', role: admin.role },
      config.jwt.secret,
      { expiresIn: config.jwt.expiresIn }
    );
    
    res.json({
      success: true,
      data: {
        admin: {
          id: admin.id,
          username: admin.username,
          role: admin.role
        },
        token,
        expiresIn: config.jwt.expiresIn
      }
    });
  } catch (error) {
    console.error('Admin login error:', error);
    res.status(500).json({
      success: false,
      error: '登录失败',
      code: 'LOGIN_FAILED'
    });
  }
});

router.get('/profile', adminAuthenticate, (req, res) => {
  res.json({
    success: true,
    data: req.admin
  });
});

router.post('/change-password', adminAuthenticate, async (req, res) => {
  try {
    const { oldPassword, newPassword } = req.body;
    
    if (!oldPassword || !newPassword) {
      return res.status(400).json({
        success: false,
        error: '旧密码和新密码为必填项',
        code: 'MISSING_PASSWORDS'
      });
    }
    
    if (newPassword.length < 6) {
      return res.status(400).json({
        success: false,
        error: '新密码长度不能少于6位',
        code: 'PASSWORD_TOO_SHORT'
      });
    }
    
    const adminResult = await req.db.query(
      'SELECT password_hash FROM admin_users WHERE id = $1',
      [req.admin.id]
    );
    
    const isValidPassword = await bcrypt.compare(oldPassword, adminResult.rows[0].password_hash);
    
    if (!isValidPassword) {
      return res.status(400).json({
        success: false,
        error: '旧密码错误',
        code: 'INVALID_OLD_PASSWORD'
      });
    }
    
    const newPasswordHash = await bcrypt.hash(newPassword, 10);
    
    await req.db.query(
      'UPDATE admin_users SET password_hash = $1 WHERE id = $2',
      [newPasswordHash, req.admin.id]
    );
    
    res.json({
      success: true,
      data: { message: '密码修改成功' }
    });
  } catch (error) {
    console.error('Change password error:', error);
    res.status(500).json({
      success: false,
      error: '修改密码失败',
      code: 'CHANGE_PASSWORD_FAILED'
    });
  }
});

router.post('/admins', adminAuthenticate, requireSuperAdmin, async (req, res) => {
  try {
    const { username, password, role } = req.body;
    
    if (!username || !password) {
      return res.status(400).json({
        success: false,
        error: '用户名和密码为必填项',
        code: 'MISSING_FIELDS'
      });
    }
    
    const existingResult = await req.db.query(
      'SELECT id FROM admin_users WHERE username = $1',
      [username]
    );
    
    if (existingResult.rows.length > 0) {
      return res.status(400).json({
        success: false,
        error: '用户名已存在',
        code: 'USERNAME_EXISTS'
      });
    }
    
    const passwordHash = await bcrypt.hash(password, 10);
    
    const result = await req.db.query(
      `INSERT INTO admin_users (username, password_hash, role, status)
       VALUES ($1, $2, $3, 1)
       RETURNING id, username, role, status, created_at`,
      [username, passwordHash, role || 'admin']
    );
    
    res.status(201).json({
      success: true,
      data: result.rows[0]
    });
  } catch (error) {
    console.error('Create admin error:', error);
    res.status(500).json({
      success: false,
      error: '创建管理员失败',
      code: 'CREATE_ADMIN_FAILED'
    });
  }
});

router.get('/admins', adminAuthenticate, requireSuperAdmin, async (req, res) => {
  try {
    const result = await req.db.query(
      `SELECT id, username, role, status, created_at, updated_at
       FROM admin_users
       ORDER BY created_at DESC`
    );
    
    res.json({
      success: true,
      data: result.rows
    });
  } catch (error) {
    console.error('Get admins error:', error);
    res.status(500).json({
      success: false,
      error: '获取管理员列表失败',
      code: 'GET_ADMINS_FAILED'
    });
  }
});

router.put('/admins/:id/status', adminAuthenticate, requireSuperAdmin, async (req, res) => {
  try {
    const { id } = req.params;
    const { status } = req.body;
    
    if (parseInt(id) === req.admin.id) {
      return res.status(400).json({
        success: false,
        error: '不能修改自己的状态',
        code: 'CANNOT_MODIFY_SELF'
      });
    }
    
    const result = await req.db.query(
      `UPDATE admin_users SET status = $1 WHERE id = $2
       RETURNING id, username, role, status`,
      [status ? 1 : 0, id]
    );
    
    if (result.rows.length === 0) {
      return res.status(404).json({
        success: false,
        error: '管理员不存在',
        code: 'ADMIN_NOT_FOUND'
      });
    }
    
    res.json({
      success: true,
      data: result.rows[0]
    });
  } catch (error) {
    console.error('Update admin status error:', error);
    res.status(500).json({
      success: false,
      error: '更新管理员状态失败',
      code: 'UPDATE_ADMIN_STATUS_FAILED'
    });
  }
});

module.exports = router;