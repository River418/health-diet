/**
 * 分类路由
 * PRD 3.2.2 分类页模块
 */

const express = require('express');
const router = express.Router();
const config = require('../config');

/**
 * @GET /api/v1/categories
 * 获取分类列表
 */
router.get('/', async (req, res) => {
  try {
    const { type } = req.query;
    const language = req.headers['accept-language'] || config.defaultLanguage;
    const nameField = language === 'zh-TW' ? 'name_zh_tw' : 
                      language === 'en' ? 'name_en' : 'name_zh_cn';
    
    let whereClause = 'WHERE is_active = 1';
    const params = [];
    
    if (type) {
      whereClause += ' AND type = $1';
      params.push(type);
    }
    
    const categoriesResult = await req.db.query(
      `SELECT 
        id,
        ${nameField} as name,
        type,
        icon,
        sort_order
      FROM categories
      ${whereClause}
      ORDER BY sort_order ASC`,
      params
    );
    const categories = categoriesResult.rows;
    
    // 按类型分组
    const grouped = categories.reduce((acc, cat) => {
      if (!acc[cat.type]) {
        acc[cat.type] = [];
      }
      acc[cat.type].push(cat);
      return acc;
    }, {});
    
    res.json({
      success: true,
      data: type ? categories : grouped
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

/**
 * @GET /api/v1/categories/kingkong
 * 获取金刚位配置
 */
router.get('/kingkong', async (req, res) => {
  try {
    const language = req.headers['accept-language'] || config.defaultLanguage;
    const nameField = language === 'zh-TW' ? 'name_zh_tw' : 
                      language === 'en' ? 'name_en' : 'name_zh_cn';
    
    const kingkongResult = await req.db.query(
      `SELECT 
        id,
        ${nameField} as name,
        icon,
        action_type,
        action_value,
        filter_config
      FROM kingkong_config
      WHERE is_active = 1
      ORDER BY sort_order ASC
      LIMIT 10`
    );
    
    res.json({
      success: true,
      data: kingkongResult.rows
    });
  } catch (error) {
    console.error('Get kingkong config error:', error);
    res.status(500).json({
      success: false,
      error: '获取金刚位配置失败',
      code: 'GET_KINGKONG_FAILED'
    });
  }
});

module.exports = router;
