-- 步骤表 (recipe_steps)
-- PRD 7.6.4
CREATE TABLE IF NOT EXISTS recipe_steps (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT '主键ID',
    recipe_id BIGINT UNSIGNED NOT NULL COMMENT '配方ID',
    step_order INT NOT NULL COMMENT '步骤序号',
    description_zh_cn TEXT NOT NULL COMMENT '步骤说明(简中)',
    description_zh_tw TEXT COMMENT '步骤说明(繁中)',
    description_en TEXT COMMENT '步骤说明(英文)',
    image VARCHAR(255) COMMENT '步骤图片',
    
    INDEX idx_recipe_id (recipe_id),
    INDEX idx_step_order (step_order),
    
    FOREIGN KEY (recipe_id) REFERENCES recipes(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='配方步骤表';
