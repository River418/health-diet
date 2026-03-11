-- 内容表 (contents)
-- PRD 7.6.8
CREATE TABLE IF NOT EXISTS contents (
    id BIGSERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    source VARCHAR(50) NOT NULL,
    source_url VARCHAR(500) NOT NULL,
    cover_image VARCHAR(255),
    author VARCHAR(100),
    content_type VARCHAR(20) NOT NULL,
    tags JSONB,
    view_count INTEGER NOT NULL DEFAULT 0,
    status SMALLINT NOT NULL DEFAULT 1,
    published_at TIMESTAMP,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

COMMENT ON TABLE contents IS '内容信息流表';
COMMENT ON COLUMN contents.id IS '主键ID';
COMMENT ON COLUMN contents.title IS '内容标题';
COMMENT ON COLUMN contents.source IS '来源: wechat_video/wechat_article/douyin/self';
COMMENT ON COLUMN contents.source_url IS '原文链接';
COMMENT ON COLUMN contents.cover_image IS '封面图';
COMMENT ON COLUMN contents.author IS '作者';
COMMENT ON COLUMN contents.content_type IS '类型: video/article';
COMMENT ON COLUMN contents.tags IS '标签';
COMMENT ON COLUMN contents.view_count IS '浏览数';
COMMENT ON COLUMN contents.status IS '状态: 0-待审核, 1-已发布, 2-已下架';
COMMENT ON COLUMN contents.published_at IS '发布时间';
COMMENT ON COLUMN contents.created_at IS '创建时间';

CREATE INDEX idx_contents_source ON contents(source);
CREATE INDEX idx_contents_content_type ON contents(content_type);
CREATE INDEX idx_contents_status ON contents(status);
CREATE INDEX idx_contents_published_at ON contents(published_at);
CREATE INDEX idx_contents_created_at ON contents(created_at);
