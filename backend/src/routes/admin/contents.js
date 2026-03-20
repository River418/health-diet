const express = require('express');
const router = express.Router();
const { validatePagination, buildPaginationResponse } = require('../../utils/pagination');

router.get('/', async (req, res) => {
  try {
    const pagination = validatePagination(req.query);
    if (pagination.error) {
      return res.status(400).json(pagination.error);
    }
    const { page, pageSize, offset } = pagination;
    
    const { source, contentType, status, keyword, sort } = req.query;
    
    let whereClause = 'WHERE 1=1';
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
    
    if (status !== undefined) {
      whereClause += ` AND status = $${paramIndex}`;
      params.push(parseInt(status));
      paramIndex++;
    }
    
    if (keyword) {
      whereClause += ` AND (title ILIKE $${paramIndex} OR author ILIKE $${paramIndex})`;
      params.push(`%${keyword}%`);
      paramIndex++;
    }
    
    // 支持排序参数
    let orderBy = 'ORDER BY created_at DESC';
    if (sort === 'published') {
      orderBy = 'ORDER BY published_at DESC NULLS LAST, created_at DESC';
    } else if (sort === 'views') {
      orderBy = 'ORDER BY view_count DESC, created_at DESC';
    }
    
    const result = await req.db.query(
      `SELECT 
        id, title, source, source_url, cover_image, author, content_type, tags, status, 
        view_count, published_at, created_at, updated_at
      FROM contents
      ${whereClause}
      ${orderBy}
      LIMIT $${paramIndex} OFFSET $${paramIndex + 1}`,
      [...params, pageSize, offset]
    );
    
    const countResult = await req.db.query(
      `SELECT COUNT(*) as total FROM contents ${whereClause}`,
      params
    );
    const total = parseInt(countResult.rows[0].total);
    
    res.json({
      success: true,
      data: buildPaginationResponse(result.rows, total, page, pageSize)
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

router.get('/:id', async (req, res) => {
  try {
    const { id } = req.params;
    
    const result = await req.db.query(
      `SELECT id, title, source, source_url, cover_image, author, content_type, tags, status, 
              view_count, published_at, created_at, updated_at
       FROM contents WHERE id = $1`,
      [id]
    );
    
    if (result.rows.length === 0) {
      return res.status(404).json({
        success: false,
        error: '内容不存在',
        code: 'CONTENT_NOT_FOUND'
      });
    }
    
    res.json({
      success: true,
      data: result.rows[0]
    });
  } catch (error) {
    console.error('Get content error:', error);
    res.status(500).json({
      success: false,
      error: '获取内容详情失败',
      code: 'GET_CONTENT_FAILED'
    });
  }
});

router.post('/', async (req, res) => {
  try {
    const { title, source, source_url, cover_image, author, content_type, tags, status, published_at } = req.body;
    
    if (!title) {
      return res.status(400).json({
        success: false,
        error: '标题为必填项',
        code: 'MISSING_TITLE'
      });
    }
    
    const result = await req.db.query(
      `INSERT INTO contents (title, source, source_url, cover_image, author, content_type, tags, status, published_at)
       VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)
       RETURNING id, title, source, source_url, cover_image, author, content_type, tags, status, published_at, created_at`,
      [title, source || '', source_url || '', cover_image || '', author || '', 
       content_type || 'article', tags || [], status || 1, published_at || null]
    );
    
    res.status(201).json({
      success: true,
      data: result.rows[0]
    });
  } catch (error) {
    console.error('Create content error:', error);
    res.status(500).json({
      success: false,
      error: '创建内容失败',
      code: 'CREATE_CONTENT_FAILED'
    });
  }
});

router.put('/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const { title, source, source_url, cover_image, author, content_type, tags, status, published_at } = req.body;
    
    const existingResult = await req.db.query(
      'SELECT id FROM contents WHERE id = $1',
      [id]
    );
    
    if (existingResult.rows.length === 0) {
      return res.status(404).json({
        success: false,
        error: '内容不存在',
        code: 'CONTENT_NOT_FOUND'
      });
    }
    
    const updateFields = [];
    const params = [];
    let paramIndex = 1;
    
    if (title !== undefined) {
      updateFields.push(`title = $${paramIndex}`);
      params.push(title);
      paramIndex++;
    }
    if (source !== undefined) {
      updateFields.push(`source = $${paramIndex}`);
      params.push(source);
      paramIndex++;
    }
    if (source_url !== undefined) {
      updateFields.push(`source_url = $${paramIndex}`);
      params.push(source_url);
      paramIndex++;
    }
    if (cover_image !== undefined) {
      updateFields.push(`cover_image = $${paramIndex}`);
      params.push(cover_image);
      paramIndex++;
    }
    if (author !== undefined) {
      updateFields.push(`author = $${paramIndex}`);
      params.push(author);
      paramIndex++;
    }
    if (content_type !== undefined) {
      updateFields.push(`content_type = $${paramIndex}`);
      params.push(content_type);
      paramIndex++;
    }
    if (tags !== undefined) {
      updateFields.push(`tags = $${paramIndex}`);
      params.push(tags);
      paramIndex++;
    }
    if (status !== undefined) {
      updateFields.push(`status = $${paramIndex}`);
      params.push(status);
      paramIndex++;
    }
    if (published_at !== undefined) {
      updateFields.push(`published_at = $${paramIndex}`);
      params.push(published_at);
      paramIndex++;
    }
    
    if (updateFields.length === 0) {
      return res.status(400).json({
        success: false,
        error: '没有要更新的字段',
        code: 'NO_UPDATE_FIELDS'
      });
    }
    
    params.push(id);
    
    const result = await req.db.query(
      `UPDATE contents SET ${updateFields.join(', ')} WHERE id = $${paramIndex}
       RETURNING id, title, source, source_url, cover_image, author, content_type, tags, status, published_at, updated_at`,
      params
    );
    
    res.json({
      success: true,
      data: result.rows[0]
    });
  } catch (error) {
    console.error('Update content error:', error);
    res.status(500).json({
      success: false,
      error: '更新内容失败',
      code: 'UPDATE_CONTENT_FAILED'
    });
  }
});

router.delete('/:id', async (req, res) => {
  try {
    const { id } = req.params;
    
    const result = await req.db.query(
      'DELETE FROM contents WHERE id = $1 RETURNING id',
      [id]
    );
    
    if (result.rows.length === 0) {
      return res.status(404).json({
        success: false,
        error: '内容不存在',
        code: 'CONTENT_NOT_FOUND'
      });
    }
    
    res.json({
      success: true,
      data: { id: result.rows[0].id }
    });
  } catch (error) {
    console.error('Delete content error:', error);
    res.status(500).json({
      success: false,
      error: '删除内容失败',
      code: 'DELETE_CONTENT_FAILED'
    });
  }
});

module.exports = router;