/**
 * 内容路由
 * PRD 3.5 信息流系统
 */

const express = require('express');
const router = express.Router();
const config = require('../config');

/**
 * @GET /api/v1/contents
 * 获取内容列表
 */
router.get('/', async (req, res) => {
  try {
    const page = parseInt(req.query.page) || 1;
    const pageSize = Math.min(parseInt(req.query.pageSize) || 20, config.pagination.maxPageSize);
    const offset = (page - 1) * pageSize;
    
    const { source, contentType } = req.query;
    
    let whereClause = 'WHERE status = 1';
    const params = [];
    
    if (source) {
      whereClause += ' AND source = ?';
      params.push(source);
    }
    
    if (contentType) {
      whereClause += ' AND content_type = ?';
      params.push(contentType);
    }
    
    const [contents] = await req.db.execute(
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
      LIMIT ? OFFSET ?`,
      [...params, pageSize, offset]
    );
    
    // 获取总数
    const [countResult] = await req.db.execute(
      `SELECT COUNT(*) as total FROM contents ${whereClause}`,
      params
    );
    
    res.json({
      success: true,
      data: {
        list: contents,
        pagination: {
          page,
          pageSize,
          total: countResult[0].total,
          totalPages: Math.ceil(countResult[0].total / pageSize)
        }
      }
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
    
    const [contents] = await req.db.execute(
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
      WHERE id = ? AND status = 1`,
      [contentId]
    );
    
    if (contents.length === 0) {
      return res.status(404).json({
        success: false,
        error: '内容不存在',
        code: 'CONTENT_NOT_FOUND'
      });
    }
    
    // 更新浏览数
    await req.db.execute(
      'UPDATE contents SET view_count = view_count + 1 WHERE id = ?',
      [contentId]
    );
    
    res.json({
      success: true,
      data: contents[0]
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
