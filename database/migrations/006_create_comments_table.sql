-- 评论表 (comments)
-- PRD 7.6.6
CREATE TABLE IF NOT EXISTS comments (
    id BIGSERIAL PRIMARY KEY,
    recipe_id BIGINT NOT NULL,
    user_id BIGINT NOT NULL,
    content TEXT NOT NULL,
    rating SMALLINT,
    images JSONB,
    likes INTEGER NOT NULL DEFAULT 0,
    reply_count INTEGER NOT NULL DEFAULT 0,
    parent_id BIGINT,
    status SMALLINT NOT NULL DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT fk_comments_recipe FOREIGN KEY (recipe_id) REFERENCES recipes(id) ON DELETE CASCADE,
    CONSTRAINT fk_comments_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT fk_comments_parent FOREIGN KEY (parent_id) REFERENCES comments(id) ON DELETE CASCADE
);

COMMENT ON TABLE comments IS '评论表';
COMMENT ON COLUMN comments.id IS '主键ID';
COMMENT ON COLUMN comments.recipe_id IS '配方ID';
COMMENT ON COLUMN comments.user_id IS '用户ID';
COMMENT ON COLUMN comments.content IS '评论内容';
COMMENT ON COLUMN comments.rating IS '评分(1-5)';
COMMENT ON COLUMN comments.images IS '评论图片数组';
COMMENT ON COLUMN comments.likes IS '点赞数';
COMMENT ON COLUMN comments.reply_count IS '回复数';
COMMENT ON COLUMN comments.parent_id IS '父评论ID(回复)';
COMMENT ON COLUMN comments.status IS '状态: 0-待审核, 1-已通过, 2-已拒绝';
COMMENT ON COLUMN comments.created_at IS '创建时间';

CREATE INDEX idx_comments_recipe_id ON comments(recipe_id);
CREATE INDEX idx_comments_user_id ON comments(user_id);
CREATE INDEX idx_comments_parent_id ON comments(parent_id);
CREATE INDEX idx_comments_status ON comments(status);
CREATE INDEX idx_comments_created_at ON comments(created_at);
