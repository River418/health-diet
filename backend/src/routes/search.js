/**
 * 搜索路由
 * PRD 2.2.4 搜索模块
 */

const express = require('express');
const router = express.Router();
const config = require('../config');
const { validatePagination, buildPaginationResponse } = require('../utils/pagination');

/**
 * @GET /api/v1/search
 * 搜索配方
 */
router.get('/', async (req, res) => {
  try {
    const { q: keyword } = req.query;
    // BUG-001, BUG-002 修复: 使用统一的分页校验
    const pagination = validatePagination(req.query);
    if (pagination.error) {
      return res.status(400).json(pagination.error);
    }
    const { page, pageSize, offset } = pagination;
    
    if (!keyword || keyword.trim().length === 0) {
      return res.status(400).json({
        success: false,
        error: '请输入搜索关键词',
        code: 'MISSING_KEYWORD'
      });
    }
    
    const language = req.headers['accept-language'] || config.defaultLanguage;
    // BUG-003 修复: 严格校验语言参数，防止SQL注入
    const validLanguage = config.languages.includes(language) ? language : config.defaultLanguage;
    const nameField = validLanguage === 'zh-TW' ? 'r.name_zh_tw' : 
                      validLanguage === 'en' ? 'r.name_en' : 'r.name_zh_cn';
    
    const searchTerm = `%${keyword.trim()}%`;
    
    // 搜索配方 - 使用参数化查询防止SQL注入
    const recipesResult = await req.db.query(
      `SELECT 
        r.id,
        ${nameField} as name,
        r.cover_image,
        r.crowd_tags,
        r.efficacy_tags,
        r.rating,
        r.view_count,
        r.favorite_count
      FROM recipes r
      WHERE r.status = 1 
        AND (${nameField} ILIKE $1 OR r.description_zh_cn ILIKE $2)
      ORDER BY 
        CASE WHEN ${nameField} ILIKE $3 THEN 1 ELSE 2 END,
        r.rating DESC,
        r.view_count DESC
      LIMIT $4 OFFSET $5`,
      [searchTerm, searchTerm, `${keyword.trim()}%`, pageSize, offset]
    );
    const recipes = recipesResult.rows;
    
    // 获取总数
    const countResult = await req.db.query(
      `SELECT COUNT(*) as total FROM recipes r
       WHERE r.status = 1 AND (${nameField} ILIKE $1 OR r.description_zh_cn ILIKE $2)`,
      [searchTerm, searchTerm]
    );
    const total = parseInt(countResult.rows[0].total);
    
    // 保存搜索历史到 Redis（用于热门搜索统计）
    if (req.redis && req.redis.isReady) {
      await req.redis.zIncrBy('search:hot', 1, keyword.trim());
    }
    
    res.json({
      success: true,
      data: {
        keyword: keyword.trim(),
        ...buildPaginationResponse(recipes, total, page, pageSize)
      }
    });
  } catch (error) {
    console.error('Search error:', error);
    res.status(500).json({
      success: false,
      error: '搜索失败',
      code: 'SEARCH_FAILED'
    });
  }
});

/**
 * @GET /api/v1/search/hot
 * 获取热门搜索
 */
router.get('/hot', async (req, res) => {
  try {
    const limit = Math.min(parseInt(req.query.limit) || 10, 50);
    
    let hotKeywords = [];
    
    // 从 Redis 获取热门搜索
    if (req.redis && req.redis.isReady) {
      const hot = await req.redis.zRange('search:hot', -limit, -1, { REV: true });
      hotKeywords = hot;
    }
    
    // 如果 Redis 没有数据，返回默认热门搜索
    if (hotKeywords.length === 0) {
      hotKeywords = ['补气养血', '安神助眠', '健脾养胃', '美容养颜', '春季养生'];
    }
    
    res.json({
      success: true,
      data: hotKeywords
    });
  } catch (error) {
    console.error('Get hot search error:', error);
    res.status(500).json({
      success: false,
      error: '获取热门搜索失败',
      code: 'GET_HOT_SEARCH_FAILED'
    });
  }
});

/**
 * @GET /api/v1/search/suggestions
 * 搜索建议
 */
router.get('/suggestions', async (req, res) => {
  try {
    const { q: keyword } = req.query;
    
    if (!keyword || keyword.trim().length < 1) {
      return res.json({
        success: true,
        data: []
      });
    }
    
    const language = req.headers['accept-language'] || config.defaultLanguage;
    // BUG-003 修复: 严格校验语言参数，防止SQL注入
    const validLanguage = config.languages.includes(language) ? language : config.defaultLanguage;
    const nameField = validLanguage === 'zh-TW' ? 'name_zh_tw' : 
                      validLanguage === 'en' ? 'name_en' : 'name_zh_cn';
    
    const suggestionsResult = await req.db.query(
      `SELECT DISTINCT ${nameField} as name FROM recipes
       WHERE status = 1 AND ${nameField} ILIKE $1
       LIMIT 10`,
      [`${keyword.trim()}%`]
    );
    
    res.json({
      success: true,
      data: suggestionsResult.rows.map(s => s.name)
    });
  } catch (error) {
    console.error('Get suggestions error:', error);
    res.status(500).json({
      success: false,
      error: '获取搜索建议失败',
      code: 'GET_SUGGESTIONS_FAILED'
    });
  }
});

module.exports = router;
