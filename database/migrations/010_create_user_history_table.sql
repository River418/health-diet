-- 用户浏览历史表 (user_history)
-- PRD 扩展: 浏览历史功能
CREATE TABLE IF NOT EXISTS user_history (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT '主键ID',
    user_id BIGINT UNSIGNED NOT NULL COMMENT '用户ID',
    recipe_id BIGINT UNSIGNED NOT NULL COMMENT '配方ID',
    viewed_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '浏览时间',
    
    INDEX idx_user_id (user_id),
    INDEX idx_recipe_id (recipe_id),
    INDEX idx_viewed_at (viewed_at),
    
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (recipe_id) REFERENCES recipes(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户浏览历史表';
