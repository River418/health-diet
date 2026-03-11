-- 配方表 (recipes)
-- PRD 7.6.2
CREATE TABLE IF NOT EXISTS recipes (
    id BIGSERIAL PRIMARY KEY,
    name_zh_cn VARCHAR(100) NOT NULL,
    name_zh_tw VARCHAR(100),
    name_en VARCHAR(100),
    description_zh_cn TEXT NOT NULL,
    description_zh_tw TEXT,
    description_en TEXT,
    cover_image VARCHAR(255) NOT NULL,
    video_url VARCHAR(255),
    video_duration INTEGER,
    crowd_tags JSONB NOT NULL DEFAULT '[]',
    efficacy_tags JSONB NOT NULL DEFAULT '[]',
    solar_term_tags JSONB,
    nutrition JSONB,
    view_count INTEGER NOT NULL DEFAULT 0,
    favorite_count INTEGER NOT NULL DEFAULT 0,
    comment_count INTEGER NOT NULL DEFAULT 0,
    rating DECIMAL(2,1) NOT NULL DEFAULT 5.0,
    status SMALLINT NOT NULL DEFAULT 1,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

COMMENT ON TABLE recipes IS '食疗配方表';
COMMENT ON COLUMN recipes.id IS '主键ID';
COMMENT ON COLUMN recipes.name_zh_cn IS '名称(简中)';
COMMENT ON COLUMN recipes.name_zh_tw IS '名称(繁中)';
COMMENT ON COLUMN recipes.name_en IS '名称(英文)';
COMMENT ON COLUMN recipes.description_zh_cn IS '简介(简中)';
COMMENT ON COLUMN recipes.description_zh_tw IS '简介(繁中)';
COMMENT ON COLUMN recipes.description_en IS '简介(英文)';
COMMENT ON COLUMN recipes.cover_image IS '封面图URL';
COMMENT ON COLUMN recipes.video_url IS '视频URL';
COMMENT ON COLUMN recipes.video_duration IS '视频时长(秒)';
COMMENT ON COLUMN recipes.crowd_tags IS '人群标签';
COMMENT ON COLUMN recipes.efficacy_tags IS '功效标签';
COMMENT ON COLUMN recipes.solar_term_tags IS '节气标签';
COMMENT ON COLUMN recipes.nutrition IS '营养信息: {calories, protein, fat, carbs}';
COMMENT ON COLUMN recipes.view_count IS '浏览数';
COMMENT ON COLUMN recipes.favorite_count IS '收藏数';
COMMENT ON COLUMN recipes.comment_count IS '评论数';
COMMENT ON COLUMN recipes.rating IS '评分(1-5)';
COMMENT ON COLUMN recipes.status IS '状态: 0-草稿, 1-已发布, 2-下架';
COMMENT ON COLUMN recipes.created_at IS '创建时间';
COMMENT ON COLUMN recipes.updated_at IS '更新时间';

CREATE INDEX idx_recipes_status ON recipes(status);
CREATE INDEX idx_recipes_created_at ON recipes(created_at);
CREATE INDEX idx_recipes_rating ON recipes(rating);
CREATE INDEX idx_recipes_view_count ON recipes(view_count);

-- 全文搜索索引 (使用 PostgreSQL 的 tsvector)
-- 注意: 需要安装 zhparser 扩展支持中文分词
-- CREATE INDEX ft_name_zh_cn ON recipes USING gin(to_tsvector('chinese', name_zh_cn));

-- 更新时间触发器
CREATE TRIGGER update_recipes_updated_at BEFORE UPDATE ON recipes
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
