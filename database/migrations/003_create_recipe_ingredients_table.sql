-- 食材表 (recipe_ingredients)
-- PRD 7.6.3
CREATE TABLE IF NOT EXISTS recipe_ingredients (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT '主键ID',
    recipe_id BIGINT UNSIGNED NOT NULL COMMENT '配方ID',
    name_zh_cn VARCHAR(50) NOT NULL COMMENT '食材名称(简中)',
    name_zh_tw VARCHAR(50) COMMENT '食材名称(繁中)',
    name_en VARCHAR(50) COMMENT '食材名称(英文)',
    amount VARCHAR(50) NOT NULL COMMENT '用量',
    image VARCHAR(255) COMMENT '食材图片',
    sort_order INT NOT NULL DEFAULT 0 COMMENT '排序',
    
    INDEX idx_recipe_id (recipe_id),
    INDEX idx_sort_order (sort_order),
    
    FOREIGN KEY (recipe_id) REFERENCES recipes(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='配方食材表';
