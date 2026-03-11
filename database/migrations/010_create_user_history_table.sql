-- 用户浏览历史表 (user_history)
-- PRD 扩展: 浏览历史功能
CREATE TABLE IF NOT EXISTS user_history (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL,
    recipe_id BIGINT NOT NULL,
    viewed_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT fk_user_history_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT fk_user_history_recipe FOREIGN KEY (recipe_id) REFERENCES recipes(id) ON DELETE CASCADE
);

COMMENT ON TABLE user_history IS '用户浏览历史表';
COMMENT ON COLUMN user_history.id IS '主键ID';
COMMENT ON COLUMN user_history.user_id IS '用户ID';
COMMENT ON COLUMN user_history.recipe_id IS '配方ID';
COMMENT ON COLUMN user_history.viewed_at IS '浏览时间';

CREATE INDEX idx_user_history_user_id ON user_history(user_id);
CREATE INDEX idx_user_history_recipe_id ON user_history(recipe_id);
CREATE INDEX idx_user_history_viewed_at ON user_history(viewed_at);

-- 添加唯一约束用于 UPSERT 操作
CREATE UNIQUE INDEX idx_user_history_user_recipe ON user_history(user_id, recipe_id);
