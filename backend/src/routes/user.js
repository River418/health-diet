/**
 * 用户路由
 * PRD 3.1 用户系统 / 3.3.3 配方收藏
 */

const express = require('express');
const router = express.Router();
const { authenticate } = require('../middleware/auth');
const config = require('../config');

/**
 * @GET /api/v1/users/profile
 * 获取用户信息
 */
router.get('/profile', authenticate, async (req, res) => {
  try {
    const [users] = await req.db.execute(
      'SELECT id, nickname, avatar, phone, language, created_at FROM users WHERE id = ?',
      [req.user.id]
    );
    
    if (users.length === 0) {
      return res.status(404).json({
        success: false,
        error: '用户不存在',
        code: 'USER_NOT_FOUND'
      });
    }
    
    res.json({
      success: true,
      data: users[0]
    });
  } catch (error) {
    console.error('Get profile error:', error);
    res.status(500).json({
      success: false,
      error: '获取用户信息失败',
      code: 'GET_PROFILE_FAILED'
    });
  }
});

/**
 * @PUT /api/v1/users/profile
 * 更新用户信息
 */
router.put('/profile', authenticate, async (req, res) => {
  try {
    const { nickname, avatar, language } = req.body;
    
    // 验证语言
    if (language && !config.languages.includes(language)) {
      return res.status(400).json({
        success: false,
        error: '不支持的语言',
        code: 'INVALID_LANGUAGE'
      });
    }
    
    const updates = [];
    const values = [];
    
    if (nickname) {
      updates.push('nickname = ?');
      values.push(nickname);
    }
    if (avatar) {
      updates.push('avatar = ?');
      values.push(avatar);
    }
    if (language) {
      updates.push('language = ?');
      values.push(language);
    }
    
    if (updates.length === 0) {
      return res.status(400).json({
        success: false,
        error: '没有要更新的字段',
        code: 'NO_FIELDS_TO_UPDATE'
      });
    }
    
    values.push(req.user.id);
    
    await req.db.execute(
      `UPDATE users SET ${updates.join(', ')} WHERE id = ?`,
      values
    );
    
    // 获取更新后的用户信息
    const [users] = await req.db.execute(
      'SELECT id, nickname, avatar, phone, language FROM users WHERE id = ?',
      [req.user.id]
    );
    
    res.json({
      success: true,
      data: users[0]
    });
  } catch (error) {
    console.error('Update profile error:', error);
    res.status(500).json({
      success: false,
      error: '更新用户信息失败',
      code: 'UPDATE_PROFILE_FAILED'
    });
  }
});

/**
 * @GET /api/v1/users/favorites
 * 获取用户收藏列表
 */
router.get('/favorites', authenticate, async (req, res) => {
  try {
    const page = parseInt(req.query.page) || 1;
    const pageSize = Math.min(parseInt(req.query.pageSize) || 20, config.pagination.maxPageSize);
    const offset = (page - 1) * pageSize;
    
    const language = req.user.language || config.defaultLanguage;
    const nameField = language === 'zh-TW' ? 'r.name_zh_tw' : 
                      language === 'en' ? 'r.name_en' : 'r.name_zh_cn';
    
    // 获取收藏列表
    const [favorites] = await req.db.execute(
      `SELECT 
        f.id as favorite_id,
        f.created_at as favorited_at,
        r.id,
        ${nameField} as name,
        r.cover_image,
        r.rating,
        r.view_count,
        r.favorite_count
      FROM favorites f
      JOIN recipes r ON f.recipe_id = r.id
      WHERE f.user_id = ? AND r.status = 1
      ORDER BY f.created_at DESC
      LIMIT ? OFFSET ?`,
      [req.user.id, pageSize, offset]
    );
    
    // 获取总数
    const [countResult] = await req.db.execute(
      'SELECT COUNT(*) as total FROM favorites WHERE user_id = ?',
      [req.user.id]
    );
    
    res.json({
      success: true,
      data: {
        list: favorites,
        pagination: {
          page,
          pageSize,
          total: countResult[0].total,
          totalPages: Math.ceil(countResult[0].total / pageSize)
        }
      }
    });
  } catch (error) {
    console.error('Get favorites error:', error);
    res.status(500).json({
      success: false,
      error: '获取收藏列表失败',
      code: 'GET_FAVORITES_FAILED'
    });
  }
});

/**
 * @GET /api/v1/users/history
 * 获取用户浏览历史
 */
router.get('/history', authenticate, async (req, res) => {
  try {
    const page = parseInt(req.query.page) || 1;
    const pageSize = Math.min(parseInt(req.query.pageSize) || 20, config.pagination.maxPageSize);
    const offset = (page - 1) * pageSize;
    
    const language = req.user.language || config.defaultLanguage;
    const nameField = language === 'zh-TW' ? 'r.name_zh_tw' : 
                      language === 'en' ? 'r.name_en' : 'r.name_zh_cn';
    
    // 获取浏览历史
    const [history] = await req.db.execute(
      `SELECT 
        h.id,
        h.viewed_at,
        r.id as recipe_id,
        ${nameField} as name,
        r.cover_image,
        r.rating
      FROM user_history h
      JOIN recipes r ON h.recipe_id = r.id
      WHERE h.user_id = ? AND r.status = 1
      ORDER BY h.viewed_at DESC
      LIMIT ? OFFSET ?`,
      [req.user.id, pageSize, offset]
    );
    
    // 获取总数
    const [countResult] = await req.db.execute(
      'SELECT COUNT(*) as total FROM user_history WHERE user_id = ?',
      [req.user.id]
    );
    
    res.json({
      success: true,
      data: {
        list: history,
        pagination: {
          page,
          pageSize,
          total: countResult[0].total,
          totalPages: Math.ceil(countResult[0].total / pageSize)
        }
      }
    });
  } catch (error) {
    console.error('Get history error:', error);
    res.status(500).json({
      success: false,
      error: '获取浏览历史失败',
      code: 'GET_HISTORY_FAILED'
    });
  }
});

/**
 * @DELETE /api/v1/users/history
 * 清除用户浏览历史
 */
router.delete('/history', authenticate, async (req, res) => {
  try {
    await req.db.execute(
      'DELETE FROM user_history WHERE user_id = ?',
      [req.user.id]
    );
    
    res.json({
      success: true,
      data: null
    });
  } catch (error) {
    console.error('Clear history error:', error);
    res.status(500).json({
      success: false,
      error: '清除浏览历史失败',
      code: 'CLEAR_HISTORY_FAILED'
    });
  }
});

module.exports = router;
