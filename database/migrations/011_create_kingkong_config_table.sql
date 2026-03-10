-- 金刚位配置表 (kingkong_config)
-- PRD 3.2.1 金刚位系统
CREATE TABLE IF NOT EXISTS kingkong_config (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT '主键ID',
    name_zh_cn VARCHAR(50) NOT NULL COMMENT '显示名称(简中)',
    name_zh_tw VARCHAR(50) COMMENT '显示名称(繁中)',
    name_en VARCHAR(50) COMMENT '显示名称(英文)',
    icon VARCHAR(255) NOT NULL COMMENT '图标URL',
    sort_order INT NOT NULL DEFAULT 0 COMMENT '排序',
    action_type ENUM('filter', 'page', 'url') NOT NULL COMMENT '动作类型',
    action_value VARCHAR(255) NOT NULL COMMENT '动作值',
    filter_config JSON COMMENT '筛选条件配置(当action_type=filter时)',
    is_active TINYINT NOT NULL DEFAULT 1 COMMENT '是否启用: 0-禁用, 1-启用',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    
    INDEX idx_is_active (is_active),
    INDEX idx_sort_order (sort_order)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='金刚位配置表';
