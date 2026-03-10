/**
 * 分页工具函数
 * 提供统一的分页参数校验和处理
 */

const config = require('../config');

/**
 * 校验并标准化分页参数
 * @param {Object} query - 请求查询参数
 * @returns {Object} - 标准化后的分页参数和可能的错误
 */
function validatePagination(query) {
  let page = parseInt(query.page);
  let pageSize = parseInt(query.pageSize);
  
  // BUG-002 修复: 负数页码未校验 - page必须 >= 1
  if (isNaN(page) || page < 1) {
    return {
      error: {
        success: false,
        error: '页码必须大于等于1',
        code: 'INVALID_PAGE'
      }
    };
  }
  
  // pageSize校验
  if (isNaN(pageSize) || pageSize < 1) {
    pageSize = config.pagination.defaultPageSize;
  }
  
  // 限制最大pageSize
  pageSize = Math.min(pageSize, config.pagination.maxPageSize);
  
  const offset = (page - 1) * pageSize;
  
  return {
    page,
    pageSize,
    offset
  };
}

/**
 * 构建分页响应
 * @param {Array} list - 数据列表
 * @param {number} total - 总记录数
 * @param {number} page - 当前页码
 * @param {number} pageSize - 每页大小
 * @returns {Object} - 分页响应对象
 */
function buildPaginationResponse(list, total, page, pageSize) {
  const totalPages = Math.ceil(total / pageSize) || 1;
  
  return {
    list: list || [],
    pagination: {
      page,
      pageSize,
      total,
      totalPages
    }
  };
}

module.exports = {
  validatePagination,
  buildPaginationResponse
};
