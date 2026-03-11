-- 食材表 (recipe_ingredients)
-- PRD 7.6.3
CREATE TABLE IF NOT EXISTS recipe_ingredients (
    id BIGSERIAL PRIMARY KEY,
    recipe_id BIGINT NOT NULL,
    name_zh_cn VARCHAR(50) NOT NULL,
    name_zh_tw VARCHAR(50),
    name_en VARCHAR(50),
    amount VARCHAR(50) NOT NULL,
    image VARCHAR(255),
    sort_order INTEGER NOT NULL DEFAULT 0,
    
    CONSTRAINT fk_recipe_ingredients_recipe FOREIGN KEY (recipe_id) REFERENCES recipes(id) ON DELETE CASCADE
);

COMMENT ON TABLE recipe_ingredients IS '配方食材表';
COMMENT ON COLUMN recipe_ingredients.id IS '主键ID';
COMMENT ON COLUMN recipe_ingredients.recipe_id IS '配方ID';
COMMENT ON COLUMN recipe_ingredients.name_zh_cn IS '食材名称(简中)';
COMMENT ON COLUMN recipe_ingredients.name_zh_tw IS '食材名称(繁中)';
COMMENT ON COLUMN recipe_ingredients.name_en IS '食材名称(英文)';
COMMENT ON COLUMN recipe_ingredients.amount IS '用量';
COMMENT ON COLUMN recipe_ingredients.image IS '食材图片';
COMMENT ON COLUMN recipe_ingredients.sort_order IS '排序';

CREATE INDEX idx_recipe_ingredients_recipe_id ON recipe_ingredients(recipe_id);
CREATE INDEX idx_recipe_ingredients_sort_order ON recipe_ingredients(sort_order);
