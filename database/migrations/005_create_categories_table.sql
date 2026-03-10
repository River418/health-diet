-- 分类表 (categories)
-- PRD 7.6.5
CREATE TABLE IF NOT EXISTS categories (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT '主键ID',
    name_zh_cn VARCHAR(50) NOT NULL COMMENT '分类名称(简中)',
    name_zh_tw VARCHAR(50) COMMENT '分类名称(繁中)',
    name_en VARCHAR(50) COMMENT '分类名称(英文)',
    type VARCHAR(20) NOT NULL COMMENT '类型: crowd/solar_term/efficacy/ingredient',
    icon VARCHAR(255) COMMENT '图标URL',
    sort_order INT NOT NULL DEFAULT 0 COMMENT '排序权重',
    is_active TINYINT NOT NULL DEFAULT 1 COMMENT '是否启用: 0-禁用, 1-启用',
    
    INDEX idx_type (type),
    INDEX idx_is_active (is_active),
    INDEX idx_sort_order (sort_order)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='分类表';
