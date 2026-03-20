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
    
    const { type, isActive, keyword } = req.query;
    
    let whereClause = 'WHERE 1=1';
    const params = [];
    let paramIndex = 1;
    
    if (type) {
      whereClause += ` AND type = $${paramIndex}`;
      params.push(type);
      paramIndex++;
    }
    
    if (isActive !== undefined) {
      whereClause += ` AND is_active = $${paramIndex}`;
      params.push(isActive === '1' || isActive === 'true' ? 1 : 0);
      paramIndex++;
    }
    
    if (keyword) {
      whereClause += ` AND (name_zh_cn ILIKE $${paramIndex} OR name_en ILIKE $${paramIndex} OR name_zh_tw ILIKE $${paramIndex})`;
      params.push(`%${keyword}%`);
      paramIndex++;
    }
    
    const result = await req.db.query(
      `SELECT 
        id, name_zh_cn, name_en, name_zh_tw, type, icon, sort_order, is_active
      FROM categories
      ${whereClause}
      ORDER BY sort_order ASC, id DESC
      LIMIT $${paramIndex} OFFSET $${paramIndex + 1}`,
      [...params, pageSize, offset]
    );
    
    const countResult = await req.db.query(
      `SELECT COUNT(*) as total FROM categories ${whereClause}`,
      params
    );
    const total = parseInt(countResult.rows[0].total);
    
    res.json({
      success: true,
      data: buildPaginationResponse(result.rows, total, page, pageSize)
    });
  } catch (error) {
    console.error('Get categories error:', error);
    res.status(500).json({
      success: false,
      error: '获取分类列表失败',
      code: 'GET_CATEGORIES_FAILED'
    });
  }
});

router.get('/:id', async (req, res) => {
  try {
    const { id } = req.params;
    
    const result = await req.db.query(
      `SELECT id, name_zh_cn, name_en, name_zh_tw, type, icon, sort_order, is_active
       FROM categories WHERE id = $1`,
      [id]
    );
    
    if (result.rows.length === 0) {
      return res.status(404).json({
        success: false,
        error: '分类不存在',
        code: 'CATEGORY_NOT_FOUND'
      });
    }
    
    res.json({
      success: true,
      data: result.rows[0]
    });
  } catch (error) {
    console.error('Get category error:', error);
    res.status(500).json({
      success: false,
      error: '获取分类详情失败',
      code: 'GET_CATEGORY_FAILED'
    });
  }
});

router.post('/', async (req, res) => {
  try {
    const { name_zh_cn, name_en, name_zh_tw, type, icon, sort_order } = req.body;
    
    if (!name_zh_cn || !type) {
      return res.status(400).json({
        success: false,
        error: '分类名称和类型为必填项',
        code: 'MISSING_REQUIRED_FIELDS'
      });
    }
    
    const result = await req.db.query(
      `INSERT INTO categories (name_zh_cn, name_en, name_zh_tw, type, icon, sort_order, is_active)
       VALUES ($1, $2, $3, $4, $5, $6, 1)
       RETURNING id, name_zh_cn, name_en, name_zh_tw, type, icon, sort_order, is_active`,
      [name_zh_cn, name_en || '', name_zh_tw || '', type, icon || '', sort_order || 0]
    );
    
    res.status(201).json({
      success: true,
      data: result.rows[0]
    });
  } catch (error) {
    console.error('Create category error:', error);
    res.status(500).json({
      success: false,
      error: '创建分类失败',
      code: 'CREATE_CATEGORY_FAILED'
    });
  }
});

router.put('/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const { name_zh_cn, name_en, name_zh_tw, type, icon, sort_order, is_active } = req.body;
    
    const existingResult = await req.db.query(
      'SELECT id FROM categories WHERE id = $1',
      [id]
    );
    
    if (existingResult.rows.length === 0) {
      return res.status(404).json({
        success: false,
        error: '分类不存在',
        code: 'CATEGORY_NOT_FOUND'
      });
    }
    
    const updateFields = [];
    const params = [];
    let paramIndex = 1;
    
    if (name_zh_cn !== undefined) {
      updateFields.push(`name_zh_cn = $${paramIndex}`);
      params.push(name_zh_cn);
      paramIndex++;
    }
    if (name_en !== undefined) {
      updateFields.push(`name_en = $${paramIndex}`);
      params.push(name_en);
      paramIndex++;
    }
    if (name_zh_tw !== undefined) {
      updateFields.push(`name_zh_tw = $${paramIndex}`);
      params.push(name_zh_tw);
      paramIndex++;
    }
    if (type !== undefined) {
      updateFields.push(`type = $${paramIndex}`);
      params.push(type);
      paramIndex++;
    }
    if (icon !== undefined) {
      updateFields.push(`icon = $${paramIndex}`);
      params.push(icon);
      paramIndex++;
    }
    if (sort_order !== undefined) {
      updateFields.push(`sort_order = $${paramIndex}`);
      params.push(sort_order);
      paramIndex++;
    }
    if (is_active !== undefined) {
      updateFields.push(`is_active = $${paramIndex}`);
      params.push(is_active ? 1 : 0);
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
      `UPDATE categories SET ${updateFields.join(', ')} WHERE id = $${paramIndex}
       RETURNING id, name_zh_cn, name_en, name_zh_tw, type, icon, sort_order, is_active`,
      params
    );
    
    res.json({
      success: true,
      data: result.rows[0]
    });
  } catch (error) {
    console.error('Update category error:', error);
    res.status(500).json({
      success: false,
      error: '更新分类失败',
      code: 'UPDATE_CATEGORY_FAILED'
    });
  }
});

router.delete('/:id', async (req, res) => {
  try {
    const { id } = req.params;
    
    const result = await req.db.query(
      'DELETE FROM categories WHERE id = $1 RETURNING id',
      [id]
    );
    
    if (result.rows.length === 0) {
      return res.status(404).json({
        success: false,
        error: '分类不存在',
        code: 'CATEGORY_NOT_FOUND'
      });
    }
    
    res.json({
      success: true,
      data: { id: result.rows[0].id }
    });
  } catch (error) {
    console.error('Delete category error:', error);
    res.status(500).json({
      success: false,
      error: '删除分类失败',
      code: 'DELETE_CATEGORY_FAILED'
    });
  }
});

module.exports = router;