-- 评论表 (comments)
-- PRD 7.6.6
CREATE TABLE IF NOT EXISTS comments (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT '主键ID',
    recipe_id BIGINT UNSIGNED NOT NULL COMMENT '配方ID',
    user_id BIGINT UNSIGNED NOT NULL COMMENT '用户ID',
    content TEXT NOT NULL COMMENT '评论内容',
    rating TINYINT COMMENT '评分(1-5)',
    images JSON COMMENT '评论图片数组',
    likes INT NOT NULL DEFAULT 0 COMMENT '点赞数',
    reply_count INT NOT NULL DEFAULT 0 COMMENT '回复数',
    parent_id BIGINT UNSIGNED COMMENT '父评论ID(回复)',
    status TINYINT NOT NULL DEFAULT 0 COMMENT '状态: 0-待审核, 1-已通过, 2-已拒绝',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    
    INDEX idx_recipe_id (recipe_id),
    INDEX idx_user_id (user_id),
    INDEX idx_parent_id (parent_id),
    INDEX idx_status (status),
    INDEX idx_created_at (created_at),
    
    FOREIGN KEY (recipe_id) REFERENCES recipes(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (parent_id) REFERENCES comments(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='评论表';
