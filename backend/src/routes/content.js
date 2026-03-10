/**
 * 内容路由
 * PRD 3.5 信息流系统
 */

const express = require('express');
const router = express.Router();
const config = require('../config');
const { validatePagination, buildPaginationResponse } = require('../utils/pagination');

/**
 * @GET /api/v1/contents
 * 获取内容列表
 */
router.get('/', async (req, res) => {
  try {
    // BUG-001, BUG-002 修复: 使用统一的分页校验
    const pagination = validatePagination(req.query);
    if (pagination.error) {
      return res.status(400).json(pagination.error);
    }
    const { page, pageSize, offset } = pagination;
    
    const { source, contentType } = req.query;
    
    let whereClause = 'WHERE status = 1';
    const params = [];
    let paramIndex = 1;
    
    if (source) {
      whereClause += ` AND source = $${paramIndex}`;
      params.push(source);
      paramIndex++;
    }
    
    if (contentType) {
      whereClause += ` AND content_type = $${paramIndex}`;
      params.push(contentType);
      paramIndex++;
    }
    
    const contentsResult = await req.db.query(
      `SELECT 
        id,
        title,
        source,
        source_url,
        cover_image,
        author,
        content_type,
        tags,
        view_count,
        published_at
      FROM contents
      ${whereClause}
      ORDER BY published_at DESC, created_at DESC
      LIMIT $${paramIndex} OFFSET $${paramIndex + 1}`,
      [...params, pageSize, offset]
    );
    const contents = contentsResult.rows;
    
    // 获取总数
    const countResult = await req.db.query(
      `SELECT COUNT(*) as total FROM contents ${whereClause}`,
      params
    );
    const total = parseInt(countResult.rows[0].total);
    
    res.json({
      success: true,
      data: buildPaginationResponse(contents, total, page, pageSize)
    });
  } catch (error) {
    console.error('Get contents error:', error);
    res.status(500).json({
      success: false,
      error: '获取内容列表失败',
      code: 'GET_CONTENTS_FAILED'
    });
  }
});

/**
 * @GET /api/v1/contents/:id
 * 获取内容详情
 */
router.get('/:id', async (req, res) => {
  try {
    const contentId = req.params.id;
    
    const contentsResult = await req.db.query(
      `SELECT 
        id,
        title,
        source,
        source_url,
        cover_image,
        author,
        content_type,
        tags,
        view_count,
        published_at,
        created_at
      FROM contents
      WHERE id = $1 AND status = 1`,
      [contentId]
    );
    
    if (contentsResult.rows.length === 0) {
      return res.status(404).json({
        success: false,
        error: '内容不存在',
        code: 'CONTENT_NOT_FOUND'
      });
    }
    
    // 更新浏览数
    await req.db.query(
      'UPDATE contents SET view_count = view_count + 1 WHERE id = $1',
      [contentId]
    );
    
    res.json({
      success: true,
      data: contentsResult.rows[0]
    });
  } catch (error) {
    console.error('Get content detail error:', error);
    res.status(500).json({
      success: false,
      error: '获取内容详情失败',
      code: 'GET_CONTENT_DETAIL_FAILED'
    });
  }
});

module.exports = router;
