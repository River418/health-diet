/**
 * 配方路由
 * PRD 3.3 配方系统 / 3.3.3 配方收藏
 */

const express = require('express');
const router = express.Router();
const { authenticate, optionalAuth } = require('../middleware/auth');
const config = require('../config');

/**
 * @GET /api/v1/recipes
 * 获取配方列表
 */
router.get('/', optionalAuth, async (req, res) => {
  try {
    const page = parseInt(req.query.page) || 1;
    const pageSize = Math.min(parseInt(req.query.pageSize) || 20, config.pagination.maxPageSize);
    const offset = (page - 1) * pageSize;
    
    const { 
      crowd, 
      efficacy, 
      solarTerm, 
      keyword,
      sortBy = 'recommend'
    } = req.query;
    
    const language = req.user?.language || config.defaultLanguage;
    const nameField = language === 'zh-TW' ? 'r.name_zh_tw' : 
                      language === 'en' ? 'r.name_en' : 'r.name_zh_cn';
    
    let whereClause = 'WHERE r.status = 1';
    const params = [];
    
    // 人群筛选
    if (crowd) {
      whereClause += ' AND JSON_CONTAINS(r.crowd_tags, ?)';
      params.push(`"${crowd}"`);
    }
    
    // 功效筛选
    if (efficacy) {
      whereClause += ' AND JSON_CONTAINS(r.efficacy_tags, ?)';
      params.push(`"${efficacy}"`);
    }
    
    // 节气筛选
    if (solarTerm) {
      whereClause += ' AND JSON_CONTAINS(r.solar_term_tags, ?)';
      params.push(`"${solarTerm}"`);
    }
    
    // 关键词搜索
    if (keyword) {
      whereClause += ` AND (${nameField} LIKE ? OR r.description_zh_cn LIKE ?)`;
      params.push(`%${keyword}%`, `%${keyword}%`);
    }
    
    // 排序
    let orderBy = 'ORDER BY r.created_at DESC';
    switch (sortBy) {
      case 'hot':
        orderBy = 'ORDER BY r.view_count DESC, r.favorite_count DESC';
        break;
      case 'newest':
        orderBy = 'ORDER BY r.created_at DESC';
        break;
      case 'rating':
        orderBy = 'ORDER BY r.rating DESC, r.view_count DESC';
        break;
      default:
        orderBy = 'ORDER BY r.rating DESC, r.view_count DESC, r.created_at DESC';
    }
    
    // 查询配方列表
    const [recipes] = await req.db.execute(
      `SELECT 
        r.id,
        ${nameField} as name,
        r.cover_image,
        r.crowd_tags,
        r.efficacy_tags,
        r.rating,
        r.view_count,
        r.favorite_count,
        r.comment_count
      FROM recipes r
      ${whereClause}
      ${orderBy}
      LIMIT ? OFFSET ?`,
      [...params, pageSize, offset]
    );
    
    // 获取总数
    const [countResult] = await req.db.execute(
      `SELECT COUNT(*) as total FROM recipes r ${whereClause}`,
      params
    );
    
    res.json({
      success: true,
      data: {
        list: recipes,
        pagination: {
          page,
          pageSize,
          total: countResult[0].total,
          totalPages: Math.ceil(countResult[0].total / pageSize)
        }
      }
    });
  } catch (error) {
    console.error('Get recipes error:', error);
    res.status(500).json({
      success: false,
      error: '获取配方列表失败',
      code: 'GET_RECIPES_FAILED'
    });
  }
});

/**
 * @GET /api/v1/recipes/:id
 * 获取配方详情
 */
router.get('/:id', optionalAuth, async (req, res) => {
  try {
    const recipeId = req.params.id;
    const userId = req.user?.id;
    
    const language = req.user?.language || config.defaultLanguage;
    const nameField = language === 'zh-TW' ? 'r.name_zh_tw' : 
                      language === 'en' ? 'r.name_en' : 'r.name_zh_cn';
    const descField = language === 'zh-TW' ? 'r.description_zh_tw' : 
                      language === 'en' ? 'r.description_en' : 'r.description_zh_cn';
    
    // 查询配方详情
    const [recipes] = await req.db.execute(
      `SELECT 
        r.id,
        ${nameField} as name,
        ${descField} as description,
        r.cover_image,
        r.images,
        r.video_url,
        r.video_duration,
        r.crowd_tags,
        r.efficacy_tags,
        r.solar_term_tags,
        r.nutrition,
        r.rating,
        r.view_count,
        r.favorite_count,
        r.comment_count,
        r.created_at
      FROM recipes r
      WHERE r.id = ? AND r.status = 1`,
      [recipeId]
    );
    
    if (recipes.length === 0) {
      return res.status(404).json({
        success: false,
        error: '配方不存在',
        code: 'RECIPE_NOT_FOUND'
      });
    }
    
    const recipe = recipes[0];
    
    // 查询食材
    const [ingredients] = await req.db.execute(
      `SELECT 
        id,
        ${language === 'zh-TW' ? 'name_zh_tw' : language === 'en' ? 'name_en' : 'name_zh_cn'} as name,
        amount,
        image,
        sort_order
      FROM recipe_ingredients
      WHERE recipe_id = ?
      ORDER BY sort_order`,
      [recipeId]
    );
    
    // 查询步骤
    const [steps] = await req.db.execute(
      `SELECT 
        id,
        step_order,
        ${language === 'zh-TW' ? 'description_zh_tw' : language === 'en' ? 'description_en' : 'description_zh_cn'} as description,
        image
      FROM recipe_steps
      WHERE recipe_id = ?
      ORDER BY step_order`,
      [recipeId]
    );
    
    // 检查是否已收藏
    let isFavorited = false;
    if (userId) {
      const [favorites] = await req.db.execute(
        'SELECT id FROM favorites WHERE user_id = ? AND recipe_id = ?',
        [userId, recipeId]
      );
      isFavorited = favorites.length > 0;
      
      // 记录浏览历史
      await req.db.execute(
        `INSERT INTO user_history (user_id, recipe_id, viewed_at) 
         VALUES (?, ?, NOW())
         ON DUPLICATE KEY UPDATE viewed_at = NOW()`,
        [userId, recipeId]
      );
    }
    
    // 更新浏览数（异步）
    await req.db.execute(
      'UPDATE recipes SET view_count = view_count + 1 WHERE id = ?',
      [recipeId]
    );
    
    res.json({
      success: true,
      data: {
        ...recipe,
        ingredients,
        steps,
        isFavorited
      }
    });
  } catch (error) {
    console.error('Get recipe detail error:', error);
    res.status(500).json({
      success: false,
      error: '获取配方详情失败',
      code: 'GET_RECIPE_DETAIL_FAILED'
    });
  }
});

/**
 * @POST /api/v1/recipes/:id/favorite
 * 收藏配方
 */
router.post('/:id/favorite', authenticate, async (req, res) => {
  try {
    const recipeId = req.params.id;
    const userId = req.user.id;
    
    // 检查配方是否存在
    const [recipes] = await req.db.execute(
      'SELECT id FROM recipes WHERE id = ? AND status = 1',
      [recipeId]
    );
    
    if (recipes.length === 0) {
      return res.status(404).json({
        success: false,
        error: '配方不存在',
        code: 'RECIPE_NOT_FOUND'
      });
    }
    
    // 检查是否已收藏
    const [existing] = await req.db.execute(
      'SELECT id FROM favorites WHERE user_id = ? AND recipe_id = ?',
      [userId, recipeId]
    );
    
    if (existing.length > 0) {
      return res.json({
        success: true,
        data: { isFavorited: true }
      });
    }
    
    // 添加收藏
    await req.db.execute(
      'INSERT INTO favorites (user_id, recipe_id) VALUES (?, ?)',
      [userId, recipeId]
    );
    
    // 更新配方收藏数
    await req.db.execute(
      'UPDATE recipes SET favorite_count = favorite_count + 1 WHERE id = ?',
      [recipeId]
    );
    
    res.json({
      success: true,
      data: { isFavorited: true }
    });
  } catch (error) {
    console.error('Favorite recipe error:', error);
    res.status(500).json({
      success: false,
      error: '收藏失败',
      code: 'FAVORITE_FAILED'
    });
  }
});

/**
 * @DELETE /api/v1/recipes/:id/favorite
 * 取消收藏配方
 */
router.delete('/:id/favorite', authenticate, async (req, res) => {
  try {
    const recipeId = req.params.id;
    const userId = req.user.id;
    
    // 删除收藏
    const [result] = await req.db.execute(
      'DELETE FROM favorites WHERE user_id = ? AND recipe_id = ?',
      [userId, recipeId]
    );
    
    if (result.affectedRows > 0) {
      // 更新配方收藏数
      await req.db.execute(
        'UPDATE recipes SET favorite_count = favorite_count - 1 WHERE id = ?',
        [recipeId]
      );
    }
    
    res.json({
      success: true,
      data: { isFavorited: false }
    });
  } catch (error) {
    console.error('Unfavorite recipe error:', error);
    res.status(500).json({
      success: false,
      error: '取消收藏失败',
      code: 'UNFAVORITE_FAILED'
    });
  }
});

module.exports = router;
