/**
 * 评论路由
 * PRD 3.4 评论系统
 */

const express = require('express');
const router = express.Router();
const { authenticate, optionalAuth } = require('../middleware/auth');
const config = require('../config');

/**
 * @GET /api/v1/comments
 * 获取评论列表
 */
router.get('/', async (req, res) => {
  try {
    const { recipeId } = req.query;
    const page = parseInt(req.query.page) || 1;
    const pageSize = Math.min(parseInt(req.query.pageSize) || 20, config.pagination.maxPageSize);
    const offset = (page - 1) * pageSize;
    
    if (!recipeId) {
      return res.status(400).json({
        success: false,
        error: '缺少recipeId参数',
        code: 'MISSING_RECIPE_ID'
      });
    }
    
    // 查询评论列表
    const [comments] = await req.db.execute(
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
      WHERE c.recipe_id = ? AND c.status = 1 AND c.parent_id IS NULL
      ORDER BY c.created_at DESC
      LIMIT ? OFFSET ?`,
      [recipeId, pageSize, offset]
    );
    
    // 获取总数
    const [countResult] = await req.db.execute(
      'SELECT COUNT(*) as total FROM comments WHERE recipe_id = ? AND status = 1 AND parent_id IS NULL',
      [recipeId]
    );
    
    res.json({
      success: true,
      data: {
        list: comments,
        pagination: {
          page,
          pageSize,
          total: countResult[0].total,
          totalPages: Math.ceil(countResult[0].total / pageSize)
        }
      }
    });
  } catch (error) {
    console.error('Get comments error:', error);
    res.status(500).json({
      success: false,
      error: '获取评论列表失败',
      code: 'GET_COMMENTS_FAILED'
    });
  }
});

/**
 * @POST /api/v1/comments
 * 发表评论
 */
router.post('/', authenticate, async (req, res) => {
  try {
    const { recipeId, content, rating, images, parentId } = req.body;
    
    if (!recipeId || !content) {
      return res.status(400).json({
        success: false,
        error: '缺少必要参数',
        code: 'MISSING_PARAMS'
      });
    }
    
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
    
    // 插入评论
    const [result] = await req.db.execute(
      `INSERT INTO comments (recipe_id, user_id, content, rating, images, parent_id, status) 
       VALUES (?, ?, ?, ?, ?, ?, 0)`,
      [recipeId, req.user.id, content, rating || null, images ? JSON.stringify(images) : null, parentId || null]
    );
    
    // 更新配方评论数
    await req.db.execute(
      'UPDATE recipes SET comment_count = comment_count + 1 WHERE id = ?',
      [recipeId]
    );
    
    // 如果有父评论，更新回复数
    if (parentId) {
      await req.db.execute(
        'UPDATE comments SET reply_count = reply_count + 1 WHERE id = ?',
        [parentId]
      );
    }
    
    // 更新评分
    if (rating) {
      const [ratingResult] = await req.db.execute(
        'SELECT AVG(rating) as avg_rating FROM comments WHERE recipe_id = ? AND rating IS NOT NULL AND status = 1',
        [recipeId]
      );
      await req.db.execute(
        'UPDATE recipes SET rating = ? WHERE id = ?',
        [ratingResult[0].avg_rating.toFixed(1), recipeId]
      );
    }
    
    res.json({
      success: true,
      data: {
        id: result.insertId,
        content,
        rating,
        status: 0,
        created_at: new Date()
      }
    });
  } catch (error) {
    console.error('Create comment error:', error);
    res.status(500).json({
      success: false,
      error: '发表评论失败',
      code: 'CREATE_COMMENT_FAILED'
    });
  }
});

/**
 * @DELETE /api/v1/comments/:id
 * 删除评论
 */
router.delete('/:id', authenticate, async (req, res) => {
  try {
    const commentId = req.params.id;
    
    // 检查评论是否存在且属于当前用户
    const [comments] = await req.db.execute(
      'SELECT id, recipe_id, parent_id FROM comments WHERE id = ? AND user_id = ?',
      [commentId, req.user.id]
    );
    
    if (comments.length === 0) {
      return res.status(404).json({
        success: false,
        error: '评论不存在或无权限删除',
        code: 'COMMENT_NOT_FOUND'
      });
    }
    
    const comment = comments[0];
    
    // 删除评论
    await req.db.execute('DELETE FROM comments WHERE id = ?', [commentId]);
    
    // 更新配方评论数
    await req.db.execute(
      'UPDATE recipes SET comment_count = comment_count - 1 WHERE id = ?',
      [comment.recipe_id]
    );
    
    // 如果有父评论，更新回复数
    if (comment.parent_id) {
      await req.db.execute(
        'UPDATE comments SET reply_count = reply_count - 1 WHERE id = ?',
        [comment.parent_id]
      );
    }
    
    res.json({
      success: true,
      data: null
    });
  } catch (error) {
    console.error('Delete comment error:', error);
    res.status(500).json({
      success: false,
      error: '删除评论失败',
      code: 'DELETE_COMMENT_FAILED'
    });
  }
});

module.exports = router;
