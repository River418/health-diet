/**
 * 认证路由
 * PRD 3.1 用户系统
 */

const express = require('express');
const router = express.Router();
const jwt = require('jsonwebtoken');
const axios = require('axios');
const config = require('../config');

/**
 * @POST /api/v1/auth/wechat/login
 * 微信登录
 */
router.post('/wechat/login', async (req, res) => {
  try {
    const { code } = req.body;
    
    if (!code) {
      return res.status(400).json({
        success: false,
        error: '缺少code参数',
        code: 'MISSING_CODE'
      });
    }
    
    // 调用微信接口获取 openid
    const wxUrl = `https://api.weixin.qq.com/sns/jscode2session?appid=${config.wechat.appId}&secret=${config.wechat.appSecret}&js_code=${code}&grant_type=authorization_code`;
    const wxResponse = await axios.get(wxUrl);
    
    if (wxResponse.data.errcode) {
      return res.status(400).json({
        success: false,
        error: '微信授权失败',
        code: 'WECHAT_AUTH_FAILED'
      });
    }
    
    const { openid, session_key } = wxResponse.data;
    
    // 查询或创建用户
    const [existingUsers] = await req.db.execute(
      'SELECT id, nickname, avatar, language FROM users WHERE wx_openid = ?',
      [openid]
    );
    
    let userId;
    let isNewUser = false;
    
    if (existingUsers.length > 0) {
      userId = existingUsers[0].id;
    } else {
      // 创建新用户
      const [result] = await req.db.execute(
        'INSERT INTO users (wx_openid, nickname, avatar, language) VALUES (?, ?, ?, ?)',
        [openid, '微信用户', '/images/default-avatar.png', config.defaultLanguage]
      );
      userId = result.insertId;
      isNewUser = true;
    }
    
    // 生成 JWT Token
    const token = jwt.sign(
      { userId, platform: 'wechat' },
      config.jwt.secret,
      { expiresIn: config.jwt.expiresIn }
    );
    
    const refreshToken = jwt.sign(
      { userId, type: 'refresh' },
      config.jwt.secret,
      { expiresIn: config.jwt.refreshExpiresIn }
    );
    
    // 获取用户信息
    const [users] = await req.db.execute(
      'SELECT id, nickname, avatar, language FROM users WHERE id = ?',
      [userId]
    );
    
    res.json({
      success: true,
      data: {
        user: users[0],
        token,
        refreshToken,
        expiresIn: config.jwt.expiresIn,
        isNewUser
      }
    });
  } catch (error) {
    console.error('WeChat login error:', error);
    res.status(500).json({
      success: false,
      error: '登录失败',
      code: 'LOGIN_FAILED'
    });
  }
});

/**
 * @POST /api/v1/auth/douyin/login
 * 抖音登录
 */
router.post('/douyin/login', async (req, res) => {
  try {
    const { code, anonymous_code } = req.body;
    
    if (!code) {
      return res.status(400).json({
        success: false,
        error: '缺少code参数',
        code: 'MISSING_CODE'
      });
    }
    
    // 调用抖音接口获取 openid
    const dyUrl = `https://developer.toutiao.com/api/apps/v2/jscode2session`;
    const dyResponse = await axios.post(dyUrl, {
      appid: config.douyin.appId,
      secret: config.douyin.appSecret,
      code,
      anonymous_code
    });
    
    if (dyResponse.data.error) {
      return res.status(400).json({
        success: false,
        error: '抖音授权失败',
        code: 'DOUYIN_AUTH_FAILED'
      });
    }
    
    const { openid } = dyResponse.data.data;
    
    // 查询或创建用户
    const [existingUsers] = await req.db.execute(
      'SELECT id, nickname, avatar, language FROM users WHERE dy_openid = ?',
      [openid]
    );
    
    let userId;
    let isNewUser = false;
    
    if (existingUsers.length > 0) {
      userId = existingUsers[0].id;
    } else {
      // 创建新用户
      const [result] = await req.db.execute(
        'INSERT INTO users (dy_openid, nickname, avatar, language) VALUES (?, ?, ?, ?)',
        [openid, '抖音用户', '/images/default-avatar.png', config.defaultLanguage]
      );
      userId = result.insertId;
      isNewUser = true;
    }
    
    // 生成 JWT Token
    const token = jwt.sign(
      { userId, platform: 'douyin' },
      config.jwt.secret,
      { expiresIn: config.jwt.expiresIn }
    );
    
    const refreshToken = jwt.sign(
      { userId, type: 'refresh' },
      config.jwt.secret,
      { expiresIn: config.jwt.refreshExpiresIn }
    );
    
    // 获取用户信息
    const [users] = await req.db.execute(
      'SELECT id, nickname, avatar, language FROM users WHERE id = ?',
      [userId]
    );
    
    res.json({
      success: true,
      data: {
        user: users[0],
        token,
        refreshToken,
        expiresIn: config.jwt.expiresIn,
        isNewUser
      }
    });
  } catch (error) {
    console.error('Douyin login error:', error);
    res.status(500).json({
      success: false,
      error: '登录失败',
      code: 'LOGIN_FAILED'
    });
  }
});

/**
 * @POST /api/v1/auth/refresh
 * 刷新 Token
 */
router.post('/refresh', async (req, res) => {
  try {
    const { refreshToken } = req.body;
    
    if (!refreshToken) {
      return res.status(400).json({
        success: false,
        error: '缺少refreshToken',
        code: 'MISSING_REFRESH_TOKEN'
      });
    }
    
    // 验证 refresh token
    const decoded = jwt.verify(refreshToken, config.jwt.secret);
    
    if (decoded.type !== 'refresh') {
      return res.status(401).json({
        success: false,
        error: '无效的刷新令牌',
        code: 'INVALID_REFRESH_TOKEN'
      });
    }
    
    // 生成新的 access token
    const token = jwt.sign(
      { userId: decoded.userId },
      config.jwt.secret,
      { expiresIn: config.jwt.expiresIn }
    );
    
    res.json({
      success: true,
      data: {
        token,
        expiresIn: config.jwt.expiresIn
      }
    });
  } catch (error) {
    if (error.name === 'TokenExpiredError') {
      return res.status(401).json({
        success: false,
        error: '刷新令牌已过期，请重新登录',
        code: 'REFRESH_TOKEN_EXPIRED'
      });
    }
    
    res.status(401).json({
      success: false,
      error: '无效的刷新令牌',
      code: 'INVALID_REFRESH_TOKEN'
    });
  }
});

module.exports = router;
