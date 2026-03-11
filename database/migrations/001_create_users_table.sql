-- 用户表 (users)
-- PRD 7.6.1
CREATE TABLE IF NOT EXISTS users (
    id BIGSERIAL PRIMARY KEY,
    wx_openid VARCHAR(64) UNIQUE,
    dy_openid VARCHAR(64) UNIQUE,
    nickname VARCHAR(64) NOT NULL,
    avatar VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    language VARCHAR(10) NOT NULL DEFAULT 'zh-CN',
    status SMALLINT NOT NULL DEFAULT 1,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

COMMENT ON TABLE users IS '用户表';
COMMENT ON COLUMN users.id IS '主键ID';
COMMENT ON COLUMN users.wx_openid IS '微信openid';
COMMENT ON COLUMN users.dy_openid IS '抖音openid';
COMMENT ON COLUMN users.nickname IS '昵称';
COMMENT ON COLUMN users.avatar IS '头像URL';
COMMENT ON COLUMN users.phone IS '手机号';
COMMENT ON COLUMN users.language IS '偏好语言: zh-CN/zh-TW/en';
COMMENT ON COLUMN users.status IS '状态: 0-禁用, 1-正常';
COMMENT ON COLUMN users.created_at IS '创建时间';
COMMENT ON COLUMN users.updated_at IS '更新时间';

CREATE INDEX idx_phone ON users(phone);
CREATE INDEX idx_status ON users(status);
CREATE INDEX idx_created_at ON users(created_at);

-- 创建更新时间触发器
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER update_users_updated_at BEFORE UPDATE ON users
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
