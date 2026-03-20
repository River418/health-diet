/**
 * 配方路由
 * PRD 3.3 配方系统 / 3.3.3 配方收藏
 */

const express = require('express');
const router = express.Router();
const { authenticate, optionalAuth } = require('../middleware/auth');
const config = require('../config');
const { validatePagination, buildPaginationResponse } = require('../utils/pagination');

/**
 * @GET /api/v1/recipes
 * 获取配方列表
 */
router.get('/', optionalAuth, async (req, res) => {
  try {
    // BUG-001, BUG-002 修复: 使用统一的分页校验
    const pagination = validatePagination(req.query);
    if (pagination.error) {
      return res.status(400).json(pagination.error);
    }
    const { page, pageSize, offset } = pagination;
    
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
    
    // 人群筛选 (PostgreSQL JSONB 操作符)
    if (crowd) {
      whereClause += ' AND r.crowd_tags @> $' + (params.length + 1);
      params.push(JSON.stringify([crowd]));
    }
    
    // 功效筛选
    if (efficacy) {
      whereClause += ' AND r.efficacy_tags @> $' + (params.length + 1);
      params.push(JSON.stringify([efficacy]));
    }
    
    // 节气筛选
    if (solarTerm) {
      whereClause += ' AND r.solar_term_tags @> $' + (params.length + 1);
      params.push(JSON.stringify([solarTerm]));
    }
    
    // 关键词搜索
    if (keyword) {
      whereClause += ` AND (${nameField} ILIKE $${params.length + 1} OR r.description_zh_cn ILIKE $${params.length + 2})`;
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
    const query = `
      SELECT 
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
      LIMIT $${params.length + 1} OFFSET $${params.length + 2}
    `;
    const recipesResult = await req.db.query(query, [...params, pageSize, offset]);
    const recipes = recipesResult.rows;
    
    // 获取总数
    const countQuery = `SELECT COUNT(*) as total FROM recipes r ${whereClause}`;
    const countResult = await req.db.query(countQuery, params);
    const total = parseInt(countResult.rows[0].total);
    
    // BUG-001 修复: 当page大于totalPages时，返回空列表而不是错误
    res.json({
      success: true,
      data: buildPaginationResponse(recipes, total, page, pageSize)
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
    const recipesResult = await req.db.query(
      `SELECT
        r.id,
        ${nameField} as name,
        ${descField} as description,
        r.cover_image,
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
      WHERE r.id = $1 AND r.status = 1`,
      [recipeId]
    );
    
    if (recipesResult.rows.length === 0) {
      return res.status(404).json({
        success: false,
        error: '配方不存在',
        code: 'RECIPE_NOT_FOUND'
      });
    }
    
    const recipe = recipesResult.rows[0];
    
    // 查询食材
    const ingredientsResult = await req.db.query(
      `SELECT 
        id,
        ${language === 'zh-TW' ? 'name_zh_tw' : language === 'en' ? 'name_en' : 'name_zh_cn'} as name,
        amount,
        image,
        sort_order
      FROM recipe_ingredients
      WHERE recipe_id = $1
      ORDER BY sort_order`,
      [recipeId]
    );
    const ingredients = ingredientsResult.rows;
    
    // 查询步骤
    const stepsResult = await req.db.query(
      `SELECT 
        id,
        step_order,
        ${language === 'zh-TW' ? 'description_zh_tw' : language === 'en' ? 'description_en' : 'description_zh_cn'} as description,
        image
      FROM recipe_steps
      WHERE recipe_id = $1
      ORDER BY step_order`,
      [recipeId]
    );
    const steps = stepsResult.rows;
    
    // 检查是否已收藏
    let isFavorited = false;
    if (userId) {
      const favoritesResult = await req.db.query(
        'SELECT id FROM favorites WHERE user_id = $1 AND recipe_id = $2',
        [userId, recipeId]
      );
      isFavorited = favoritesResult.rows.length > 0;
      
      // 记录浏览历史 (PostgreSQL UPSERT: ON CONFLICT)
      await req.db.query(
        `INSERT INTO user_history (user_id, recipe_id, viewed_at) 
         VALUES ($1, $2, CURRENT_TIMESTAMP)
         ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = CURRENT_TIMESTAMP`,
        [userId, recipeId]
      );
    }
    
    // 更新浏览数
    await req.db.query(
      'UPDATE recipes SET view_count = view_count + 1 WHERE id = $1',
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
    const recipesResult = await req.db.query(
      'SELECT id FROM recipes WHERE id = $1 AND status = 1',
      [recipeId]
    );
    
    if (recipesResult.rows.length === 0) {
      return res.status(404).json({
        success: false,
        error: '配方不存在',
        code: 'RECIPE_NOT_FOUND'
      });
    }
    
    // 检查是否已收藏
    const existingResult = await req.db.query(
      'SELECT id FROM favorites WHERE user_id = $1 AND recipe_id = $2',
      [userId, recipeId]
    );
    
    if (existingResult.rows.length > 0) {
      return res.json({
        success: true,
        data: { isFavorited: true }
      });
    }
    
    // 添加收藏
    await req.db.query(
      'INSERT INTO favorites (user_id, recipe_id) VALUES ($1, $2)',
      [userId, recipeId]
    );
    
    // 更新配方收藏数
    await req.db.query(
      'UPDATE recipes SET favorite_count = favorite_count + 1 WHERE id = $1',
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
    const result = await req.db.query(
      'DELETE FROM favorites WHERE user_id = $1 AND recipe_id = $2',
      [userId, recipeId]
    );
    
    if (result.rowCount > 0) {
      // 更新配方收藏数
      await req.db.query(
        'UPDATE recipes SET favorite_count = favorite_count - 1 WHERE id = $1',
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

/**
 * @GET /api/v1/recipes/:id/comments
 * 获取配方评论列表
 */
router.get('/:id/comments', async (req, res) => {
  try {
    const recipeId = req.params.id;
    const pagination = validatePagination(req.query);
    if (pagination.error) {
      return res.status(400).json(pagination.error);
    }
    const { page, pageSize, offset } = pagination;

    // 检查配方是否存在
    const recipeResult = await req.db.query(
      'SELECT id FROM recipes WHERE id = $1 AND status = 1',
      [recipeId]
    );

    if (recipeResult.rows.length === 0) {
      return res.status(404).json({
        success: false,
        error: '配方不存在',
        code: 'RECIPE_NOT_FOUND'
      });
    }

    // 查询评论列表
    const commentsResult = await req.db.query(
      `SELECT
        c.id,
        c.content,
        c.rating,
        c.images,
        c.likes,
        c.reply_count,
        c.created_at,
        u.id as user_id,
        u.nickname,
        u.avatar
      FROM comments c
      JOIN users u ON c.user_id = u.id
      WHERE c.recipe_id = $1 AND c.status = 1 AND c.parent_id IS NULL
      ORDER BY c.created_at DESC
      LIMIT $2 OFFSET $3`,
      [recipeId, pageSize, offset]
    );
    const comments = commentsResult.rows;

    // 获取总数
    const countResult = await req.db.query(
      'SELECT COUNT(*) as total FROM comments WHERE recipe_id = $1 AND status = 1 AND parent_id IS NULL',
      [recipeId]
    );
    const total = parseInt(countResult.rows[0].total);

    res.json({
      success: true,
      data: buildPaginationResponse(comments, total, page, pageSize)
    });
  } catch (error) {
    console.error('Get recipe comments error:', error);
    res.status(500).json({
      success: false,
      error: '获取评论列表失败',
      code: 'GET_COMMENTS_FAILED'
    });
  }
});

/**
 * @GET /api/v1/recipes/:id/related
 * 获取相关配方推荐
 */
router.get('/:id/related', async (req, res) => {
  try {
    const recipeId = req.params.id;
    const limit = Math.min(parseInt(req.query.limit) || 6, 20);

    // 获取当前配方的分类和功效标签
    const recipeResult = await req.db.query(
      `SELECT crowd_tags, efficacy_tags
       FROM recipes
       WHERE id = $1 AND status = 1`,
      [recipeId]
    );

    if (recipeResult.rows.length === 0) {
      return res.status(404).json({
        success: false,
        error: '配方不存在',
        code: 'RECIPE_NOT_FOUND'
      });
    }

    const { crowd_tags, efficacy_tags } = recipeResult.rows[0];

    const language = req.user?.language || config.defaultLanguage;
    const nameField = language === 'zh-TW' ? 'r.name_zh_tw' :
                      language === 'en' ? 'r.name_en' : 'r.name_zh_cn';

    // 提取标签数组用于匹配
    const crowdTagList = crowd_tags || [];
    const efficacyTagList = efficacy_tags || [];

    // 查询相关配方：同分类或同功效，排除当前配方
    // 使用 jsonb_array_elements 来匹配任意一个标签
    const relatedResult = await req.db.query(
      `SELECT DISTINCT
        r.id,
        ${nameField} as name,
        r.cover_image,
        r.crowd_tags,
        r.efficacy_tags,
        r.rating,
        r.view_count,
        r.favorite_count,
        (
          CASE WHEN EXISTS (
            SELECT 1 FROM jsonb_array_elements_text(r.crowd_tags) ct
            WHERE ct = ANY($2::text[])
          ) THEN 2 ELSE 0 END +
          CASE WHEN EXISTS (
            SELECT 1 FROM jsonb_array_elements_text(r.efficacy_tags) et
            WHERE et = ANY($3::text[])
          ) THEN 1 ELSE 0 END
        ) as relevance_score
      FROM recipes r
      WHERE r.id != $1
        AND r.status = 1
        AND (
          EXISTS (
            SELECT 1 FROM jsonb_array_elements_text(r.crowd_tags) ct
            WHERE ct = ANY($2::text[])
          )
          OR EXISTS (
            SELECT 1 FROM jsonb_array_elements_text(r.efficacy_tags) et
            WHERE et = ANY($3::text[])
          )
        )
      ORDER BY relevance_score DESC, r.rating DESC, r.view_count DESC
      LIMIT $4`,
      [recipeId, crowdTagList, efficacyTagList, limit]
    );

    res.json({
      success: true,
      data: relatedResult.rows
    });
  } catch (error) {
    console.error('Get related recipes error:', error);
    res.status(500).json({
      success: false,
      error: '获取相关配方失败',
      code: 'GET_RELATED_FAILED'
    });
  }
});

module.exports = router;
