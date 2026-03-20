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
    
    const { status, crowd, efficacy, keyword, sort } = req.query;
    
    let whereClause = 'WHERE 1=1';
    const params = [];
    let paramIndex = 1;
    
    if (status !== undefined) {
      whereClause += ` AND status = $${paramIndex}`;
      params.push(parseInt(status));
      paramIndex++;
    }
    
    if (crowd) {
      whereClause += ` AND crowd_tags @> $${paramIndex}`;
      params.push(JSON.stringify([crowd]));
      paramIndex++;
    }
    
    if (efficacy) {
      whereClause += ` AND efficacy_tags @> $${paramIndex}`;
      params.push(JSON.stringify([efficacy]));
      paramIndex++;
    }
    
    if (keyword) {
      whereClause += ` AND (name_zh_cn ILIKE $${paramIndex} OR description_zh_cn ILIKE $${paramIndex})`;
      params.push(`%${keyword}%`);
      paramIndex++;
    }
    
    // 支持排序参数
    let orderBy = 'ORDER BY created_at DESC';
    if (sort === 'views') {
      orderBy = 'ORDER BY view_count DESC, created_at DESC';
    } else if (sort === 'rating') {
      orderBy = 'ORDER BY rating DESC, view_count DESC';
    } else if (sort === 'favorites') {
      orderBy = 'ORDER BY favorite_count DESC, view_count DESC';
    }
    
    const result = await req.db.query(
      `SELECT 
        id, name_zh_cn, name_en, name_zh_tw, cover_image, video_url, 
        crowd_tags, efficacy_tags, solar_term_tags, nutrition,
        rating, view_count, favorite_count, comment_count, status, created_at, updated_at
      FROM recipes
      ${whereClause}
      ${orderBy}
      LIMIT $${paramIndex} OFFSET $${paramIndex + 1}`,
      [...params, pageSize, offset]
    );
    
    const countResult = await req.db.query(
      `SELECT COUNT(*) as total FROM recipes ${whereClause}`,
      params
    );
    const total = parseInt(countResult.rows[0].total);
    
    res.json({
      success: true,
      data: buildPaginationResponse(result.rows, total, page, pageSize)
    });
  } catch (error) {
    console.error('Get recipes error:', error);
    res.status(500).json({
      success: false,
      error: '获取食谱列表失败',
      code: 'GET_RECIPES_FAILED'
    });
  }
});

router.get('/:id', async (req, res) => {
  try {
    const { id } = req.params;
    
    const recipeResult = await req.db.query(
      `SELECT 
        id, name_zh_cn, name_en, name_zh_tw, description_zh_cn, description_en, description_zh_tw,
        cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
        rating, view_count, favorite_count, comment_count, status, created_at, updated_at
       FROM recipes WHERE id = $1`,
      [id]
    );
    
    if (recipeResult.rows.length === 0) {
      return res.status(404).json({
        success: false,
        error: '食谱不存在',
        code: 'RECIPE_NOT_FOUND'
      });
    }
    
    const recipe = recipeResult.rows[0];
    
    const ingredientsResult = await req.db.query(
      `SELECT id, name_zh_cn, name_en, name_zh_tw, amount, image, sort_order
       FROM recipe_ingredients WHERE recipe_id = $1 ORDER BY sort_order`,
      [id]
    );
    recipe.ingredients = ingredientsResult.rows;
    
    const stepsResult = await req.db.query(
      `SELECT id, step_order, description_zh_cn, description_en, description_zh_tw, image
       FROM recipe_steps WHERE recipe_id = $1 ORDER BY step_order`,
      [id]
    );
    recipe.steps = stepsResult.rows;
    
    res.json({
      success: true,
      data: recipe
    });
  } catch (error) {
    console.error('Get recipe error:', error);
    res.status(500).json({
      success: false,
      error: '获取食谱详情失败',
      code: 'GET_RECIPE_FAILED'
    });
  }
});

router.post('/', async (req, res) => {
  try {
    const { 
      name_zh_cn, name_en, name_zh_tw, 
      description_zh_cn, description_en, description_zh_tw,
      cover_image, video_url, video_duration,
      crowd_tags, efficacy_tags, solar_term_tags, nutrition,
      status, ingredients, steps
    } = req.body;
    
    if (!name_zh_cn) {
      return res.status(400).json({
        success: false,
        error: '食谱名称为必填项',
        code: 'MISSING_NAME'
      });
    }
    
    const client = await req.db.connect();
    
    try {
      await client.query('BEGIN');
      
      const recipeResult = await client.query(
        `INSERT INTO recipes (
          name_zh_cn, name_en, name_zh_tw, 
          description_zh_cn, description_en, description_zh_tw,
          cover_image, video_url, video_duration,
          crowd_tags, efficacy_tags, solar_term_tags, nutrition, status
        ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14)
         RETURNING id`,
        [name_zh_cn, name_en || '', name_zh_tw || '',
         description_zh_cn || '', description_en || '', description_zh_tw || '',
         cover_image || '', video_url || '', video_duration || 0,
         crowd_tags || [], efficacy_tags || [], solar_term_tags || [], nutrition || {},
         status || 1]
      );
      
      const recipeId = recipeResult.rows[0].id;
      
      if (ingredients && ingredients.length > 0) {
        for (let i = 0; i < ingredients.length; i++) {
          const ing = ingredients[i];
          await client.query(
            `INSERT INTO recipe_ingredients (recipe_id, name_zh_cn, name_en, name_zh_tw, amount, image, sort_order)
             VALUES ($1, $2, $3, $4, $5, $6, $7)`,
            [recipeId, ing.name_zh_cn || '', ing.name_en || '', ing.name_zh_tw || '', 
             ing.amount || '', ing.image || '', i + 1]
          );
        }
      }
      
      if (steps && steps.length > 0) {
        for (let i = 0; i < steps.length; i++) {
          const step = steps[i];
          await client.query(
            `INSERT INTO recipe_steps (recipe_id, step_order, description_zh_cn, description_en, description_zh_tw, image)
             VALUES ($1, $2, $3, $4, $5, $6)`,
            [recipeId, i + 1, step.description_zh_cn || '', step.description_en || '', 
             step.description_zh_tw || '', step.image || '']
          );
        }
      }
      
      await client.query('COMMIT');
      
      res.status(201).json({
        success: true,
        data: { id: recipeId }
      });
    } catch (e) {
      await client.query('ROLLBACK');
      throw e;
    } finally {
      client.release();
    }
  } catch (error) {
    console.error('Create recipe error:', error);
    res.status(500).json({
      success: false,
      error: '创建食谱失败',
      code: 'CREATE_RECIPE_FAILED'
    });
  }
});

router.put('/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const { 
      name_zh_cn, name_en, name_zh_tw, 
      description_zh_cn, description_en, description_zh_tw,
      cover_image, video_url, video_duration,
      crowd_tags, efficacy_tags, solar_term_tags, nutrition,
      status, ingredients, steps
    } = req.body;
    
    const existingResult = await req.db.query(
      'SELECT id FROM recipes WHERE id = $1',
      [id]
    );
    
    if (existingResult.rows.length === 0) {
      return res.status(404).json({
        success: false,
        error: '食谱不存在',
        code: 'RECIPE_NOT_FOUND'
      });
    }
    
    const client = await req.db.connect();
    
    try {
      await client.query('BEGIN');
      
      const updateFields = [];
      const params = [];
      let paramIndex = 1;
      
      if (name_zh_cn !== undefined) { updateFields.push(`name_zh_cn = $${paramIndex}`); params.push(name_zh_cn); paramIndex++; }
      if (name_en !== undefined) { updateFields.push(`name_en = $${paramIndex}`); params.push(name_en); paramIndex++; }
      if (name_zh_tw !== undefined) { updateFields.push(`name_zh_tw = $${paramIndex}`); params.push(name_zh_tw); paramIndex++; }
      if (description_zh_cn !== undefined) { updateFields.push(`description_zh_cn = $${paramIndex}`); params.push(description_zh_cn); paramIndex++; }
      if (description_en !== undefined) { updateFields.push(`description_en = $${paramIndex}`); params.push(description_en); paramIndex++; }
      if (description_zh_tw !== undefined) { updateFields.push(`description_zh_tw = $${paramIndex}`); params.push(description_zh_tw); paramIndex++; }
      if (cover_image !== undefined) { updateFields.push(`cover_image = $${paramIndex}`); params.push(cover_image); paramIndex++; }
      if (video_url !== undefined) { updateFields.push(`video_url = $${paramIndex}`); params.push(video_url); paramIndex++; }
      if (video_duration !== undefined) { updateFields.push(`video_duration = $${paramIndex}`); params.push(video_duration); paramIndex++; }
      if (crowd_tags !== undefined) { updateFields.push(`crowd_tags = $${paramIndex}`); params.push(crowd_tags); paramIndex++; }
      if (efficacy_tags !== undefined) { updateFields.push(`efficacy_tags = $${paramIndex}`); params.push(efficacy_tags); paramIndex++; }
      if (solar_term_tags !== undefined) { updateFields.push(`solar_term_tags = $${paramIndex}`); params.push(solar_term_tags); paramIndex++; }
      if (nutrition !== undefined) { updateFields.push(`nutrition = $${paramIndex}`); params.push(nutrition); paramIndex++; }
      if (status !== undefined) { updateFields.push(`status = $${paramIndex}`); params.push(status); paramIndex++; }
      
      if (updateFields.length > 0) {
        params.push(id);
        await client.query(
          `UPDATE recipes SET ${updateFields.join(', ')} WHERE id = $${paramIndex}`,
          params
        );
      }
      
      if (ingredients !== undefined) {
        await client.query('DELETE FROM recipe_ingredients WHERE recipe_id = $1', [id]);
        for (let i = 0; i < ingredients.length; i++) {
          const ing = ingredients[i];
          await client.query(
            `INSERT INTO recipe_ingredients (recipe_id, name_zh_cn, name_en, name_zh_tw, amount, image, sort_order)
             VALUES ($1, $2, $3, $4, $5, $6, $7)`,
            [id, ing.name_zh_cn || '', ing.name_en || '', ing.name_zh_tw || '', 
             ing.amount || '', ing.image || '', i + 1]
          );
        }
      }
      
      if (steps !== undefined) {
        await client.query('DELETE FROM recipe_steps WHERE recipe_id = $1', [id]);
        for (let i = 0; i < steps.length; i++) {
          const step = steps[i];
          await client.query(
            `INSERT INTO recipe_steps (recipe_id, step_order, description_zh_cn, description_en, description_zh_tw, image)
             VALUES ($1, $2, $3, $4, $5, $6)`,
            [id, i + 1, step.description_zh_cn || '', step.description_en || '', 
             step.description_zh_tw || '', step.image || '']
          );
        }
      }
      
      await client.query('COMMIT');
      
      res.json({
        success: true,
        data: { id }
      });
    } catch (e) {
      await client.query('ROLLBACK');
      throw e;
    } finally {
      client.release();
    }
  } catch (error) {
    console.error('Update recipe error:', error);
    res.status(500).json({
      success: false,
      error: '更新食谱失败',
      code: 'UPDATE_RECIPE_FAILED'
    });
  }
});

router.delete('/:id', async (req, res) => {
  try {
    const { id } = req.params;
    
    const client = await req.db.connect();
    
    try {
      await client.query('BEGIN');
      
      await client.query('DELETE FROM recipe_ingredients WHERE recipe_id = $1', [id]);
      await client.query('DELETE FROM recipe_steps WHERE recipe_id = $1', [id]);
      
      const result = await client.query(
        'DELETE FROM recipes WHERE id = $1 RETURNING id',
        [id]
      );
      
      if (result.rows.length === 0) {
        await client.query('ROLLBACK');
        return res.status(404).json({
          success: false,
          error: '食谱不存在',
          code: 'RECIPE_NOT_FOUND'
        });
      }
      
      await client.query('COMMIT');
      
      res.json({
        success: true,
        data: { id: result.rows[0].id }
      });
    } catch (e) {
      await client.query('ROLLBACK');
      throw e;
    } finally {
      client.release();
    }
  } catch (error) {
    console.error('Delete recipe error:', error);
    res.status(500).json({
      success: false,
      error: '删除食谱失败',
      code: 'DELETE_RECIPE_FAILED'
    });
  }
});

module.exports = router;