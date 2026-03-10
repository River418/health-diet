-- 收藏表 (favorites)
-- PRD 7.6.7
CREATE TABLE IF NOT EXISTS favorites (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT '主键ID',
    user_id BIGINT UNSIGNED NOT NULL COMMENT '用户ID',
    recipe_id BIGINT UNSIGNED NOT NULL COMMENT '配方ID',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    
    UNIQUE KEY idx_user_recipe (user_id, recipe_id),
    INDEX idx_user_id (user_id),
    INDEX idx_recipe_id (recipe_id),
    INDEX idx_created_at (created_at),
    
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (recipe_id) REFERENCES recipes(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='收藏表';
