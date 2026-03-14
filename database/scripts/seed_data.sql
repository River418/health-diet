-- Health-Diet 食疗养生小程序 - 测试数据生成脚本
-- 生成时间: 2026-03-14 20:49:27
-- 注意: 执行前请确保数据库已初始化

BEGIN;

-- ============================================
-- 0. 分类数据 (人群/节气/功效)
-- ============================================

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

SELECT '分类数据插入完成: 43条' AS message;

-- ============================================
-- 1. 用户数据 (20个测试用户)
-- ============================================

INSERT INTO users (id, wx_openid, dy_openid, nickname, avatar, phone, language, status, created_at, updated_at)
VALUES (1, 'wx_39278694', NULL, '食疗达人1', 'https://api.dicebear.com/7.x/avataaars/svg?seed=4&user=1', NULL, 'zh-CN', 1, '2025-12-23 20:49:27', '2025-12-23 20:49:27');
INSERT INTO users (id, wx_openid, dy_openid, nickname, avatar, phone, language, status, created_at, updated_at)
VALUES (2, 'wx_71033080', NULL, '中医粉2', 'https://api.dicebear.com/7.x/avataaars/svg?seed=3&user=2', '13834625010', 'zh-TW', 1, '2026-02-18 20:49:27', '2026-02-18 20:49:27');
INSERT INTO users (id, wx_openid, dy_openid, nickname, avatar, phone, language, status, created_at, updated_at)
VALUES (3, 'wx_81341371', 'dy_87363331', '健康生活方式3', 'https://api.dicebear.com/7.x/avataaars/svg?seed=2&user=3', '13843329771', 'en', 1, '2026-02-28 20:49:27', '2026-02-28 20:49:27');
INSERT INTO users (id, wx_openid, dy_openid, nickname, avatar, phone, language, status, created_at, updated_at)
VALUES (4, NULL, 'dy_20574604', '健康顾问4', 'https://api.dicebear.com/7.x/avataaars/svg?seed=4&user=4', '13819497413', 'en', 1, '2026-01-30 20:49:27', '2026-01-30 20:49:27');
INSERT INTO users (id, wx_openid, dy_openid, nickname, avatar, phone, language, status, created_at, updated_at)
VALUES (5, 'wx_15166954', 'dy_98159363', '养生老司机5', 'https://api.dicebear.com/7.x/avataaars/svg?seed=3&user=5', NULL, 'en', 1, '2026-03-01 20:49:27', '2026-03-01 20:49:27');
INSERT INTO users (id, wx_openid, dy_openid, nickname, avatar, phone, language, status, created_at, updated_at)
VALUES (6, NULL, NULL, '养生学徒6', 'https://api.dicebear.com/7.x/avataaars/svg?seed=4&user=6', '13874802564', 'zh-TW', 1, '2026-02-06 20:49:27', '2026-02-06 20:49:27');
INSERT INTO users (id, wx_openid, dy_openid, nickname, avatar, phone, language, status, created_at, updated_at)
VALUES (7, 'wx_25943250', 'dy_96390858', '健康倡导者7', 'https://api.dicebear.com/7.x/avataaars/svg?seed=4&user=7', '13892442472', 'zh-CN', 1, '2026-03-13 20:49:27', '2026-03-13 20:49:27');
INSERT INTO users (id, wx_openid, dy_openid, nickname, avatar, phone, language, status, created_at, updated_at)
VALUES (8, 'wx_60808106', 'dy_90135009', '食疗养生专家8', 'https://api.dicebear.com/7.x/avataaars/svg?seed=3&user=8', NULL, 'en', 1, '2026-01-27 20:49:27', '2026-01-27 20:49:27');
INSERT INTO users (id, wx_openid, dy_openid, nickname, avatar, phone, language, status, created_at, updated_at)
VALUES (9, 'wx_86354072', NULL, '食疗探索者9', 'https://api.dicebear.com/7.x/avataaars/svg?seed=4&user=9', '13825188240', 'zh-TW', 1, '2026-01-21 20:49:27', '2026-01-21 20:49:27');
INSERT INTO users (id, wx_openid, dy_openid, nickname, avatar, phone, language, status, created_at, updated_at)
VALUES (10, 'wx_88388503', 'dy_13993767', '食疗研究者10', 'https://api.dicebear.com/7.x/avataaars/svg?seed=5&user=10', '13836762403', 'zh-TW', 1, '2025-12-25 20:49:27', '2025-12-25 20:49:27');
INSERT INTO users (id, wx_openid, dy_openid, nickname, avatar, phone, language, status, created_at, updated_at)
VALUES (11, 'wx_58890087', 'dy_60865863', '健康生活方式11', 'https://api.dicebear.com/7.x/avataaars/svg?seed=3&user=11', '13845610210', 'zh-CN', 1, '2026-01-25 20:49:27', '2026-01-25 20:49:27');
INSERT INTO users (id, wx_openid, dy_openid, nickname, avatar, phone, language, status, created_at, updated_at)
VALUES (12, NULL, NULL, '食疗达人12', 'https://api.dicebear.com/7.x/avataaars/svg?seed=2&user=12', '13872790375', 'zh-TW', 1, '2026-02-09 20:49:27', '2026-02-09 20:49:27');
INSERT INTO users (id, wx_openid, dy_openid, nickname, avatar, phone, language, status, created_at, updated_at)
VALUES (13, 'wx_16450576', NULL, '美食家小王13', 'https://api.dicebear.com/7.x/avataaars/svg?seed=1&user=13', NULL, 'zh-TW', 1, '2026-02-04 20:49:27', '2026-02-04 20:49:27');
INSERT INTO users (id, wx_openid, dy_openid, nickname, avatar, phone, language, status, created_at, updated_at)
VALUES (14, 'wx_32308769', 'dy_70955365', '健康生活家14', 'https://api.dicebear.com/7.x/avataaars/svg?seed=2&user=14', '13818633065', 'zh-TW', 1, '2026-02-05 20:49:27', '2026-02-05 20:49:27');
INSERT INTO users (id, wx_openid, dy_openid, nickname, avatar, phone, language, status, created_at, updated_at)
VALUES (15, 'wx_20752812', NULL, '美食博主15', 'https://api.dicebear.com/7.x/avataaars/svg?seed=5&user=15', NULL, 'zh-CN', 1, '2026-02-09 20:49:27', '2026-02-09 20:49:27');
INSERT INTO users (id, wx_openid, dy_openid, nickname, avatar, phone, language, status, created_at, updated_at)
VALUES (16, 'wx_54701846', NULL, '食疗小能手16', 'https://api.dicebear.com/7.x/avataaars/svg?seed=3&user=16', '13874450867', 'zh-CN', 1, '2025-12-23 20:49:27', '2025-12-23 20:49:27');
INSERT INTO users (id, wx_openid, dy_openid, nickname, avatar, phone, language, status, created_at, updated_at)
VALUES (17, NULL, 'dy_36371031', '食疗探索者17', 'https://api.dicebear.com/7.x/avataaars/svg?seed=2&user=17', NULL, 'en', 1, '2026-02-04 20:49:27', '2026-02-04 20:49:27');
INSERT INTO users (id, wx_openid, dy_openid, nickname, avatar, phone, language, status, created_at, updated_at)
VALUES (18, NULL, NULL, '食疗爱好者18', 'https://api.dicebear.com/7.x/avataaars/svg?seed=1&user=18', '13847391308', 'zh-TW', 1, '2026-01-05 20:49:27', '2026-01-05 20:49:27');
INSERT INTO users (id, wx_openid, dy_openid, nickname, avatar, phone, language, status, created_at, updated_at)
VALUES (19, 'wx_57997429', 'dy_98699767', '健康守护者19', 'https://api.dicebear.com/7.x/avataaars/svg?seed=5&user=19', '13817256065', 'zh-CN', 1, '2025-12-30 20:49:27', '2025-12-30 20:49:27');
INSERT INTO users (id, wx_openid, dy_openid, nickname, avatar, phone, language, status, created_at, updated_at)
VALUES (20, 'wx_30437283', NULL, '食疗探索者20', 'https://api.dicebear.com/7.x/avataaars/svg?seed=1&user=20', NULL, 'zh-CN', 1, '2026-02-19 20:49:27', '2026-02-19 20:49:27');

SELECT '用户数据插入完成: 20条' AS message;

-- ============================================
-- 2. 配方数据 (69条食疗配方)
-- ============================================

INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (1, '山药小米粥', '山药小米粥', '山药小米粥', '山药小米粥是一道传统的食疗养生佳品，具有健脾养胃的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '山药小米粥是一道傳統的食療養生佳品，具有健脾养胃的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '山药小米粥 is a traditional therapeutic recipe with benefits of 健脾养胃. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=1', NULL, NULL, '["中老年", "白领", "通用"]', '["健脾养胃"]', '["秋季", "冬季"]', '{"calories": 180, "protein": 6, "fat": 2, "carbs": 35}',
    3250, 314, 45, 4.0, 1, '2026-01-24 20:49:27', '2026-01-24 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (2, '南瓜红枣粥', '南瓜红枣粥', '南瓜红枣粥', '南瓜红枣粥是一道传统的食疗养生佳品，具有健脾养胃、补气养血的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '南瓜红枣粥是一道傳統的食療養生佳品，具有健脾养胃、补气养血的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '南瓜红枣粥 is a traditional therapeutic recipe with benefits of 健脾养胃、补气养血. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=2', '/videos/recipes/南瓜红枣粥.mp4', 150, '["中老年", "女性", "儿童"]', '["健脾养胃", "补气养血"]', '["秋季", "冬季"]', '{"calories": 220, "protein": 5, "fat": 1, "carbs": 45}',
    2267, 237, 81, 4.3, 1, '2025-10-16 20:49:27', '2025-10-16 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (3, '猴头菇炖鸡汤', '猴头菇炖鸡汤', '猴头菇炖鸡汤', '猴头菇炖鸡汤是一道传统的食疗养生佳品，具有健脾养胃、增强免疫的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '猴头菇炖鸡汤是一道傳統的食療養生佳品，具有健脾养胃、增强免疫的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '猴头菇炖鸡汤 is a traditional therapeutic recipe with benefits of 健脾养胃、增强免疫. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=3', '/videos/recipes/猴头菇炖鸡汤.mp4', 161, '["中老年", "白领"]', '["健脾养胃", "增强免疫"]', '["冬季", "立冬", "小雪"]', '{"calories": 280, "protein": 25, "fat": 15, "carbs": 8}',
    4520, 232, 36, 4.4, 1, '2026-01-05 20:49:27', '2026-01-05 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (4, '莲子百合粥', '莲子百合粥', '莲子百合粥', '莲子百合粥是一道传统的食疗养生佳品，具有健脾养胃、安神助眠的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '莲子百合粥是一道傳統的食療養生佳品，具有健脾养胃、安神助眠的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '莲子百合粥 is a traditional therapeutic recipe with benefits of 健脾养胃、安神助眠. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=4', NULL, NULL, '["中老年", "女性"]', '["健脾养胃", "安神助眠"]', '["秋季", "白露", "秋分"]', '{"calories": 160, "protein": 5, "fat": 1, "carbs": 32}',
    1790, 20, 10, 4.5, 1, '2025-12-14 20:49:27', '2025-12-14 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (5, '茯苓山药排骨汤', '茯苓山药排骨汤', '茯苓山药排骨汤', '茯苓山药排骨汤是一道传统的食疗养生佳品，具有健脾养胃、祛湿排毒的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '茯苓山药排骨汤是一道傳統的食療養生佳品，具有健脾养胃、祛湿排毒的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '茯苓山药排骨汤 is a traditional therapeutic recipe with benefits of 健脾养胃、祛湿排毒. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=5', '/videos/recipes/茯苓山药排骨汤.mp4', 266, '["中老年", "通用"]', '["健脾养胃", "祛湿排毒"]', '["春季", "夏季"]', '{"calories": 320, "protein": 22, "fat": 18, "carbs": 12}',
    2510, 40, 55, 4.5, 1, '2026-03-07 20:49:27', '2026-03-07 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (6, '陈皮瘦肉粥', '陈皮瘦肉粥', '陈皮瘦肉粥', '陈皮瘦肉粥是一道传统的食疗养生佳品，具有健脾养胃的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '陈皮瘦肉粥是一道傳統的食療養生佳品，具有健脾养胃的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '陈皮瘦肉粥 is a traditional therapeutic recipe with benefits of 健脾养胃. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=6', NULL, NULL, '["中老年", "儿童"]', '["健脾养胃"]', '["四季"]', '{"calories": 200, "protein": 12, "fat": 6, "carbs": 25}',
    625, 389, 50, 4.9, 1, '2025-11-08 20:49:27', '2025-11-08 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (7, '芡实薏米粥', '芡实薏米粥', '芡实薏米粥', '芡实薏米粥是一道传统的食疗养生佳品，具有健脾养胃、祛湿排毒的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '芡实薏米粥是一道傳統的食療養生佳品，具有健脾养胃、祛湿排毒的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '芡实薏米粥 is a traditional therapeutic recipe with benefits of 健脾养胃、祛湿排毒. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=7', NULL, NULL, '["中老年", "女性"]', '["健脾养胃", "祛湿排毒"]', '["夏季", "秋季"]', '{"calories": 170, "protein": 5, "fat": 1, "carbs": 34}',
    2727, 455, 55, 4.2, 1, '2026-02-23 20:49:27', '2026-02-23 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (8, '生姜红糖暖胃汤', '生姜红糖暖胃汤', '生姜红糖暖胃汤', '生姜红糖暖胃汤是一道传统的食疗养生佳品，具有健脾养胃、补气养血的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '生姜红糖暖胃汤是一道傳統的食療養生佳品，具有健脾养胃、补气养血的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '生姜红糖暖胃汤 is a traditional therapeutic recipe with benefits of 健脾养胃、补气养血. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=8', NULL, NULL, '["女性", "中老年"]', '["健脾养胃", "补气养血"]', '["冬季", "小寒", "大寒"]', '{"calories": 120, "protein": 1, "fat": 0, "carbs": 28}',
    3652, 161, 85, 4.9, 1, '2026-03-06 20:49:27', '2026-03-06 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (9, '川贝雪梨汤', '川贝雪梨汤', '川贝雪梨汤', '川贝雪梨汤是一道传统的食疗养生佳品，具有润肺止咳的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '川贝雪梨汤是一道傳統的食療養生佳品，具有润肺止咳的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '川贝雪梨汤 is a traditional therapeutic recipe with benefits of 润肺止咳. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=9', NULL, NULL, '["儿童", "中老年", "通用"]', '["润肺止咳"]', '["秋季", "立冬"]', '{"calories": 90, "protein": 1, "fat": 0, "carbs": 22}',
    4811, 32, 66, 4.9, 1, '2025-11-20 20:49:27', '2025-11-20 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (10, '银耳莲子羹', '银耳莲子羹', '银耳莲子羹', '银耳莲子羹是一道传统的食疗养生佳品，具有润肺止咳、美容养颜的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '银耳莲子羹是一道傳統的食療養生佳品，具有润肺止咳、美容养颜的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '银耳莲子羹 is a traditional therapeutic recipe with benefits of 润肺止咳、美容养颜. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=10', NULL, NULL, '["女性", "中老年"]', '["润肺止咳", "美容养颜"]', '["秋季", "冬季"]', '{"calories": 140, "protein": 4, "fat": 0, "carbs": 30}',
    3611, 397, 93, 4.8, 1, '2026-02-06 20:49:27', '2026-02-06 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (11, '百合杏仁粥', '百合杏仁粥', '百合杏仁粥', '百合杏仁粥是一道传统的食疗养生佳品，具有润肺止咳、安神助眠的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '百合杏仁粥是一道傳統的食療養生佳品，具有润肺止咳、安神助眠的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '百合杏仁粥 is a traditional therapeutic recipe with benefits of 润肺止咳、安神助眠. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=11', NULL, NULL, '["中老年", "白领"]', '["润肺止咳", "安神助眠"]', '["秋季", "白露", "寒露"]', '{"calories": 180, "protein": 6, "fat": 3, "carbs": 32}',
    3316, 267, 60, 4.6, 1, '2026-02-21 20:49:27', '2026-02-21 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (12, '枇杷叶瘦肉汤', '枇杷叶瘦肉汤', '枇杷叶瘦肉汤', '枇杷叶瘦肉汤是一道传统的食疗养生佳品，具有润肺止咳的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '枇杷叶瘦肉汤是一道傳統的食療養生佳品，具有润肺止咳的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '枇杷叶瘦肉汤 is a traditional therapeutic recipe with benefits of 润肺止咳. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=12', NULL, NULL, '["中老年", "儿童"]', '["润肺止咳"]', '["春季", "秋季"]', '{"calories": 250, "protein": 20, "fat": 12, "carbs": 5}',
    1852, 139, 46, 4.8, 1, '2025-12-13 20:49:27', '2025-12-13 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (13, '沙参玉竹老鸭汤', '沙参玉竹老鸭汤', '沙参玉竹老鸭汤', '沙参玉竹老鸭汤是一道传统的食疗养生佳品，具有润肺止咳、补气养血的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '沙参玉竹老鸭汤是一道傳統的食療養生佳品，具有润肺止咳、补气养血的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '沙参玉竹老鸭汤 is a traditional therapeutic recipe with benefits of 润肺止咳、补气养血. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=13', '/videos/recipes/沙参玉竹老鸭汤.mp4', 146, '["中老年", "通用"]', '["润肺止咳", "补气养血"]', '["秋季", "处暑", "白露"]', '{"calories": 380, "protein": 28, "fat": 25, "carbs": 8}',
    4688, 245, 20, 4.2, 1, '2025-10-07 20:49:27', '2025-10-07 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (14, '罗汉果菊花茶', '罗汉果菊花茶', '罗汉果菊花茶', '罗汉果菊花茶是一道传统的食疗养生佳品，具有润肺止咳、清热解毒的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '罗汉果菊花茶是一道傳統的食療養生佳品，具有润肺止咳、清热解毒的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '罗汉果菊花茶 is a traditional therapeutic recipe with benefits of 润肺止咳、清热解毒. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=14', NULL, NULL, '["白领", "中老年"]', '["润肺止咳", "清热解毒"]', '["秋季", "夏季"]', '{"calories": 15, "protein": 0, "fat": 0, "carbs": 4}',
    752, 406, 96, 4.1, 1, '2025-12-31 20:49:27', '2025-12-31 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (15, '白萝卜蜂蜜饮', '白萝卜蜂蜜饮', '白萝卜蜂蜜饮', '白萝卜蜂蜜饮是一道传统的食疗养生佳品，具有润肺止咳的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '白萝卜蜂蜜饮是一道傳統的食療養生佳品，具有润肺止咳的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '白萝卜蜂蜜饮 is a traditional therapeutic recipe with benefits of 润肺止咳. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=15', '/videos/recipes/白萝卜蜂蜜饮.mp4', 215, '["儿童", "中老年"]', '["润肺止咳"]', '["冬季", "秋季"]', '{"calories": 80, "protein": 1, "fat": 0, "carbs": 19}',
    4128, 326, 58, 4.6, 1, '2025-09-18 20:49:27', '2025-09-18 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (16, '南北杏猪肺汤', '南北杏猪肺汤', '南北杏猪肺汤', '南北杏猪肺汤是一道传统的食疗养生佳品，具有润肺止咳的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '南北杏猪肺汤是一道傳統的食療養生佳品，具有润肺止咳的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '南北杏猪肺汤 is a traditional therapeutic recipe with benefits of 润肺止咳. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=16', '/videos/recipes/南北杏猪肺汤.mp4', 71, '["中老年", "通用"]', '["润肺止咳"]', '["秋季", "冬季"]', '{"calories": 220, "protein": 18, "fat": 14, "carbs": 6}',
    2840, 313, 69, 4.5, 1, '2025-09-19 20:49:27', '2025-09-19 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (17, '当归红枣乌鸡汤', '当归红枣乌鸡汤', '当归红枣乌鸡汤', '当归红枣乌鸡汤是一道传统的食疗养生佳品，具有补气养血的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '当归红枣乌鸡汤是一道傳統的食療養生佳品，具有补气养血的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '当归红枣乌鸡汤 is a traditional therapeutic recipe with benefits of 补气养血. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=17', '/videos/recipes/当归红枣乌鸡汤.mp4', 144, '["女性", "中老年"]', '["补气养血"]', '["冬季", "秋季"]', '{"calories": 320, "protein": 28, "fat": 16, "carbs": 10}',
    1178, 381, 73, 4.7, 1, '2026-02-15 20:49:27', '2026-02-15 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (18, '阿胶红糖粥', '阿胶红糖粥', '阿胶红糖粥', '阿胶红糖粥是一道传统的食疗养生佳品，具有补气养血、美容养颜的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '阿胶红糖粥是一道傳統的食療養生佳品，具有补气养血、美容养颜的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '阿胶红糖粥 is a traditional therapeutic recipe with benefits of 补气养血、美容养颜. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=18', '/videos/recipes/阿胶红糖粥.mp4', 214, '["女性"]', '["补气养血", "美容养颜"]', '["冬季", "秋季"]', '{"calories": 280, "protein": 6, "fat": 2, "carbs": 58}',
    4240, 165, 10, 4.2, 1, '2025-10-05 20:49:27', '2025-10-05 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (19, '枸杞桂圆红枣茶', '枸杞桂圆红枣茶', '枸杞桂圆红枣茶', '枸杞桂圆红枣茶是一道传统的食疗养生佳品，具有补气养血、安神助眠的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '枸杞桂圆红枣茶是一道傳統的食療養生佳品，具有补气养血、安神助眠的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '枸杞桂圆红枣茶 is a traditional therapeutic recipe with benefits of 补气养血、安神助眠. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=19', NULL, NULL, '["女性", "中老年", "白领"]', '["补气养血", "安神助眠"]', '["四季"]', '{"calories": 120, "protein": 2, "fat": 0, "carbs": 28}',
    3611, 41, 30, 4.3, 1, '2025-09-29 20:49:27', '2025-09-29 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (20, '花生红衣猪蹄汤', '花生红衣猪蹄汤', '花生红衣猪蹄汤', '花生红衣猪蹄汤是一道传统的食疗养生佳品，具有补气养血的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '花生红衣猪蹄汤是一道傳統的食療養生佳品，具有补气养血的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '花生红衣猪蹄汤 is a traditional therapeutic recipe with benefits of 补气养血. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=20', NULL, NULL, '["女性", "中老年"]', '["补气养血"]', '["冬季", "秋季"]', '{"calories": 450, "protein": 32, "fat": 30, "carbs": 12}',
    1400, 454, 95, 4.2, 1, '2026-02-23 20:49:27', '2026-02-23 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (21, '四物汤', '四物汤', '四物汤', '四物汤是一道传统的食疗养生佳品，具有补气养血的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '四物汤是一道傳統的食療養生佳品，具有补气养血的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '四物汤 is a traditional therapeutic recipe with benefits of 补气养血. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=21', '/videos/recipes/四物汤.mp4', 203, '["女性"]', '["补气养血"]', '["秋季", "冬季"]', '{"calories": 80, "protein": 4, "fat": 1, "carbs": 14}',
    3333, 258, 83, 4.7, 1, '2026-02-12 20:49:27', '2026-02-12 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (22, '猪肝菠菜汤', '猪肝菠菜汤', '猪肝菠菜汤', '猪肝菠菜汤是一道传统的食疗养生佳品，具有补气养血的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '猪肝菠菜汤是一道傳統的食療養生佳品，具有补气养血的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '猪肝菠菜汤 is a traditional therapeutic recipe with benefits of 补气养血. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=22', NULL, NULL, '["女性", "儿童", "中老年"]', '["补气养血"]', '["春季", "秋季"]', '{"calories": 180, "protein": 22, "fat": 8, "carbs": 8}',
    4469, 274, 19, 4.5, 1, '2026-02-06 20:49:27', '2026-02-06 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (23, '黑芝麻糊', '黑芝麻糊', '黑芝麻糊', '黑芝麻糊是一道传统的食疗养生佳品，具有补气养血、美容养颜的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '黑芝麻糊是一道傳統的食療養生佳品，具有补气养血、美容养颜的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '黑芝麻糊 is a traditional therapeutic recipe with benefits of 补气养血、美容养颜. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=23', NULL, NULL, '["中老年", "女性", "通用"]', '["补气养血", "美容养颜"]', '["冬季", "秋季"]', '{"calories": 240, "protein": 8, "fat": 12, "carbs": 28}',
    4629, 332, 46, 4.8, 1, '2025-10-11 20:49:27', '2025-10-11 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (24, '桂圆莲子羹', '桂圆莲子羹', '桂圆莲子羹', '桂圆莲子羹是一道传统的食疗养生佳品，具有补气养血、安神助眠的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '桂圆莲子羹是一道傳統的食療養生佳品，具有补气养血、安神助眠的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '桂圆莲子羹 is a traditional therapeutic recipe with benefits of 补气养血、安神助眠. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=24', '/videos/recipes/桂圆莲子羹.mp4', 140, '["女性", "中老年"]', '["补气养血", "安神助眠"]', '["秋季", "冬季"]', '{"calories": 200, "protein": 5, "fat": 1, "carbs": 42}',
    4193, 46, 52, 4.5, 1, '2025-12-21 20:49:27', '2025-12-21 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (25, '红豆薏米补血粥', '红豆薏米补血粥', '红豆薏米补血粥', '红豆薏米补血粥是一道传统的食疗养生佳品，具有补气养血、祛湿排毒的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '红豆薏米补血粥是一道傳統的食療養生佳品，具有补气养血、祛湿排毒的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '红豆薏米补血粥 is a traditional therapeutic recipe with benefits of 补气养血、祛湿排毒. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=25', '/videos/recipes/红豆薏米补血粥.mp4', 277, '["女性", "中老年"]', '["补气养血", "祛湿排毒"]', '["春季", "夏季"]', '{"calories": 210, "protein": 7, "fat": 2, "carbs": 40}',
    3657, 428, 85, 4.6, 1, '2025-10-17 20:49:27', '2025-10-17 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (26, '酸枣仁安神茶', '酸枣仁安神茶', '酸枣仁安神茶', '酸枣仁安神茶是一道传统的食疗养生佳品，具有安神助眠的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '酸枣仁安神茶是一道傳統的食療養生佳品，具有安神助眠的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '酸枣仁安神茶 is a traditional therapeutic recipe with benefits of 安神助眠. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=26', '/videos/recipes/酸枣仁安神茶.mp4', 222, '["中老年", "白领", "女性"]', '["安神助眠"]', '["秋季", "冬季"]', '{"calories": 25, "protein": 1, "fat": 0, "carbs": 5}',
    257, 74, 49, 4.7, 1, '2026-03-03 20:49:27', '2026-03-03 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (27, '柏子仁粥', '柏子仁粥', '柏子仁粥', '柏子仁粥是一道传统的食疗养生佳品，具有安神助眠的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '柏子仁粥是一道傳統的食療養生佳品，具有安神助眠的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '柏子仁粥 is a traditional therapeutic recipe with benefits of 安神助眠. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=27', '/videos/recipes/柏子仁粥.mp4', 204, '["中老年", "白领"]', '["安神助眠"]', '["四季"]', '{"calories": 170, "protein": 5, "fat": 2, "carbs": 32}',
    2612, 335, 94, 5.0, 1, '2026-02-28 20:49:27', '2026-02-28 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (28, '百合麦冬汤', '百合麦冬汤', '百合麦冬汤', '百合麦冬汤是一道传统的食疗养生佳品，具有安神助眠、润肺止咳的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '百合麦冬汤是一道傳統的食療養生佳品，具有安神助眠、润肺止咳的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '百合麦冬汤 is a traditional therapeutic recipe with benefits of 安神助眠、润肺止咳. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=28', NULL, NULL, '["中老年", "女性"]', '["安神助眠", "润肺止咳"]', '["秋季", "夏季"]', '{"calories": 60, "protein": 2, "fat": 0, "carbs": 12}',
    2071, 418, 29, 4.8, 1, '2025-10-17 20:49:27', '2025-10-17 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (29, '龙眼肉粥', '龙眼肉粥', '龙眼肉粥', '龙眼肉粥是一道传统的食疗养生佳品，具有安神助眠、补气养血的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '龙眼肉粥是一道傳統的食療養生佳品，具有安神助眠、补气养血的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '龙眼肉粥 is a traditional therapeutic recipe with benefits of 安神助眠、补气养血. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=29', '/videos/recipes/龙眼肉粥.mp4', 186, '["中老年", "女性"]', '["安神助眠", "补气养血"]', '["冬季", "秋季"]', '{"calories": 220, "protein": 5, "fat": 1, "carbs": 48}',
    3012, 234, 76, 4.6, 1, '2026-02-25 20:49:27', '2026-02-25 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (30, '五味子茶', '五味子茶', '五味子茶', '五味子茶是一道传统的食疗养生佳品，具有安神助眠的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '五味子茶是一道傳統的食療養生佳品，具有安神助眠的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '五味子茶 is a traditional therapeutic recipe with benefits of 安神助眠. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=30', '/videos/recipes/五味子茶.mp4', 206, '["中老年", "白领"]', '["安神助眠"]', '["秋季", "冬季"]', '{"calories": 10, "protein": 0, "fat": 0, "carbs": 2}',
    1449, 31, 27, 4.5, 1, '2026-02-26 20:49:27', '2026-02-26 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (31, '远志莲子汤', '远志莲子汤', '远志莲子汤', '远志莲子汤是一道传统的食疗养生佳品，具有安神助眠、健脾养胃的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '远志莲子汤是一道傳統的食療養生佳品，具有安神助眠、健脾养胃的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '远志莲子汤 is a traditional therapeutic recipe with benefits of 安神助眠、健脾养胃. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=31', NULL, NULL, '["中老年", "通用"]', '["安神助眠", "健脾养胃"]', '["四季"]', '{"calories": 80, "protein": 3, "fat": 0, "carbs": 16}',
    4628, 366, 49, 4.7, 1, '2026-03-06 20:49:27', '2026-03-06 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (32, '灵芝孢子粉饮', '灵芝孢子粉饮', '灵芝孢子粉饮', '灵芝孢子粉饮是一道传统的食疗养生佳品，具有安神助眠、增强免疫的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '灵芝孢子粉饮是一道傳統的食療養生佳品，具有安神助眠、增强免疫的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '灵芝孢子粉饮 is a traditional therapeutic recipe with benefits of 安神助眠、增强免疫. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=32', '/videos/recipes/灵芝孢子粉饮.mp4', 230, '["中老年", "白领"]', '["安神助眠", "增强免疫"]', '["秋季", "冬季"]', '{"calories": 30, "protein": 2, "fat": 1, "carbs": 4}',
    4257, 123, 45, 4.1, 1, '2026-03-05 20:49:27', '2026-03-05 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (33, '桃胶银耳羹', '桃胶银耳羹', '桃胶银耳羹', '桃胶银耳羹是一道传统的食疗养生佳品，具有美容养颜的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '桃胶银耳羹是一道傳統的食療養生佳品，具有美容养颜的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '桃胶银耳羹 is a traditional therapeutic recipe with benefits of 美容养颜. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=33', NULL, NULL, '["女性"]', '["美容养颜"]', '["秋季", "冬季"]', '{"calories": 150, "protein": 3, "fat": 0, "carbs": 35}',
    4403, 10, 27, 4.1, 1, '2026-01-22 20:49:27', '2026-01-22 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (34, '燕窝炖雪梨', '燕窝炖雪梨', '燕窝炖雪梨', '燕窝炖雪梨是一道传统的食疗养生佳品，具有美容养颜、润肺止咳的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '燕窝炖雪梨是一道傳統的食療養生佳品，具有美容养颜、润肺止咳的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '燕窝炖雪梨 is a traditional therapeutic recipe with benefits of 美容养颜、润肺止咳. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=34', '/videos/recipes/燕窝炖雪梨.mp4', 92, '["女性", "中老年"]', '["美容养颜", "润肺止咳"]', '["秋季", "冬季"]', '{"calories": 120, "protein": 8, "fat": 0, "carbs": 22}',
    4345, 429, 48, 4.9, 1, '2025-12-13 20:49:27', '2025-12-13 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (35, '玫瑰花茶', '玫瑰花茶', '玫瑰花茶', '玫瑰花茶是一道传统的食疗养生佳品，具有美容养颜的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '玫瑰花茶是一道傳統的食療養生佳品，具有美容养颜的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '玫瑰花茶 is a traditional therapeutic recipe with benefits of 美容养颜. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=35', NULL, NULL, '["女性", "白领"]', '["美容养颜"]', '["春季", "夏季"]', '{"calories": 5, "protein": 0, "fat": 0, "carbs": 1}',
    624, 152, 11, 4.0, 1, '2026-03-04 20:49:27', '2026-03-04 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (36, '木瓜炖雪蛤', '木瓜炖雪蛤', '木瓜炖雪蛤', '木瓜炖雪蛤是一道传统的食疗养生佳品，具有美容养颜的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '木瓜炖雪蛤是一道傳統的食療養生佳品，具有美容养颜的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '木瓜炖雪蛤 is a traditional therapeutic recipe with benefits of 美容养颜. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=36', NULL, NULL, '["女性"]', '["美容养颜"]', '["秋季", "冬季"]', '{"calories": 180, "protein": 12, "fat": 8, "carbs": 18}',
    2512, 177, 86, 4.7, 1, '2025-12-19 20:49:27', '2025-12-19 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (37, '蜂蜜柠檬水', '蜂蜜柠檬水', '蜂蜜柠檬水', '蜂蜜柠檬水是一道传统的食疗养生佳品，具有美容养颜、清热解毒的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '蜂蜜柠檬水是一道傳統的食療養生佳品，具有美容养颜、清热解毒的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '蜂蜜柠檬水 is a traditional therapeutic recipe with benefits of 美容养颜、清热解毒. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=37', NULL, NULL, '["女性", "通用"]', '["美容养颜", "清热解毒"]', '["夏季", "春季"]', '{"calories": 60, "protein": 0, "fat": 0, "carbs": 16}',
    4237, 113, 18, 4.5, 1, '2025-10-16 20:49:27', '2025-10-16 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (38, '紫薯银耳羹', '紫薯银耳羹', '紫薯银耳羹', '紫薯银耳羹是一道传统的食疗养生佳品，具有美容养颜、健脾养胃的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '紫薯银耳羹是一道傳統的食療養生佳品，具有美容养颜、健脾养胃的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '紫薯银耳羹 is a traditional therapeutic recipe with benefits of 美容养颜、健脾养胃. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=38', NULL, NULL, '["女性", "中老年"]', '["美容养颜", "健脾养胃"]', '["秋季", "冬季"]', '{"calories": 160, "protein": 4, "fat": 0, "carbs": 36}',
    3487, 467, 32, 4.3, 1, '2026-02-09 20:49:27', '2026-02-09 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (39, '胶原蛋白汤', '胶原蛋白汤', '胶原蛋白汤', '胶原蛋白汤是一道传统的食疗养生佳品，具有美容养颜的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '胶原蛋白汤是一道傳統的食療養生佳品，具有美容养颜的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '胶原蛋白汤 is a traditional therapeutic recipe with benefits of 美容养颜. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=39', NULL, NULL, '["女性"]', '["美容养颜"]', '["冬季", "秋季"]', '{"calories": 200, "protein": 18, "fat": 10, "carbs": 8}',
    262, 262, 10, 4.0, 1, '2025-09-25 20:49:27', '2025-09-25 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (40, '绿豆汤', '绿豆汤', '绿豆汤', '绿豆汤是一道传统的食疗养生佳品，具有清热解毒的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '绿豆汤是一道傳統的食療養生佳品，具有清热解毒的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '绿豆汤 is a traditional therapeutic recipe with benefits of 清热解毒. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=40', NULL, NULL, '["通用", "儿童", "中老年"]', '["清热解毒"]', '["夏季", "小暑", "大暑"]', '{"calories": 120, "protein": 6, "fat": 0, "carbs": 24}',
    4777, 295, 78, 4.5, 1, '2025-12-11 20:49:27', '2025-12-11 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (41, '苦瓜排骨汤', '苦瓜排骨汤', '苦瓜排骨汤', '苦瓜排骨汤是一道传统的食疗养生佳品，具有清热解毒、降压降脂的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '苦瓜排骨汤是一道傳統的食療養生佳品，具有清热解毒、降压降脂的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '苦瓜排骨汤 is a traditional therapeutic recipe with benefits of 清热解毒、降压降脂. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=41', '/videos/recipes/苦瓜排骨汤.mp4', 128, '["中老年", "通用"]', '["清热解毒", "降压降脂"]', '["夏季", "秋季"]', '{"calories": 280, "protein": 22, "fat": 16, "carbs": 8}',
    2346, 54, 74, 4.9, 1, '2025-11-20 20:49:27', '2025-11-20 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (42, '金银花菊花茶', '金银花菊花茶', '金银花菊花茶', '金银花菊花茶是一道传统的食疗养生佳品，具有清热解毒的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '金银花菊花茶是一道傳統的食療養生佳品，具有清热解毒的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '金银花菊花茶 is a traditional therapeutic recipe with benefits of 清热解毒. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=42', NULL, NULL, '["白领", "通用"]', '["清热解毒"]', '["夏季", "秋季"]', '{"calories": 10, "protein": 0, "fat": 0, "carbs": 2}',
    1491, 411, 91, 4.4, 1, '2025-11-24 20:49:27', '2025-11-24 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (43, '冬瓜薏米汤', '冬瓜薏米汤', '冬瓜薏米汤', '冬瓜薏米汤是一道传统的食疗养生佳品，具有清热解毒、祛湿排毒的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '冬瓜薏米汤是一道傳統的食療養生佳品，具有清热解毒、祛湿排毒的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '冬瓜薏米汤 is a traditional therapeutic recipe with benefits of 清热解毒、祛湿排毒. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=43', '/videos/recipes/冬瓜薏米汤.mp4', 136, '["中老年", "女性"]', '["清热解毒", "祛湿排毒"]', '["夏季", "秋季"]', '{"calories": 80, "protein": 3, "fat": 0, "carbs": 16}',
    3885, 498, 85, 4.6, 1, '2026-01-02 20:49:27', '2026-01-02 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (44, '蒲公英茶', '蒲公英茶', '蒲公英茶', '蒲公英茶是一道传统的食疗养生佳品，具有清热解毒的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '蒲公英茶是一道傳統的食療養生佳品，具有清热解毒的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '蒲公英茶 is a traditional therapeutic recipe with benefits of 清热解毒. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=44', NULL, NULL, '["中老年", "通用"]', '["清热解毒"]', '["春季", "夏季"]', '{"calories": 5, "protein": 0, "fat": 0, "carbs": 1}',
    3636, 441, 20, 4.9, 1, '2026-01-23 20:49:27', '2026-01-23 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (45, '莲藕排骨汤', '莲藕排骨汤', '莲藕排骨汤', '莲藕排骨汤是一道传统的食疗养生佳品，具有清热解毒、健脾养胃的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '莲藕排骨汤是一道傳統的食療養生佳品，具有清热解毒、健脾养胃的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '莲藕排骨汤 is a traditional therapeutic recipe with benefits of 清热解毒、健脾养胃. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=45', '/videos/recipes/莲藕排骨汤.mp4', 269, '["中老年", "儿童", "通用"]', '["清热解毒", "健脾养胃"]', '["秋季", "冬季"]', '{"calories": 320, "protein": 24, "fat": 18, "carbs": 12}',
    2781, 56, 96, 4.5, 1, '2026-01-04 20:49:27', '2026-01-04 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (46, '芹菜汁', '芹菜汁', '芹菜汁', '芹菜汁是一道传统的食疗养生佳品，具有降压降脂的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '芹菜汁是一道傳統的食療養生佳品，具有降压降脂的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '芹菜汁 is a traditional therapeutic recipe with benefits of 降压降脂. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=46', NULL, NULL, '["中老年", "白领"]', '["降压降脂"]', '["春季", "夏季"]', '{"calories": 35, "protein": 2, "fat": 0, "carbs": 7}',
    4703, 409, 7, 4.5, 1, '2025-12-16 20:49:27', '2025-12-16 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (47, '山楂荷叶茶', '山楂荷叶茶', '山楂荷叶茶', '山楂荷叶茶是一道传统的食疗养生佳品，具有降压降脂的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '山楂荷叶茶是一道傳統的食療養生佳品，具有降压降脂的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '山楂荷叶茶 is a traditional therapeutic recipe with benefits of 降压降脂. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=47', '/videos/recipes/山楂荷叶茶.mp4', 88, '["中老年", "通用"]', '["降压降脂"]', '["夏季", "秋季"]', '{"calories": 20, "protein": 0, "fat": 0, "carbs": 5}',
    787, 241, 84, 4.8, 1, '2025-11-14 20:49:27', '2025-11-14 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (48, '决明子茶', '决明子茶', '决明子茶', '决明子茶是一道传统的食疗养生佳品，具有降压降脂、清热解毒的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '决明子茶是一道傳統的食療養生佳品，具有降压降脂、清热解毒的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '决明子茶 is a traditional therapeutic recipe with benefits of 降压降脂、清热解毒. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=48', '/videos/recipes/决明子茶.mp4', 176, '["中老年", "白领"]', '["降压降脂", "清热解毒"]', '["秋季", "冬季"]', '{"calories": 15, "protein": 1, "fat": 0, "carbs": 3}',
    697, 251, 17, 5.0, 1, '2026-01-24 20:49:27', '2026-01-24 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (49, '黑木耳红枣汤', '黑木耳红枣汤', '黑木耳红枣汤', '黑木耳红枣汤是一道传统的食疗养生佳品，具有降压降脂、补气养血的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '黑木耳红枣汤是一道傳統的食療養生佳品，具有降压降脂、补气养血的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '黑木耳红枣汤 is a traditional therapeutic recipe with benefits of 降压降脂、补气养血. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=49', '/videos/recipes/黑木耳红枣汤.mp4', 270, '["中老年", "女性"]', '["降压降脂", "补气养血"]', '["秋季", "冬季"]', '{"calories": 140, "protein": 5, "fat": 1, "carbs": 28}',
    4359, 482, 51, 4.7, 1, '2026-03-02 20:49:27', '2026-03-02 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (50, '海带豆腐汤', '海带豆腐汤', '海带豆腐汤', '海带豆腐汤是一道传统的食疗养生佳品，具有降压降脂的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '海带豆腐汤是一道傳統的食療養生佳品，具有降压降脂的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '海带豆腐汤 is a traditional therapeutic recipe with benefits of 降压降脂. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=50', NULL, NULL, '["中老年", "通用"]', '["降压降脂"]', '["四季"]', '{"calories": 120, "protein": 10, "fat": 4, "carbs": 10}',
    3140, 21, 34, 4.3, 1, '2026-01-13 20:49:27', '2026-01-13 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (51, '燕麦粥', '燕麦粥', '燕麦粥', '燕麦粥是一道传统的食疗养生佳品，具有降压降脂、健脾养胃的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '燕麦粥是一道傳統的食療養生佳品，具有降压降脂、健脾养胃的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '燕麦粥 is a traditional therapeutic recipe with benefits of 降压降脂、健脾养胃. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=51', '/videos/recipes/燕麦粥.mp4', 235, '["中老年", "白领", "通用"]', '["降压降脂", "健脾养胃"]', '["四季"]', '{"calories": 150, "protein": 6, "fat": 3, "carbs": 26}',
    1732, 454, 18, 4.5, 1, '2025-10-24 20:49:27', '2025-10-24 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (52, '黄芪党参鸡汤', '黄芪党参鸡汤', '黄芪党参鸡汤', '黄芪党参鸡汤是一道传统的食疗养生佳品，具有增强免疫、补气养血的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '黄芪党参鸡汤是一道傳統的食療養生佳品，具有增强免疫、补气养血的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '黄芪党参鸡汤 is a traditional therapeutic recipe with benefits of 增强免疫、补气养血. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=52', '/videos/recipes/黄芪党参鸡汤.mp4', 110, '["中老年", "通用"]', '["增强免疫", "补气养血"]', '["冬季", "秋季"]', '{"calories": 340, "protein": 30, "fat": 18, "carbs": 8}',
    4364, 399, 31, 4.2, 1, '2026-01-18 20:49:27', '2026-01-18 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (53, '虫草花炖排骨', '虫草花炖排骨', '虫草花炖排骨', '虫草花炖排骨是一道传统的食疗养生佳品，具有增强免疫的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '虫草花炖排骨是一道傳統的食療養生佳品，具有增强免疫的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '虫草花炖排骨 is a traditional therapeutic recipe with benefits of 增强免疫. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=53', '/videos/recipes/虫草花炖排骨.mp4', 184, '["中老年", "通用"]', '["增强免疫"]', '["秋季", "冬季"]', '{"calories": 380, "protein": 28, "fat": 22, "carbs": 10}',
    4653, 476, 74, 4.8, 1, '2026-02-03 20:49:27', '2026-02-03 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (54, '灵芝煲鸡汤', '灵芝煲鸡汤', '灵芝煲鸡汤', '灵芝煲鸡汤是一道传统的食疗养生佳品，具有增强免疫、安神助眠的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '灵芝煲鸡汤是一道傳統的食療養生佳品，具有增强免疫、安神助眠的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '灵芝煲鸡汤 is a traditional therapeutic recipe with benefits of 增强免疫、安神助眠. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=54', NULL, NULL, '["中老年", "通用"]', '["增强免疫", "安神助眠"]', '["冬季", "秋季"]', '{"calories": 360, "protein": 32, "fat": 20, "carbs": 6}',
    4606, 165, 73, 4.8, 1, '2025-09-22 20:49:27', '2025-09-22 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (55, '人参枸杞茶', '人参枸杞茶', '人参枸杞茶', '人参枸杞茶是一道传统的食疗养生佳品，具有增强免疫、补气养血的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '人参枸杞茶是一道傳統的食療養生佳品，具有增强免疫、补气养血的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '人参枸杞茶 is a traditional therapeutic recipe with benefits of 增强免疫、补气养血. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=55', '/videos/recipes/人参枸杞茶.mp4', 149, '["中老年", "白领"]', '["增强免疫", "补气养血"]', '["冬季", "秋季"]', '{"calories": 40, "protein": 2, "fat": 0, "carbs": 8}',
    191, 155, 25, 4.8, 1, '2025-12-30 20:49:27', '2025-12-30 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (56, '花胶炖鸡汤', '花胶炖鸡汤', '花胶炖鸡汤', '花胶炖鸡汤是一道传统的食疗养生佳品，具有增强免疫、美容养颜的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '花胶炖鸡汤是一道傳統的食療養生佳品，具有增强免疫、美容养颜的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '花胶炖鸡汤 is a traditional therapeutic recipe with benefits of 增强免疫、美容养颜. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=56', NULL, NULL, '["中老年", "女性"]', '["增强免疫", "美容养颜"]', '["冬季", "秋季"]', '{"calories": 420, "protein": 35, "fat": 24, "carbs": 8}',
    2114, 105, 24, 4.8, 1, '2026-02-15 20:49:27', '2026-02-15 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (57, '牛蒡排骨汤', '牛蒡排骨汤', '牛蒡排骨汤', '牛蒡排骨汤是一道传统的食疗养生佳品，具有增强免疫、清热解毒的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '牛蒡排骨汤是一道傳統的食療養生佳品，具有增强免疫、清热解毒的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '牛蒡排骨汤 is a traditional therapeutic recipe with benefits of 增强免疫、清热解毒. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=57', NULL, NULL, '["中老年", "通用"]', '["增强免疫", "清热解毒"]', '["春季", "秋季"]', '{"calories": 340, "protein": 26, "fat": 20, "carbs": 12}',
    603, 304, 90, 4.6, 1, '2026-02-03 20:49:27', '2026-02-03 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (58, '红豆薏米水', '红豆薏米水', '红豆薏米水', '红豆薏米水是一道传统的食疗养生佳品，具有祛湿排毒的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '红豆薏米水是一道傳統的食療養生佳品，具有祛湿排毒的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '红豆薏米水 is a traditional therapeutic recipe with benefits of 祛湿排毒. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=58', NULL, NULL, '["女性", "中老年", "通用"]', '["祛湿排毒"]', '["夏季", "秋季"]', '{"calories": 90, "protein": 4, "fat": 0, "carbs": 18}',
    3714, 81, 77, 4.1, 1, '2026-02-13 20:49:27', '2026-02-13 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (59, '茯苓白术汤', '茯苓白术汤', '茯苓白术汤', '茯苓白术汤是一道传统的食疗养生佳品，具有祛湿排毒、健脾养胃的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '茯苓白术汤是一道傳統的食療養生佳品，具有祛湿排毒、健脾养胃的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '茯苓白术汤 is a traditional therapeutic recipe with benefits of 祛湿排毒、健脾养胃. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=59', NULL, NULL, '["中老年", "通用"]', '["祛湿排毒", "健脾养胃"]', '["夏季", "秋季"]', '{"calories": 60, "protein": 2, "fat": 0, "carbs": 12}',
    1731, 302, 7, 4.5, 1, '2026-01-25 20:49:27', '2026-01-25 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (60, '冬瓜荷叶汤', '冬瓜荷叶汤', '冬瓜荷叶汤', '冬瓜荷叶汤是一道传统的食疗养生佳品，具有祛湿排毒、清热解毒的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '冬瓜荷叶汤是一道傳統的食療養生佳品，具有祛湿排毒、清热解毒的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '冬瓜荷叶汤 is a traditional therapeutic recipe with benefits of 祛湿排毒、清热解毒. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=60', '/videos/recipes/冬瓜荷叶汤.mp4', 185, '["中老年", "女性"]', '["祛湿排毒", "清热解毒"]', '["夏季", "秋季"]', '{"calories": 50, "protein": 2, "fat": 0, "carbs": 10}',
    2700, 486, 21, 4.6, 1, '2025-10-31 20:49:27', '2025-10-31 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (61, '玉米须茶', '玉米须茶', '玉米须茶', '玉米须茶是一道传统的食疗养生佳品，具有祛湿排毒、降压降脂的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '玉米须茶是一道傳統的食療養生佳品，具有祛湿排毒、降压降脂的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '玉米须茶 is a traditional therapeutic recipe with benefits of 祛湿排毒、降压降脂. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=61', NULL, NULL, '["中老年", "通用"]', '["祛湿排毒", "降压降脂"]', '["夏季", "秋季"]', '{"calories": 5, "protein": 0, "fat": 0, "carbs": 1}',
    1354, 210, 17, 4.5, 1, '2025-11-12 20:49:27', '2025-11-12 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (62, '赤小豆鲫鱼汤', '赤小豆鲫鱼汤', '赤小豆鲫鱼汤', '赤小豆鲫鱼汤是一道传统的食疗养生佳品，具有祛湿排毒的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '赤小豆鲫鱼汤是一道傳統的食療養生佳品，具有祛湿排毒的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '赤小豆鲫鱼汤 is a traditional therapeutic recipe with benefits of 祛湿排毒. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=62', '/videos/recipes/赤小豆鲫鱼汤.mp4', 211, '["中老年", "通用"]', '["祛湿排毒"]', '["春季", "夏季"]', '{"calories": 280, "protein": 28, "fat": 14, "carbs": 6}',
    2446, 22, 99, 4.3, 1, '2025-09-30 20:49:27', '2025-09-30 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (63, '土茯苓煲龟', '土茯苓煲龟', '土茯苓煲龟', '土茯苓煲龟是一道传统的食疗养生佳品，具有祛湿排毒、清热解毒的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '土茯苓煲龟是一道傳統的食療養生佳品，具有祛湿排毒、清热解毒的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '土茯苓煲龟 is a traditional therapeutic recipe with benefits of 祛湿排毒、清热解毒. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=63', '/videos/recipes/土茯苓煲龟.mp4', 267, '["中老年", "通用"]', '["祛湿排毒", "清热解毒"]', '["夏季", "秋季"]', '{"calories": 320, "protein": 35, "fat": 16, "carbs": 4}',
    3623, 210, 21, 4.1, 1, '2025-10-03 20:49:27', '2025-10-03 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (64, '杜仲猪腰汤', '杜仲猪腰汤', '杜仲猪腰汤', '杜仲猪腰汤是一道传统的食疗养生佳品，具有补肾壮阳的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '杜仲猪腰汤是一道傳統的食療養生佳品，具有补肾壮阳的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '杜仲猪腰汤 is a traditional therapeutic recipe with benefits of 补肾壮阳. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=64', NULL, NULL, '["中老年", "男性"]', '["补肾壮阳"]', '["冬季", "秋季"]', '{"calories": 380, "protein": 30, "fat": 24, "carbs": 6}',
    1500, 304, 88, 4.1, 1, '2025-10-30 20:49:27', '2025-10-30 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (65, '枸杞羊肉汤', '枸杞羊肉汤', '枸杞羊肉汤', '枸杞羊肉汤是一道传统的食疗养生佳品，具有补肾壮阳、补气养血的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '枸杞羊肉汤是一道傳統的食療養生佳品，具有补肾壮阳、补气养血的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '枸杞羊肉汤 is a traditional therapeutic recipe with benefits of 补肾壮阳、补气养血. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=65', '/videos/recipes/枸杞羊肉汤.mp4', 282, '["中老年", "男性"]', '["补肾壮阳", "补气养血"]', '["冬季", "立冬", "冬至"]', '{"calories": 450, "protein": 35, "fat": 30, "carbs": 8}',
    1806, 369, 75, 4.3, 1, '2026-01-25 20:49:27', '2026-01-25 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (66, '韭菜炒虾仁', '韭菜炒虾仁', '韭菜炒虾仁', '韭菜炒虾仁是一道传统的食疗养生佳品，具有补肾壮阳的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '韭菜炒虾仁是一道傳統的食療養生佳品，具有补肾壮阳的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '韭菜炒虾仁 is a traditional therapeutic recipe with benefits of 补肾壮阳. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=66', '/videos/recipes/韭菜炒虾仁.mp4', 78, '["中老年", "男性", "通用"]', '["补肾壮阳"]', '["春季", "冬季"]', '{"calories": 280, "protein": 28, "fat": 16, "carbs": 8}',
    3339, 370, 21, 4.7, 1, '2025-11-06 20:49:27', '2025-11-06 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (67, '核桃仁粥', '核桃仁粥', '核桃仁粥', '核桃仁粥是一道传统的食疗养生佳品，具有补肾壮阳、安神助眠的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '核桃仁粥是一道傳統的食療養生佳品，具有补肾壮阳、安神助眠的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '核桃仁粥 is a traditional therapeutic recipe with benefits of 补肾壮阳、安神助眠. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=67', '/videos/recipes/核桃仁粥.mp4', 288, '["中老年", "通用"]', '["补肾壮阳", "安神助眠"]', '["冬季", "秋季"]', '{"calories": 260, "protein": 10, "fat": 18, "carbs": 16}',
    1568, 337, 11, 4.4, 1, '2025-10-30 20:49:27', '2025-10-30 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (68, '海参小米粥', '海参小米粥', '海参小米粥', '海参小米粥是一道传统的食疗养生佳品，具有补肾壮阳、增强免疫的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '海参小米粥是一道傳統的食療養生佳品，具有补肾壮阳、增强免疫的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '海参小米粥 is a traditional therapeutic recipe with benefits of 补肾壮阳、增强免疫. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=68', '/videos/recipes/海参小米粥.mp4', 217, '["中老年", "通用"]', '["补肾壮阳", "增强免疫"]', '["冬季", "秋季"]', '{"calories": 320, "protein": 22, "fat": 12, "carbs": 30}',
    3451, 36, 64, 4.2, 1, '2026-03-11 20:49:27', '2026-03-11 20:49:27');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (69, '肉苁蓉炖羊肉', '肉苁蓉炖羊肉', '肉苁蓉炖羊肉', '肉苁蓉炖羊肉是一道传统的食疗养生佳品，具有补肾壮阳、补气养血的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '肉苁蓉炖羊肉是一道傳統的食療養生佳品，具有补肾壮阳、补气养血的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '肉苁蓉炖羊肉 is a traditional therapeutic recipe with benefits of 补肾壮阳、补气养血. Made with quality ingredients, perfect for daily wellness.',
    'https://loremflickr.com/600/400/food,recipe?lock=69', '/videos/recipes/肉苁蓉炖羊肉.mp4', 280, '["中老年", "男性"]', '["补肾壮阳", "补气养血"]', '["冬季", "大寒", "小寒"]', '{"calories": 480, "protein": 38, "fat": 32, "carbs": 6}',
    494, 124, 96, 4.5, 1, '2025-12-31 20:49:27', '2025-12-31 20:49:27');

SELECT '配方数据插入完成: 69条' AS message;

-- ============================================
-- 3. 食材数据
-- ============================================

INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (1, 1, '山药', '山药', '山药', '100g', 'https://loremflickr.com/200/200/food,ingredient?lock=1', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (2, 1, '小米', '小米', '小米', '80g', 'https://loremflickr.com/200/200/food,ingredient?lock=2', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (3, 1, '红枣', '红枣', '红枣', '5颗', 'https://loremflickr.com/200/200/food,ingredient?lock=3', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (4, 1, '冰糖', '冰糖', '冰糖', '适量', 'https://loremflickr.com/200/200/food,ingredient?lock=4', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (5, 2, '南瓜', '南瓜', '南瓜', '200g', 'https://loremflickr.com/200/200/food,ingredient?lock=5', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (6, 2, '红枣', '红枣', '红枣', '8颗', 'https://loremflickr.com/200/200/food,ingredient?lock=6', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (7, 2, '大米', '大米', '大米', '100g', 'https://loremflickr.com/200/200/food,ingredient?lock=7', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (8, 2, '红糖', '红糖', '红糖', '适量', 'https://loremflickr.com/200/200/food,ingredient?lock=8', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (9, 3, '猴头菇', '猴头菇', '猴头菇', '50g', 'https://loremflickr.com/200/200/food,ingredient?lock=9', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (10, 3, '土鸡', '土鸡', '土鸡', '半只', 'https://loremflickr.com/200/200/food,ingredient?lock=10', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (11, 3, '枸杞', '枸杞', '枸杞', '10g', 'https://loremflickr.com/200/200/food,ingredient?lock=11', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (12, 3, '姜片', '姜片', '姜片', '3片', 'https://loremflickr.com/200/200/food,ingredient?lock=12', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (13, 4, '莲子', '莲子', '莲子', '30g', 'https://loremflickr.com/200/200/food,ingredient?lock=13', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (14, 4, '百合', '百合', '百合', '20g', 'https://loremflickr.com/200/200/food,ingredient?lock=14', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (15, 4, '大米', '大米', '大米', '100g', 'https://loremflickr.com/200/200/food,ingredient?lock=15', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (16, 4, '冰糖', '冰糖', '冰糖', '适量', 'https://loremflickr.com/200/200/food,ingredient?lock=16', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (17, 5, '茯苓', '茯苓', '茯苓', '15g', 'https://loremflickr.com/200/200/food,ingredient?lock=17', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (18, 5, '山药', '山药', '山药', '150g', 'https://loremflickr.com/200/200/food,ingredient?lock=18', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (19, 5, '排骨', '排骨', '排骨', '300g', 'https://loremflickr.com/200/200/food,ingredient?lock=19', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (20, 5, '红枣', '红枣', '红枣', '5颗', 'https://loremflickr.com/200/200/food,ingredient?lock=20', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (21, 6, '陈皮', '陈皮', '陈皮', '5g', 'https://loremflickr.com/200/200/food,ingredient?lock=21', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (22, 6, '瘦肉', '瘦肉', '瘦肉', '100g', 'https://loremflickr.com/200/200/food,ingredient?lock=22', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (23, 6, '大米', '大米', '大米', '100g', 'https://loremflickr.com/200/200/food,ingredient?lock=23', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (24, 6, '姜丝', '姜丝', '姜丝', '少许', 'https://loremflickr.com/200/200/food,ingredient?lock=24', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (25, 7, '芡实', '芡实', '芡实', '30g', 'https://loremflickr.com/200/200/food,ingredient?lock=25', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (26, 7, '薏米', '薏米', '薏米', '30g', 'https://loremflickr.com/200/200/food,ingredient?lock=26', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (27, 7, '大米', '大米', '大米', '80g', 'https://loremflickr.com/200/200/food,ingredient?lock=27', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (28, 7, '红枣', '红枣', '红枣', '5颗', 'https://loremflickr.com/200/200/food,ingredient?lock=28', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (29, 8, '生姜', '生姜', '生姜', '30g', 'https://loremflickr.com/200/200/food,ingredient?lock=29', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (30, 8, '红糖', '红糖', '红糖', '30g', 'https://loremflickr.com/200/200/food,ingredient?lock=30', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (31, 8, '红枣', '红枣', '红枣', '6颗', 'https://loremflickr.com/200/200/food,ingredient?lock=31', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (32, 8, '水', '水', '水', '500ml', 'https://loremflickr.com/200/200/food,ingredient?lock=32', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (33, 9, '川贝', '川贝', '川贝', '5g', 'https://loremflickr.com/200/200/food,ingredient?lock=33', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (34, 9, '雪梨', '雪梨', '雪梨', '1个', 'https://loremflickr.com/200/200/food,ingredient?lock=34', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (35, 9, '冰糖', '冰糖', '冰糖', '适量', 'https://loremflickr.com/200/200/food,ingredient?lock=35', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (36, 9, '枸杞', '枸杞', '枸杞', '少许', 'https://loremflickr.com/200/200/food,ingredient?lock=36', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (37, 10, '银耳', '银耳', '银耳', '20g', 'https://loremflickr.com/200/200/food,ingredient?lock=37', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (38, 10, '莲子', '莲子', '莲子', '30g', 'https://loremflickr.com/200/200/food,ingredient?lock=38', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (39, 10, '冰糖', '冰糖', '冰糖', '适量', 'https://loremflickr.com/200/200/food,ingredient?lock=39', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (40, 10, '枸杞', '枸杞', '枸杞', '10g', 'https://loremflickr.com/200/200/food,ingredient?lock=40', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (41, 11, '百合', '百合', '百合', '30g', 'https://loremflickr.com/200/200/food,ingredient?lock=41', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (42, 11, '杏仁', '杏仁', '杏仁', '15g', 'https://loremflickr.com/200/200/food,ingredient?lock=42', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (43, 11, '大米', '大米', '大米', '100g', 'https://loremflickr.com/200/200/food,ingredient?lock=43', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (44, 11, '冰糖', '冰糖', '冰糖', '适量', 'https://loremflickr.com/200/200/food,ingredient?lock=44', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (45, 12, '枇杷叶', '枇杷叶', '枇杷叶', '10g', 'https://loremflickr.com/200/200/food,ingredient?lock=45', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (46, 12, '瘦肉', '瘦肉', '瘦肉', '200g', 'https://loremflickr.com/200/200/food,ingredient?lock=46', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (47, 12, '蜜枣', '蜜枣', '蜜枣', '2颗', 'https://loremflickr.com/200/200/food,ingredient?lock=47', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (48, 12, '姜片', '姜片', '姜片', '3片', 'https://loremflickr.com/200/200/food,ingredient?lock=48', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (49, 13, '沙参', '沙参', '沙参', '15g', 'https://loremflickr.com/200/200/food,ingredient?lock=49', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (50, 13, '玉竹', '玉竹', '玉竹', '15g', 'https://loremflickr.com/200/200/food,ingredient?lock=50', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (51, 13, '老鸭', '老鸭', '老鸭', '半只', 'https://loremflickr.com/200/200/food,ingredient?lock=51', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (52, 13, '枸杞', '枸杞', '枸杞', '10g', 'https://loremflickr.com/200/200/food,ingredient?lock=52', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (53, 14, '罗汉果', '罗汉果', '罗汉果', '1/4个', 'https://loremflickr.com/200/200/food,ingredient?lock=53', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (54, 14, '菊花', '菊花', '菊花', '10g', 'https://loremflickr.com/200/200/food,ingredient?lock=54', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (55, 14, '枸杞', '枸杞', '枸杞', '5g', 'https://loremflickr.com/200/200/food,ingredient?lock=55', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (56, 14, '冰糖', '冰糖', '冰糖', '适量', 'https://loremflickr.com/200/200/food,ingredient?lock=56', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (57, 15, '白萝卜', '白萝卜', '白萝卜', '200g', 'https://loremflickr.com/200/200/food,ingredient?lock=57', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (58, 15, '蜂蜜', '蜂蜜', '蜂蜜', '2勺', 'https://loremflickr.com/200/200/food,ingredient?lock=58', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (59, 15, '水', '水', '水', '300ml', 'https://loremflickr.com/200/200/food,ingredient?lock=59', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (60, 16, '南杏', '南杏', '南杏', '10g', 'https://loremflickr.com/200/200/food,ingredient?lock=60', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (61, 16, '北杏', '北杏', '北杏', '5g', 'https://loremflickr.com/200/200/food,ingredient?lock=61', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (62, 16, '猪肺', '猪肺', '猪肺', '300g', 'https://loremflickr.com/200/200/food,ingredient?lock=62', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (63, 16, '蜜枣', '蜜枣', '蜜枣', '2颗', 'https://loremflickr.com/200/200/food,ingredient?lock=63', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (64, 17, '当归', '当归', '当归', '10g', 'https://loremflickr.com/200/200/food,ingredient?lock=64', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (65, 17, '红枣', '红枣', '红枣', '8颗', 'https://loremflickr.com/200/200/food,ingredient?lock=65', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (66, 17, '乌鸡', '乌鸡', '乌鸡', '半只', 'https://loremflickr.com/200/200/food,ingredient?lock=66', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (67, 17, '枸杞', '枸杞', '枸杞', '10g', 'https://loremflickr.com/200/200/food,ingredient?lock=67', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (68, 18, '阿胶', '阿胶', '阿胶', '10g', 'https://loremflickr.com/200/200/food,ingredient?lock=68', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (69, 18, '红糖', '红糖', '红糖', '30g', 'https://loremflickr.com/200/200/food,ingredient?lock=69', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (70, 18, '大米', '大米', '大米', '100g', 'https://loremflickr.com/200/200/food,ingredient?lock=70', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (71, 18, '红枣', '红枣', '红枣', '6颗', 'https://loremflickr.com/200/200/food,ingredient?lock=71', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (72, 19, '枸杞', '枸杞', '枸杞', '15g', 'https://loremflickr.com/200/200/food,ingredient?lock=72', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (73, 19, '桂圆', '桂圆', '桂圆', '10颗', 'https://loremflickr.com/200/200/food,ingredient?lock=73', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (74, 19, '红枣', '红枣', '红枣', '5颗', 'https://loremflickr.com/200/200/food,ingredient?lock=74', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (75, 19, '红糖', '红糖', '红糖', '适量', 'https://loremflickr.com/200/200/food,ingredient?lock=75', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (76, 20, '花生', '花生', '花生', '100g', 'https://loremflickr.com/200/200/food,ingredient?lock=76', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (77, 20, '猪蹄', '猪蹄', '猪蹄', '1只', 'https://loremflickr.com/200/200/food,ingredient?lock=77', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (78, 20, '红枣', '红枣', '红枣', '8颗', 'https://loremflickr.com/200/200/food,ingredient?lock=78', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (79, 20, '姜片', '姜片', '姜片', '3片', 'https://loremflickr.com/200/200/food,ingredient?lock=79', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (80, 21, '当归', '当归', '当归', '10g', 'https://loremflickr.com/200/200/food,ingredient?lock=80', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (81, 21, '川芎', '川芎', '川芎', '8g', 'https://loremflickr.com/200/200/food,ingredient?lock=81', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (82, 21, '白芍', '白芍', '白芍', '12g', 'https://loremflickr.com/200/200/food,ingredient?lock=82', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (83, 21, '熟地', '熟地', '熟地', '12g', 'https://loremflickr.com/200/200/food,ingredient?lock=83', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (84, 22, '猪肝', '猪肝', '猪肝', '200g', 'https://loremflickr.com/200/200/food,ingredient?lock=84', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (85, 22, '菠菜', '菠菜', '菠菜', '150g', 'https://loremflickr.com/200/200/food,ingredient?lock=85', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (86, 22, '姜丝', '姜丝', '姜丝', '少许', 'https://loremflickr.com/200/200/food,ingredient?lock=86', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (87, 22, '枸杞', '枸杞', '枸杞', '10g', 'https://loremflickr.com/200/200/food,ingredient?lock=87', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (88, 23, '黑芝麻', '黑芝麻', '黑芝麻', '50g', 'https://loremflickr.com/200/200/food,ingredient?lock=88', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (89, 23, '糯米粉', '糯米粉', '糯米粉', '30g', 'https://loremflickr.com/200/200/food,ingredient?lock=89', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (90, 23, '冰糖', '冰糖', '冰糖', '适量', 'https://loremflickr.com/200/200/food,ingredient?lock=90', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (91, 23, '水', '水', '水', '400ml', 'https://loremflickr.com/200/200/food,ingredient?lock=91', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (92, 24, '桂圆', '桂圆', '桂圆', '20g', 'https://loremflickr.com/200/200/food,ingredient?lock=92', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (93, 24, '莲子', '莲子', '莲子', '30g', 'https://loremflickr.com/200/200/food,ingredient?lock=93', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (94, 24, '银耳', '银耳', '银耳', '15g', 'https://loremflickr.com/200/200/food,ingredient?lock=94', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (95, 24, '冰糖', '冰糖', '冰糖', '适量', 'https://loremflickr.com/200/200/food,ingredient?lock=95', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (96, 25, '红豆', '红豆', '红豆', '50g', 'https://loremflickr.com/200/200/food,ingredient?lock=96', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (97, 25, '薏米', '薏米', '薏米', '30g', 'https://loremflickr.com/200/200/food,ingredient?lock=97', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (98, 25, '红枣', '红枣', '红枣', '6颗', 'https://loremflickr.com/200/200/food,ingredient?lock=98', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (99, 25, '红糖', '红糖', '红糖', '适量', 'https://loremflickr.com/200/200/food,ingredient?lock=99', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (100, 26, '酸枣仁', '酸枣仁', '酸枣仁', '15g', 'https://loremflickr.com/200/200/food,ingredient?lock=100', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (101, 26, '茯苓', '茯苓', '茯苓', '10g', 'https://loremflickr.com/200/200/food,ingredient?lock=101', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (102, 26, '甘草', '甘草', '甘草', '3g', 'https://loremflickr.com/200/200/food,ingredient?lock=102', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (103, 26, '水', '水', '水', '500ml', 'https://loremflickr.com/200/200/food,ingredient?lock=103', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (104, 27, '柏子仁', '柏子仁', '柏子仁', '15g', 'https://loremflickr.com/200/200/food,ingredient?lock=104', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (105, 27, '大米', '大米', '大米', '100g', 'https://loremflickr.com/200/200/food,ingredient?lock=105', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (106, 27, '蜂蜜', '蜂蜜', '蜂蜜', '适量', 'https://loremflickr.com/200/200/food,ingredient?lock=106', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (107, 28, '百合', '百合', '百合', '30g', 'https://loremflickr.com/200/200/food,ingredient?lock=107', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (108, 28, '麦冬', '麦冬', '麦冬', '15g', 'https://loremflickr.com/200/200/food,ingredient?lock=108', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (109, 28, '冰糖', '冰糖', '冰糖', '适量', 'https://loremflickr.com/200/200/food,ingredient?lock=109', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (110, 29, '龙眼肉', '龙眼肉', '龙眼肉', '30g', 'https://loremflickr.com/200/200/food,ingredient?lock=110', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (111, 29, '大米', '大米', '大米', '100g', 'https://loremflickr.com/200/200/food,ingredient?lock=111', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (112, 29, '红枣', '红枣', '红枣', '5颗', 'https://loremflickr.com/200/200/food,ingredient?lock=112', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (113, 30, '五味子', '五味子', '五味子', '10g', 'https://loremflickr.com/200/200/food,ingredient?lock=113', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (114, 30, '枸杞', '枸杞', '枸杞', '10g', 'https://loremflickr.com/200/200/food,ingredient?lock=114', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (115, 30, '水', '水', '水', '500ml', 'https://loremflickr.com/200/200/food,ingredient?lock=115', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (116, 31, '远志', '远志', '远志', '10g', 'https://loremflickr.com/200/200/food,ingredient?lock=116', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (117, 31, '莲子', '莲子', '莲子', '30g', 'https://loremflickr.com/200/200/food,ingredient?lock=117', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (118, 31, '冰糖', '冰糖', '冰糖', '适量', 'https://loremflickr.com/200/200/food,ingredient?lock=118', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (119, 32, '灵芝孢子粉', '灵芝孢子粉', '灵芝孢子粉', '3g', 'https://loremflickr.com/200/200/food,ingredient?lock=119', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (120, 32, '蜂蜜', '蜂蜜', '蜂蜜', '适量', 'https://loremflickr.com/200/200/food,ingredient?lock=120', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (121, 32, '温水', '温水', '温水', '200ml', 'https://loremflickr.com/200/200/food,ingredient?lock=121', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (122, 33, '桃胶', '桃胶', '桃胶', '15g', 'https://loremflickr.com/200/200/food,ingredient?lock=122', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (123, 33, '银耳', '银耳', '银耳', '20g', 'https://loremflickr.com/200/200/food,ingredient?lock=123', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (124, 33, '冰糖', '冰糖', '冰糖', '适量', 'https://loremflickr.com/200/200/food,ingredient?lock=124', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (125, 33, '枸杞', '枸杞', '枸杞', '10g', 'https://loremflickr.com/200/200/food,ingredient?lock=125', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (126, 34, '燕窝', '燕窝', '燕窝', '5g', 'https://loremflickr.com/200/200/food,ingredient?lock=126', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (127, 34, '雪梨', '雪梨', '雪梨', '1个', 'https://loremflickr.com/200/200/food,ingredient?lock=127', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (128, 34, '冰糖', '冰糖', '冰糖', '适量', 'https://loremflickr.com/200/200/food,ingredient?lock=128', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (129, 34, '枸杞', '枸杞', '枸杞', '少许', 'https://loremflickr.com/200/200/food,ingredient?lock=129', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (130, 35, '玫瑰花', '玫瑰花', '玫瑰花', '10g', 'https://loremflickr.com/200/200/food,ingredient?lock=130', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (131, 35, '冰糖', '冰糖', '冰糖', '适量', 'https://loremflickr.com/200/200/food,ingredient?lock=131', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (132, 35, '水', '水', '水', '500ml', 'https://loremflickr.com/200/200/food,ingredient?lock=132', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (133, 36, '木瓜', '木瓜', '木瓜', '半个', 'https://loremflickr.com/200/200/food,ingredient?lock=133', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (134, 36, '雪蛤', '雪蛤', '雪蛤', '5g', 'https://loremflickr.com/200/200/food,ingredient?lock=134', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (135, 36, '冰糖', '冰糖', '冰糖', '适量', 'https://loremflickr.com/200/200/food,ingredient?lock=135', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (136, 36, '牛奶', '牛奶', '牛奶', '200ml', 'https://loremflickr.com/200/200/food,ingredient?lock=136', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (137, 37, '柠檬', '柠檬', '柠檬', '半个', 'https://loremflickr.com/200/200/food,ingredient?lock=137', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (138, 37, '蜂蜜', '蜂蜜', '蜂蜜', '2勺', 'https://loremflickr.com/200/200/food,ingredient?lock=138', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (139, 37, '温水', '温水', '温水', '300ml', 'https://loremflickr.com/200/200/food,ingredient?lock=139', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (140, 38, '紫薯', '紫薯', '紫薯', '150g', 'https://loremflickr.com/200/200/food,ingredient?lock=140', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (141, 38, '银耳', '银耳', '银耳', '20g', 'https://loremflickr.com/200/200/food,ingredient?lock=141', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (142, 38, '冰糖', '冰糖', '冰糖', '适量', 'https://loremflickr.com/200/200/food,ingredient?lock=142', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (143, 39, '猪蹄', '猪蹄', '猪蹄', '1只', 'https://loremflickr.com/200/200/food,ingredient?lock=143', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (144, 39, '鸡爪', '鸡爪', '鸡爪', '200g', 'https://loremflickr.com/200/200/food,ingredient?lock=144', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (145, 39, '红枣', '红枣', '红枣', '8颗', 'https://loremflickr.com/200/200/food,ingredient?lock=145', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (146, 39, '姜片', '姜片', '姜片', '3片', 'https://loremflickr.com/200/200/food,ingredient?lock=146', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (147, 40, '绿豆', '绿豆', '绿豆', '100g', 'https://loremflickr.com/200/200/food,ingredient?lock=147', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (148, 40, '冰糖', '冰糖', '冰糖', '适量', 'https://loremflickr.com/200/200/food,ingredient?lock=148', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (149, 40, '水', '水', '水', '800ml', 'https://loremflickr.com/200/200/food,ingredient?lock=149', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (150, 41, '苦瓜', '苦瓜', '苦瓜', '200g', 'https://loremflickr.com/200/200/food,ingredient?lock=150', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (151, 41, '排骨', '排骨', '排骨', '300g', 'https://loremflickr.com/200/200/food,ingredient?lock=151', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (152, 41, '黄豆', '黄豆', '黄豆', '50g', 'https://loremflickr.com/200/200/food,ingredient?lock=152', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (153, 41, '姜片', '姜片', '姜片', '3片', 'https://loremflickr.com/200/200/food,ingredient?lock=153', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (154, 42, '金银花', '金银花', '金银花', '10g', 'https://loremflickr.com/200/200/food,ingredient?lock=154', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (155, 42, '菊花', '菊花', '菊花', '10g', 'https://loremflickr.com/200/200/food,ingredient?lock=155', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (156, 42, '冰糖', '冰糖', '冰糖', '适量', 'https://loremflickr.com/200/200/food,ingredient?lock=156', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (157, 43, '冬瓜', '冬瓜', '冬瓜', '300g', 'https://loremflickr.com/200/200/food,ingredient?lock=157', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (158, 43, '薏米', '薏米', '薏米', '50g', 'https://loremflickr.com/200/200/food,ingredient?lock=158', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (159, 43, '排骨', '排骨', '排骨', '200g', 'https://loremflickr.com/200/200/food,ingredient?lock=159', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (160, 43, '姜片', '姜片', '姜片', '2片', 'https://loremflickr.com/200/200/food,ingredient?lock=160', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (161, 44, '蒲公英', '蒲公英', '蒲公英', '15g', 'https://loremflickr.com/200/200/food,ingredient?lock=161', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (162, 44, '冰糖', '冰糖', '冰糖', '适量', 'https://loremflickr.com/200/200/food,ingredient?lock=162', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (163, 44, '水', '水', '水', '500ml', 'https://loremflickr.com/200/200/food,ingredient?lock=163', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (164, 45, '莲藕', '莲藕', '莲藕', '300g', 'https://loremflickr.com/200/200/food,ingredient?lock=164', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (165, 45, '排骨', '排骨', '排骨', '300g', 'https://loremflickr.com/200/200/food,ingredient?lock=165', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (166, 45, '红枣', '红枣', '红枣', '6颗', 'https://loremflickr.com/200/200/food,ingredient?lock=166', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (167, 45, '枸杞', '枸杞', '枸杞', '10g', 'https://loremflickr.com/200/200/food,ingredient?lock=167', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (168, 46, '芹菜', '芹菜', '芹菜', '200g', 'https://loremflickr.com/200/200/food,ingredient?lock=168', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (169, 46, '苹果', '苹果', '苹果', '1个', 'https://loremflickr.com/200/200/food,ingredient?lock=169', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (170, 46, '蜂蜜', '蜂蜜', '蜂蜜', '适量', 'https://loremflickr.com/200/200/food,ingredient?lock=170', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (171, 46, '水', '水', '水', '200ml', 'https://loremflickr.com/200/200/food,ingredient?lock=171', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (172, 47, '山楂', '山楂', '山楂', '15g', 'https://loremflickr.com/200/200/food,ingredient?lock=172', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (173, 47, '荷叶', '荷叶', '荷叶', '10g', 'https://loremflickr.com/200/200/food,ingredient?lock=173', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (174, 47, '冰糖', '冰糖', '冰糖', '适量', 'https://loremflickr.com/200/200/food,ingredient?lock=174', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (175, 48, '决明子', '决明子', '决明子', '15g', 'https://loremflickr.com/200/200/food,ingredient?lock=175', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (176, 48, '菊花', '菊花', '菊花', '10g', 'https://loremflickr.com/200/200/food,ingredient?lock=176', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (177, 48, '枸杞', '枸杞', '枸杞', '10g', 'https://loremflickr.com/200/200/food,ingredient?lock=177', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (178, 49, '黑木耳', '黑木耳', '黑木耳', '30g', 'https://loremflickr.com/200/200/food,ingredient?lock=178', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (179, 49, '红枣', '红枣', '红枣', '10颗', 'https://loremflickr.com/200/200/food,ingredient?lock=179', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (180, 49, '冰糖', '冰糖', '冰糖', '适量', 'https://loremflickr.com/200/200/food,ingredient?lock=180', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (181, 50, '海带', '海带', '海带', '100g', 'https://loremflickr.com/200/200/food,ingredient?lock=181', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (182, 50, '豆腐', '豆腐', '豆腐', '200g', 'https://loremflickr.com/200/200/food,ingredient?lock=182', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (183, 50, '虾皮', '虾皮', '虾皮', '10g', 'https://loremflickr.com/200/200/food,ingredient?lock=183', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (184, 50, '姜丝', '姜丝', '姜丝', '少许', 'https://loremflickr.com/200/200/food,ingredient?lock=184', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (185, 51, '燕麦', '燕麦', '燕麦', '80g', 'https://loremflickr.com/200/200/food,ingredient?lock=185', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (186, 51, '牛奶', '牛奶', '牛奶', '250ml', 'https://loremflickr.com/200/200/food,ingredient?lock=186', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (187, 51, '蜂蜜', '蜂蜜', '蜂蜜', '适量', 'https://loremflickr.com/200/200/food,ingredient?lock=187', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (188, 51, '坚果', '坚果', '坚果', '少许', 'https://loremflickr.com/200/200/food,ingredient?lock=188', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (189, 52, '黄芪', '黄芪', '黄芪', '15g', 'https://loremflickr.com/200/200/food,ingredient?lock=189', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (190, 52, '党参', '党参', '党参', '15g', 'https://loremflickr.com/200/200/food,ingredient?lock=190', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (191, 52, '土鸡', '土鸡', '土鸡', '半只', 'https://loremflickr.com/200/200/food,ingredient?lock=191', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (192, 52, '红枣', '红枣', '红枣', '8颗', 'https://loremflickr.com/200/200/food,ingredient?lock=192', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (193, 53, '虫草花', '虫草花', '虫草花', '20g', 'https://loremflickr.com/200/200/food,ingredient?lock=193', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (194, 53, '排骨', '排骨', '排骨', '400g', 'https://loremflickr.com/200/200/food,ingredient?lock=194', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (195, 53, '枸杞', '枸杞', '枸杞', '10g', 'https://loremflickr.com/200/200/food,ingredient?lock=195', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (196, 53, '姜片', '姜片', '姜片', '3片', 'https://loremflickr.com/200/200/food,ingredient?lock=196', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (197, 54, '灵芝', '灵芝', '灵芝', '10g', 'https://loremflickr.com/200/200/food,ingredient?lock=197', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (198, 54, '土鸡', '土鸡', '土鸡', '半只', 'https://loremflickr.com/200/200/food,ingredient?lock=198', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (199, 54, '红枣', '红枣', '红枣', '8颗', 'https://loremflickr.com/200/200/food,ingredient?lock=199', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (200, 54, '枸杞', '枸杞', '枸杞', '10g', 'https://loremflickr.com/200/200/food,ingredient?lock=200', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (201, 55, '人参', '人参', '人参', '5g', 'https://loremflickr.com/200/200/food,ingredient?lock=201', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (202, 55, '枸杞', '枸杞', '枸杞', '15g', 'https://loremflickr.com/200/200/food,ingredient?lock=202', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (203, 55, '红枣', '红枣', '红枣', '5颗', 'https://loremflickr.com/200/200/food,ingredient?lock=203', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (204, 55, '冰糖', '冰糖', '冰糖', '适量', 'https://loremflickr.com/200/200/food,ingredient?lock=204', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (205, 56, '花胶', '花胶', '花胶', '20g', 'https://loremflickr.com/200/200/food,ingredient?lock=205', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (206, 56, '土鸡', '土鸡', '土鸡', '半只', 'https://loremflickr.com/200/200/food,ingredient?lock=206', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (207, 56, '红枣', '红枣', '红枣', '8颗', 'https://loremflickr.com/200/200/food,ingredient?lock=207', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (208, 56, '枸杞', '枸杞', '枸杞', '10g', 'https://loremflickr.com/200/200/food,ingredient?lock=208', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (209, 57, '牛蒡', '牛蒡', '牛蒡', '200g', 'https://loremflickr.com/200/200/food,ingredient?lock=209', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (210, 57, '排骨', '排骨', '排骨', '300g', 'https://loremflickr.com/200/200/food,ingredient?lock=210', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (211, 57, '胡萝卜', '胡萝卜', '胡萝卜', '1根', 'https://loremflickr.com/200/200/food,ingredient?lock=211', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (212, 57, '姜片', '姜片', '姜片', '3片', 'https://loremflickr.com/200/200/food,ingredient?lock=212', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (213, 58, '红豆', '红豆', '红豆', '50g', 'https://loremflickr.com/200/200/food,ingredient?lock=213', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (214, 58, '薏米', '薏米', '薏米', '50g', 'https://loremflickr.com/200/200/food,ingredient?lock=214', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (215, 58, '冰糖', '冰糖', '冰糖', '适量', 'https://loremflickr.com/200/200/food,ingredient?lock=215', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (216, 59, '茯苓', '茯苓', '茯苓', '15g', 'https://loremflickr.com/200/200/food,ingredient?lock=216', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (217, 59, '白术', '白术', '白术', '15g', 'https://loremflickr.com/200/200/food,ingredient?lock=217', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (218, 59, '红枣', '红枣', '红枣', '6颗', 'https://loremflickr.com/200/200/food,ingredient?lock=218', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (219, 59, '冰糖', '冰糖', '冰糖', '适量', 'https://loremflickr.com/200/200/food,ingredient?lock=219', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (220, 60, '冬瓜', '冬瓜', '冬瓜', '400g', 'https://loremflickr.com/200/200/food,ingredient?lock=220', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (221, 60, '荷叶', '荷叶', '荷叶', '10g', 'https://loremflickr.com/200/200/food,ingredient?lock=221', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (222, 60, '薏米', '薏米', '薏米', '30g', 'https://loremflickr.com/200/200/food,ingredient?lock=222', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (223, 61, '玉米须', '玉米须', '玉米须', '30g', 'https://loremflickr.com/200/200/food,ingredient?lock=223', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (224, 61, '水', '水', '水', '500ml', 'https://loremflickr.com/200/200/food,ingredient?lock=224', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (225, 62, '赤小豆', '赤小豆', '赤小豆', '50g', 'https://loremflickr.com/200/200/food,ingredient?lock=225', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (226, 62, '鲫鱼', '鲫鱼', '鲫鱼', '1条', 'https://loremflickr.com/200/200/food,ingredient?lock=226', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (227, 62, '姜片', '姜片', '姜片', '3片', 'https://loremflickr.com/200/200/food,ingredient?lock=227', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (228, 62, '陈皮', '陈皮', '陈皮', '5g', 'https://loremflickr.com/200/200/food,ingredient?lock=228', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (229, 63, '土茯苓', '土茯苓', '土茯苓', '30g', 'https://loremflickr.com/200/200/food,ingredient?lock=229', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (230, 63, '草龟', '草龟', '草龟', '1只', 'https://loremflickr.com/200/200/food,ingredient?lock=230', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (231, 63, '瘦肉', '瘦肉', '瘦肉', '200g', 'https://loremflickr.com/200/200/food,ingredient?lock=231', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (232, 63, '姜片', '姜片', '姜片', '3片', 'https://loremflickr.com/200/200/food,ingredient?lock=232', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (233, 64, '杜仲', '杜仲', '杜仲', '15g', 'https://loremflickr.com/200/200/food,ingredient?lock=233', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (234, 64, '猪腰', '猪腰', '猪腰', '2个', 'https://loremflickr.com/200/200/food,ingredient?lock=234', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (235, 64, '枸杞', '枸杞', '枸杞', '10g', 'https://loremflickr.com/200/200/food,ingredient?lock=235', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (236, 64, '姜片', '姜片', '姜片', '3片', 'https://loremflickr.com/200/200/food,ingredient?lock=236', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (237, 65, '枸杞', '枸杞', '枸杞', '20g', 'https://loremflickr.com/200/200/food,ingredient?lock=237', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (238, 65, '羊肉', '羊肉', '羊肉', '500g', 'https://loremflickr.com/200/200/food,ingredient?lock=238', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (239, 65, '当归', '当归', '当归', '10g', 'https://loremflickr.com/200/200/food,ingredient?lock=239', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (240, 65, '姜片', '姜片', '姜片', '5片', 'https://loremflickr.com/200/200/food,ingredient?lock=240', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (241, 66, '韭菜', '韭菜', '韭菜', '200g', 'https://loremflickr.com/200/200/food,ingredient?lock=241', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (242, 66, '虾仁', '虾仁', '虾仁', '150g', 'https://loremflickr.com/200/200/food,ingredient?lock=242', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (243, 66, '姜丝', '姜丝', '姜丝', '少许', 'https://loremflickr.com/200/200/food,ingredient?lock=243', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (244, 66, '料酒', '料酒', '料酒', '适量', 'https://loremflickr.com/200/200/food,ingredient?lock=244', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (245, 67, '核桃仁', '核桃仁', '核桃仁', '30g', 'https://loremflickr.com/200/200/food,ingredient?lock=245', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (246, 67, '大米', '大米', '大米', '100g', 'https://loremflickr.com/200/200/food,ingredient?lock=246', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (247, 67, '冰糖', '冰糖', '冰糖', '适量', 'https://loremflickr.com/200/200/food,ingredient?lock=247', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (248, 68, '海参', '海参', '海参', '2只', 'https://loremflickr.com/200/200/food,ingredient?lock=248', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (249, 68, '小米', '小米', '小米', '100g', 'https://loremflickr.com/200/200/food,ingredient?lock=249', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (250, 68, '姜丝', '姜丝', '姜丝', '少许', 'https://loremflickr.com/200/200/food,ingredient?lock=250', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (251, 68, '葱花', '葱花', '葱花', '少许', 'https://loremflickr.com/200/200/food,ingredient?lock=251', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (252, 69, '肉苁蓉', '肉苁蓉', '肉苁蓉', '15g', 'https://loremflickr.com/200/200/food,ingredient?lock=252', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (253, 69, '羊肉', '羊肉', '羊肉', '500g', 'https://loremflickr.com/200/200/food,ingredient?lock=253', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (254, 69, '枸杞', '枸杞', '枸杞', '15g', 'https://loremflickr.com/200/200/food,ingredient?lock=254', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (255, 69, '姜片', '姜片', '姜片', '5片', 'https://loremflickr.com/200/200/food,ingredient?lock=255', 3);

SELECT '食材数据插入完成: 255条' AS message;

-- ============================================
-- 4. 制作步骤数据
-- ============================================

INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (1, 1, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=山药小米粥_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (2, 1, 2, '将山药主料处理干净，切成适当大小', '将山药主料处理干净，切成适当大小', 'Step 2: 将山药主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=山药小米粥_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (3, 1, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=山药小米粥_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (4, 1, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=山药小米粥_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (5, 1, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=山药小米粥_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (6, 1, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=山药小米粥_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (7, 2, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=南瓜红枣粥_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (8, 2, 2, '将南瓜主料处理干净，切成适当大小', '将南瓜主料处理干净，切成适当大小', 'Step 2: 将南瓜主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=南瓜红枣粥_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (9, 2, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=南瓜红枣粥_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (10, 2, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=南瓜红枣粥_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (11, 2, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=南瓜红枣粥_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (12, 2, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=南瓜红枣粥_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (13, 3, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=猴头菇炖鸡汤_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (14, 3, 2, '将猴头主料处理干净，切成适当大小', '将猴头主料处理干净，切成适当大小', 'Step 2: 将猴头主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=猴头菇炖鸡汤_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (15, 3, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=猴头菇炖鸡汤_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (16, 3, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=猴头菇炖鸡汤_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (17, 3, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=猴头菇炖鸡汤_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (18, 3, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=猴头菇炖鸡汤_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (19, 4, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=莲子百合粥_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (20, 4, 2, '将莲子主料处理干净，切成适当大小', '将莲子主料处理干净，切成适当大小', 'Step 2: 将莲子主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=莲子百合粥_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (21, 4, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=莲子百合粥_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (22, 4, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=莲子百合粥_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (23, 4, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=莲子百合粥_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (24, 4, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=莲子百合粥_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (25, 5, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=茯苓山药排骨汤_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (26, 5, 2, '将茯苓主料处理干净，切成适当大小', '将茯苓主料处理干净，切成适当大小', 'Step 2: 将茯苓主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=茯苓山药排骨汤_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (27, 5, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=茯苓山药排骨汤_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (28, 5, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=茯苓山药排骨汤_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (29, 5, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=茯苓山药排骨汤_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (30, 5, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=茯苓山药排骨汤_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (31, 6, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=陈皮瘦肉粥_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (32, 6, 2, '将陈皮主料处理干净，切成适当大小', '将陈皮主料处理干净，切成适当大小', 'Step 2: 将陈皮主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=陈皮瘦肉粥_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (33, 6, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=陈皮瘦肉粥_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (34, 6, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=陈皮瘦肉粥_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (35, 6, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=陈皮瘦肉粥_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (36, 6, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=陈皮瘦肉粥_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (37, 7, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=芡实薏米粥_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (38, 7, 2, '将芡实主料处理干净，切成适当大小', '将芡实主料处理干净，切成适当大小', 'Step 2: 将芡实主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=芡实薏米粥_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (39, 7, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=芡实薏米粥_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (40, 7, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=芡实薏米粥_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (41, 7, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=芡实薏米粥_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (42, 7, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=芡实薏米粥_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (43, 8, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=生姜红糖暖胃汤_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (44, 8, 2, '将生姜主料处理干净，切成适当大小', '将生姜主料处理干净，切成适当大小', 'Step 2: 将生姜主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=生姜红糖暖胃汤_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (45, 8, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=生姜红糖暖胃汤_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (46, 8, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=生姜红糖暖胃汤_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (47, 8, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=生姜红糖暖胃汤_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (48, 8, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=生姜红糖暖胃汤_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (49, 9, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=川贝雪梨汤_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (50, 9, 2, '将川贝主料处理干净，切成适当大小', '将川贝主料处理干净，切成适当大小', 'Step 2: 将川贝主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=川贝雪梨汤_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (51, 9, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=川贝雪梨汤_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (52, 9, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=川贝雪梨汤_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (53, 9, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=川贝雪梨汤_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (54, 9, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=川贝雪梨汤_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (55, 10, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=银耳莲子羹_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (56, 10, 2, '将银耳主料处理干净，切成适当大小', '将银耳主料处理干净，切成适当大小', 'Step 2: 将银耳主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=银耳莲子羹_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (57, 10, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=银耳莲子羹_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (58, 10, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=银耳莲子羹_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (59, 10, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=银耳莲子羹_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (60, 10, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=银耳莲子羹_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (61, 11, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=百合杏仁粥_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (62, 11, 2, '将百合主料处理干净，切成适当大小', '将百合主料处理干净，切成适当大小', 'Step 2: 将百合主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=百合杏仁粥_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (63, 11, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=百合杏仁粥_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (64, 11, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=百合杏仁粥_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (65, 11, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=百合杏仁粥_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (66, 11, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=百合杏仁粥_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (67, 12, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=枇杷叶瘦肉汤_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (68, 12, 2, '将枇杷主料处理干净，切成适当大小', '将枇杷主料处理干净，切成适当大小', 'Step 2: 将枇杷主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=枇杷叶瘦肉汤_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (69, 12, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=枇杷叶瘦肉汤_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (70, 12, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=枇杷叶瘦肉汤_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (71, 12, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=枇杷叶瘦肉汤_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (72, 12, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=枇杷叶瘦肉汤_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (73, 13, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=沙参玉竹老鸭汤_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (74, 13, 2, '将沙参主料处理干净，切成适当大小', '将沙参主料处理干净，切成适当大小', 'Step 2: 将沙参主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=沙参玉竹老鸭汤_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (75, 13, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=沙参玉竹老鸭汤_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (76, 13, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=沙参玉竹老鸭汤_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (77, 13, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=沙参玉竹老鸭汤_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (78, 13, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=沙参玉竹老鸭汤_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (79, 14, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=罗汉果菊花茶_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (80, 14, 2, '将罗汉主料处理干净，切成适当大小', '将罗汉主料处理干净，切成适当大小', 'Step 2: 将罗汉主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=罗汉果菊花茶_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (81, 14, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=罗汉果菊花茶_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (82, 14, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=罗汉果菊花茶_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (83, 14, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=罗汉果菊花茶_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (84, 14, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=罗汉果菊花茶_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (85, 15, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=白萝卜蜂蜜饮_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (86, 15, 2, '将白萝主料处理干净，切成适当大小', '将白萝主料处理干净，切成适当大小', 'Step 2: 将白萝主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=白萝卜蜂蜜饮_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (87, 15, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=白萝卜蜂蜜饮_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (88, 15, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=白萝卜蜂蜜饮_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (89, 15, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=白萝卜蜂蜜饮_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (90, 15, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=白萝卜蜂蜜饮_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (91, 16, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=南北杏猪肺汤_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (92, 16, 2, '将南北主料处理干净，切成适当大小', '将南北主料处理干净，切成适当大小', 'Step 2: 将南北主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=南北杏猪肺汤_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (93, 16, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=南北杏猪肺汤_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (94, 16, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=南北杏猪肺汤_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (95, 16, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=南北杏猪肺汤_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (96, 16, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=南北杏猪肺汤_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (97, 17, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=当归红枣乌鸡汤_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (98, 17, 2, '将当归主料处理干净，切成适当大小', '将当归主料处理干净，切成适当大小', 'Step 2: 将当归主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=当归红枣乌鸡汤_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (99, 17, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=当归红枣乌鸡汤_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (100, 17, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=当归红枣乌鸡汤_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (101, 17, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=当归红枣乌鸡汤_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (102, 17, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=当归红枣乌鸡汤_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (103, 18, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=阿胶红糖粥_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (104, 18, 2, '将阿胶主料处理干净，切成适当大小', '将阿胶主料处理干净，切成适当大小', 'Step 2: 将阿胶主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=阿胶红糖粥_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (105, 18, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=阿胶红糖粥_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (106, 18, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=阿胶红糖粥_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (107, 18, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=阿胶红糖粥_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (108, 18, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=阿胶红糖粥_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (109, 19, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=枸杞桂圆红枣茶_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (110, 19, 2, '将枸杞主料处理干净，切成适当大小', '将枸杞主料处理干净，切成适当大小', 'Step 2: 将枸杞主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=枸杞桂圆红枣茶_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (111, 19, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=枸杞桂圆红枣茶_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (112, 19, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=枸杞桂圆红枣茶_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (113, 19, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=枸杞桂圆红枣茶_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (114, 19, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=枸杞桂圆红枣茶_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (115, 20, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=花生红衣猪蹄汤_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (116, 20, 2, '将花生主料处理干净，切成适当大小', '将花生主料处理干净，切成适当大小', 'Step 2: 将花生主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=花生红衣猪蹄汤_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (117, 20, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=花生红衣猪蹄汤_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (118, 20, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=花生红衣猪蹄汤_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (119, 20, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=花生红衣猪蹄汤_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (120, 20, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=花生红衣猪蹄汤_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (121, 21, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=四物汤_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (122, 21, 2, '将四物主料处理干净，切成适当大小', '将四物主料处理干净，切成适当大小', 'Step 2: 将四物主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=四物汤_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (123, 21, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=四物汤_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (124, 21, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=四物汤_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (125, 21, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=四物汤_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (126, 21, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=四物汤_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (127, 22, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=猪肝菠菜汤_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (128, 22, 2, '将猪肝主料处理干净，切成适当大小', '将猪肝主料处理干净，切成适当大小', 'Step 2: 将猪肝主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=猪肝菠菜汤_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (129, 22, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=猪肝菠菜汤_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (130, 22, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=猪肝菠菜汤_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (131, 22, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=猪肝菠菜汤_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (132, 22, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=猪肝菠菜汤_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (133, 23, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=黑芝麻糊_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (134, 23, 2, '将黑芝主料处理干净，切成适当大小', '将黑芝主料处理干净，切成适当大小', 'Step 2: 将黑芝主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=黑芝麻糊_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (135, 23, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=黑芝麻糊_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (136, 23, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=黑芝麻糊_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (137, 23, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=黑芝麻糊_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (138, 23, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=黑芝麻糊_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (139, 24, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=桂圆莲子羹_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (140, 24, 2, '将桂圆主料处理干净，切成适当大小', '将桂圆主料处理干净，切成适当大小', 'Step 2: 将桂圆主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=桂圆莲子羹_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (141, 24, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=桂圆莲子羹_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (142, 24, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=桂圆莲子羹_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (143, 24, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=桂圆莲子羹_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (144, 24, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=桂圆莲子羹_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (145, 25, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=红豆薏米补血粥_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (146, 25, 2, '将红豆主料处理干净，切成适当大小', '将红豆主料处理干净，切成适当大小', 'Step 2: 将红豆主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=红豆薏米补血粥_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (147, 25, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=红豆薏米补血粥_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (148, 25, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=红豆薏米补血粥_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (149, 25, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=红豆薏米补血粥_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (150, 25, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=红豆薏米补血粥_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (151, 26, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=酸枣仁安神茶_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (152, 26, 2, '将酸枣主料处理干净，切成适当大小', '将酸枣主料处理干净，切成适当大小', 'Step 2: 将酸枣主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=酸枣仁安神茶_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (153, 26, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=酸枣仁安神茶_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (154, 26, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=酸枣仁安神茶_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (155, 26, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=酸枣仁安神茶_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (156, 26, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=酸枣仁安神茶_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (157, 27, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=柏子仁粥_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (158, 27, 2, '将柏子主料处理干净，切成适当大小', '将柏子主料处理干净，切成适当大小', 'Step 2: 将柏子主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=柏子仁粥_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (159, 27, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=柏子仁粥_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (160, 27, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=柏子仁粥_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (161, 27, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=柏子仁粥_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (162, 27, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=柏子仁粥_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (163, 28, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=百合麦冬汤_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (164, 28, 2, '将百合主料处理干净，切成适当大小', '将百合主料处理干净，切成适当大小', 'Step 2: 将百合主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=百合麦冬汤_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (165, 28, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=百合麦冬汤_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (166, 28, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=百合麦冬汤_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (167, 28, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=百合麦冬汤_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (168, 28, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=百合麦冬汤_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (169, 29, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=龙眼肉粥_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (170, 29, 2, '将龙眼主料处理干净，切成适当大小', '将龙眼主料处理干净，切成适当大小', 'Step 2: 将龙眼主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=龙眼肉粥_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (171, 29, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=龙眼肉粥_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (172, 29, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=龙眼肉粥_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (173, 29, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=龙眼肉粥_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (174, 29, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=龙眼肉粥_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (175, 30, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=五味子茶_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (176, 30, 2, '将五味主料处理干净，切成适当大小', '将五味主料处理干净，切成适当大小', 'Step 2: 将五味主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=五味子茶_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (177, 30, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=五味子茶_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (178, 30, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=五味子茶_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (179, 30, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=五味子茶_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (180, 30, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=五味子茶_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (181, 31, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=远志莲子汤_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (182, 31, 2, '将远志主料处理干净，切成适当大小', '将远志主料处理干净，切成适当大小', 'Step 2: 将远志主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=远志莲子汤_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (183, 31, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=远志莲子汤_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (184, 31, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=远志莲子汤_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (185, 31, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=远志莲子汤_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (186, 31, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=远志莲子汤_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (187, 32, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=灵芝孢子粉饮_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (188, 32, 2, '将灵芝主料处理干净，切成适当大小', '将灵芝主料处理干净，切成适当大小', 'Step 2: 将灵芝主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=灵芝孢子粉饮_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (189, 32, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=灵芝孢子粉饮_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (190, 32, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=灵芝孢子粉饮_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (191, 32, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=灵芝孢子粉饮_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (192, 32, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=灵芝孢子粉饮_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (193, 33, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=桃胶银耳羹_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (194, 33, 2, '将桃胶主料处理干净，切成适当大小', '将桃胶主料处理干净，切成适当大小', 'Step 2: 将桃胶主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=桃胶银耳羹_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (195, 33, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=桃胶银耳羹_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (196, 33, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=桃胶银耳羹_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (197, 33, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=桃胶银耳羹_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (198, 33, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=桃胶银耳羹_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (199, 34, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=燕窝炖雪梨_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (200, 34, 2, '将燕窝主料处理干净，切成适当大小', '将燕窝主料处理干净，切成适当大小', 'Step 2: 将燕窝主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=燕窝炖雪梨_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (201, 34, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=燕窝炖雪梨_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (202, 34, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=燕窝炖雪梨_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (203, 34, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=燕窝炖雪梨_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (204, 34, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=燕窝炖雪梨_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (205, 35, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=玫瑰花茶_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (206, 35, 2, '将玫瑰主料处理干净，切成适当大小', '将玫瑰主料处理干净，切成适当大小', 'Step 2: 将玫瑰主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=玫瑰花茶_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (207, 35, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=玫瑰花茶_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (208, 35, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=玫瑰花茶_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (209, 35, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=玫瑰花茶_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (210, 35, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=玫瑰花茶_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (211, 36, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=木瓜炖雪蛤_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (212, 36, 2, '将木瓜主料处理干净，切成适当大小', '将木瓜主料处理干净，切成适当大小', 'Step 2: 将木瓜主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=木瓜炖雪蛤_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (213, 36, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=木瓜炖雪蛤_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (214, 36, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=木瓜炖雪蛤_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (215, 36, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=木瓜炖雪蛤_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (216, 36, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=木瓜炖雪蛤_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (217, 37, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=蜂蜜柠檬水_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (218, 37, 2, '将蜂蜜主料处理干净，切成适当大小', '将蜂蜜主料处理干净，切成适当大小', 'Step 2: 将蜂蜜主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=蜂蜜柠檬水_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (219, 37, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=蜂蜜柠檬水_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (220, 37, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=蜂蜜柠檬水_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (221, 37, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=蜂蜜柠檬水_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (222, 37, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=蜂蜜柠檬水_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (223, 38, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=紫薯银耳羹_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (224, 38, 2, '将紫薯主料处理干净，切成适当大小', '将紫薯主料处理干净，切成适当大小', 'Step 2: 将紫薯主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=紫薯银耳羹_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (225, 38, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=紫薯银耳羹_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (226, 38, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=紫薯银耳羹_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (227, 38, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=紫薯银耳羹_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (228, 38, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=紫薯银耳羹_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (229, 39, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=胶原蛋白汤_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (230, 39, 2, '将胶原主料处理干净，切成适当大小', '将胶原主料处理干净，切成适当大小', 'Step 2: 将胶原主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=胶原蛋白汤_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (231, 39, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=胶原蛋白汤_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (232, 39, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=胶原蛋白汤_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (233, 39, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=胶原蛋白汤_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (234, 39, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=胶原蛋白汤_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (235, 40, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=绿豆汤_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (236, 40, 2, '将绿豆主料处理干净，切成适当大小', '将绿豆主料处理干净，切成适当大小', 'Step 2: 将绿豆主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=绿豆汤_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (237, 40, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=绿豆汤_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (238, 40, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=绿豆汤_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (239, 40, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=绿豆汤_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (240, 40, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=绿豆汤_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (241, 41, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=苦瓜排骨汤_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (242, 41, 2, '将苦瓜主料处理干净，切成适当大小', '将苦瓜主料处理干净，切成适当大小', 'Step 2: 将苦瓜主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=苦瓜排骨汤_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (243, 41, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=苦瓜排骨汤_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (244, 41, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=苦瓜排骨汤_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (245, 41, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=苦瓜排骨汤_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (246, 41, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=苦瓜排骨汤_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (247, 42, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=金银花菊花茶_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (248, 42, 2, '将金银主料处理干净，切成适当大小', '将金银主料处理干净，切成适当大小', 'Step 2: 将金银主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=金银花菊花茶_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (249, 42, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=金银花菊花茶_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (250, 42, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=金银花菊花茶_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (251, 42, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=金银花菊花茶_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (252, 42, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=金银花菊花茶_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (253, 43, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=冬瓜薏米汤_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (254, 43, 2, '将冬瓜主料处理干净，切成适当大小', '将冬瓜主料处理干净，切成适当大小', 'Step 2: 将冬瓜主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=冬瓜薏米汤_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (255, 43, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=冬瓜薏米汤_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (256, 43, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=冬瓜薏米汤_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (257, 43, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=冬瓜薏米汤_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (258, 43, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=冬瓜薏米汤_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (259, 44, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=蒲公英茶_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (260, 44, 2, '将蒲公主料处理干净，切成适当大小', '将蒲公主料处理干净，切成适当大小', 'Step 2: 将蒲公主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=蒲公英茶_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (261, 44, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=蒲公英茶_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (262, 44, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=蒲公英茶_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (263, 44, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=蒲公英茶_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (264, 44, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=蒲公英茶_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (265, 45, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=莲藕排骨汤_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (266, 45, 2, '将莲藕主料处理干净，切成适当大小', '将莲藕主料处理干净，切成适当大小', 'Step 2: 将莲藕主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=莲藕排骨汤_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (267, 45, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=莲藕排骨汤_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (268, 45, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=莲藕排骨汤_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (269, 45, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=莲藕排骨汤_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (270, 45, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=莲藕排骨汤_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (271, 46, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=芹菜汁_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (272, 46, 2, '将芹菜主料处理干净，切成适当大小', '将芹菜主料处理干净，切成适当大小', 'Step 2: 将芹菜主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=芹菜汁_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (273, 46, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=芹菜汁_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (274, 46, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=芹菜汁_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (275, 46, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=芹菜汁_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (276, 46, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=芹菜汁_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (277, 47, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=山楂荷叶茶_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (278, 47, 2, '将山楂主料处理干净，切成适当大小', '将山楂主料处理干净，切成适当大小', 'Step 2: 将山楂主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=山楂荷叶茶_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (279, 47, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=山楂荷叶茶_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (280, 47, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=山楂荷叶茶_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (281, 47, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=山楂荷叶茶_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (282, 47, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=山楂荷叶茶_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (283, 48, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=决明子茶_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (284, 48, 2, '将决明主料处理干净，切成适当大小', '将决明主料处理干净，切成适当大小', 'Step 2: 将决明主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=决明子茶_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (285, 48, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=决明子茶_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (286, 48, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=决明子茶_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (287, 48, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=决明子茶_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (288, 48, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=决明子茶_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (289, 49, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=黑木耳红枣汤_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (290, 49, 2, '将黑木主料处理干净，切成适当大小', '将黑木主料处理干净，切成适当大小', 'Step 2: 将黑木主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=黑木耳红枣汤_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (291, 49, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=黑木耳红枣汤_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (292, 49, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=黑木耳红枣汤_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (293, 49, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=黑木耳红枣汤_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (294, 49, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=黑木耳红枣汤_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (295, 50, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=海带豆腐汤_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (296, 50, 2, '将海带主料处理干净，切成适当大小', '将海带主料处理干净，切成适当大小', 'Step 2: 将海带主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=海带豆腐汤_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (297, 50, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=海带豆腐汤_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (298, 50, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=海带豆腐汤_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (299, 50, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=海带豆腐汤_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (300, 50, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=海带豆腐汤_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (301, 51, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=燕麦粥_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (302, 51, 2, '将燕麦主料处理干净，切成适当大小', '将燕麦主料处理干净，切成适当大小', 'Step 2: 将燕麦主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=燕麦粥_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (303, 51, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=燕麦粥_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (304, 51, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=燕麦粥_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (305, 51, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=燕麦粥_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (306, 51, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=燕麦粥_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (307, 52, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=黄芪党参鸡汤_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (308, 52, 2, '将黄芪主料处理干净，切成适当大小', '将黄芪主料处理干净，切成适当大小', 'Step 2: 将黄芪主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=黄芪党参鸡汤_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (309, 52, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=黄芪党参鸡汤_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (310, 52, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=黄芪党参鸡汤_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (311, 52, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=黄芪党参鸡汤_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (312, 52, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=黄芪党参鸡汤_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (313, 53, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=虫草花炖排骨_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (314, 53, 2, '将虫草主料处理干净，切成适当大小', '将虫草主料处理干净，切成适当大小', 'Step 2: 将虫草主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=虫草花炖排骨_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (315, 53, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=虫草花炖排骨_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (316, 53, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=虫草花炖排骨_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (317, 53, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=虫草花炖排骨_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (318, 53, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=虫草花炖排骨_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (319, 54, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=灵芝煲鸡汤_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (320, 54, 2, '将灵芝主料处理干净，切成适当大小', '将灵芝主料处理干净，切成适当大小', 'Step 2: 将灵芝主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=灵芝煲鸡汤_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (321, 54, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=灵芝煲鸡汤_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (322, 54, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=灵芝煲鸡汤_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (323, 54, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=灵芝煲鸡汤_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (324, 54, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=灵芝煲鸡汤_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (325, 55, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=人参枸杞茶_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (326, 55, 2, '将人参主料处理干净，切成适当大小', '将人参主料处理干净，切成适当大小', 'Step 2: 将人参主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=人参枸杞茶_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (327, 55, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=人参枸杞茶_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (328, 55, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=人参枸杞茶_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (329, 55, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=人参枸杞茶_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (330, 55, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=人参枸杞茶_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (331, 56, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=花胶炖鸡汤_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (332, 56, 2, '将花胶主料处理干净，切成适当大小', '将花胶主料处理干净，切成适当大小', 'Step 2: 将花胶主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=花胶炖鸡汤_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (333, 56, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=花胶炖鸡汤_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (334, 56, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=花胶炖鸡汤_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (335, 56, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=花胶炖鸡汤_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (336, 56, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=花胶炖鸡汤_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (337, 57, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=牛蒡排骨汤_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (338, 57, 2, '将牛蒡主料处理干净，切成适当大小', '将牛蒡主料处理干净，切成适当大小', 'Step 2: 将牛蒡主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=牛蒡排骨汤_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (339, 57, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=牛蒡排骨汤_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (340, 57, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=牛蒡排骨汤_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (341, 57, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=牛蒡排骨汤_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (342, 57, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=牛蒡排骨汤_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (343, 58, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=红豆薏米水_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (344, 58, 2, '将红豆主料处理干净，切成适当大小', '将红豆主料处理干净，切成适当大小', 'Step 2: 将红豆主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=红豆薏米水_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (345, 58, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=红豆薏米水_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (346, 58, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=红豆薏米水_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (347, 58, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=红豆薏米水_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (348, 58, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=红豆薏米水_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (349, 59, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=茯苓白术汤_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (350, 59, 2, '将茯苓主料处理干净，切成适当大小', '将茯苓主料处理干净，切成适当大小', 'Step 2: 将茯苓主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=茯苓白术汤_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (351, 59, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=茯苓白术汤_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (352, 59, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=茯苓白术汤_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (353, 59, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=茯苓白术汤_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (354, 59, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=茯苓白术汤_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (355, 60, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=冬瓜荷叶汤_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (356, 60, 2, '将冬瓜主料处理干净，切成适当大小', '将冬瓜主料处理干净，切成适当大小', 'Step 2: 将冬瓜主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=冬瓜荷叶汤_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (357, 60, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=冬瓜荷叶汤_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (358, 60, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=冬瓜荷叶汤_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (359, 60, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=冬瓜荷叶汤_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (360, 60, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=冬瓜荷叶汤_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (361, 61, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=玉米须茶_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (362, 61, 2, '将玉米主料处理干净，切成适当大小', '将玉米主料处理干净，切成适当大小', 'Step 2: 将玉米主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=玉米须茶_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (363, 61, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=玉米须茶_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (364, 61, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=玉米须茶_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (365, 61, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=玉米须茶_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (366, 61, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=玉米须茶_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (367, 62, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=赤小豆鲫鱼汤_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (368, 62, 2, '将赤小主料处理干净，切成适当大小', '将赤小主料处理干净，切成适当大小', 'Step 2: 将赤小主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=赤小豆鲫鱼汤_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (369, 62, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=赤小豆鲫鱼汤_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (370, 62, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=赤小豆鲫鱼汤_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (371, 62, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=赤小豆鲫鱼汤_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (372, 62, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=赤小豆鲫鱼汤_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (373, 63, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=土茯苓煲龟_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (374, 63, 2, '将土茯主料处理干净，切成适当大小', '将土茯主料处理干净，切成适当大小', 'Step 2: 将土茯主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=土茯苓煲龟_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (375, 63, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=土茯苓煲龟_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (376, 63, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=土茯苓煲龟_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (377, 63, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=土茯苓煲龟_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (378, 63, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=土茯苓煲龟_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (379, 64, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=杜仲猪腰汤_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (380, 64, 2, '将杜仲主料处理干净，切成适当大小', '将杜仲主料处理干净，切成适当大小', 'Step 2: 将杜仲主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=杜仲猪腰汤_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (381, 64, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=杜仲猪腰汤_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (382, 64, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=杜仲猪腰汤_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (383, 64, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=杜仲猪腰汤_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (384, 64, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=杜仲猪腰汤_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (385, 65, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=枸杞羊肉汤_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (386, 65, 2, '将枸杞主料处理干净，切成适当大小', '将枸杞主料处理干净，切成适当大小', 'Step 2: 将枸杞主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=枸杞羊肉汤_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (387, 65, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=枸杞羊肉汤_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (388, 65, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=枸杞羊肉汤_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (389, 65, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=枸杞羊肉汤_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (390, 65, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=枸杞羊肉汤_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (391, 66, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=韭菜炒虾仁_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (392, 66, 2, '将韭菜主料处理干净，切成适当大小', '将韭菜主料处理干净，切成适当大小', 'Step 2: 将韭菜主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=韭菜炒虾仁_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (393, 66, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=韭菜炒虾仁_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (394, 66, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=韭菜炒虾仁_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (395, 66, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=韭菜炒虾仁_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (396, 66, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=韭菜炒虾仁_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (397, 67, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=核桃仁粥_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (398, 67, 2, '将核桃主料处理干净，切成适当大小', '将核桃主料处理干净，切成适当大小', 'Step 2: 将核桃主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=核桃仁粥_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (399, 67, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=核桃仁粥_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (400, 67, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=核桃仁粥_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (401, 67, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=核桃仁粥_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (402, 67, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=核桃仁粥_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (403, 68, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=海参小米粥_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (404, 68, 2, '将海参主料处理干净，切成适当大小', '将海参主料处理干净，切成适当大小', 'Step 2: 将海参主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=海参小米粥_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (405, 68, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=海参小米粥_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (406, 68, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=海参小米粥_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (407, 68, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=海参小米粥_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (408, 68, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=海参小米粥_6');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (409, 69, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', 'https://loremflickr.com/400/300/cooking,step?lock=肉苁蓉炖羊肉_1');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (410, 69, 2, '将肉苁主料处理干净，切成适当大小', '将肉苁主料处理干净，切成适当大小', 'Step 2: 将肉苁主料处理干净，切成适当大小', 'https://loremflickr.com/400/300/cooking,step?lock=肉苁蓉炖羊肉_2');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (411, 69, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', 'https://loremflickr.com/400/300/cooking,step?lock=肉苁蓉炖羊肉_3');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (412, 69, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', 'https://loremflickr.com/400/300/cooking,step?lock=肉苁蓉炖羊肉_4');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (413, 69, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', 'https://loremflickr.com/400/300/cooking,step?lock=肉苁蓉炖羊肉_5');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (414, 69, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', 'https://loremflickr.com/400/300/cooking,step?lock=肉苁蓉炖羊肉_6');

SELECT '步骤数据插入完成: 414条' AS message;

-- ============================================
-- 5. 内容数据 (30条)
-- ============================================

INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (1, '更年期养生食疗', 'douyin', 'https://example.com/content/1', 'https://loremflickr.com/600/400/health,lifestyle?lock=1', '健康美食家', 'video', '["健康", "食疗", "中医"]', 8443, 1, '2026-03-10 20:49:27', '2026-03-10 20:49:27');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (2, '增肌健身食疗推荐', 'douyin', 'https://example.com/content/2', 'https://loremflickr.com/600/400/health,lifestyle?lock=2', '老中医食疗', 'video', '["食疗", "中医", "保健"]', 9448, 1, '2026-01-17 20:49:27', '2026-01-17 20:49:27');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (3, '办公室养生茶饮推荐', 'douyin', 'https://example.com/content/3', 'https://loremflickr.com/600/400/health,lifestyle?lock=3', '健康美食家', 'video', '["中医", "保健", "食疗"]', 2794, 1, '2026-02-26 20:49:27', '2026-02-26 20:49:27');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (4, '秋季润肺止咳的食疗秘方', 'wechat_video', 'https://example.com/content/4', 'https://loremflickr.com/600/400/health,lifestyle?lock=4', '中医养生堂', 'video', '["食疗", "美食", "健康"]', 7811, 1, '2026-01-13 20:49:27', '2026-01-13 20:49:27');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (5, '更年期养生食疗', 'wechat_article', 'https://example.com/content/5', 'https://loremflickr.com/600/400/health,lifestyle?lock=5', '养生食谱精选', 'article', '["美食", "食疗", "保健"]', 2768, 1, '2026-02-28 20:49:27', '2026-02-28 20:49:27');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (6, '办公室养生茶饮推荐', 'wechat_article', 'https://example.com/content/6', 'https://loremflickr.com/600/400/health,lifestyle?lock=6', '养生食谱精选', 'article', '["美食", "中医", "食疗"]', 1106, 1, '2026-03-05 20:49:27', '2026-03-05 20:49:27');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (7, '中老年人的养胃食疗方案', 'wechat_article', 'https://example.com/content/7', 'https://loremflickr.com/600/400/health,lifestyle?lock=7', '中医食疗大全', 'article', '["健康", "养生", "保健"]', 6309, 1, '2026-01-13 20:49:27', '2026-01-13 20:49:27');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (8, '增肌健身食疗推荐', 'douyin', 'https://example.com/content/8', 'https://loremflickr.com/600/400/health,lifestyle?lock=8', '养生小姐姐', 'video', '["节气", "美食", "健康"]', 6233, 1, '2026-03-13 20:49:27', '2026-03-13 20:49:27');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (9, '学生健脑食疗方', 'wechat_video', 'https://example.com/content/9', 'https://loremflickr.com/600/400/health,lifestyle?lock=9', '食疗养生专家', 'video', '["中医", "食疗", "节气"]', 4737, 1, '2026-01-18 20:49:27', '2026-01-18 20:49:27');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (10, '女性美容养颜食疗方', 'wechat_article', 'https://example.com/content/10', 'https://loremflickr.com/600/400/health,lifestyle?lock=10', '中医食疗大全', 'article', '["美食", "节气", "保健"]', 1625, 1, '2026-03-11 20:49:27', '2026-03-11 20:49:27');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (11, '更年期养生食疗', 'self', 'https://example.com/content/11', 'https://loremflickr.com/600/400/health,lifestyle?lock=11', 'Health-Diet官方', 'article', '["食疗", "中医", "美食"]', 9307, 1, '2026-02-05 20:49:27', '2026-02-05 20:49:27');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (12, '中老年人的养胃食疗方案', 'wechat_video', 'https://example.com/content/12', 'https://loremflickr.com/600/400/health,lifestyle?lock=12', '食疗养生专家', 'video', '["保健", "美食", "节气"]', 9914, 1, '2026-02-18 20:49:27', '2026-02-18 20:49:27');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (13, '早餐养生粥谱推荐', 'wechat_article', 'https://example.com/content/13', 'https://loremflickr.com/600/400/health,lifestyle?lock=13', '健康生活指南', 'article', '["中医", "保健", "节气"]', 5887, 1, '2026-02-15 20:49:27', '2026-02-15 20:49:27');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (14, '补肾壮阳食疗推荐', 'wechat_video', 'https://example.com/content/14', 'https://loremflickr.com/600/400/health,lifestyle?lock=14', '中医养生堂', 'video', '["美食", "中医", "保健"]', 5001, 1, '2026-02-08 20:49:27', '2026-02-08 20:49:27');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (15, '春季养生必吃的10种食材', 'wechat_video', 'https://example.com/content/15', 'https://loremflickr.com/600/400/health,lifestyle?lock=15', '中医养生堂', 'video', '["保健", "养生", "中医"]', 4985, 1, '2026-01-31 20:49:27', '2026-01-31 20:49:27');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (16, '补气养血的食疗秘方', 'wechat_video', 'https://example.com/content/16', 'https://loremflickr.com/600/400/health,lifestyle?lock=16', '食疗养生专家', 'video', '["食疗", "健康", "节气"]', 8768, 1, '2026-01-25 20:49:27', '2026-01-25 20:49:27');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (17, '美容养颜食疗食谱', 'wechat_video', 'https://example.com/content/17', 'https://loremflickr.com/600/400/health,lifestyle?lock=17', '中医养生堂', 'video', '["中医", "美食", "保健"]', 4160, 1, '2026-02-23 20:49:27', '2026-02-23 20:49:27');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (18, '养胃护胃食疗大全', 'wechat_video', 'https://example.com/content/18', 'https://loremflickr.com/600/400/health,lifestyle?lock=18', '食疗养生专家', 'video', '["节气", "保健", "美食"]', 5503, 1, '2026-02-28 20:49:27', '2026-02-28 20:49:27');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (19, '润肺止咳食疗秘方', 'wechat_video', 'https://example.com/content/19', 'https://loremflickr.com/600/400/health,lifestyle?lock=19', '食疗养生专家', 'video', '["中医", "食疗", "保健"]', 3544, 1, '2026-02-25 20:49:27', '2026-02-25 20:49:27');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (20, '中老年人的养胃食疗方案', 'douyin', 'https://example.com/content/20', 'https://loremflickr.com/600/400/health,lifestyle?lock=20', '老中医食疗', 'video', '["养生", "健康", "保健"]', 4212, 1, '2026-02-27 20:49:27', '2026-02-27 20:49:27');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (21, '补气养血的食疗秘方', 'wechat_video', 'https://example.com/content/21', 'https://loremflickr.com/600/400/health,lifestyle?lock=21', '中医养生堂', 'video', '["健康", "美食", "养生"]', 4556, 1, '2026-02-01 20:49:27', '2026-02-01 20:49:27');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (22, '减肥瘦身食疗方', 'douyin', 'https://example.com/content/22', 'https://loremflickr.com/600/400/health,lifestyle?lock=22', '健康美食家', 'video', '["食疗", "中医", "保健"]', 2261, 1, '2026-01-27 20:49:27', '2026-01-27 20:49:27');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (23, '四季养生食疗指南', 'wechat_article', 'https://example.com/content/23', 'https://loremflickr.com/600/400/health,lifestyle?lock=23', '中医食疗大全', 'article', '["保健", "节气", "养生"]', 1787, 1, '2026-01-19 20:49:27', '2026-01-19 20:49:27');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (24, '睡前助眠食疗方', 'wechat_video', 'https://example.com/content/24', 'https://loremflickr.com/600/400/health,lifestyle?lock=24', '食疗养生专家', 'video', '["保健", "节气", "食疗"]', 3748, 1, '2026-03-13 20:49:27', '2026-03-13 20:49:27');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (25, '润肺止咳食疗秘方', 'wechat_article', 'https://example.com/content/25', 'https://loremflickr.com/600/400/health,lifestyle?lock=25', '健康生活指南', 'article', '["美食", "中医", "养生"]', 8285, 1, '2026-01-29 20:49:27', '2026-01-29 20:49:27');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (26, '运动员营养食疗', 'wechat_article', 'https://example.com/content/26', 'https://loremflickr.com/600/400/health,lifestyle?lock=26', '健康生活指南', 'article', '["中医", "节气", "美食"]', 4447, 1, '2026-03-07 20:49:27', '2026-03-07 20:49:27');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (27, '清热解毒食疗方案', 'wechat_video', 'https://example.com/content/27', 'https://loremflickr.com/600/400/health,lifestyle?lock=27', '养生达人小王', 'video', '["中医", "节气", "保健"]', 4629, 1, '2026-02-06 20:49:27', '2026-02-06 20:49:27');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (28, '冬季进补养生汤谱大全', 'douyin', 'https://example.com/content/28', 'https://loremflickr.com/600/400/health,lifestyle?lock=28', '健康美食家', 'video', '["节气", "食疗", "美食"]', 8228, 1, '2026-03-08 20:49:27', '2026-03-08 20:49:27');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (29, '节气养生食疗指南', 'wechat_video', 'https://example.com/content/29', 'https://loremflickr.com/600/400/health,lifestyle?lock=29', '食疗养生专家', 'video', '["中医", "食疗", "保健"]', 2302, 1, '2026-02-15 20:49:27', '2026-02-15 20:49:27');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (30, '女性美容养颜食疗方', 'wechat_article', 'https://example.com/content/30', 'https://loremflickr.com/600/400/health,lifestyle?lock=30', '养生食谱精选', 'article', '["健康", "节气", "中医"]', 6194, 1, '2026-03-11 20:49:27', '2026-03-11 20:49:27');

SELECT '内容数据插入完成: 30条' AS message;

-- ============================================
-- 6. 收藏数据
-- ============================================

INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (1, 1, 6, '2026-03-12 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (2, 1, 35, '2026-03-02 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (3, 1, 41, '2026-02-07 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (4, 1, 26, '2026-02-19 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (5, 1, 7, '2026-03-01 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (6, 1, 63, '2026-02-05 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (7, 1, 25, '2026-01-25 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (8, 1, 33, '2026-01-20 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (9, 1, 31, '2026-02-18 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (10, 1, 2, '2026-02-12 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (11, 1, 32, '2026-03-01 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (12, 1, 10, '2026-02-16 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (13, 2, 38, '2026-02-03 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (14, 2, 62, '2026-02-06 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (15, 2, 68, '2026-01-31 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (16, 2, 37, '2026-02-19 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (17, 2, 36, '2026-02-22 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (18, 2, 42, '2026-03-08 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (19, 2, 34, '2026-01-25 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (20, 3, 21, '2026-02-22 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (21, 3, 34, '2026-03-05 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (22, 3, 68, '2026-02-25 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (23, 3, 12, '2026-01-15 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (24, 3, 20, '2026-02-20 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (25, 3, 36, '2026-02-12 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (26, 3, 28, '2026-02-06 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (27, 3, 47, '2026-01-31 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (28, 3, 33, '2026-01-28 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (29, 3, 50, '2026-03-02 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (30, 3, 41, '2026-03-05 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (31, 3, 59, '2026-02-17 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (32, 4, 47, '2026-01-28 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (33, 4, 36, '2026-02-10 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (34, 4, 15, '2026-01-30 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (35, 4, 67, '2026-02-14 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (36, 4, 9, '2026-01-30 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (37, 4, 30, '2026-02-25 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (38, 4, 48, '2026-01-29 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (39, 4, 23, '2026-02-24 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (40, 4, 53, '2026-01-26 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (41, 4, 61, '2026-01-25 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (42, 4, 60, '2026-01-17 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (43, 4, 69, '2026-02-24 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (44, 4, 41, '2026-02-02 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (45, 4, 10, '2026-01-24 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (46, 5, 46, '2026-03-06 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (47, 5, 37, '2026-01-23 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (48, 5, 49, '2026-03-13 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (49, 5, 45, '2026-02-24 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (50, 5, 2, '2026-01-23 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (51, 5, 14, '2026-03-01 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (52, 5, 23, '2026-02-11 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (53, 5, 26, '2026-02-18 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (54, 5, 3, '2026-02-25 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (55, 5, 34, '2026-02-23 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (56, 5, 53, '2026-01-13 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (57, 5, 68, '2026-01-16 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (58, 5, 30, '2026-01-27 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (59, 6, 69, '2026-02-24 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (60, 6, 53, '2026-01-23 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (61, 6, 27, '2026-03-07 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (62, 6, 58, '2026-03-10 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (63, 6, 21, '2026-03-07 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (64, 6, 55, '2026-02-17 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (65, 6, 20, '2026-02-10 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (66, 6, 28, '2026-01-14 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (67, 6, 34, '2026-01-25 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (68, 6, 3, '2026-03-10 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (69, 6, 26, '2026-02-15 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (70, 6, 8, '2026-02-24 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (71, 6, 2, '2026-02-08 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (72, 6, 42, '2026-02-01 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (73, 7, 53, '2026-02-23 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (74, 7, 63, '2026-02-03 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (75, 7, 64, '2026-01-21 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (76, 7, 21, '2026-02-26 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (77, 7, 9, '2026-02-18 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (78, 7, 58, '2026-01-26 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (79, 7, 24, '2026-02-02 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (80, 7, 34, '2026-02-21 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (81, 7, 57, '2026-03-02 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (82, 7, 35, '2026-02-11 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (83, 7, 45, '2026-02-07 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (84, 7, 51, '2026-01-16 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (85, 7, 18, '2026-02-11 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (86, 7, 17, '2026-01-20 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (87, 7, 60, '2026-01-17 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (88, 8, 60, '2026-03-07 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (89, 8, 26, '2026-03-08 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (90, 8, 3, '2026-01-23 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (91, 8, 50, '2026-01-28 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (92, 8, 28, '2026-03-08 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (93, 8, 41, '2026-02-21 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (94, 8, 56, '2026-02-27 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (95, 8, 34, '2026-02-01 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (96, 8, 61, '2026-02-26 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (97, 8, 69, '2026-02-08 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (98, 8, 18, '2026-02-26 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (99, 8, 67, '2026-03-13 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (100, 8, 38, '2026-02-12 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (101, 8, 62, '2026-02-13 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (102, 8, 48, '2026-03-11 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (103, 9, 43, '2026-02-17 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (104, 9, 17, '2026-01-31 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (105, 9, 25, '2026-01-17 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (106, 9, 5, '2026-02-16 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (107, 9, 59, '2026-01-28 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (108, 9, 48, '2026-02-01 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (109, 10, 25, '2026-01-21 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (110, 10, 23, '2026-01-16 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (111, 10, 38, '2026-03-01 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (112, 10, 57, '2026-02-12 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (113, 10, 15, '2026-02-05 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (114, 10, 56, '2026-02-19 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (115, 11, 50, '2026-03-02 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (116, 11, 68, '2026-02-05 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (117, 11, 46, '2026-03-06 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (118, 11, 17, '2026-01-13 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (119, 11, 69, '2026-01-23 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (120, 11, 7, '2026-02-25 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (121, 11, 39, '2026-01-28 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (122, 11, 54, '2026-01-22 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (123, 11, 62, '2026-01-21 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (124, 11, 13, '2026-03-02 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (125, 11, 42, '2026-01-31 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (126, 12, 40, '2026-01-29 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (127, 12, 3, '2026-02-03 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (128, 12, 61, '2026-03-09 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (129, 12, 21, '2026-02-10 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (130, 12, 20, '2026-03-12 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (131, 12, 46, '2026-03-03 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (132, 12, 31, '2026-02-03 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (133, 12, 30, '2026-03-07 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (134, 12, 18, '2026-02-20 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (135, 12, 44, '2026-02-06 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (136, 13, 32, '2026-02-22 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (137, 13, 15, '2026-02-24 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (138, 13, 46, '2026-03-10 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (139, 13, 23, '2026-01-13 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (140, 13, 53, '2026-03-12 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (141, 13, 29, '2026-02-23 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (142, 13, 8, '2026-01-26 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (143, 13, 5, '2026-03-11 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (144, 13, 44, '2026-02-05 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (145, 13, 33, '2026-02-02 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (146, 14, 66, '2026-02-26 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (147, 14, 8, '2026-02-14 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (148, 14, 35, '2026-01-31 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (149, 14, 64, '2026-03-09 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (150, 14, 40, '2026-01-16 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (151, 14, 19, '2026-01-17 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (152, 14, 61, '2026-03-03 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (153, 14, 15, '2026-02-25 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (154, 14, 2, '2026-01-18 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (155, 14, 46, '2026-02-09 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (156, 14, 10, '2026-02-09 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (157, 14, 13, '2026-03-08 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (158, 15, 49, '2026-03-07 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (159, 15, 34, '2026-03-11 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (160, 15, 6, '2026-02-16 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (161, 15, 45, '2026-02-04 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (162, 15, 22, '2026-03-09 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (163, 15, 46, '2026-03-01 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (164, 15, 14, '2026-03-06 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (165, 15, 32, '2026-01-22 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (166, 15, 47, '2026-03-05 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (167, 15, 39, '2026-02-08 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (168, 15, 33, '2026-02-28 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (169, 15, 57, '2026-01-16 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (170, 15, 29, '2026-03-03 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (171, 16, 16, '2026-03-04 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (172, 16, 52, '2026-01-29 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (173, 16, 44, '2026-02-20 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (174, 16, 45, '2026-03-08 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (175, 16, 27, '2026-01-19 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (176, 16, 67, '2026-02-25 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (177, 16, 21, '2026-01-24 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (178, 16, 55, '2026-02-27 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (179, 16, 65, '2026-02-12 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (180, 16, 56, '2026-01-23 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (181, 16, 64, '2026-03-02 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (182, 16, 26, '2026-02-24 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (183, 16, 5, '2026-01-16 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (184, 16, 53, '2026-03-09 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (185, 17, 2, '2026-03-12 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (186, 17, 45, '2026-01-15 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (187, 17, 8, '2026-02-13 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (188, 17, 62, '2026-01-19 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (189, 17, 44, '2026-02-18 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (190, 17, 13, '2026-01-16 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (191, 18, 10, '2026-02-11 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (192, 18, 58, '2026-03-08 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (193, 18, 45, '2026-03-04 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (194, 18, 31, '2026-03-10 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (195, 18, 32, '2026-01-23 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (196, 18, 29, '2026-01-13 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (197, 18, 23, '2026-01-19 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (198, 18, 62, '2026-03-05 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (199, 18, 18, '2026-03-09 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (200, 18, 47, '2026-02-23 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (201, 18, 27, '2026-02-18 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (202, 18, 20, '2026-02-22 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (203, 19, 16, '2026-01-24 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (204, 19, 27, '2026-02-05 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (205, 19, 6, '2026-02-13 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (206, 19, 61, '2026-03-01 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (207, 19, 47, '2026-02-21 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (208, 19, 55, '2026-02-16 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (209, 19, 57, '2026-02-02 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (210, 19, 24, '2026-03-11 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (211, 19, 21, '2026-02-04 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (212, 19, 63, '2026-03-08 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (213, 19, 48, '2026-01-13 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (214, 19, 18, '2026-03-12 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (215, 19, 25, '2026-01-28 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (216, 20, 36, '2026-01-19 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (217, 20, 58, '2026-02-07 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (218, 20, 55, '2026-01-20 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (219, 20, 11, '2026-01-27 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (220, 20, 62, '2026-02-14 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (221, 20, 65, '2026-02-01 20:49:27');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (222, 20, 33, '2026-02-08 20:49:27');

SELECT '收藏数据插入完成: 222条' AS message;

-- ============================================
-- 7. 浏览历史数据
-- ============================================

INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (1, 1, 6, '2026-02-17 20:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-17 20:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (2, 1, 51, '2026-03-05 09:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-05 09:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (3, 1, 45, '2026-02-25 03:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-25 03:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (4, 1, 61, '2026-02-17 14:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-17 14:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (5, 1, 31, '2026-03-11 01:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-11 01:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (6, 1, 35, '2026-02-21 15:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-21 15:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (7, 1, 30, '2026-02-28 18:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-28 18:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (8, 1, 48, '2026-03-06 15:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-06 15:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (9, 1, 23, '2026-02-28 15:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-28 15:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (10, 1, 10, '2026-02-23 00:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-23 00:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (11, 1, 32, '2026-02-24 08:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-24 08:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (12, 1, 66, '2026-02-23 07:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-23 07:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (13, 1, 18, '2026-02-18 18:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-18 18:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (14, 1, 1, '2026-02-24 23:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-24 23:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (15, 1, 57, '2026-03-06 23:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-06 23:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (16, 1, 42, '2026-02-25 13:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-25 13:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (17, 1, 62, '2026-02-20 11:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-20 11:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (18, 1, 56, '2026-02-21 13:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-21 13:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (19, 1, 4, '2026-03-01 19:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-01 19:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (20, 2, 54, '2026-02-16 08:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-16 08:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (21, 2, 59, '2026-03-10 09:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-10 09:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (22, 2, 21, '2026-03-05 03:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-05 03:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (23, 2, 37, '2026-02-18 22:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-18 22:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (24, 2, 62, '2026-03-11 05:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-11 05:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (25, 2, 45, '2026-03-10 09:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-10 09:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (26, 2, 22, '2026-02-25 10:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-25 10:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (27, 2, 31, '2026-02-28 04:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-28 04:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (28, 2, 2, '2026-02-24 10:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-24 10:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (29, 2, 64, '2026-02-14 01:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-14 01:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (30, 2, 38, '2026-03-09 15:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-09 15:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (31, 2, 49, '2026-02-21 15:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-21 15:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (32, 2, 33, '2026-03-12 01:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-12 01:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (33, 2, 67, '2026-03-06 11:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-06 11:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (34, 2, 40, '2026-03-06 13:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-06 13:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (35, 2, 42, '2026-02-24 12:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-24 12:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (36, 2, 28, '2026-02-15 23:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-15 23:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (37, 2, 69, '2026-02-26 10:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-26 10:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (38, 2, 46, '2026-03-11 19:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-11 19:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (39, 2, 39, '2026-03-11 19:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-11 19:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (40, 2, 61, '2026-02-19 18:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-19 18:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (41, 2, 56, '2026-03-13 05:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-13 05:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (42, 2, 48, '2026-03-10 09:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-10 09:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (43, 2, 4, '2026-03-06 18:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-06 18:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (44, 2, 29, '2026-02-22 06:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-22 06:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (45, 2, 17, '2026-02-14 21:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-14 21:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (46, 2, 1, '2026-03-10 23:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-10 23:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (47, 2, 58, '2026-02-22 21:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-22 21:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (48, 2, 16, '2026-02-20 21:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-20 21:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (49, 3, 1, '2026-03-03 04:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-03 04:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (50, 3, 69, '2026-03-13 14:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-13 14:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (51, 3, 63, '2026-02-21 23:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-21 23:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (52, 3, 18, '2026-02-28 23:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-28 23:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (53, 3, 42, '2026-02-13 06:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-13 06:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (54, 3, 33, '2026-03-01 08:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-01 08:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (55, 3, 28, '2026-03-07 01:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-07 01:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (56, 3, 58, '2026-03-04 07:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-04 07:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (57, 3, 47, '2026-03-03 01:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-03 01:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (58, 3, 64, '2026-03-08 19:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-08 19:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (59, 3, 31, '2026-02-21 08:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-21 08:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (60, 3, 59, '2026-02-20 06:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-20 06:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (61, 3, 56, '2026-02-18 20:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-18 20:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (62, 3, 4, '2026-03-07 01:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-07 01:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (63, 3, 30, '2026-03-04 08:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-04 08:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (64, 3, 57, '2026-02-18 07:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-18 07:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (65, 3, 38, '2026-03-06 11:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-06 11:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (66, 4, 53, '2026-03-01 17:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-01 17:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (67, 4, 62, '2026-03-04 04:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-04 04:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (68, 4, 12, '2026-02-20 07:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-20 07:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (69, 4, 67, '2026-02-16 11:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-16 11:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (70, 4, 4, '2026-02-27 00:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-27 00:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (71, 4, 27, '2026-03-12 18:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-12 18:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (72, 4, 11, '2026-02-25 17:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-25 17:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (73, 4, 55, '2026-02-28 10:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-28 10:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (74, 4, 6, '2026-03-01 01:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-01 01:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (75, 4, 24, '2026-02-23 11:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-23 11:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (76, 4, 17, '2026-02-28 08:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-28 08:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (77, 4, 1, '2026-02-25 00:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-25 00:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (78, 5, 1, '2026-02-15 12:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-15 12:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (79, 5, 27, '2026-03-12 12:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-12 12:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (80, 5, 47, '2026-03-05 10:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-05 10:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (81, 5, 6, '2026-02-23 15:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-23 15:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (82, 5, 11, '2026-02-17 17:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-17 17:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (83, 5, 19, '2026-03-03 06:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-03 06:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (84, 5, 5, '2026-02-20 19:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-20 19:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (85, 5, 52, '2026-02-27 03:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-27 03:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (86, 5, 49, '2026-03-10 03:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-10 03:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (87, 5, 54, '2026-02-19 23:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-19 23:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (88, 5, 40, '2026-02-20 06:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-20 06:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (89, 5, 42, '2026-02-18 19:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-18 19:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (90, 5, 35, '2026-03-05 18:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-05 18:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (91, 5, 31, '2026-03-05 20:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-05 20:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (92, 5, 24, '2026-03-04 19:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-04 19:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (93, 5, 61, '2026-03-08 07:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-08 07:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (94, 5, 62, '2026-03-06 21:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-06 21:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (95, 5, 7, '2026-02-17 16:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-17 16:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (96, 5, 30, '2026-02-26 03:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-26 03:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (97, 5, 34, '2026-03-06 18:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-06 18:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (98, 5, 68, '2026-03-04 15:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-04 15:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (99, 6, 2, '2026-03-07 10:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-07 10:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (100, 6, 31, '2026-03-13 01:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-13 01:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (101, 6, 63, '2026-03-11 16:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-11 16:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (102, 6, 54, '2026-02-14 01:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-14 01:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (103, 6, 47, '2026-03-07 11:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-07 11:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (104, 6, 53, '2026-03-02 14:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-02 14:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (105, 6, 42, '2026-02-12 12:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-12 12:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (106, 6, 55, '2026-02-22 20:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-22 20:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (107, 6, 23, '2026-03-03 03:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-03 03:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (108, 6, 14, '2026-03-03 06:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-03 06:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (109, 6, 27, '2026-02-21 09:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-21 09:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (110, 6, 5, '2026-02-28 00:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-28 00:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (111, 6, 48, '2026-02-23 14:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-23 14:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (112, 6, 10, '2026-03-06 18:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-06 18:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (113, 6, 8, '2026-03-09 21:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-09 21:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (114, 6, 37, '2026-02-16 09:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-16 09:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (115, 6, 15, '2026-02-13 11:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-13 11:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (116, 6, 69, '2026-02-26 15:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-26 15:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (117, 6, 35, '2026-03-12 06:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-12 06:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (118, 6, 33, '2026-03-11 14:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-11 14:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (119, 6, 41, '2026-03-11 16:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-11 16:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (120, 6, 36, '2026-02-22 09:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-22 09:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (121, 7, 5, '2026-02-13 10:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-13 10:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (122, 7, 41, '2026-02-27 19:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-27 19:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (123, 7, 30, '2026-03-05 07:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-05 07:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (124, 7, 18, '2026-02-27 19:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-27 19:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (125, 7, 43, '2026-02-16 00:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-16 00:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (126, 7, 23, '2026-03-01 00:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-01 00:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (127, 7, 67, '2026-02-12 04:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-12 04:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (128, 7, 36, '2026-03-01 02:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-01 02:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (129, 7, 66, '2026-02-23 16:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-23 16:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (130, 7, 63, '2026-03-09 02:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-09 02:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (131, 7, 49, '2026-03-04 20:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-04 20:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (132, 7, 35, '2026-03-10 18:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-10 18:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (133, 7, 24, '2026-03-11 07:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-11 07:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (134, 7, 9, '2026-03-03 13:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-03 13:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (135, 7, 38, '2026-02-23 18:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-23 18:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (136, 7, 20, '2026-03-05 00:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-05 00:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (137, 7, 42, '2026-03-04 14:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-04 14:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (138, 7, 25, '2026-02-27 01:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-27 01:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (139, 7, 26, '2026-03-13 11:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-13 11:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (140, 7, 15, '2026-02-24 05:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-24 05:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (141, 7, 22, '2026-03-05 12:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-05 12:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (142, 7, 19, '2026-02-21 00:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-21 00:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (143, 7, 7, '2026-02-28 00:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-28 00:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (144, 7, 13, '2026-02-21 00:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-21 00:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (145, 7, 32, '2026-03-13 17:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-13 17:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (146, 7, 3, '2026-03-04 00:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-04 00:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (147, 7, 39, '2026-03-11 13:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-11 13:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (148, 7, 48, '2026-03-13 08:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-13 08:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (149, 7, 50, '2026-03-08 18:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-08 18:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (150, 8, 5, '2026-03-12 00:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-12 00:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (151, 8, 18, '2026-02-22 14:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-22 14:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (152, 8, 52, '2026-02-16 08:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-16 08:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (153, 8, 37, '2026-02-16 21:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-16 21:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (154, 8, 51, '2026-02-12 04:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-12 04:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (155, 8, 69, '2026-03-03 16:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-03 16:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (156, 8, 66, '2026-02-20 07:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-20 07:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (157, 8, 33, '2026-02-26 08:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-26 08:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (158, 8, 16, '2026-03-02 16:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-02 16:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (159, 8, 15, '2026-02-21 19:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-21 19:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (160, 8, 60, '2026-03-07 06:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-07 06:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (161, 9, 10, '2026-02-27 03:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-27 03:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (162, 9, 19, '2026-02-25 10:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-25 10:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (163, 9, 68, '2026-03-11 21:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-11 21:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (164, 9, 13, '2026-02-13 19:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-13 19:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (165, 9, 41, '2026-03-01 21:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-01 21:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (166, 9, 44, '2026-03-08 07:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-08 07:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (167, 9, 33, '2026-02-20 17:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-20 17:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (168, 9, 8, '2026-02-13 06:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-13 06:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (169, 9, 48, '2026-02-12 20:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-12 20:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (170, 9, 9, '2026-03-08 23:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-08 23:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (171, 9, 55, '2026-03-13 18:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-13 18:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (172, 9, 27, '2026-03-03 04:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-03 04:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (173, 9, 45, '2026-02-16 16:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-16 16:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (174, 9, 62, '2026-03-13 18:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-13 18:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (175, 9, 22, '2026-02-22 03:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-22 03:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (176, 9, 65, '2026-02-18 22:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-18 22:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (177, 9, 29, '2026-02-27 16:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-27 16:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (178, 9, 69, '2026-02-26 07:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-26 07:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (179, 9, 11, '2026-03-11 05:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-11 05:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (180, 9, 56, '2026-02-19 19:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-19 19:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (181, 9, 52, '2026-02-28 06:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-28 06:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (182, 10, 20, '2026-02-24 23:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-24 23:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (183, 10, 30, '2026-02-17 03:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-17 03:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (184, 10, 54, '2026-02-15 23:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-15 23:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (185, 10, 26, '2026-03-02 09:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-02 09:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (186, 10, 38, '2026-02-14 18:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-14 18:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (187, 10, 9, '2026-03-10 20:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-10 20:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (188, 10, 23, '2026-02-13 21:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-13 21:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (189, 10, 25, '2026-02-17 09:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-17 09:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (190, 10, 47, '2026-03-06 18:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-06 18:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (191, 10, 45, '2026-02-14 10:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-14 10:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (192, 10, 3, '2026-02-18 14:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-18 14:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (193, 10, 10, '2026-02-26 10:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-26 10:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (194, 10, 43, '2026-03-11 03:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-11 03:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (195, 10, 44, '2026-03-12 15:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-12 15:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (196, 10, 33, '2026-03-08 18:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-08 18:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (197, 10, 22, '2026-02-20 15:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-20 15:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (198, 10, 18, '2026-03-03 20:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-03 20:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (199, 10, 46, '2026-03-08 21:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-08 21:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (200, 10, 41, '2026-02-18 13:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-18 13:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (201, 10, 57, '2026-02-28 05:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-28 05:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (202, 10, 55, '2026-02-15 07:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-15 07:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (203, 10, 68, '2026-02-16 17:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-16 17:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (204, 10, 29, '2026-02-19 23:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-19 23:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (205, 10, 17, '2026-03-11 18:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-11 18:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (206, 10, 1, '2026-02-12 05:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-12 05:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (207, 10, 61, '2026-02-26 01:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-26 01:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (208, 11, 45, '2026-03-13 03:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-13 03:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (209, 11, 62, '2026-03-13 13:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-13 13:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (210, 11, 10, '2026-02-14 16:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-14 16:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (211, 11, 30, '2026-03-11 15:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-11 15:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (212, 11, 67, '2026-02-14 05:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-14 05:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (213, 11, 20, '2026-03-08 19:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-08 19:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (214, 11, 46, '2026-03-04 15:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-04 15:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (215, 11, 12, '2026-03-08 15:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-08 15:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (216, 11, 1, '2026-02-14 23:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-14 23:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (217, 11, 27, '2026-02-27 19:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-27 19:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (218, 11, 60, '2026-03-05 16:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-05 16:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (219, 11, 53, '2026-03-07 06:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-07 06:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (220, 11, 64, '2026-02-24 05:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-24 05:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (221, 11, 17, '2026-02-24 06:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-24 06:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (222, 11, 69, '2026-03-09 11:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-09 11:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (223, 11, 44, '2026-03-10 07:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-10 07:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (224, 11, 5, '2026-02-12 08:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-12 08:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (225, 11, 6, '2026-03-06 00:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-06 00:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (226, 11, 11, '2026-03-08 10:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-08 10:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (227, 11, 21, '2026-02-28 23:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-28 23:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (228, 12, 57, '2026-02-15 08:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-15 08:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (229, 12, 34, '2026-03-09 10:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-09 10:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (230, 12, 9, '2026-02-13 22:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-13 22:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (231, 12, 65, '2026-02-23 12:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-23 12:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (232, 12, 63, '2026-02-12 12:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-12 12:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (233, 12, 31, '2026-02-18 10:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-18 10:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (234, 12, 11, '2026-02-19 19:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-19 19:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (235, 12, 2, '2026-02-21 00:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-21 00:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (236, 12, 20, '2026-02-23 20:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-23 20:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (237, 12, 22, '2026-02-18 18:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-18 18:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (238, 12, 24, '2026-02-23 18:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-23 18:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (239, 12, 18, '2026-03-11 14:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-11 14:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (240, 12, 48, '2026-02-18 19:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-18 19:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (241, 12, 13, '2026-03-10 20:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-10 20:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (242, 12, 61, '2026-03-01 09:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-01 09:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (243, 12, 46, '2026-03-05 08:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-05 08:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (244, 13, 8, '2026-02-16 02:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-16 02:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (245, 13, 63, '2026-03-09 12:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-09 12:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (246, 13, 29, '2026-02-17 07:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-17 07:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (247, 13, 14, '2026-03-10 14:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-10 14:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (248, 13, 67, '2026-02-25 21:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-25 21:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (249, 13, 10, '2026-03-10 04:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-10 04:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (250, 13, 17, '2026-03-09 20:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-09 20:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (251, 13, 13, '2026-02-13 14:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-13 14:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (252, 13, 12, '2026-02-15 11:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-15 11:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (253, 13, 19, '2026-02-18 01:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-18 01:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (254, 13, 62, '2026-03-13 15:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-13 15:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (255, 13, 16, '2026-02-16 15:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-16 15:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (256, 13, 20, '2026-02-24 23:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-24 23:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (257, 13, 48, '2026-02-21 10:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-21 10:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (258, 13, 3, '2026-03-12 00:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-12 00:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (259, 13, 32, '2026-03-08 00:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-08 00:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (260, 13, 15, '2026-02-24 01:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-24 01:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (261, 13, 22, '2026-02-25 05:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-25 05:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (262, 13, 50, '2026-02-13 21:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-13 21:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (263, 13, 43, '2026-03-03 01:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-03 01:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (264, 13, 41, '2026-02-28 05:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-28 05:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (265, 14, 9, '2026-03-10 01:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-10 01:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (266, 14, 36, '2026-02-12 16:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-12 16:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (267, 14, 30, '2026-02-27 08:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-27 08:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (268, 14, 46, '2026-02-23 14:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-23 14:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (269, 14, 65, '2026-03-13 04:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-13 04:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (270, 14, 2, '2026-02-17 19:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-17 19:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (271, 14, 49, '2026-02-21 17:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-21 17:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (272, 14, 27, '2026-02-13 19:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-13 19:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (273, 14, 16, '2026-03-01 02:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-01 02:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (274, 14, 43, '2026-03-06 02:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-06 02:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (275, 15, 16, '2026-02-21 04:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-21 04:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (276, 15, 56, '2026-03-13 16:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-13 16:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (277, 15, 15, '2026-02-28 00:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-28 00:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (278, 15, 21, '2026-03-07 06:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-07 06:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (279, 15, 40, '2026-02-19 08:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-19 08:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (280, 15, 14, '2026-03-08 07:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-08 07:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (281, 15, 29, '2026-03-02 16:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-02 16:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (282, 15, 67, '2026-02-24 05:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-24 05:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (283, 15, 46, '2026-02-16 18:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-16 18:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (284, 15, 24, '2026-02-23 05:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-23 05:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (285, 15, 43, '2026-03-05 20:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-05 20:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (286, 15, 55, '2026-03-10 07:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-10 07:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (287, 15, 65, '2026-03-10 01:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-10 01:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (288, 15, 50, '2026-03-07 12:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-07 12:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (289, 16, 40, '2026-02-21 02:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-21 02:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (290, 16, 66, '2026-03-07 20:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-07 20:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (291, 16, 55, '2026-03-10 17:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-10 17:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (292, 16, 63, '2026-02-11 22:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-11 22:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (293, 16, 50, '2026-03-03 18:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-03 18:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (294, 16, 19, '2026-03-08 08:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-08 08:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (295, 16, 20, '2026-02-12 11:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-12 11:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (296, 16, 69, '2026-02-21 06:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-21 06:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (297, 16, 68, '2026-02-12 07:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-12 07:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (298, 16, 39, '2026-03-05 14:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-05 14:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (299, 16, 46, '2026-03-07 10:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-07 10:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (300, 16, 35, '2026-02-27 08:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-27 08:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (301, 16, 67, '2026-02-20 18:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-20 18:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (302, 16, 11, '2026-02-15 16:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-15 16:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (303, 16, 26, '2026-02-20 09:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-20 09:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (304, 16, 60, '2026-03-03 07:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-03 07:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (305, 16, 31, '2026-03-09 09:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-09 09:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (306, 16, 17, '2026-03-13 02:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-13 02:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (307, 16, 49, '2026-02-28 11:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-28 11:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (308, 16, 14, '2026-03-11 11:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-11 11:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (309, 17, 68, '2026-02-28 13:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-28 13:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (310, 17, 8, '2026-02-15 09:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-15 09:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (311, 17, 19, '2026-03-11 17:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-11 17:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (312, 17, 17, '2026-02-22 13:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-22 13:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (313, 17, 1, '2026-03-07 16:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-07 16:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (314, 17, 67, '2026-03-10 05:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-10 05:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (315, 17, 41, '2026-03-07 03:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-07 03:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (316, 17, 18, '2026-02-25 17:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-25 17:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (317, 17, 20, '2026-02-26 08:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-26 08:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (318, 17, 5, '2026-03-06 14:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-06 14:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (319, 17, 61, '2026-03-13 07:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-13 07:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (320, 18, 59, '2026-02-14 21:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-14 21:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (321, 18, 56, '2026-02-17 11:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-17 11:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (322, 18, 45, '2026-03-10 20:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-10 20:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (323, 18, 60, '2026-02-21 09:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-21 09:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (324, 18, 65, '2026-03-03 05:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-03 05:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (325, 18, 4, '2026-03-10 08:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-10 08:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (326, 18, 6, '2026-02-22 06:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-22 06:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (327, 18, 2, '2026-03-03 04:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-03 04:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (328, 18, 66, '2026-03-03 19:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-03 19:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (329, 18, 5, '2026-03-04 11:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-04 11:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (330, 18, 13, '2026-02-28 14:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-28 14:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (331, 18, 54, '2026-03-13 04:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-13 04:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (332, 18, 22, '2026-02-21 18:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-21 18:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (333, 18, 20, '2026-02-16 12:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-16 12:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (334, 18, 67, '2026-02-20 19:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-20 19:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (335, 18, 25, '2026-03-07 19:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-07 19:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (336, 18, 38, '2026-03-05 08:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-05 08:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (337, 18, 10, '2026-02-28 02:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-28 02:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (338, 18, 48, '2026-02-21 22:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-21 22:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (339, 18, 63, '2026-03-04 22:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-04 22:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (340, 18, 30, '2026-03-06 21:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-06 21:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (341, 18, 15, '2026-03-05 04:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-05 04:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (342, 18, 40, '2026-02-16 11:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-16 11:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (343, 18, 57, '2026-03-04 17:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-04 17:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (344, 19, 67, '2026-02-20 20:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-20 20:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (345, 19, 66, '2026-02-19 22:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-19 22:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (346, 19, 65, '2026-02-18 10:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-18 10:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (347, 19, 47, '2026-02-22 06:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-22 06:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (348, 19, 39, '2026-02-16 05:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-16 05:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (349, 19, 12, '2026-03-09 03:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-09 03:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (350, 19, 19, '2026-03-12 11:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-12 11:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (351, 19, 52, '2026-02-20 01:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-20 01:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (352, 19, 7, '2026-02-14 03:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-14 03:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (353, 19, 28, '2026-03-08 03:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-08 03:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (354, 19, 35, '2026-03-01 04:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-01 04:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (355, 19, 24, '2026-03-01 06:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-01 06:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (356, 19, 40, '2026-02-27 07:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-27 07:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (357, 19, 17, '2026-02-12 07:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-12 07:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (358, 19, 31, '2026-03-02 13:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-02 13:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (359, 19, 58, '2026-02-17 02:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-17 02:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (360, 19, 3, '2026-03-11 11:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-11 11:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (361, 19, 1, '2026-02-14 16:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-14 16:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (362, 19, 55, '2026-02-15 17:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-15 17:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (363, 19, 23, '2026-02-18 17:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-18 17:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (364, 19, 64, '2026-02-22 08:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-22 08:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (365, 19, 2, '2026-02-27 20:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-27 20:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (366, 19, 20, '2026-02-25 23:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-25 23:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (367, 19, 33, '2026-02-23 22:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-23 22:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (368, 19, 18, '2026-03-01 02:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-01 02:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (369, 19, 11, '2026-02-15 05:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-15 05:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (370, 19, 16, '2026-02-22 22:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-22 22:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (371, 19, 37, '2026-03-04 10:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-04 10:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (372, 19, 36, '2026-02-26 12:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-26 12:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (373, 19, 46, '2026-02-23 21:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-23 21:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (374, 20, 33, '2026-02-24 00:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-24 00:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (375, 20, 42, '2026-03-02 00:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-02 00:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (376, 20, 66, '2026-02-23 14:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-23 14:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (377, 20, 52, '2026-02-25 22:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-25 22:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (378, 20, 36, '2026-02-14 02:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-14 02:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (379, 20, 47, '2026-02-20 00:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-20 00:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (380, 20, 31, '2026-02-18 01:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-18 01:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (381, 20, 46, '2026-03-06 11:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-06 11:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (382, 20, 34, '2026-03-10 04:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-10 04:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (383, 20, 32, '2026-03-04 22:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-04 22:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (384, 20, 22, '2026-02-25 07:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-25 07:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (385, 20, 68, '2026-03-08 10:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-08 10:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (386, 20, 17, '2026-03-01 18:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-01 18:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (387, 20, 14, '2026-03-07 16:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-07 16:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (388, 20, 18, '2026-02-18 06:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-18 06:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (389, 20, 9, '2026-02-28 08:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-28 08:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (390, 20, 27, '2026-02-27 07:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-27 07:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (391, 20, 10, '2026-02-18 01:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-18 01:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (392, 20, 29, '2026-02-17 07:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-17 07:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (393, 20, 53, '2026-03-02 03:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-02 03:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (394, 20, 2, '2026-03-02 23:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-02 23:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (395, 20, 12, '2026-02-28 14:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-28 14:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (396, 20, 35, '2026-02-23 14:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-23 14:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (397, 20, 67, '2026-02-28 08:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-28 08:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (398, 20, 50, '2026-03-04 05:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-04 05:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (399, 20, 61, '2026-02-23 04:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-23 04:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (400, 20, 4, '2026-02-15 16:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-15 16:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (401, 20, 44, '2026-02-13 15:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-13 15:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (402, 20, 20, '2026-03-10 04:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-10 04:49:27';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (403, 20, 24, '2026-03-02 22:49:27')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-02 22:49:27';

SELECT '浏览历史数据插入完成: 403条' AS message;

-- ============================================
-- 8. 评论数据 (100+条)
-- ============================================

INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (1, 1, 14, '冬天喝这个太舒服了', 3, '[]', 38, 5, 1, '2026-02-26 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (2, 1, 13, '按照步骤做的，效果很明显', 4, '[]', 36, 3, 1, '2026-02-03 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (3, 1, 4, '做法详细，新手也能学会', 3, '[]', 7, 4, 1, '2025-12-19 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (4, 1, 13, '糖尿病患者能喝吗？', 4, '[]', 10, 1, 1, '2026-03-09 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (5, 1, 17, '食材容易买到，很方便', 5, '[]', 36, 0, 1, '2026-03-05 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (6, 2, 8, '这个配方太棒了，收藏了', 3, '["https://loremflickr.com/400/400/food,review?lock=6"]', 0, 1, 1, '2025-12-19 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (7, 2, 20, '真的很有效，坚持喝了一周感觉好多了！', 5, '[]', 27, 5, 1, '2026-01-30 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (8, 3, 3, '火候要掌握多久啊？', 5, '[]', 14, 5, 1, '2026-03-10 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (9, 3, 7, '食材容易买到，很方便', 5, '[]', 25, 3, 1, '2026-03-03 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (10, 4, 3, '食材容易买到，很方便', 5, '[]', 29, 5, 1, '2026-02-18 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (11, 4, 13, '已经收藏，准备明天试试', 5, '["https://loremflickr.com/400/400/food,review?lock=11"]', 43, 3, 1, '2026-02-26 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (12, 4, 18, '糖尿病患者能喝吗？', 5, '[]', 45, 1, 1, '2026-02-28 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (13, 5, 14, '已经加入收藏夹了', 5, '[]', 33, 2, 1, '2025-12-30 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (14, 6, 11, '感谢分享这么好的食谱', 5, '[]', 19, 1, 1, '2026-01-13 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (15, 6, 5, '这个配方太棒了，收藏了', 3, '[]', 48, 0, 1, '2026-02-24 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (16, 7, 12, '每天一碗，身体棒棒的', 3, '[]', 31, 4, 1, '2026-01-19 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (17, 7, 3, '冬天喝这个太舒服了', 5, '[]', 12, 5, 1, '2026-01-12 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (18, 7, 3, '这个汤真的很滋补', 4, '[]', 2, 4, 1, '2026-01-04 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (19, 7, 3, '按照步骤做的，效果很明显', 3, '[]', 25, 2, 1, '2026-01-16 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (20, 7, 9, '营养价值很高', 4, '[]', 37, 2, 1, '2026-02-15 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (21, 8, 14, '真的很有效，坚持喝了一周感觉好多了！', 5, '[]', 11, 0, 1, '2025-12-29 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (22, 8, 13, '推荐给朋友了，都说不错', 4, '[]', 24, 1, 1, '2026-01-27 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (23, 8, 7, '做法详细，新手也能学会', 4, '[]', 50, 0, 1, '2026-03-02 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (24, 8, 1, '夏天喝这个很解暑', 5, '[]', 47, 0, 1, '2026-02-19 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (25, 8, 6, '夏天喝这个很解暑', 3, '[]', 38, 5, 1, '2026-01-13 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (26, 9, 18, '喝了一段时间，感觉气色好了很多', 5, '[]', 49, 5, 1, '2026-03-13 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (27, 10, 7, '食材容易买到，很方便', 3, '[]', 20, 0, 1, '2025-12-26 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (28, 11, 10, '已经加入收藏夹了', 4, '[]', 46, 1, 1, '2026-02-10 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (29, 11, 17, '冬天喝这个太舒服了', 5, '[]', 4, 4, 1, '2026-03-07 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (30, 11, 10, '第一次做就成功了，开心', 5, '[]', 17, 5, 1, '2025-12-26 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (31, 12, 6, '给家人做了这个，都说很好喝', 3, '["https://loremflickr.com/400/400/food,review?lock=31"]', 47, 4, 1, '2026-03-13 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (32, 12, 3, '希望能出更多类似的食谱', 5, '[]', 49, 4, 1, '2026-02-19 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (33, 12, 13, '火候要掌握多久啊？', 3, '[]', 28, 4, 1, '2026-01-03 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (34, 12, 6, '感谢分享这么好的食谱', 5, '[]', 13, 5, 1, '2026-02-02 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (35, 12, 1, '已经收藏，准备明天试试', 4, '[]', 41, 3, 1, '2026-02-18 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (36, 13, 16, '做法详细，新手也能学会', 5, '[]', 47, 5, 1, '2026-03-13 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (37, 13, 5, '食材容易买到，很方便', 4, '[]', 19, 1, 1, '2026-02-03 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (38, 13, 8, '请问可以天天喝吗？', 4, '[]', 5, 5, 1, '2026-01-20 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (39, 14, 15, '真的很有效，坚持喝了一周感觉好多了！', 3, '[]', 48, 1, 1, '2025-12-14 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (40, 14, 8, '做法简单快捷，适合上班族', 3, '["https://loremflickr.com/400/400/food,review?lock=40"]', 29, 3, 1, '2026-01-05 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (41, 15, 20, '糖尿病患者能喝吗？', 4, '[]', 31, 3, 1, '2026-03-06 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (42, 15, 18, '这个汤真的很滋补', 5, '[]', 48, 0, 1, '2026-01-09 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (43, 16, 17, '味道清淡不油腻，喜欢', 4, '[]', 26, 5, 1, '2026-02-01 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (44, 16, 15, '孩子很喜欢喝，谢谢分享', 4, '[]', 14, 0, 1, '2026-03-08 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (45, 16, 8, '请问可以用其他食材代替吗？', 3, '[]', 30, 5, 1, '2026-01-17 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (46, 16, 6, '喝了一段时间，感觉气色好了很多', 3, '[]', 24, 5, 1, '2026-02-28 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (47, 16, 20, '孩子很喜欢喝，谢谢分享', 3, '[]', 40, 1, 1, '2025-12-28 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (48, 17, 11, '火候要掌握多久啊？', 3, '[]', 28, 2, 1, '2026-02-01 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (49, 17, 1, '孕妇可以喝这个吗？', 5, '[]', 47, 5, 1, '2026-01-27 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (50, 17, 20, '味道不错，做法也很简单，推荐给大家', 3, '[]', 37, 0, 1, '2025-12-31 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (51, 17, 9, '真的很有效，坚持喝了一周感觉好多了！', 4, '[]', 6, 5, 1, '2025-12-28 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (52, 17, 10, '食材容易买到，很方便', 3, '[]', 41, 4, 1, '2026-02-27 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (53, 18, 6, '给家人做了这个，都说很好喝', 3, '["https://loremflickr.com/400/400/food,review?lock=53"]', 30, 2, 1, '2025-12-24 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (54, 19, 10, '味道清淡不油腻，喜欢', 4, '[]', 30, 5, 1, '2025-12-14 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (55, 19, 7, '已经加入收藏夹了', 4, '["https://loremflickr.com/400/400/food,review?lock=55"]', 16, 5, 1, '2026-01-07 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (56, 19, 3, '孩子很喜欢喝，谢谢分享', 4, '[]', 15, 1, 1, '2026-01-12 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (57, 20, 13, '做法简单快捷，适合上班族', 5, '[]', 43, 1, 1, '2026-03-05 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (58, 20, 6, '老人小孩都适合喝', 4, '[]', 7, 3, 1, '2026-01-30 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (59, 21, 18, '喝了一段时间，感觉气色好了很多', 5, '[]', 32, 4, 1, '2026-01-30 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (60, 22, 7, '这个配方太棒了，收藏了', 4, '[]', 25, 3, 1, '2025-12-30 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (61, 22, 4, '坚持喝了一个月，效果明显', 3, '["https://loremflickr.com/400/400/food,review?lock=61"]', 38, 1, 1, '2025-12-25 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (62, 22, 19, '做法简单快捷，适合上班族', 3, '["https://loremflickr.com/400/400/food,review?lock=62"]', 43, 2, 1, '2026-01-20 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (63, 22, 7, '每天一碗，身体棒棒的', 3, '[]', 29, 5, 1, '2026-01-09 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (64, 23, 8, '夏天喝这个很解暑', 4, '[]', 9, 5, 1, '2025-12-19 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (65, 23, 11, '孕妇可以喝这个吗？', 3, '["https://loremflickr.com/400/400/food,review?lock=65"]', 38, 0, 1, '2026-01-29 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (66, 23, 17, '第一次做就成功了，开心', 5, '[]', 43, 5, 1, '2026-01-30 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (67, 23, 9, '做法简单快捷，适合上班族', 5, '["https://loremflickr.com/400/400/food,review?lock=67"]', 25, 3, 1, '2026-03-04 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (68, 23, 14, '火候要掌握多久啊？', 3, '[]', 38, 3, 1, '2025-12-30 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (69, 24, 1, '坚持喝了一个月，效果明显', 5, '[]', 3, 3, 1, '2026-02-08 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (70, 24, 7, '给家人做了这个，都说很好喝', 3, '[]', 22, 4, 1, '2026-01-08 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (71, 24, 6, '按照步骤做的，效果很明显', 4, '["https://loremflickr.com/400/400/food,review?lock=71"]', 6, 3, 1, '2026-01-07 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (72, 24, 6, '做法详细，新手也能学会', 3, '[]', 32, 1, 1, '2026-02-16 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (73, 25, 20, '做法简单快捷，适合上班族', 4, '[]', 29, 0, 1, '2025-12-27 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (74, 25, 13, '营养价值很高', 4, '[]', 50, 5, 1, '2026-02-25 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (75, 25, 14, '推荐给朋友了，都说不错', 3, '[]', 30, 2, 1, '2025-12-14 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (76, 25, 7, '火候要掌握多久啊？', 5, '["https://loremflickr.com/400/400/food,review?lock=76"]', 39, 0, 1, '2025-12-28 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (77, 25, 8, '味道不错，做法也很简单，推荐给大家', 3, '["https://loremflickr.com/400/400/food,review?lock=77"]', 16, 3, 1, '2026-03-07 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (78, 26, 1, '已经收藏，准备明天试试', 5, '[]', 13, 5, 1, '2026-01-17 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (79, 26, 20, '冬天喝这个太舒服了', 5, '[]', 1, 3, 1, '2025-12-24 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (80, 26, 7, '做法简单快捷，适合上班族', 4, '[]', 42, 4, 1, '2026-01-08 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (81, 26, 19, '这个配方太棒了，收藏了', 4, '[]', 37, 4, 1, '2026-02-05 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (82, 27, 16, '做法详细，新手也能学会', 4, '[]', 37, 1, 1, '2026-02-21 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (83, 28, 8, '真的很有效，坚持喝了一周感觉好多了！', 5, '[]', 27, 3, 1, '2026-01-19 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (84, 28, 19, '老人小孩都适合喝', 3, '[]', 16, 0, 1, '2026-01-22 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (85, 28, 4, '这个配方很专业，点赞', 4, '[]', 13, 3, 1, '2026-01-14 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (86, 28, 18, '给家人做了这个，都说很好喝', 3, '[]', 18, 2, 1, '2026-02-01 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (87, 28, 9, '感谢分享这么好的食谱', 3, '[]', 10, 4, 1, '2025-12-30 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (88, 29, 15, '食材容易买到，很方便', 5, '[]', 32, 3, 1, '2026-01-06 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (89, 29, 15, '味道清淡不油腻，喜欢', 4, '[]', 3, 3, 1, '2026-01-12 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (90, 29, 16, '味道不错，做法也很简单，推荐给大家', 4, '["https://loremflickr.com/400/400/food,review?lock=90"]', 12, 0, 1, '2026-02-27 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (91, 29, 16, '喝了一段时间，感觉气色好了很多', 4, '["https://loremflickr.com/400/400/food,review?lock=91"]', 44, 3, 1, '2025-12-27 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (92, 30, 9, '推荐给朋友了，都说不错', 4, '[]', 26, 4, 1, '2026-03-10 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (93, 30, 7, '做法简单快捷，适合上班族', 4, '[]', 13, 4, 1, '2026-02-02 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (94, 30, 16, '这个汤真的很滋补', 3, '["https://loremflickr.com/400/400/food,review?lock=94"]', 39, 1, 1, '2026-03-01 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (95, 31, 17, '冬天喝这个太舒服了', 4, '[]', 2, 5, 1, '2025-12-24 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (96, 31, 3, '孕妇可以喝这个吗？', 3, '[]', 46, 1, 1, '2026-01-07 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (97, 31, 5, '这个配方太棒了，收藏了', 5, '[]', 22, 2, 1, '2026-01-18 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (98, 31, 5, '这个汤真的很滋补', 3, '[]', 8, 5, 1, '2026-02-20 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (99, 31, 5, '营养价值很高', 4, '[]', 46, 3, 1, '2026-03-10 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (100, 32, 8, '推荐给朋友了，都说不错', 3, '[]', 15, 0, 1, '2026-01-06 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (101, 32, 9, '已经收藏，准备明天试试', 3, '[]', 7, 1, 1, '2026-01-06 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (102, 32, 6, '已经收藏，准备明天试试', 3, '[]', 30, 2, 1, '2026-01-07 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (103, 32, 4, '味道清淡不油腻，喜欢', 4, '[]', 0, 3, 1, '2026-01-02 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (104, 33, 17, '做法详细，新手也能学会', 4, '[]', 37, 1, 1, '2026-01-07 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (105, 33, 12, '火候要掌握多久啊？', 3, '[]', 24, 2, 1, '2026-03-06 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (106, 33, 17, '糖尿病患者能喝吗？', 4, '["https://loremflickr.com/400/400/food,review?lock=106"]', 50, 2, 1, '2026-01-05 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (107, 33, 5, '给家人做了这个，都说很好喝', 5, '["https://loremflickr.com/400/400/food,review?lock=107"]', 11, 5, 1, '2025-12-16 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (108, 34, 20, '做法简单快捷，适合上班族', 3, '["https://loremflickr.com/400/400/food,review?lock=108"]', 39, 4, 1, '2026-02-15 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (109, 34, 4, '这个配方很专业，点赞', 3, '["https://loremflickr.com/400/400/food,review?lock=109"]', 8, 2, 1, '2026-03-12 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (110, 34, 10, '营养价值很高', 4, '["https://loremflickr.com/400/400/food,review?lock=110"]', 8, 5, 1, '2026-01-21 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (111, 34, 20, '夏天喝这个很解暑', 5, '[]', 8, 1, 1, '2026-02-07 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (112, 35, 5, '孕妇可以喝这个吗？', 3, '["https://loremflickr.com/400/400/food,review?lock=112"]', 11, 4, 1, '2026-01-18 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (113, 35, 15, '食材容易买到，很方便', 4, '[]', 49, 5, 1, '2026-01-08 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (114, 35, 1, '这个汤真的很滋补', 5, '[]', 14, 2, 1, '2026-02-03 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (115, 36, 14, '真的很有效，坚持喝了一周感觉好多了！', 3, '[]', 36, 0, 1, '2026-01-03 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (116, 36, 6, '火候要掌握多久啊？', 5, '["https://loremflickr.com/400/400/food,review?lock=116"]', 43, 2, 1, '2026-03-13 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (117, 36, 12, '这个汤真的很滋补', 5, '[]', 34, 3, 1, '2026-02-01 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (118, 36, 14, '夏天喝这个很解暑', 4, '[]', 8, 2, 1, '2026-02-21 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (119, 36, 7, '第一次做就成功了，开心', 5, '[]', 38, 5, 1, '2025-12-25 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (120, 37, 3, '真的很有效，坚持喝了一周感觉好多了！', 3, '[]', 47, 4, 1, '2026-01-02 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (121, 37, 18, '已经收藏，准备明天试试', 3, '["https://loremflickr.com/400/400/food,review?lock=121"]', 47, 4, 1, '2026-01-21 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (122, 38, 13, '冬天喝这个太舒服了', 5, '["https://loremflickr.com/400/400/food,review?lock=122"]', 19, 5, 1, '2026-01-15 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (123, 38, 5, '糖尿病患者能喝吗？', 3, '[]', 36, 5, 1, '2026-01-31 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (124, 38, 9, '喝了一段时间，感觉气色好了很多', 5, '[]', 0, 3, 1, '2026-01-02 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (125, 39, 16, '第一次做就成功了，开心', 3, '["https://loremflickr.com/400/400/food,review?lock=125"]', 33, 5, 1, '2026-01-21 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (126, 39, 17, '孕妇可以喝这个吗？', 3, '[]', 20, 0, 1, '2025-12-14 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (127, 39, 6, '味道清淡不油腻，喜欢', 4, '["https://loremflickr.com/400/400/food,review?lock=127"]', 12, 2, 1, '2026-02-21 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (128, 40, 18, '食材容易买到，很方便', 3, '[]', 8, 0, 1, '2025-12-24 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (129, 40, 15, '孕妇可以喝这个吗？', 5, '[]', 0, 4, 1, '2026-01-18 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (130, 40, 2, '老人小孩都适合喝', 4, '[]', 22, 5, 1, '2025-12-22 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (131, 40, 14, '冬天喝这个太舒服了', 3, '[]', 25, 3, 1, '2026-01-07 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (132, 41, 6, '做法详细，新手也能学会', 4, '[]', 3, 4, 1, '2026-01-06 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (133, 42, 12, '火候要掌握多久啊？', 3, '[]', 25, 1, 1, '2026-01-10 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (134, 43, 12, '老人小孩都适合喝', 5, '["https://loremflickr.com/400/400/food,review?lock=134"]', 13, 5, 1, '2026-01-29 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (135, 43, 10, '食材容易买到，很方便', 4, '[]', 28, 2, 1, '2026-01-13 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (136, 44, 2, '冬天喝这个太舒服了', 4, '[]', 11, 4, 1, '2026-01-28 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (137, 45, 18, '这个配方很专业，点赞', 4, '[]', 16, 3, 1, '2026-02-20 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (138, 46, 16, '夏天喝这个很解暑', 4, '[]', 32, 1, 1, '2026-02-01 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (139, 47, 6, '每天一碗，身体棒棒的', 5, '["https://loremflickr.com/400/400/food,review?lock=139"]', 1, 0, 1, '2026-01-19 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (140, 47, 2, '这个配方很专业，点赞', 3, '[]', 20, 0, 1, '2026-01-21 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (141, 47, 10, '请问可以天天喝吗？', 3, '["https://loremflickr.com/400/400/food,review?lock=141"]', 2, 4, 1, '2026-01-06 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (142, 47, 4, '营养价值很高', 4, '[]', 1, 5, 1, '2025-12-21 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (143, 48, 7, '喝了一段时间，感觉气色好了很多', 4, '[]', 6, 5, 1, '2026-02-26 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (144, 48, 2, '坚持喝了一个月，效果明显', 3, '[]', 32, 2, 1, '2026-02-14 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (145, 49, 16, '推荐给朋友了，都说不错', 3, '[]', 27, 0, 1, '2026-02-01 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (146, 49, 7, '第一次做就成功了，开心', 4, '[]', 33, 4, 1, '2026-02-11 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (147, 49, 16, '食材容易买到，很方便', 4, '[]', 40, 4, 1, '2026-02-18 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (148, 49, 16, '夏天喝这个很解暑', 3, '[]', 8, 2, 1, '2026-01-20 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (149, 49, 14, '做法详细，新手也能学会', 4, '["https://loremflickr.com/400/400/food,review?lock=149"]', 44, 1, 1, '2026-02-16 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (150, 50, 7, '已经加入收藏夹了', 5, '[]', 20, 0, 1, '2026-01-24 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (151, 50, 16, '做法简单快捷，适合上班族', 5, '[]', 23, 2, 1, '2026-03-04 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (152, 50, 14, '给家人做了这个，都说很好喝', 3, '[]', 8, 1, 1, '2026-01-04 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (153, 50, 7, '夏天喝这个很解暑', 3, '[]', 34, 0, 1, '2026-01-07 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (154, 50, 7, '喝了一段时间，感觉气色好了很多', 5, '["https://loremflickr.com/400/400/food,review?lock=154"]', 31, 5, 1, '2026-01-07 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (155, 51, 15, '这个汤真的很滋补', 4, '[]', 35, 2, 1, '2026-02-18 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (156, 51, 20, '火候要掌握多久啊？', 4, '["https://loremflickr.com/400/400/food,review?lock=156"]', 26, 0, 1, '2025-12-23 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (157, 51, 13, '味道不错，做法也很简单，推荐给大家', 5, '[]', 33, 2, 1, '2026-01-14 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (158, 51, 6, '感谢分享这么好的食谱', 4, '[]', 42, 2, 1, '2025-12-23 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (159, 52, 4, '请问可以天天喝吗？', 5, '[]', 49, 2, 1, '2026-02-22 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (160, 52, 15, '每天一碗，身体棒棒的', 4, '["https://loremflickr.com/400/400/food,review?lock=160"]', 11, 4, 1, '2025-12-20 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (161, 52, 10, '味道不错，做法也很简单，推荐给大家', 5, '[]', 8, 4, 1, '2026-01-05 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (162, 53, 2, '老人小孩都适合喝', 4, '[]', 37, 4, 1, '2026-01-09 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (163, 53, 2, '坚持喝了一个月，效果明显', 3, '[]', 29, 1, 1, '2026-01-17 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (164, 53, 9, '希望能出更多类似的食谱', 5, '["https://loremflickr.com/400/400/food,review?lock=164"]', 31, 2, 1, '2025-12-20 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (165, 54, 1, '营养价值很高', 5, '[]', 12, 1, 1, '2025-12-25 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (166, 54, 6, '已经加入收藏夹了', 3, '[]', 7, 2, 1, '2026-01-31 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (167, 55, 16, '食材容易买到，很方便', 4, '[]', 10, 5, 1, '2025-12-15 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (168, 55, 13, '味道不错，做法也很简单，推荐给大家', 4, '[]', 4, 5, 1, '2026-01-13 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (169, 55, 2, '请问可以用其他食材代替吗？', 5, '[]', 39, 5, 1, '2026-02-26 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (170, 56, 6, '坚持喝了一个月，效果明显', 5, '[]', 47, 0, 1, '2026-02-16 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (171, 56, 18, '夏天喝这个很解暑', 5, '[]', 22, 1, 1, '2026-01-26 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (172, 56, 12, '给家人做了这个，都说很好喝', 3, '[]', 50, 0, 1, '2026-03-10 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (173, 57, 13, '已经收藏，准备明天试试', 3, '[]', 30, 4, 1, '2026-02-13 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (174, 57, 10, '喝了一段时间，感觉气色好了很多', 4, '[]', 29, 4, 1, '2026-02-16 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (175, 57, 18, '糖尿病患者能喝吗？', 4, '[]', 26, 3, 1, '2026-01-11 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (176, 57, 8, '这个汤真的很滋补', 3, '[]', 6, 4, 1, '2026-03-08 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (177, 57, 12, '食材容易买到，很方便', 3, '[]', 9, 0, 1, '2026-03-01 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (178, 58, 16, '老人小孩都适合喝', 4, '[]', 26, 0, 1, '2026-01-19 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (179, 58, 10, '食材容易买到，很方便', 3, '[]', 25, 5, 1, '2026-03-01 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (180, 59, 6, '希望能出更多类似的食谱', 5, '[]', 40, 4, 1, '2026-02-04 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (181, 59, 11, '按照步骤做的，效果很明显', 4, '[]', 5, 1, 1, '2026-03-05 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (182, 59, 13, '营养价值很高', 3, '[]', 5, 1, 1, '2026-02-16 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (183, 59, 15, '按照步骤做的，效果很明显', 4, '["https://loremflickr.com/400/400/food,review?lock=183"]', 1, 4, 1, '2026-02-10 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (184, 59, 16, '按照步骤做的，效果很明显', 5, '[]', 12, 2, 1, '2026-02-27 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (185, 60, 4, '糖尿病患者能喝吗？', 5, '[]', 48, 3, 1, '2026-02-08 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (186, 60, 1, '这个配方很专业，点赞', 3, '[]', 43, 4, 1, '2026-02-10 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (187, 61, 5, '冬天喝这个太舒服了', 3, '["https://loremflickr.com/400/400/food,review?lock=187"]', 3, 1, 1, '2026-02-19 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (188, 61, 3, '喝了一段时间，感觉气色好了很多', 3, '[]', 10, 2, 1, '2026-03-13 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (189, 61, 16, '请问可以用其他食材代替吗？', 4, '["https://loremflickr.com/400/400/food,review?lock=189"]', 7, 3, 1, '2025-12-16 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (190, 61, 4, '味道不错，做法也很简单，推荐给大家', 4, '[]', 5, 1, 1, '2026-02-04 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (191, 62, 4, '请问可以用其他食材代替吗？', 3, '[]', 47, 2, 1, '2026-03-04 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (192, 62, 20, '冬天喝这个太舒服了', 3, '[]', 22, 2, 1, '2025-12-19 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (193, 63, 1, '味道清淡不油腻，喜欢', 5, '[]', 24, 4, 1, '2025-12-14 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (194, 64, 6, '味道不错，做法也很简单，推荐给大家', 5, '[]', 48, 2, 1, '2026-03-08 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (195, 64, 3, '做法详细，新手也能学会', 5, '["https://loremflickr.com/400/400/food,review?lock=195"]', 8, 4, 1, '2026-02-10 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (196, 64, 15, '喝了一段时间，感觉气色好了很多', 4, '[]', 28, 5, 1, '2026-02-17 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (197, 64, 5, '第一次做就成功了，开心', 4, '[]', 26, 3, 1, '2026-01-13 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (198, 64, 5, '冬天喝这个太舒服了', 5, '[]', 6, 3, 1, '2025-12-29 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (199, 65, 13, '请问可以天天喝吗？', 5, '[]', 35, 5, 1, '2026-01-20 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (200, 65, 19, '味道清淡不油腻，喜欢', 3, '[]', 25, 3, 1, '2025-12-17 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (201, 66, 14, '做法详细，新手也能学会', 3, '[]', 17, 4, 1, '2025-12-25 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (202, 66, 2, '请问可以用其他食材代替吗？', 3, '[]', 2, 2, 1, '2025-12-14 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (203, 67, 8, '做法简单快捷，适合上班族', 5, '[]', 42, 1, 1, '2026-03-04 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (204, 67, 4, '已经加入收藏夹了', 3, '[]', 30, 1, 1, '2026-01-24 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (205, 67, 16, '希望能出更多类似的食谱', 4, '[]', 43, 3, 1, '2026-03-13 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (206, 67, 4, '给家人做了这个，都说很好喝', 5, '[]', 14, 5, 1, '2026-01-11 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (207, 67, 6, '已经加入收藏夹了', 5, '[]', 38, 1, 1, '2026-01-11 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (208, 68, 18, '糖尿病患者能喝吗？', 3, '["https://loremflickr.com/400/400/food,review?lock=208"]', 17, 2, 1, '2026-02-21 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (209, 68, 19, '坚持喝了一个月，效果明显', 3, '[]', 32, 0, 1, '2026-02-04 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (210, 68, 17, '坚持喝了一个月，效果明显', 3, '[]', 34, 3, 1, '2026-01-13 20:49:27');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (211, 69, 3, '孩子很喜欢喝，谢谢分享', 4, '["https://loremflickr.com/400/400/food,review?lock=211"]', 17, 3, 1, '2026-02-05 20:49:27');

SELECT '评论数据插入完成: 211条' AS message;

COMMIT;

-- ============================================
-- 数据统计
-- ============================================

SELECT '数据填充完成！统计如下：' AS message;
SELECT COUNT(*) AS user_count FROM users;
SELECT COUNT(*) AS recipe_count FROM recipes;
SELECT COUNT(*) AS ingredient_count FROM recipe_ingredients;
SELECT COUNT(*) AS step_count FROM recipe_steps;
SELECT COUNT(*) AS content_count FROM contents;
SELECT COUNT(*) AS favorite_count FROM favorites;
SELECT COUNT(*) AS history_count FROM user_history;
SELECT COUNT(*) AS comment_count FROM comments;