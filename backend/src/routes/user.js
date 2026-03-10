/**
 * 用户路由
 * PRD 3.1 用户系统 / 3.3.3 配方收藏
 */

const express = require('express');
const router = express.Router();
const { authenticate } = require('../middleware/auth');
const config = require('../config');
const { validatePagination, buildPaginationResponse } = require('../utils/pagination');

/**
 * @GET /api/v1/users/profile
 * 获取用户信息
 */
router.get('/profile', authenticate, async (req, res) => {
  try {
    const usersResult = await req.db.query(
      'SELECT id, nickname, avatar, phone, language, created_at FROM users WHERE id = $1',
      [req.user.id]
    );
    
    if (usersResult.rows.length === 0) {
      return res.status(404).json({
        success: false,
        error: '用户不存在',
        code: 'USER_NOT_FOUND'
      });
    }
    
    res.json({
      success: true,
      data: usersResult.rows[0]
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
    let paramIndex = 1;
    
    if (nickname) {
      updates.push(`nickname = $${paramIndex}`);
      values.push(nickname);
      paramIndex++;
    }
    if (avatar) {
      updates.push(`avatar = $${paramIndex}`);
      values.push(avatar);
      paramIndex++;
    }
    if (language) {
      updates.push(`language = $${paramIndex}`);
      values.push(language);
      paramIndex++;
    }
    
    if (updates.length === 0) {
      return res.status(400).json({
        success: false,
        error: '没有要更新的字段',
        code: 'NO_FIELDS_TO_UPDATE'
      });
    }
    
    values.push(req.user.id);
    
    await req.db.query(
      `UPDATE users SET ${updates.join(', ')} WHERE id = $${paramIndex}`,
      values
    );
    
    // 获取更新后的用户信息
    const usersResult = await req.db.query(
      'SELECT id, nickname, avatar, phone, language FROM users WHERE id = $1',
      [req.user.id]
    );
    
    res.json({
      success: true,
      data: usersResult.rows[0]
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
    // BUG-001, BUG-002 修复: 使用统一的分页校验
    const pagination = validatePagination(req.query);
    if (pagination.error) {
      return res.status(400).json(pagination.error);
    }
    const { page, pageSize, offset } = pagination;
    
    const language = req.user.language || config.defaultLanguage;
    const nameField = language === 'zh-TW' ? 'r.name_zh_tw' : 
                      language === 'en' ? 'r.name_en' : 'r.name_zh_cn';
    
    // 获取收藏列表
    const favoritesResult = await req.db.query(
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
      WHERE f.user_id = $1 AND r.status = 1
      ORDER BY f.created_at DESC
      LIMIT $2 OFFSET $3`,
      [req.user.id, pageSize, offset]
    );
    const favorites = favoritesResult.rows;
    
    // 获取总数
    const countResult = await req.db.query(
      'SELECT COUNT(*) as total FROM favorites WHERE user_id = $1',
      [req.user.id]
    );
    const total = parseInt(countResult.rows[0].total);
    
    res.json({
      success: true,
      data: buildPaginationResponse(favorites, total, page, pageSize)
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
    // BUG-001, BUG-002 修复: 使用统一的分页校验
    const pagination = validatePagination(req.query);
    if (pagination.error) {
      return res.status(400).json(pagination.error);
    }
    const { page, pageSize, offset } = pagination;
    
    const language = req.user.language || config.defaultLanguage;
    const nameField = language === 'zh-TW' ? 'r.name_zh_tw' : 
                      language === 'en' ? 'r.name_en' : 'r.name_zh_cn';
    
    // 获取浏览历史
    const historyResult = await req.db.query(
      `SELECT 
        h.id,
        h.viewed_at,
        r.id as recipe_id,
        ${nameField} as name,
        r.cover_image,
        r.rating
      FROM user_history h
      JOIN recipes r ON h.recipe_id = r.id
      WHERE h.user_id = $1 AND r.status = 1
      ORDER BY h.viewed_at DESC
      LIMIT $2 OFFSET $3`,
      [req.user.id, pageSize, offset]
    );
    const history = historyResult.rows;
    
    // 获取总数
    const countResult = await req.db.query(
      'SELECT COUNT(*) as total FROM user_history WHERE user_id = $1',
      [req.user.id]
    );
    const total = parseInt(countResult.rows[0].total);
    
    res.json({
      success: true,
      data: buildPaginationResponse(history, total, page, pageSize)
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
    await req.db.query(
      'DELETE FROM user_history WHERE user_id = $1',
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
