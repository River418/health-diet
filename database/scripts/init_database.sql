-- Health-Diet 食疗养生小程序数据库初始化脚本
-- 执行顺序: 按序号从小到大执行

-- 设置字符集
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- 创建数据库
CREATE DATABASE IF NOT EXISTS health_diet 
    DEFAULT CHARACTER SET utf8mb4 
    DEFAULT COLLATE utf8mb4_unicode_ci;

USE health_diet;

-- 执行所有迁移文件
-- 注意: 实际部署时请按顺序单独执行每个迁移文件

-- 初始化分类数据
-- 人群分类
INSERT INTO categories (name_zh_cn, name_zh_tw, name_en, type, sort_order, is_active) VALUES
('中老年', '中老年', 'Seniors', 'crowd', 1, 1),
('白领', '白領', 'Office Workers', 'crowd', 2, 1),
('女性', '女性', 'Women', 'crowd', 3, 1),
('儿童', '兒童', 'Children', 'crowd', 4, 1),
('通用', '通用', 'Universal', 'crowd', 5, 1);

-- 疗效分类
INSERT INTO categories (name_zh_cn, name_zh_tw, name_en, type, sort_order, is_active) VALUES
('补气养血', '補氣養血', 'Tonify Blood & Qi', 'efficacy', 1, 1),
('健脾养胃', '健脾養胃', 'Strengthen Spleen & Stomach', 'efficacy', 2, 1),
('安神助眠', '安神助眠', 'Calm & Aid Sleep', 'efficacy', 3, 1),
('美容养颜', '美容養顏', 'Beauty & Skin Care', 'efficacy', 4, 1),
('清热解毒', '清熱解毒', 'Clear Heat & Detox', 'efficacy', 5, 1),
('润肺止咳', '潤肺止咳', 'Moisten Lung & Stop Cough', 'efficacy', 6, 1),
('补肾壮阳', '補腎壯陽', 'Tonify Kidney', 'efficacy', 7, 1),
('祛湿排毒', '祛濕排毒', 'Remove Dampness & Detox', 'efficacy', 8, 1),
('降压降脂', '降壓降脂', 'Lower Pressure & Lipid', 'efficacy', 9, 1),
('增强免疫', '增強免疫', 'Boost Immunity', 'efficacy', 10, 1);

-- 四季分类
INSERT INTO categories (name_zh_cn, name_zh_tw, name_en, type, sort_order, is_active) VALUES
('春季', '春季', 'Spring', 'solar_term', 1, 1),
('夏季', '夏季', 'Summer', 'solar_term', 2, 1),
('秋季', '秋季', 'Autumn', 'solar_term', 3, 1),
('冬季', '冬季', 'Winter', 'solar_term', 4, 1);

-- 24节气分类
INSERT INTO categories (name_zh_cn, name_zh_tw, name_en, type, sort_order, is_active) VALUES
('立春', '立春', 'Beginning of Spring', 'solar_term', 5, 1),
('雨水', '雨水', 'Rain Water', 'solar_term', 6, 1),
('惊蛰', '驚蟄', 'Awakening of Insects', 'solar_term', 7, 1),
('春分', '春分', 'Spring Equinox', 'solar_term', 8, 1),
('清明', '清明', 'Pure Brightness', 'solar_term', 9, 1),
('谷雨', '穀雨', 'Grain Rain', 'solar_term', 10, 1),
('立夏', '立夏', 'Beginning of Summer', 'solar_term', 11, 1),
('小满', '小滿', 'Grain Full', 'solar_term', 12, 1),
('芒种', '芒種', 'Grain in Ear', 'solar_term', 13, 1),
('夏至', '夏至', 'Summer Solstice', 'solar_term', 14, 1),
('小暑', '小暑', 'Minor Heat', 'solar_term', 15, 1),
('大暑', '大暑', 'Major Heat', 'solar_term', 16, 1),
('立秋', '立秋', 'Beginning of Autumn', 'solar_term', 17, 1),
('处暑', '處暑', 'End of Heat', 'solar_term', 18, 1),
('白露', '白露', 'White Dew', 'solar_term', 19, 1),
('秋分', '秋分', 'Autumn Equinox', 'solar_term', 20, 1),
('寒露', '寒露', 'Cold Dew', 'solar_term', 21, 1),
('霜降', '霜降', 'Frost Descent', 'solar_term', 22, 1),
('立冬', '立冬', 'Beginning of Winter', 'solar_term', 23, 1),
('小雪', '小雪', 'Minor Snow', 'solar_term', 24, 1),
('大雪', '大雪', 'Major Snow', 'solar_term', 25, 1),
('冬至', '冬至', 'Winter Solstice', 'solar_term', 26, 1),
('小寒', '小寒', 'Minor Cold', 'solar_term', 27, 1),
('大寒', '大寒', 'Major Cold', 'solar_term', 28, 1);

-- 初始化金刚位配置
INSERT INTO kingkong_config (name_zh_cn, name_zh_tw, name_en, icon, sort_order, action_type, action_value, filter_config, is_active) VALUES
('中老年养生', '中老年養生', 'Senior Wellness', '/icons/elderly.png', 1, 'filter', 'recipes', '{"crowd": "elderly"}', 1),
('白领调理', '白領調理', 'Office Wellness', '/icons/office.png', 2, 'filter', 'recipes', '{"crowd": "office"}', 1),
('节气养生', '節氣養生', 'Solar Term Wellness', '/icons/solar.png', 3, 'filter', 'recipes', '{"type": "solar_term"}', 1),
('补气养血', '補氣養血', 'Tonify Blood', '/icons/blood.png', 4, 'filter', 'recipes', '{"efficacy": "tonify_blood"}', 1),
('健脾养胃', '健脾養胃', 'Strengthen Stomach', '/icons/stomach.png', 5, 'filter', 'recipes', '{"efficacy": "strengthen_stomach"}', 1),
('安神助眠', '安神助眠', 'Sleep Aid', '/icons/sleep.png', 6, 'filter', 'recipes', '{"efficacy": "calm_sleep"}', 1),
('美容养颜', '美容養顏', 'Beauty Care', '/icons/beauty.png', 7, 'filter', 'recipes', '{"efficacy": "beauty"}', 1),
('更多分类', '更多分類', 'More Categories', '/icons/more.png', 8, 'page', '/pages/category/index', NULL, 1);

SET FOREIGN_KEY_CHECKS = 1;

-- 初始化完成
SELECT 'Health-Diet database initialized successfully!' AS message;
