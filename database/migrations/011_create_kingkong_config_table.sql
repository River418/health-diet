-- 金刚位配置表 (kingkong_config)
-- PRD 3.2.1 金刚位系统
CREATE TYPE action_type_enum AS ENUM ('filter', 'page', 'url');

CREATE TABLE IF NOT EXISTS kingkong_config (
    id BIGSERIAL PRIMARY KEY,
    name_zh_cn VARCHAR(50) NOT NULL,
    name_zh_tw VARCHAR(50),
    name_en VARCHAR(50),
    icon VARCHAR(255) NOT NULL,
    sort_order INTEGER NOT NULL DEFAULT 0,
    action_type action_type_enum NOT NULL,
    action_value VARCHAR(255) NOT NULL,
    filter_config JSONB,
    is_active SMALLINT NOT NULL DEFAULT 1,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

COMMENT ON TABLE kingkong_config IS '金刚位配置表';
COMMENT ON COLUMN kingkong_config.id IS '主键ID';
COMMENT ON COLUMN kingkong_config.name_zh_cn IS '显示名称(简中)';
COMMENT ON COLUMN kingkong_config.name_zh_tw IS '显示名称(繁中)';
COMMENT ON COLUMN kingkong_config.name_en IS '显示名称(英文)';
COMMENT ON COLUMN kingkong_config.icon IS '图标URL';
COMMENT ON COLUMN kingkong_config.sort_order IS '排序';
COMMENT ON COLUMN kingkong_config.action_type IS '动作类型';
COMMENT ON COLUMN kingkong_config.action_value IS '动作值';
COMMENT ON COLUMN kingkong_config.filter_config IS '筛选条件配置(当action_type=filter时)';
COMMENT ON COLUMN kingkong_config.is_active IS '是否启用: 0-禁用, 1-启用';
COMMENT ON COLUMN kingkong_config.created_at IS '创建时间';
COMMENT ON COLUMN kingkong_config.updated_at IS '更新时间';

CREATE INDEX idx_kingkong_config_is_active ON kingkong_config(is_active);
CREATE INDEX idx_kingkong_config_sort_order ON kingkong_config(sort_order);

-- 更新时间触发器
CREATE TRIGGER update_kingkong_config_updated_at BEFORE UPDATE ON kingkong_config
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
