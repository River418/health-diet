-- 分类表 (categories)
-- PRD 7.6.5
CREATE TABLE IF NOT EXISTS categories (
    id BIGSERIAL PRIMARY KEY,
    name_zh_cn VARCHAR(50) NOT NULL,
    name_zh_tw VARCHAR(50),
    name_en VARCHAR(50),
    type VARCHAR(20) NOT NULL,
    icon VARCHAR(255),
    sort_order INTEGER NOT NULL DEFAULT 0,
    is_active SMALLINT NOT NULL DEFAULT 1
);

COMMENT ON TABLE categories IS '分类表';
COMMENT ON COLUMN categories.id IS '主键ID';
COMMENT ON COLUMN categories.name_zh_cn IS '分类名称(简中)';
COMMENT ON COLUMN categories.name_zh_tw IS '分类名称(繁中)';
COMMENT ON COLUMN categories.name_en IS '分类名称(英文)';
COMMENT ON COLUMN categories.type IS '类型: crowd/solar_term/efficacy/ingredient';
COMMENT ON COLUMN categories.icon IS '图标URL';
COMMENT ON COLUMN categories.sort_order IS '排序权重';
COMMENT ON COLUMN categories.is_active IS '是否启用: 0-禁用, 1-启用';

CREATE INDEX idx_categories_type ON categories(type);
CREATE INDEX idx_categories_is_active ON categories(is_active);
CREATE INDEX idx_categories_sort_order ON categories(sort_order);
