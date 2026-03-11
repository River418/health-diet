-- 步骤表 (recipe_steps)
-- PRD 7.6.4
CREATE TABLE IF NOT EXISTS recipe_steps (
    id BIGSERIAL PRIMARY KEY,
    recipe_id BIGINT NOT NULL,
    step_order INTEGER NOT NULL,
    description_zh_cn TEXT NOT NULL,
    description_zh_tw TEXT,
    description_en TEXT,
    image VARCHAR(255),
    
    CONSTRAINT fk_recipe_steps_recipe FOREIGN KEY (recipe_id) REFERENCES recipes(id) ON DELETE CASCADE
);

COMMENT ON TABLE recipe_steps IS '配方步骤表';
COMMENT ON COLUMN recipe_steps.id IS '主键ID';
COMMENT ON COLUMN recipe_steps.recipe_id IS '配方ID';
COMMENT ON COLUMN recipe_steps.step_order IS '步骤序号';
COMMENT ON COLUMN recipe_steps.description_zh_cn IS '步骤说明(简中)';
COMMENT ON COLUMN recipe_steps.description_zh_tw IS '步骤说明(繁中)';
COMMENT ON COLUMN recipe_steps.description_en IS '步骤说明(英文)';
COMMENT ON COLUMN recipe_steps.image IS '步骤图片';

CREATE INDEX idx_recipe_steps_recipe_id ON recipe_steps(recipe_id);
CREATE INDEX idx_recipe_steps_step_order ON recipe_steps(step_order);
