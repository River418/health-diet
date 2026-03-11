-- Health-Diet 食疗养生小程序 - 测试数据生成脚本
-- 生成时间: 2026-03-10 23:47:20
-- 注意: 执行前请确保数据库已初始化

BEGIN;

-- ============================================
-- 1. 用户数据 (20个测试用户)
-- ============================================

INSERT INTO users (id, wx_openid, dy_openid, nickname, avatar, phone, language, status, created_at, updated_at)
VALUES (1, 'wx_50211169', NULL, '健康小卫士1', 'https://api.dicebear.com/7.x/avataaars/svg?seed=1&user=1', '13852329328', 'zh-TW', 1, '2026-01-15 23:47:20', '2026-01-15 23:47:20');
INSERT INTO users (id, wx_openid, dy_openid, nickname, avatar, phone, language, status, created_at, updated_at)
VALUES (2, 'wx_24842486', NULL, '美食爱好者2', 'https://api.dicebear.com/7.x/avataaars/svg?seed=4&user=2', NULL, 'en', 1, '2026-01-05 23:47:20', '2026-01-05 23:47:20');
INSERT INTO users (id, wx_openid, dy_openid, nickname, avatar, phone, language, status, created_at, updated_at)
VALUES (3, NULL, NULL, '中医粉3', 'https://api.dicebear.com/7.x/avataaars/svg?seed=2&user=3', '13826885136', 'zh-TW', 1, '2026-01-27 23:47:20', '2026-01-27 23:47:20');
INSERT INTO users (id, wx_openid, dy_openid, nickname, avatar, phone, language, status, created_at, updated_at)
VALUES (4, 'wx_96805385', NULL, '食疗养生专家4', 'https://api.dicebear.com/7.x/avataaars/svg?seed=3&user=4', NULL, 'en', 1, '2025-12-25 23:47:20', '2025-12-25 23:47:20');
INSERT INTO users (id, wx_openid, dy_openid, nickname, avatar, phone, language, status, created_at, updated_at)
VALUES (5, 'wx_60139235', NULL, '健康顾问5', 'https://api.dicebear.com/7.x/avataaars/svg?seed=4&user=5', NULL, 'en', 1, '2026-02-18 23:47:20', '2026-02-18 23:47:20');
INSERT INTO users (id, wx_openid, dy_openid, nickname, avatar, phone, language, status, created_at, updated_at)
VALUES (6, NULL, 'dy_15476697', '食疗达人6', 'https://api.dicebear.com/7.x/avataaars/svg?seed=1&user=6', '13854015492', 'zh-TW', 1, '2025-12-16 23:47:20', '2025-12-16 23:47:20');
INSERT INTO users (id, wx_openid, dy_openid, nickname, avatar, phone, language, status, created_at, updated_at)
VALUES (7, NULL, 'dy_92014539', '健康小卫士7', 'https://api.dicebear.com/7.x/avataaars/svg?seed=1&user=7', NULL, 'zh-CN', 1, '2026-02-18 23:47:20', '2026-02-18 23:47:20');
INSERT INTO users (id, wx_openid, dy_openid, nickname, avatar, phone, language, status, created_at, updated_at)
VALUES (8, 'wx_26687112', NULL, '食疗研究者8', 'https://api.dicebear.com/7.x/avataaars/svg?seed=5&user=8', '13855250403', 'zh-TW', 1, '2025-12-19 23:47:20', '2025-12-19 23:47:20');
INSERT INTO users (id, wx_openid, dy_openid, nickname, avatar, phone, language, status, created_at, updated_at)
VALUES (9, 'wx_40262883', 'dy_16964415', '健康小卫士9', 'https://api.dicebear.com/7.x/avataaars/svg?seed=1&user=9', '13854518393', 'zh-TW', 1, '2026-01-11 23:47:20', '2026-01-11 23:47:20');
INSERT INTO users (id, wx_openid, dy_openid, nickname, avatar, phone, language, status, created_at, updated_at)
VALUES (10, NULL, 'dy_49317402', '食疗实践者10', 'https://api.dicebear.com/7.x/avataaars/svg?seed=2&user=10', '13823068823', 'zh-TW', 1, '2026-02-27 23:47:20', '2026-02-27 23:47:20');
INSERT INTO users (id, wx_openid, dy_openid, nickname, avatar, phone, language, status, created_at, updated_at)
VALUES (11, 'wx_17532910', NULL, '美食爱好者11', 'https://api.dicebear.com/7.x/avataaars/svg?seed=5&user=11', '13890777768', 'zh-TW', 1, '2026-02-06 23:47:20', '2026-02-06 23:47:20');
INSERT INTO users (id, wx_openid, dy_openid, nickname, avatar, phone, language, status, created_at, updated_at)
VALUES (12, 'wx_57101780', NULL, '养生老司机12', 'https://api.dicebear.com/7.x/avataaars/svg?seed=5&user=12', '13823433369', 'zh-TW', 1, '2026-03-06 23:47:20', '2026-03-06 23:47:20');
INSERT INTO users (id, wx_openid, dy_openid, nickname, avatar, phone, language, status, created_at, updated_at)
VALUES (13, 'wx_93297658', NULL, '健康生活方式13', 'https://api.dicebear.com/7.x/avataaars/svg?seed=3&user=13', NULL, 'en', 1, '2026-01-20 23:47:20', '2026-01-20 23:47:20');
INSERT INTO users (id, wx_openid, dy_openid, nickname, avatar, phone, language, status, created_at, updated_at)
VALUES (14, 'wx_51650854', NULL, '养生小仙女14', 'https://api.dicebear.com/7.x/avataaars/svg?seed=2&user=14', '13822240926', 'zh-TW', 1, '2026-02-22 23:47:20', '2026-02-22 23:47:20');
INSERT INTO users (id, wx_openid, dy_openid, nickname, avatar, phone, language, status, created_at, updated_at)
VALUES (15, NULL, 'dy_82712169', '美食探索者15', 'https://api.dicebear.com/7.x/avataaars/svg?seed=4&user=15', '13811789154', 'zh-TW', 1, '2026-01-13 23:47:20', '2026-01-13 23:47:20');
INSERT INTO users (id, wx_openid, dy_openid, nickname, avatar, phone, language, status, created_at, updated_at)
VALUES (16, 'wx_17181225', 'dy_67906228', '健康守护者16', 'https://api.dicebear.com/7.x/avataaars/svg?seed=4&user=16', '13869799228', 'en', 1, '2025-12-16 23:47:20', '2025-12-16 23:47:20');
INSERT INTO users (id, wx_openid, dy_openid, nickname, avatar, phone, language, status, created_at, updated_at)
VALUES (17, NULL, 'dy_89697492', '食疗探索者17', 'https://api.dicebear.com/7.x/avataaars/svg?seed=4&user=17', '13817209785', 'en', 1, '2026-02-04 23:47:20', '2026-02-04 23:47:20');
INSERT INTO users (id, wx_openid, dy_openid, nickname, avatar, phone, language, status, created_at, updated_at)
VALUES (18, 'wx_83396266', 'dy_89652215', '食疗小能手18', 'https://api.dicebear.com/7.x/avataaars/svg?seed=4&user=18', '13891756357', 'en', 1, '2026-01-16 23:47:20', '2026-01-16 23:47:20');
INSERT INTO users (id, wx_openid, dy_openid, nickname, avatar, phone, language, status, created_at, updated_at)
VALUES (19, 'wx_41994988', NULL, '食疗研究者19', 'https://api.dicebear.com/7.x/avataaars/svg?seed=1&user=19', '13836061073', 'en', 1, '2026-01-28 23:47:20', '2026-01-28 23:47:20');
INSERT INTO users (id, wx_openid, dy_openid, nickname, avatar, phone, language, status, created_at, updated_at)
VALUES (20, 'wx_77010200', 'dy_53497053', '美食博主20', 'https://api.dicebear.com/7.x/avataaars/svg?seed=3&user=20', NULL, 'zh-CN', 1, '2026-01-24 23:47:20', '2026-01-24 23:47:20');

SELECT '用户数据插入完成: 20条' AS message;

-- ============================================
-- 2. 配方数据 (69条食疗配方)
-- ============================================

INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (1, '山药小米粥', '山药小米粥', '山药小米粥', '山药小米粥是一道传统的食疗养生佳品，具有健脾养胃的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '山药小米粥是一道傳統的食療養生佳品，具有健脾养胃的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '山药小米粥 is a traditional therapeutic recipe with benefits of 健脾养胃. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/山药小米粥.jpg', '/videos/recipes/山药小米粥.mp4', 122, '["中老年", "白领", "通用"]', '["健脾养胃"]', '["秋季", "冬季"]', '{"calories": 180, "protein": 6, "fat": 2, "carbs": 35}',
    190, 273, 26, 4.4, 1, '2025-12-01 23:47:20', '2025-12-01 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (2, '南瓜红枣粥', '南瓜红枣粥', '南瓜红枣粥', '南瓜红枣粥是一道传统的食疗养生佳品，具有健脾养胃、补气养血的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '南瓜红枣粥是一道傳統的食療養生佳品，具有健脾养胃、补气养血的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '南瓜红枣粥 is a traditional therapeutic recipe with benefits of 健脾养胃、补气养血. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/南瓜红枣粥.jpg', NULL, NULL, '["中老年", "女性", "儿童"]', '["健脾养胃", "补气养血"]', '["秋季", "冬季"]', '{"calories": 220, "protein": 5, "fat": 1, "carbs": 45}',
    3229, 48, 16, 4.0, 1, '2025-10-11 23:47:20', '2025-10-11 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (3, '猴头菇炖鸡汤', '猴头菇炖鸡汤', '猴头菇炖鸡汤', '猴头菇炖鸡汤是一道传统的食疗养生佳品，具有健脾养胃、增强免疫的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '猴头菇炖鸡汤是一道傳統的食療養生佳品，具有健脾养胃、增强免疫的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '猴头菇炖鸡汤 is a traditional therapeutic recipe with benefits of 健脾养胃、增强免疫. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/猴头菇炖鸡汤.jpg', '/videos/recipes/猴头菇炖鸡汤.mp4', 172, '["中老年", "白领"]', '["健脾养胃", "增强免疫"]', '["冬季", "立冬", "小雪"]', '{"calories": 280, "protein": 25, "fat": 15, "carbs": 8}',
    2431, 330, 19, 4.9, 1, '2025-12-05 23:47:20', '2025-12-05 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (4, '莲子百合粥', '莲子百合粥', '莲子百合粥', '莲子百合粥是一道传统的食疗养生佳品，具有健脾养胃、安神助眠的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '莲子百合粥是一道傳統的食療養生佳品，具有健脾养胃、安神助眠的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '莲子百合粥 is a traditional therapeutic recipe with benefits of 健脾养胃、安神助眠. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/莲子百合粥.jpg', '/videos/recipes/莲子百合粥.mp4', 103, '["中老年", "女性"]', '["健脾养胃", "安神助眠"]', '["秋季", "白露", "秋分"]', '{"calories": 160, "protein": 5, "fat": 1, "carbs": 32}',
    3402, 163, 92, 4.6, 1, '2025-10-09 23:47:20', '2025-10-09 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (5, '茯苓山药排骨汤', '茯苓山药排骨汤', '茯苓山药排骨汤', '茯苓山药排骨汤是一道传统的食疗养生佳品，具有健脾养胃、祛湿排毒的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '茯苓山药排骨汤是一道傳統的食療養生佳品，具有健脾养胃、祛湿排毒的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '茯苓山药排骨汤 is a traditional therapeutic recipe with benefits of 健脾养胃、祛湿排毒. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/茯苓山药排骨汤.jpg', '/videos/recipes/茯苓山药排骨汤.mp4', 225, '["中老年", "通用"]', '["健脾养胃", "祛湿排毒"]', '["春季", "夏季"]', '{"calories": 320, "protein": 22, "fat": 18, "carbs": 12}',
    750, 481, 41, 4.4, 1, '2025-12-16 23:47:20', '2025-12-16 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (6, '陈皮瘦肉粥', '陈皮瘦肉粥', '陈皮瘦肉粥', '陈皮瘦肉粥是一道传统的食疗养生佳品，具有健脾养胃的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '陈皮瘦肉粥是一道傳統的食療養生佳品，具有健脾养胃的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '陈皮瘦肉粥 is a traditional therapeutic recipe with benefits of 健脾养胃. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/陈皮瘦肉粥.jpg', NULL, NULL, '["中老年", "儿童"]', '["健脾养胃"]', '["四季"]', '{"calories": 200, "protein": 12, "fat": 6, "carbs": 25}',
    4580, 58, 9, 4.9, 1, '2026-02-09 23:47:20', '2026-02-09 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (7, '芡实薏米粥', '芡实薏米粥', '芡实薏米粥', '芡实薏米粥是一道传统的食疗养生佳品，具有健脾养胃、祛湿排毒的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '芡实薏米粥是一道傳統的食療養生佳品，具有健脾养胃、祛湿排毒的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '芡实薏米粥 is a traditional therapeutic recipe with benefits of 健脾养胃、祛湿排毒. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/芡实薏米粥.jpg', NULL, NULL, '["中老年", "女性"]', '["健脾养胃", "祛湿排毒"]', '["夏季", "秋季"]', '{"calories": 170, "protein": 5, "fat": 1, "carbs": 34}',
    353, 352, 8, 4.9, 1, '2025-12-30 23:47:20', '2025-12-30 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (8, '生姜红糖暖胃汤', '生姜红糖暖胃汤', '生姜红糖暖胃汤', '生姜红糖暖胃汤是一道传统的食疗养生佳品，具有健脾养胃、补气养血的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '生姜红糖暖胃汤是一道傳統的食療養生佳品，具有健脾养胃、补气养血的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '生姜红糖暖胃汤 is a traditional therapeutic recipe with benefits of 健脾养胃、补气养血. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/生姜红糖暖胃汤.jpg', '/videos/recipes/生姜红糖暖胃汤.mp4', 176, '["女性", "中老年"]', '["健脾养胃", "补气养血"]', '["冬季", "小寒", "大寒"]', '{"calories": 120, "protein": 1, "fat": 0, "carbs": 28}',
    2077, 493, 15, 4.8, 1, '2025-12-28 23:47:20', '2025-12-28 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (9, '川贝雪梨汤', '川贝雪梨汤', '川贝雪梨汤', '川贝雪梨汤是一道传统的食疗养生佳品，具有润肺止咳的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '川贝雪梨汤是一道傳統的食療養生佳品，具有润肺止咳的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '川贝雪梨汤 is a traditional therapeutic recipe with benefits of 润肺止咳. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/川贝雪梨汤.jpg', '/videos/recipes/川贝雪梨汤.mp4', 238, '["儿童", "中老年", "通用"]', '["润肺止咳"]', '["秋季", "立冬"]', '{"calories": 90, "protein": 1, "fat": 0, "carbs": 22}',
    480, 145, 61, 4.9, 1, '2026-01-27 23:47:20', '2026-01-27 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (10, '银耳莲子羹', '银耳莲子羹', '银耳莲子羹', '银耳莲子羹是一道传统的食疗养生佳品，具有润肺止咳、美容养颜的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '银耳莲子羹是一道傳統的食療養生佳品，具有润肺止咳、美容养颜的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '银耳莲子羹 is a traditional therapeutic recipe with benefits of 润肺止咳、美容养颜. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/银耳莲子羹.jpg', NULL, NULL, '["女性", "中老年"]', '["润肺止咳", "美容养颜"]', '["秋季", "冬季"]', '{"calories": 140, "protein": 4, "fat": 0, "carbs": 30}',
    383, 468, 58, 4.9, 1, '2025-12-06 23:47:20', '2025-12-06 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (11, '百合杏仁粥', '百合杏仁粥', '百合杏仁粥', '百合杏仁粥是一道传统的食疗养生佳品，具有润肺止咳、安神助眠的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '百合杏仁粥是一道傳統的食療養生佳品，具有润肺止咳、安神助眠的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '百合杏仁粥 is a traditional therapeutic recipe with benefits of 润肺止咳、安神助眠. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/百合杏仁粥.jpg', NULL, NULL, '["中老年", "白领"]', '["润肺止咳", "安神助眠"]', '["秋季", "白露", "寒露"]', '{"calories": 180, "protein": 6, "fat": 3, "carbs": 32}',
    4359, 24, 55, 4.0, 1, '2025-12-05 23:47:20', '2025-12-05 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (12, '枇杷叶瘦肉汤', '枇杷叶瘦肉汤', '枇杷叶瘦肉汤', '枇杷叶瘦肉汤是一道传统的食疗养生佳品，具有润肺止咳的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '枇杷叶瘦肉汤是一道傳統的食療養生佳品，具有润肺止咳的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '枇杷叶瘦肉汤 is a traditional therapeutic recipe with benefits of 润肺止咳. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/枇杷叶瘦肉汤.jpg', '/videos/recipes/枇杷叶瘦肉汤.mp4', 270, '["中老年", "儿童"]', '["润肺止咳"]', '["春季", "秋季"]', '{"calories": 250, "protein": 20, "fat": 12, "carbs": 5}',
    2599, 358, 69, 4.5, 1, '2025-11-14 23:47:20', '2025-11-14 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (13, '沙参玉竹老鸭汤', '沙参玉竹老鸭汤', '沙参玉竹老鸭汤', '沙参玉竹老鸭汤是一道传统的食疗养生佳品，具有润肺止咳、补气养血的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '沙参玉竹老鸭汤是一道傳統的食療養生佳品，具有润肺止咳、补气养血的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '沙参玉竹老鸭汤 is a traditional therapeutic recipe with benefits of 润肺止咳、补气养血. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/沙参玉竹老鸭汤.jpg', NULL, NULL, '["中老年", "通用"]', '["润肺止咳", "补气养血"]', '["秋季", "处暑", "白露"]', '{"calories": 380, "protein": 28, "fat": 25, "carbs": 8}',
    3399, 486, 59, 4.8, 1, '2026-01-05 23:47:20', '2026-01-05 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (14, '罗汉果菊花茶', '罗汉果菊花茶', '罗汉果菊花茶', '罗汉果菊花茶是一道传统的食疗养生佳品，具有润肺止咳、清热解毒的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '罗汉果菊花茶是一道傳統的食療養生佳品，具有润肺止咳、清热解毒的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '罗汉果菊花茶 is a traditional therapeutic recipe with benefits of 润肺止咳、清热解毒. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/罗汉果菊花茶.jpg', NULL, NULL, '["白领", "中老年"]', '["润肺止咳", "清热解毒"]', '["秋季", "夏季"]', '{"calories": 15, "protein": 0, "fat": 0, "carbs": 4}',
    2986, 167, 50, 4.8, 1, '2026-02-05 23:47:20', '2026-02-05 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (15, '白萝卜蜂蜜饮', '白萝卜蜂蜜饮', '白萝卜蜂蜜饮', '白萝卜蜂蜜饮是一道传统的食疗养生佳品，具有润肺止咳的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '白萝卜蜂蜜饮是一道傳統的食療養生佳品，具有润肺止咳的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '白萝卜蜂蜜饮 is a traditional therapeutic recipe with benefits of 润肺止咳. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/白萝卜蜂蜜饮.jpg', '/videos/recipes/白萝卜蜂蜜饮.mp4', 247, '["儿童", "中老年"]', '["润肺止咳"]', '["冬季", "秋季"]', '{"calories": 80, "protein": 1, "fat": 0, "carbs": 19}',
    4023, 349, 93, 4.1, 1, '2026-01-19 23:47:20', '2026-01-19 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (16, '南北杏猪肺汤', '南北杏猪肺汤', '南北杏猪肺汤', '南北杏猪肺汤是一道传统的食疗养生佳品，具有润肺止咳的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '南北杏猪肺汤是一道傳統的食療養生佳品，具有润肺止咳的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '南北杏猪肺汤 is a traditional therapeutic recipe with benefits of 润肺止咳. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/南北杏猪肺汤.jpg', '/videos/recipes/南北杏猪肺汤.mp4', 292, '["中老年", "通用"]', '["润肺止咳"]', '["秋季", "冬季"]', '{"calories": 220, "protein": 18, "fat": 14, "carbs": 6}',
    4098, 246, 93, 4.6, 1, '2025-09-19 23:47:20', '2025-09-19 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (17, '当归红枣乌鸡汤', '当归红枣乌鸡汤', '当归红枣乌鸡汤', '当归红枣乌鸡汤是一道传统的食疗养生佳品，具有补气养血的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '当归红枣乌鸡汤是一道傳統的食療養生佳品，具有补气养血的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '当归红枣乌鸡汤 is a traditional therapeutic recipe with benefits of 补气养血. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/当归红枣乌鸡汤.jpg', '/videos/recipes/当归红枣乌鸡汤.mp4', 107, '["女性", "中老年"]', '["补气养血"]', '["冬季", "秋季"]', '{"calories": 320, "protein": 28, "fat": 16, "carbs": 10}',
    3151, 191, 34, 5.0, 1, '2025-11-07 23:47:20', '2025-11-07 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (18, '阿胶红糖粥', '阿胶红糖粥', '阿胶红糖粥', '阿胶红糖粥是一道传统的食疗养生佳品，具有补气养血、美容养颜的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '阿胶红糖粥是一道傳統的食療養生佳品，具有补气养血、美容养颜的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '阿胶红糖粥 is a traditional therapeutic recipe with benefits of 补气养血、美容养颜. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/阿胶红糖粥.jpg', NULL, NULL, '["女性"]', '["补气养血", "美容养颜"]', '["冬季", "秋季"]', '{"calories": 280, "protein": 6, "fat": 2, "carbs": 58}',
    1348, 81, 71, 4.8, 1, '2025-11-29 23:47:20', '2025-11-29 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (19, '枸杞桂圆红枣茶', '枸杞桂圆红枣茶', '枸杞桂圆红枣茶', '枸杞桂圆红枣茶是一道传统的食疗养生佳品，具有补气养血、安神助眠的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '枸杞桂圆红枣茶是一道傳統的食療養生佳品，具有补气养血、安神助眠的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '枸杞桂圆红枣茶 is a traditional therapeutic recipe with benefits of 补气养血、安神助眠. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/枸杞桂圆红枣茶.jpg', '/videos/recipes/枸杞桂圆红枣茶.mp4', 74, '["女性", "中老年", "白领"]', '["补气养血", "安神助眠"]', '["四季"]', '{"calories": 120, "protein": 2, "fat": 0, "carbs": 28}',
    4507, 401, 67, 4.1, 1, '2026-02-13 23:47:20', '2026-02-13 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (20, '花生红衣猪蹄汤', '花生红衣猪蹄汤', '花生红衣猪蹄汤', '花生红衣猪蹄汤是一道传统的食疗养生佳品，具有补气养血的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '花生红衣猪蹄汤是一道傳統的食療養生佳品，具有补气养血的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '花生红衣猪蹄汤 is a traditional therapeutic recipe with benefits of 补气养血. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/花生红衣猪蹄汤.jpg', NULL, NULL, '["女性", "中老年"]', '["补气养血"]', '["冬季", "秋季"]', '{"calories": 450, "protein": 32, "fat": 30, "carbs": 12}',
    1998, 446, 74, 4.5, 1, '2026-01-14 23:47:20', '2026-01-14 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (21, '四物汤', '四物汤', '四物汤', '四物汤是一道传统的食疗养生佳品，具有补气养血的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '四物汤是一道傳統的食療養生佳品，具有补气养血的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '四物汤 is a traditional therapeutic recipe with benefits of 补气养血. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/四物汤.jpg', NULL, NULL, '["女性"]', '["补气养血"]', '["秋季", "冬季"]', '{"calories": 80, "protein": 4, "fat": 1, "carbs": 14}',
    557, 405, 10, 4.8, 1, '2025-09-29 23:47:20', '2025-09-29 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (22, '猪肝菠菜汤', '猪肝菠菜汤', '猪肝菠菜汤', '猪肝菠菜汤是一道传统的食疗养生佳品，具有补气养血的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '猪肝菠菜汤是一道傳統的食療養生佳品，具有补气养血的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '猪肝菠菜汤 is a traditional therapeutic recipe with benefits of 补气养血. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/猪肝菠菜汤.jpg', '/videos/recipes/猪肝菠菜汤.mp4', 105, '["女性", "儿童", "中老年"]', '["补气养血"]', '["春季", "秋季"]', '{"calories": 180, "protein": 22, "fat": 8, "carbs": 8}',
    2234, 64, 12, 4.5, 1, '2026-01-22 23:47:20', '2026-01-22 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (23, '黑芝麻糊', '黑芝麻糊', '黑芝麻糊', '黑芝麻糊是一道传统的食疗养生佳品，具有补气养血、美容养颜的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '黑芝麻糊是一道傳統的食療養生佳品，具有补气养血、美容养颜的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '黑芝麻糊 is a traditional therapeutic recipe with benefits of 补气养血、美容养颜. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/黑芝麻糊.jpg', '/videos/recipes/黑芝麻糊.mp4', 171, '["中老年", "女性", "通用"]', '["补气养血", "美容养颜"]', '["冬季", "秋季"]', '{"calories": 240, "protein": 8, "fat": 12, "carbs": 28}',
    1336, 485, 30, 4.3, 1, '2025-12-06 23:47:20', '2025-12-06 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (24, '桂圆莲子羹', '桂圆莲子羹', '桂圆莲子羹', '桂圆莲子羹是一道传统的食疗养生佳品，具有补气养血、安神助眠的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '桂圆莲子羹是一道傳統的食療養生佳品，具有补气养血、安神助眠的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '桂圆莲子羹 is a traditional therapeutic recipe with benefits of 补气养血、安神助眠. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/桂圆莲子羹.jpg', NULL, NULL, '["女性", "中老年"]', '["补气养血", "安神助眠"]', '["秋季", "冬季"]', '{"calories": 200, "protein": 5, "fat": 1, "carbs": 42}',
    2606, 392, 69, 4.9, 1, '2025-12-03 23:47:20', '2025-12-03 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (25, '红豆薏米补血粥', '红豆薏米补血粥', '红豆薏米补血粥', '红豆薏米补血粥是一道传统的食疗养生佳品，具有补气养血、祛湿排毒的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '红豆薏米补血粥是一道傳統的食療養生佳品，具有补气养血、祛湿排毒的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '红豆薏米补血粥 is a traditional therapeutic recipe with benefits of 补气养血、祛湿排毒. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/红豆薏米补血粥.jpg', '/videos/recipes/红豆薏米补血粥.mp4', 219, '["女性", "中老年"]', '["补气养血", "祛湿排毒"]', '["春季", "夏季"]', '{"calories": 210, "protein": 7, "fat": 2, "carbs": 40}',
    117, 430, 59, 4.8, 1, '2025-10-24 23:47:20', '2025-10-24 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (26, '酸枣仁安神茶', '酸枣仁安神茶', '酸枣仁安神茶', '酸枣仁安神茶是一道传统的食疗养生佳品，具有安神助眠的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '酸枣仁安神茶是一道傳統的食療養生佳品，具有安神助眠的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '酸枣仁安神茶 is a traditional therapeutic recipe with benefits of 安神助眠. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/酸枣仁安神茶.jpg', '/videos/recipes/酸枣仁安神茶.mp4', 281, '["中老年", "白领", "女性"]', '["安神助眠"]', '["秋季", "冬季"]', '{"calories": 25, "protein": 1, "fat": 0, "carbs": 5}',
    4612, 116, 53, 4.3, 1, '2025-09-30 23:47:20', '2025-09-30 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (27, '柏子仁粥', '柏子仁粥', '柏子仁粥', '柏子仁粥是一道传统的食疗养生佳品，具有安神助眠的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '柏子仁粥是一道傳統的食療養生佳品，具有安神助眠的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '柏子仁粥 is a traditional therapeutic recipe with benefits of 安神助眠. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/柏子仁粥.jpg', NULL, NULL, '["中老年", "白领"]', '["安神助眠"]', '["四季"]', '{"calories": 170, "protein": 5, "fat": 2, "carbs": 32}',
    878, 221, 24, 4.7, 1, '2026-01-16 23:47:20', '2026-01-16 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (28, '百合麦冬汤', '百合麦冬汤', '百合麦冬汤', '百合麦冬汤是一道传统的食疗养生佳品，具有安神助眠、润肺止咳的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '百合麦冬汤是一道傳統的食療養生佳品，具有安神助眠、润肺止咳的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '百合麦冬汤 is a traditional therapeutic recipe with benefits of 安神助眠、润肺止咳. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/百合麦冬汤.jpg', '/videos/recipes/百合麦冬汤.mp4', 74, '["中老年", "女性"]', '["安神助眠", "润肺止咳"]', '["秋季", "夏季"]', '{"calories": 60, "protein": 2, "fat": 0, "carbs": 12}',
    1400, 441, 72, 4.6, 1, '2025-09-26 23:47:20', '2025-09-26 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (29, '龙眼肉粥', '龙眼肉粥', '龙眼肉粥', '龙眼肉粥是一道传统的食疗养生佳品，具有安神助眠、补气养血的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '龙眼肉粥是一道傳統的食療養生佳品，具有安神助眠、补气养血的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '龙眼肉粥 is a traditional therapeutic recipe with benefits of 安神助眠、补气养血. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/龙眼肉粥.jpg', NULL, NULL, '["中老年", "女性"]', '["安神助眠", "补气养血"]', '["冬季", "秋季"]', '{"calories": 220, "protein": 5, "fat": 1, "carbs": 48}',
    4399, 102, 34, 4.2, 1, '2026-02-03 23:47:20', '2026-02-03 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (30, '五味子茶', '五味子茶', '五味子茶', '五味子茶是一道传统的食疗养生佳品，具有安神助眠的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '五味子茶是一道傳統的食療養生佳品，具有安神助眠的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '五味子茶 is a traditional therapeutic recipe with benefits of 安神助眠. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/五味子茶.jpg', NULL, NULL, '["中老年", "白领"]', '["安神助眠"]', '["秋季", "冬季"]', '{"calories": 10, "protein": 0, "fat": 0, "carbs": 2}',
    4653, 220, 46, 4.9, 1, '2025-12-22 23:47:20', '2025-12-22 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (31, '远志莲子汤', '远志莲子汤', '远志莲子汤', '远志莲子汤是一道传统的食疗养生佳品，具有安神助眠、健脾养胃的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '远志莲子汤是一道傳統的食療養生佳品，具有安神助眠、健脾养胃的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '远志莲子汤 is a traditional therapeutic recipe with benefits of 安神助眠、健脾养胃. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/远志莲子汤.jpg', '/videos/recipes/远志莲子汤.mp4', 131, '["中老年", "通用"]', '["安神助眠", "健脾养胃"]', '["四季"]', '{"calories": 80, "protein": 3, "fat": 0, "carbs": 16}',
    941, 359, 69, 4.6, 1, '2025-11-29 23:47:20', '2025-11-29 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (32, '灵芝孢子粉饮', '灵芝孢子粉饮', '灵芝孢子粉饮', '灵芝孢子粉饮是一道传统的食疗养生佳品，具有安神助眠、增强免疫的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '灵芝孢子粉饮是一道傳統的食療養生佳品，具有安神助眠、增强免疫的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '灵芝孢子粉饮 is a traditional therapeutic recipe with benefits of 安神助眠、增强免疫. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/灵芝孢子粉饮.jpg', NULL, NULL, '["中老年", "白领"]', '["安神助眠", "增强免疫"]', '["秋季", "冬季"]', '{"calories": 30, "protein": 2, "fat": 1, "carbs": 4}',
    3954, 409, 67, 4.1, 1, '2025-10-20 23:47:20', '2025-10-20 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (33, '桃胶银耳羹', '桃胶银耳羹', '桃胶银耳羹', '桃胶银耳羹是一道传统的食疗养生佳品，具有美容养颜的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '桃胶银耳羹是一道傳統的食療養生佳品，具有美容养颜的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '桃胶银耳羹 is a traditional therapeutic recipe with benefits of 美容养颜. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/桃胶银耳羹.jpg', '/videos/recipes/桃胶银耳羹.mp4', 227, '["女性"]', '["美容养颜"]', '["秋季", "冬季"]', '{"calories": 150, "protein": 3, "fat": 0, "carbs": 35}',
    535, 301, 76, 4.9, 1, '2026-02-07 23:47:20', '2026-02-07 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (34, '燕窝炖雪梨', '燕窝炖雪梨', '燕窝炖雪梨', '燕窝炖雪梨是一道传统的食疗养生佳品，具有美容养颜、润肺止咳的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '燕窝炖雪梨是一道傳統的食療養生佳品，具有美容养颜、润肺止咳的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '燕窝炖雪梨 is a traditional therapeutic recipe with benefits of 美容养颜、润肺止咳. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/燕窝炖雪梨.jpg', '/videos/recipes/燕窝炖雪梨.mp4', 71, '["女性", "中老年"]', '["美容养颜", "润肺止咳"]', '["秋季", "冬季"]', '{"calories": 120, "protein": 8, "fat": 0, "carbs": 22}',
    1307, 304, 44, 4.6, 1, '2025-09-27 23:47:20', '2025-09-27 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (35, '玫瑰花茶', '玫瑰花茶', '玫瑰花茶', '玫瑰花茶是一道传统的食疗养生佳品，具有美容养颜的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '玫瑰花茶是一道傳統的食療養生佳品，具有美容养颜的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '玫瑰花茶 is a traditional therapeutic recipe with benefits of 美容养颜. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/玫瑰花茶.jpg', '/videos/recipes/玫瑰花茶.mp4', 164, '["女性", "白领"]', '["美容养颜"]', '["春季", "夏季"]', '{"calories": 5, "protein": 0, "fat": 0, "carbs": 1}',
    2926, 304, 75, 4.5, 1, '2026-03-05 23:47:20', '2026-03-05 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (36, '木瓜炖雪蛤', '木瓜炖雪蛤', '木瓜炖雪蛤', '木瓜炖雪蛤是一道传统的食疗养生佳品，具有美容养颜的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '木瓜炖雪蛤是一道傳統的食療養生佳品，具有美容养颜的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '木瓜炖雪蛤 is a traditional therapeutic recipe with benefits of 美容养颜. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/木瓜炖雪蛤.jpg', '/videos/recipes/木瓜炖雪蛤.mp4', 243, '["女性"]', '["美容养颜"]', '["秋季", "冬季"]', '{"calories": 180, "protein": 12, "fat": 8, "carbs": 18}',
    3154, 184, 38, 4.6, 1, '2026-01-18 23:47:20', '2026-01-18 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (37, '蜂蜜柠檬水', '蜂蜜柠檬水', '蜂蜜柠檬水', '蜂蜜柠檬水是一道传统的食疗养生佳品，具有美容养颜、清热解毒的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '蜂蜜柠檬水是一道傳統的食療養生佳品，具有美容养颜、清热解毒的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '蜂蜜柠檬水 is a traditional therapeutic recipe with benefits of 美容养颜、清热解毒. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/蜂蜜柠檬水.jpg', NULL, NULL, '["女性", "通用"]', '["美容养颜", "清热解毒"]', '["夏季", "春季"]', '{"calories": 60, "protein": 0, "fat": 0, "carbs": 16}',
    1175, 482, 27, 4.4, 1, '2025-09-17 23:47:20', '2025-09-17 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (38, '紫薯银耳羹', '紫薯银耳羹', '紫薯银耳羹', '紫薯银耳羹是一道传统的食疗养生佳品，具有美容养颜、健脾养胃的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '紫薯银耳羹是一道傳統的食療養生佳品，具有美容养颜、健脾养胃的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '紫薯银耳羹 is a traditional therapeutic recipe with benefits of 美容养颜、健脾养胃. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/紫薯银耳羹.jpg', '/videos/recipes/紫薯银耳羹.mp4', 118, '["女性", "中老年"]', '["美容养颜", "健脾养胃"]', '["秋季", "冬季"]', '{"calories": 160, "protein": 4, "fat": 0, "carbs": 36}',
    2224, 293, 37, 4.3, 1, '2025-09-26 23:47:20', '2025-09-26 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (39, '胶原蛋白汤', '胶原蛋白汤', '胶原蛋白汤', '胶原蛋白汤是一道传统的食疗养生佳品，具有美容养颜的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '胶原蛋白汤是一道傳統的食療養生佳品，具有美容养颜的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '胶原蛋白汤 is a traditional therapeutic recipe with benefits of 美容养颜. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/胶原蛋白汤.jpg', NULL, NULL, '["女性"]', '["美容养颜"]', '["冬季", "秋季"]', '{"calories": 200, "protein": 18, "fat": 10, "carbs": 8}',
    2140, 285, 32, 4.8, 1, '2026-02-04 23:47:20', '2026-02-04 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (40, '绿豆汤', '绿豆汤', '绿豆汤', '绿豆汤是一道传统的食疗养生佳品，具有清热解毒的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '绿豆汤是一道傳統的食療養生佳品，具有清热解毒的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '绿豆汤 is a traditional therapeutic recipe with benefits of 清热解毒. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/绿豆汤.jpg', '/videos/recipes/绿豆汤.mp4', 158, '["通用", "儿童", "中老年"]', '["清热解毒"]', '["夏季", "小暑", "大暑"]', '{"calories": 120, "protein": 6, "fat": 0, "carbs": 24}',
    1417, 169, 15, 4.9, 1, '2025-10-29 23:47:20', '2025-10-29 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (41, '苦瓜排骨汤', '苦瓜排骨汤', '苦瓜排骨汤', '苦瓜排骨汤是一道传统的食疗养生佳品，具有清热解毒、降压降脂的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '苦瓜排骨汤是一道傳統的食療養生佳品，具有清热解毒、降压降脂的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '苦瓜排骨汤 is a traditional therapeutic recipe with benefits of 清热解毒、降压降脂. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/苦瓜排骨汤.jpg', '/videos/recipes/苦瓜排骨汤.mp4', 154, '["中老年", "通用"]', '["清热解毒", "降压降脂"]', '["夏季", "秋季"]', '{"calories": 280, "protein": 22, "fat": 16, "carbs": 8}',
    3885, 389, 10, 4.2, 1, '2026-02-26 23:47:20', '2026-02-26 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (42, '金银花菊花茶', '金银花菊花茶', '金银花菊花茶', '金银花菊花茶是一道传统的食疗养生佳品，具有清热解毒的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '金银花菊花茶是一道傳統的食療養生佳品，具有清热解毒的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '金银花菊花茶 is a traditional therapeutic recipe with benefits of 清热解毒. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/金银花菊花茶.jpg', '/videos/recipes/金银花菊花茶.mp4', 142, '["白领", "通用"]', '["清热解毒"]', '["夏季", "秋季"]', '{"calories": 10, "protein": 0, "fat": 0, "carbs": 2}',
    2165, 424, 10, 4.6, 1, '2025-10-29 23:47:20', '2025-10-29 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (43, '冬瓜薏米汤', '冬瓜薏米汤', '冬瓜薏米汤', '冬瓜薏米汤是一道传统的食疗养生佳品，具有清热解毒、祛湿排毒的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '冬瓜薏米汤是一道傳統的食療養生佳品，具有清热解毒、祛湿排毒的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '冬瓜薏米汤 is a traditional therapeutic recipe with benefits of 清热解毒、祛湿排毒. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/冬瓜薏米汤.jpg', '/videos/recipes/冬瓜薏米汤.mp4', 141, '["中老年", "女性"]', '["清热解毒", "祛湿排毒"]', '["夏季", "秋季"]', '{"calories": 80, "protein": 3, "fat": 0, "carbs": 16}',
    1329, 346, 62, 4.1, 1, '2026-01-13 23:47:20', '2026-01-13 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (44, '蒲公英茶', '蒲公英茶', '蒲公英茶', '蒲公英茶是一道传统的食疗养生佳品，具有清热解毒的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '蒲公英茶是一道傳統的食療養生佳品，具有清热解毒的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '蒲公英茶 is a traditional therapeutic recipe with benefits of 清热解毒. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/蒲公英茶.jpg', NULL, NULL, '["中老年", "通用"]', '["清热解毒"]', '["春季", "夏季"]', '{"calories": 5, "protein": 0, "fat": 0, "carbs": 1}',
    1157, 124, 77, 4.2, 1, '2025-10-01 23:47:20', '2025-10-01 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (45, '莲藕排骨汤', '莲藕排骨汤', '莲藕排骨汤', '莲藕排骨汤是一道传统的食疗养生佳品，具有清热解毒、健脾养胃的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '莲藕排骨汤是一道傳統的食療養生佳品，具有清热解毒、健脾养胃的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '莲藕排骨汤 is a traditional therapeutic recipe with benefits of 清热解毒、健脾养胃. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/莲藕排骨汤.jpg', NULL, NULL, '["中老年", "儿童", "通用"]', '["清热解毒", "健脾养胃"]', '["秋季", "冬季"]', '{"calories": 320, "protein": 24, "fat": 18, "carbs": 12}',
    3653, 438, 95, 4.3, 1, '2026-01-10 23:47:20', '2026-01-10 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (46, '芹菜汁', '芹菜汁', '芹菜汁', '芹菜汁是一道传统的食疗养生佳品，具有降压降脂的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '芹菜汁是一道傳統的食療養生佳品，具有降压降脂的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '芹菜汁 is a traditional therapeutic recipe with benefits of 降压降脂. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/芹菜汁.jpg', NULL, NULL, '["中老年", "白领"]', '["降压降脂"]', '["春季", "夏季"]', '{"calories": 35, "protein": 2, "fat": 0, "carbs": 7}',
    4586, 330, 6, 4.7, 1, '2025-10-23 23:47:20', '2025-10-23 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (47, '山楂荷叶茶', '山楂荷叶茶', '山楂荷叶茶', '山楂荷叶茶是一道传统的食疗养生佳品，具有降压降脂的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '山楂荷叶茶是一道傳統的食療養生佳品，具有降压降脂的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '山楂荷叶茶 is a traditional therapeutic recipe with benefits of 降压降脂. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/山楂荷叶茶.jpg', '/videos/recipes/山楂荷叶茶.mp4', 159, '["中老年", "通用"]', '["降压降脂"]', '["夏季", "秋季"]', '{"calories": 20, "protein": 0, "fat": 0, "carbs": 5}',
    489, 54, 17, 4.9, 1, '2025-11-07 23:47:20', '2025-11-07 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (48, '决明子茶', '决明子茶', '决明子茶', '决明子茶是一道传统的食疗养生佳品，具有降压降脂、清热解毒的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '决明子茶是一道傳統的食療養生佳品，具有降压降脂、清热解毒的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '决明子茶 is a traditional therapeutic recipe with benefits of 降压降脂、清热解毒. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/决明子茶.jpg', NULL, NULL, '["中老年", "白领"]', '["降压降脂", "清热解毒"]', '["秋季", "冬季"]', '{"calories": 15, "protein": 1, "fat": 0, "carbs": 3}',
    4599, 336, 17, 4.7, 1, '2025-11-26 23:47:20', '2025-11-26 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (49, '黑木耳红枣汤', '黑木耳红枣汤', '黑木耳红枣汤', '黑木耳红枣汤是一道传统的食疗养生佳品，具有降压降脂、补气养血的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '黑木耳红枣汤是一道傳統的食療養生佳品，具有降压降脂、补气养血的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '黑木耳红枣汤 is a traditional therapeutic recipe with benefits of 降压降脂、补气养血. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/黑木耳红枣汤.jpg', '/videos/recipes/黑木耳红枣汤.mp4', 61, '["中老年", "女性"]', '["降压降脂", "补气养血"]', '["秋季", "冬季"]', '{"calories": 140, "protein": 5, "fat": 1, "carbs": 28}',
    1690, 202, 83, 4.4, 1, '2026-02-02 23:47:20', '2026-02-02 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (50, '海带豆腐汤', '海带豆腐汤', '海带豆腐汤', '海带豆腐汤是一道传统的食疗养生佳品，具有降压降脂的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '海带豆腐汤是一道傳統的食療養生佳品，具有降压降脂的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '海带豆腐汤 is a traditional therapeutic recipe with benefits of 降压降脂. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/海带豆腐汤.jpg', NULL, NULL, '["中老年", "通用"]', '["降压降脂"]', '["四季"]', '{"calories": 120, "protein": 10, "fat": 4, "carbs": 10}',
    2664, 441, 49, 5.0, 1, '2025-11-15 23:47:20', '2025-11-15 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (51, '燕麦粥', '燕麦粥', '燕麦粥', '燕麦粥是一道传统的食疗养生佳品，具有降压降脂、健脾养胃的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '燕麦粥是一道傳統的食療養生佳品，具有降压降脂、健脾养胃的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '燕麦粥 is a traditional therapeutic recipe with benefits of 降压降脂、健脾养胃. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/燕麦粥.jpg', NULL, NULL, '["中老年", "白领", "通用"]', '["降压降脂", "健脾养胃"]', '["四季"]', '{"calories": 150, "protein": 6, "fat": 3, "carbs": 26}',
    1676, 472, 44, 4.8, 1, '2025-10-12 23:47:20', '2025-10-12 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (52, '黄芪党参鸡汤', '黄芪党参鸡汤', '黄芪党参鸡汤', '黄芪党参鸡汤是一道传统的食疗养生佳品，具有增强免疫、补气养血的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '黄芪党参鸡汤是一道傳統的食療養生佳品，具有增强免疫、补气养血的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '黄芪党参鸡汤 is a traditional therapeutic recipe with benefits of 增强免疫、补气养血. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/黄芪党参鸡汤.jpg', NULL, NULL, '["中老年", "通用"]', '["增强免疫", "补气养血"]', '["冬季", "秋季"]', '{"calories": 340, "protein": 30, "fat": 18, "carbs": 8}',
    1090, 23, 64, 4.3, 1, '2026-02-11 23:47:20', '2026-02-11 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (53, '虫草花炖排骨', '虫草花炖排骨', '虫草花炖排骨', '虫草花炖排骨是一道传统的食疗养生佳品，具有增强免疫的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '虫草花炖排骨是一道傳統的食療養生佳品，具有增强免疫的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '虫草花炖排骨 is a traditional therapeutic recipe with benefits of 增强免疫. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/虫草花炖排骨.jpg', '/videos/recipes/虫草花炖排骨.mp4', 220, '["中老年", "通用"]', '["增强免疫"]', '["秋季", "冬季"]', '{"calories": 380, "protein": 28, "fat": 22, "carbs": 10}',
    3473, 64, 96, 4.7, 1, '2026-02-25 23:47:20', '2026-02-25 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (54, '灵芝煲鸡汤', '灵芝煲鸡汤', '灵芝煲鸡汤', '灵芝煲鸡汤是一道传统的食疗养生佳品，具有增强免疫、安神助眠的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '灵芝煲鸡汤是一道傳統的食療養生佳品，具有增强免疫、安神助眠的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '灵芝煲鸡汤 is a traditional therapeutic recipe with benefits of 增强免疫、安神助眠. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/灵芝煲鸡汤.jpg', NULL, NULL, '["中老年", "通用"]', '["增强免疫", "安神助眠"]', '["冬季", "秋季"]', '{"calories": 360, "protein": 32, "fat": 20, "carbs": 6}',
    2012, 349, 52, 4.9, 1, '2026-02-07 23:47:20', '2026-02-07 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (55, '人参枸杞茶', '人参枸杞茶', '人参枸杞茶', '人参枸杞茶是一道传统的食疗养生佳品，具有增强免疫、补气养血的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '人参枸杞茶是一道傳統的食療養生佳品，具有增强免疫、补气养血的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '人参枸杞茶 is a traditional therapeutic recipe with benefits of 增强免疫、补气养血. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/人参枸杞茶.jpg', '/videos/recipes/人参枸杞茶.mp4', 294, '["中老年", "白领"]', '["增强免疫", "补气养血"]', '["冬季", "秋季"]', '{"calories": 40, "protein": 2, "fat": 0, "carbs": 8}',
    3675, 115, 21, 4.2, 1, '2026-01-05 23:47:20', '2026-01-05 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (56, '花胶炖鸡汤', '花胶炖鸡汤', '花胶炖鸡汤', '花胶炖鸡汤是一道传统的食疗养生佳品，具有增强免疫、美容养颜的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '花胶炖鸡汤是一道傳統的食療養生佳品，具有增强免疫、美容养颜的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '花胶炖鸡汤 is a traditional therapeutic recipe with benefits of 增强免疫、美容养颜. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/花胶炖鸡汤.jpg', NULL, NULL, '["中老年", "女性"]', '["增强免疫", "美容养颜"]', '["冬季", "秋季"]', '{"calories": 420, "protein": 35, "fat": 24, "carbs": 8}',
    4163, 139, 11, 4.8, 1, '2025-12-08 23:47:20', '2025-12-08 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (57, '牛蒡排骨汤', '牛蒡排骨汤', '牛蒡排骨汤', '牛蒡排骨汤是一道传统的食疗养生佳品，具有增强免疫、清热解毒的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '牛蒡排骨汤是一道傳統的食療養生佳品，具有增强免疫、清热解毒的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '牛蒡排骨汤 is a traditional therapeutic recipe with benefits of 增强免疫、清热解毒. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/牛蒡排骨汤.jpg', '/videos/recipes/牛蒡排骨汤.mp4', 187, '["中老年", "通用"]', '["增强免疫", "清热解毒"]', '["春季", "秋季"]', '{"calories": 340, "protein": 26, "fat": 20, "carbs": 12}',
    3687, 48, 80, 4.8, 1, '2025-11-09 23:47:20', '2025-11-09 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (58, '红豆薏米水', '红豆薏米水', '红豆薏米水', '红豆薏米水是一道传统的食疗养生佳品，具有祛湿排毒的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '红豆薏米水是一道傳統的食療養生佳品，具有祛湿排毒的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '红豆薏米水 is a traditional therapeutic recipe with benefits of 祛湿排毒. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/红豆薏米水.jpg', NULL, NULL, '["女性", "中老年", "通用"]', '["祛湿排毒"]', '["夏季", "秋季"]', '{"calories": 90, "protein": 4, "fat": 0, "carbs": 18}',
    3621, 276, 57, 4.7, 1, '2025-10-22 23:47:20', '2025-10-22 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (59, '茯苓白术汤', '茯苓白术汤', '茯苓白术汤', '茯苓白术汤是一道传统的食疗养生佳品，具有祛湿排毒、健脾养胃的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '茯苓白术汤是一道傳統的食療養生佳品，具有祛湿排毒、健脾养胃的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '茯苓白术汤 is a traditional therapeutic recipe with benefits of 祛湿排毒、健脾养胃. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/茯苓白术汤.jpg', '/videos/recipes/茯苓白术汤.mp4', 160, '["中老年", "通用"]', '["祛湿排毒", "健脾养胃"]', '["夏季", "秋季"]', '{"calories": 60, "protein": 2, "fat": 0, "carbs": 12}',
    2474, 267, 81, 4.3, 1, '2025-09-29 23:47:20', '2025-09-29 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (60, '冬瓜荷叶汤', '冬瓜荷叶汤', '冬瓜荷叶汤', '冬瓜荷叶汤是一道传统的食疗养生佳品，具有祛湿排毒、清热解毒的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '冬瓜荷叶汤是一道傳統的食療養生佳品，具有祛湿排毒、清热解毒的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '冬瓜荷叶汤 is a traditional therapeutic recipe with benefits of 祛湿排毒、清热解毒. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/冬瓜荷叶汤.jpg', NULL, NULL, '["中老年", "女性"]', '["祛湿排毒", "清热解毒"]', '["夏季", "秋季"]', '{"calories": 50, "protein": 2, "fat": 0, "carbs": 10}',
    2753, 327, 75, 4.4, 1, '2026-03-05 23:47:20', '2026-03-05 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (61, '玉米须茶', '玉米须茶', '玉米须茶', '玉米须茶是一道传统的食疗养生佳品，具有祛湿排毒、降压降脂的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '玉米须茶是一道傳統的食療養生佳品，具有祛湿排毒、降压降脂的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '玉米须茶 is a traditional therapeutic recipe with benefits of 祛湿排毒、降压降脂. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/玉米须茶.jpg', '/videos/recipes/玉米须茶.mp4', 169, '["中老年", "通用"]', '["祛湿排毒", "降压降脂"]', '["夏季", "秋季"]', '{"calories": 5, "protein": 0, "fat": 0, "carbs": 1}',
    2598, 497, 45, 4.6, 1, '2025-09-23 23:47:20', '2025-09-23 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (62, '赤小豆鲫鱼汤', '赤小豆鲫鱼汤', '赤小豆鲫鱼汤', '赤小豆鲫鱼汤是一道传统的食疗养生佳品，具有祛湿排毒的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '赤小豆鲫鱼汤是一道傳統的食療養生佳品，具有祛湿排毒的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '赤小豆鲫鱼汤 is a traditional therapeutic recipe with benefits of 祛湿排毒. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/赤小豆鲫鱼汤.jpg', '/videos/recipes/赤小豆鲫鱼汤.mp4', 80, '["中老年", "通用"]', '["祛湿排毒"]', '["春季", "夏季"]', '{"calories": 280, "protein": 28, "fat": 14, "carbs": 6}',
    2392, 366, 77, 4.7, 1, '2025-11-23 23:47:20', '2025-11-23 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (63, '土茯苓煲龟', '土茯苓煲龟', '土茯苓煲龟', '土茯苓煲龟是一道传统的食疗养生佳品，具有祛湿排毒、清热解毒的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '土茯苓煲龟是一道傳統的食療養生佳品，具有祛湿排毒、清热解毒的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '土茯苓煲龟 is a traditional therapeutic recipe with benefits of 祛湿排毒、清热解毒. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/土茯苓煲龟.jpg', NULL, NULL, '["中老年", "通用"]', '["祛湿排毒", "清热解毒"]', '["夏季", "秋季"]', '{"calories": 320, "protein": 35, "fat": 16, "carbs": 4}',
    4112, 335, 65, 4.3, 1, '2026-02-15 23:47:20', '2026-02-15 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (64, '杜仲猪腰汤', '杜仲猪腰汤', '杜仲猪腰汤', '杜仲猪腰汤是一道传统的食疗养生佳品，具有补肾壮阳的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '杜仲猪腰汤是一道傳統的食療養生佳品，具有补肾壮阳的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '杜仲猪腰汤 is a traditional therapeutic recipe with benefits of 补肾壮阳. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/杜仲猪腰汤.jpg', '/videos/recipes/杜仲猪腰汤.mp4', 192, '["中老年", "男性"]', '["补肾壮阳"]', '["冬季", "秋季"]', '{"calories": 380, "protein": 30, "fat": 24, "carbs": 6}',
    2164, 324, 60, 4.6, 1, '2025-11-17 23:47:20', '2025-11-17 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (65, '枸杞羊肉汤', '枸杞羊肉汤', '枸杞羊肉汤', '枸杞羊肉汤是一道传统的食疗养生佳品，具有补肾壮阳、补气养血的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '枸杞羊肉汤是一道傳統的食療養生佳品，具有补肾壮阳、补气养血的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '枸杞羊肉汤 is a traditional therapeutic recipe with benefits of 补肾壮阳、补气养血. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/枸杞羊肉汤.jpg', '/videos/recipes/枸杞羊肉汤.mp4', 83, '["中老年", "男性"]', '["补肾壮阳", "补气养血"]', '["冬季", "立冬", "冬至"]', '{"calories": 450, "protein": 35, "fat": 30, "carbs": 8}',
    2879, 383, 48, 4.2, 1, '2026-01-21 23:47:20', '2026-01-21 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (66, '韭菜炒虾仁', '韭菜炒虾仁', '韭菜炒虾仁', '韭菜炒虾仁是一道传统的食疗养生佳品，具有补肾壮阳的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '韭菜炒虾仁是一道傳統的食療養生佳品，具有补肾壮阳的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '韭菜炒虾仁 is a traditional therapeutic recipe with benefits of 补肾壮阳. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/韭菜炒虾仁.jpg', NULL, NULL, '["中老年", "男性", "通用"]', '["补肾壮阳"]', '["春季", "冬季"]', '{"calories": 280, "protein": 28, "fat": 16, "carbs": 8}',
    3349, 121, 11, 4.5, 1, '2025-12-29 23:47:20', '2025-12-29 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (67, '核桃仁粥', '核桃仁粥', '核桃仁粥', '核桃仁粥是一道传统的食疗养生佳品，具有补肾壮阳、安神助眠的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '核桃仁粥是一道傳統的食療養生佳品，具有补肾壮阳、安神助眠的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '核桃仁粥 is a traditional therapeutic recipe with benefits of 补肾壮阳、安神助眠. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/核桃仁粥.jpg', '/videos/recipes/核桃仁粥.mp4', 278, '["中老年", "通用"]', '["补肾壮阳", "安神助眠"]', '["冬季", "秋季"]', '{"calories": 260, "protein": 10, "fat": 18, "carbs": 16}',
    1685, 57, 94, 4.7, 1, '2025-09-13 23:47:20', '2025-09-13 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (68, '海参小米粥', '海参小米粥', '海参小米粥', '海参小米粥是一道传统的食疗养生佳品，具有补肾壮阳、增强免疫的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '海参小米粥是一道傳統的食療養生佳品，具有补肾壮阳、增强免疫的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '海参小米粥 is a traditional therapeutic recipe with benefits of 补肾壮阳、增强免疫. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/海参小米粥.jpg', NULL, NULL, '["中老年", "通用"]', '["补肾壮阳", "增强免疫"]', '["冬季", "秋季"]', '{"calories": 320, "protein": 22, "fat": 12, "carbs": 30}',
    1314, 134, 91, 4.9, 1, '2026-02-28 23:47:20', '2026-02-28 23:47:20');
INSERT INTO recipes (id, name_zh_cn, name_zh_tw, name_en, description_zh_cn, description_zh_tw, description_en,
    cover_image, video_url, video_duration, crowd_tags, efficacy_tags, solar_term_tags, nutrition,
    view_count, favorite_count, comment_count, rating, status, created_at, updated_at)
VALUES (69, '肉苁蓉炖羊肉', '肉苁蓉炖羊肉', '肉苁蓉炖羊肉', '肉苁蓉炖羊肉是一道传统的食疗养生佳品，具有补肾壮阳、补气养血的功效。选用优质食材，精心熬制而成，适合日常保健调理。', '肉苁蓉炖羊肉是一道傳統的食療養生佳品，具有补肾壮阳、补气养血的功效。選用優質食材，精心熬製而成，適合日常保健調理。', '肉苁蓉炖羊肉 is a traditional therapeutic recipe with benefits of 补肾壮阳、补气养血. Made with quality ingredients, perfect for daily wellness.',
    '/images/recipes/肉苁蓉炖羊肉.jpg', '/videos/recipes/肉苁蓉炖羊肉.mp4', 232, '["中老年", "男性"]', '["补肾壮阳", "补气养血"]', '["冬季", "大寒", "小寒"]', '{"calories": 480, "protein": 38, "fat": 32, "carbs": 6}',
    2047, 486, 9, 4.3, 1, '2025-09-17 23:47:20', '2025-09-17 23:47:20');

SELECT '配方数据插入完成: 69条' AS message;

-- ============================================
-- 3. 食材数据
-- ============================================

INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (1, 1, '山药', '山药', '山药', '100g', '/images/ingredients/山药.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (2, 1, '小米', '小米', '小米', '80g', '/images/ingredients/小米.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (3, 1, '红枣', '红枣', '红枣', '5颗', '/images/ingredients/红枣.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (4, 1, '冰糖', '冰糖', '冰糖', '适量', '/images/ingredients/冰糖.jpg', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (5, 2, '南瓜', '南瓜', '南瓜', '200g', '/images/ingredients/南瓜.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (6, 2, '红枣', '红枣', '红枣', '8颗', '/images/ingredients/红枣.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (7, 2, '大米', '大米', '大米', '100g', '/images/ingredients/大米.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (8, 2, '红糖', '红糖', '红糖', '适量', '/images/ingredients/红糖.jpg', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (9, 3, '猴头菇', '猴头菇', '猴头菇', '50g', '/images/ingredients/猴头菇.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (10, 3, '土鸡', '土鸡', '土鸡', '半只', '/images/ingredients/土鸡.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (11, 3, '枸杞', '枸杞', '枸杞', '10g', '/images/ingredients/枸杞.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (12, 3, '姜片', '姜片', '姜片', '3片', '/images/ingredients/姜片.jpg', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (13, 4, '莲子', '莲子', '莲子', '30g', '/images/ingredients/莲子.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (14, 4, '百合', '百合', '百合', '20g', '/images/ingredients/百合.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (15, 4, '大米', '大米', '大米', '100g', '/images/ingredients/大米.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (16, 4, '冰糖', '冰糖', '冰糖', '适量', '/images/ingredients/冰糖.jpg', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (17, 5, '茯苓', '茯苓', '茯苓', '15g', '/images/ingredients/茯苓.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (18, 5, '山药', '山药', '山药', '150g', '/images/ingredients/山药.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (19, 5, '排骨', '排骨', '排骨', '300g', '/images/ingredients/排骨.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (20, 5, '红枣', '红枣', '红枣', '5颗', '/images/ingredients/红枣.jpg', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (21, 6, '陈皮', '陈皮', '陈皮', '5g', '/images/ingredients/陈皮.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (22, 6, '瘦肉', '瘦肉', '瘦肉', '100g', '/images/ingredients/瘦肉.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (23, 6, '大米', '大米', '大米', '100g', '/images/ingredients/大米.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (24, 6, '姜丝', '姜丝', '姜丝', '少许', '/images/ingredients/姜丝.jpg', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (25, 7, '芡实', '芡实', '芡实', '30g', '/images/ingredients/芡实.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (26, 7, '薏米', '薏米', '薏米', '30g', '/images/ingredients/薏米.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (27, 7, '大米', '大米', '大米', '80g', '/images/ingredients/大米.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (28, 7, '红枣', '红枣', '红枣', '5颗', '/images/ingredients/红枣.jpg', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (29, 8, '生姜', '生姜', '生姜', '30g', '/images/ingredients/生姜.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (30, 8, '红糖', '红糖', '红糖', '30g', '/images/ingredients/红糖.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (31, 8, '红枣', '红枣', '红枣', '6颗', '/images/ingredients/红枣.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (32, 8, '水', '水', '水', '500ml', '/images/ingredients/水.jpg', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (33, 9, '川贝', '川贝', '川贝', '5g', '/images/ingredients/川贝.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (34, 9, '雪梨', '雪梨', '雪梨', '1个', '/images/ingredients/雪梨.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (35, 9, '冰糖', '冰糖', '冰糖', '适量', '/images/ingredients/冰糖.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (36, 9, '枸杞', '枸杞', '枸杞', '少许', '/images/ingredients/枸杞.jpg', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (37, 10, '银耳', '银耳', '银耳', '20g', '/images/ingredients/银耳.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (38, 10, '莲子', '莲子', '莲子', '30g', '/images/ingredients/莲子.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (39, 10, '冰糖', '冰糖', '冰糖', '适量', '/images/ingredients/冰糖.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (40, 10, '枸杞', '枸杞', '枸杞', '10g', '/images/ingredients/枸杞.jpg', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (41, 11, '百合', '百合', '百合', '30g', '/images/ingredients/百合.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (42, 11, '杏仁', '杏仁', '杏仁', '15g', '/images/ingredients/杏仁.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (43, 11, '大米', '大米', '大米', '100g', '/images/ingredients/大米.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (44, 11, '冰糖', '冰糖', '冰糖', '适量', '/images/ingredients/冰糖.jpg', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (45, 12, '枇杷叶', '枇杷叶', '枇杷叶', '10g', '/images/ingredients/枇杷叶.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (46, 12, '瘦肉', '瘦肉', '瘦肉', '200g', '/images/ingredients/瘦肉.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (47, 12, '蜜枣', '蜜枣', '蜜枣', '2颗', '/images/ingredients/蜜枣.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (48, 12, '姜片', '姜片', '姜片', '3片', '/images/ingredients/姜片.jpg', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (49, 13, '沙参', '沙参', '沙参', '15g', '/images/ingredients/沙参.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (50, 13, '玉竹', '玉竹', '玉竹', '15g', '/images/ingredients/玉竹.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (51, 13, '老鸭', '老鸭', '老鸭', '半只', '/images/ingredients/老鸭.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (52, 13, '枸杞', '枸杞', '枸杞', '10g', '/images/ingredients/枸杞.jpg', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (53, 14, '罗汉果', '罗汉果', '罗汉果', '1/4个', '/images/ingredients/罗汉果.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (54, 14, '菊花', '菊花', '菊花', '10g', '/images/ingredients/菊花.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (55, 14, '枸杞', '枸杞', '枸杞', '5g', '/images/ingredients/枸杞.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (56, 14, '冰糖', '冰糖', '冰糖', '适量', '/images/ingredients/冰糖.jpg', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (57, 15, '白萝卜', '白萝卜', '白萝卜', '200g', '/images/ingredients/白萝卜.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (58, 15, '蜂蜜', '蜂蜜', '蜂蜜', '2勺', '/images/ingredients/蜂蜜.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (59, 15, '水', '水', '水', '300ml', '/images/ingredients/水.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (60, 16, '南杏', '南杏', '南杏', '10g', '/images/ingredients/南杏.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (61, 16, '北杏', '北杏', '北杏', '5g', '/images/ingredients/北杏.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (62, 16, '猪肺', '猪肺', '猪肺', '300g', '/images/ingredients/猪肺.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (63, 16, '蜜枣', '蜜枣', '蜜枣', '2颗', '/images/ingredients/蜜枣.jpg', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (64, 17, '当归', '当归', '当归', '10g', '/images/ingredients/当归.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (65, 17, '红枣', '红枣', '红枣', '8颗', '/images/ingredients/红枣.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (66, 17, '乌鸡', '乌鸡', '乌鸡', '半只', '/images/ingredients/乌鸡.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (67, 17, '枸杞', '枸杞', '枸杞', '10g', '/images/ingredients/枸杞.jpg', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (68, 18, '阿胶', '阿胶', '阿胶', '10g', '/images/ingredients/阿胶.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (69, 18, '红糖', '红糖', '红糖', '30g', '/images/ingredients/红糖.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (70, 18, '大米', '大米', '大米', '100g', '/images/ingredients/大米.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (71, 18, '红枣', '红枣', '红枣', '6颗', '/images/ingredients/红枣.jpg', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (72, 19, '枸杞', '枸杞', '枸杞', '15g', '/images/ingredients/枸杞.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (73, 19, '桂圆', '桂圆', '桂圆', '10颗', '/images/ingredients/桂圆.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (74, 19, '红枣', '红枣', '红枣', '5颗', '/images/ingredients/红枣.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (75, 19, '红糖', '红糖', '红糖', '适量', '/images/ingredients/红糖.jpg', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (76, 20, '花生', '花生', '花生', '100g', '/images/ingredients/花生.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (77, 20, '猪蹄', '猪蹄', '猪蹄', '1只', '/images/ingredients/猪蹄.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (78, 20, '红枣', '红枣', '红枣', '8颗', '/images/ingredients/红枣.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (79, 20, '姜片', '姜片', '姜片', '3片', '/images/ingredients/姜片.jpg', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (80, 21, '当归', '当归', '当归', '10g', '/images/ingredients/当归.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (81, 21, '川芎', '川芎', '川芎', '8g', '/images/ingredients/川芎.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (82, 21, '白芍', '白芍', '白芍', '12g', '/images/ingredients/白芍.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (83, 21, '熟地', '熟地', '熟地', '12g', '/images/ingredients/熟地.jpg', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (84, 22, '猪肝', '猪肝', '猪肝', '200g', '/images/ingredients/猪肝.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (85, 22, '菠菜', '菠菜', '菠菜', '150g', '/images/ingredients/菠菜.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (86, 22, '姜丝', '姜丝', '姜丝', '少许', '/images/ingredients/姜丝.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (87, 22, '枸杞', '枸杞', '枸杞', '10g', '/images/ingredients/枸杞.jpg', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (88, 23, '黑芝麻', '黑芝麻', '黑芝麻', '50g', '/images/ingredients/黑芝麻.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (89, 23, '糯米粉', '糯米粉', '糯米粉', '30g', '/images/ingredients/糯米粉.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (90, 23, '冰糖', '冰糖', '冰糖', '适量', '/images/ingredients/冰糖.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (91, 23, '水', '水', '水', '400ml', '/images/ingredients/水.jpg', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (92, 24, '桂圆', '桂圆', '桂圆', '20g', '/images/ingredients/桂圆.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (93, 24, '莲子', '莲子', '莲子', '30g', '/images/ingredients/莲子.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (94, 24, '银耳', '银耳', '银耳', '15g', '/images/ingredients/银耳.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (95, 24, '冰糖', '冰糖', '冰糖', '适量', '/images/ingredients/冰糖.jpg', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (96, 25, '红豆', '红豆', '红豆', '50g', '/images/ingredients/红豆.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (97, 25, '薏米', '薏米', '薏米', '30g', '/images/ingredients/薏米.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (98, 25, '红枣', '红枣', '红枣', '6颗', '/images/ingredients/红枣.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (99, 25, '红糖', '红糖', '红糖', '适量', '/images/ingredients/红糖.jpg', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (100, 26, '酸枣仁', '酸枣仁', '酸枣仁', '15g', '/images/ingredients/酸枣仁.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (101, 26, '茯苓', '茯苓', '茯苓', '10g', '/images/ingredients/茯苓.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (102, 26, '甘草', '甘草', '甘草', '3g', '/images/ingredients/甘草.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (103, 26, '水', '水', '水', '500ml', '/images/ingredients/水.jpg', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (104, 27, '柏子仁', '柏子仁', '柏子仁', '15g', '/images/ingredients/柏子仁.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (105, 27, '大米', '大米', '大米', '100g', '/images/ingredients/大米.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (106, 27, '蜂蜜', '蜂蜜', '蜂蜜', '适量', '/images/ingredients/蜂蜜.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (107, 28, '百合', '百合', '百合', '30g', '/images/ingredients/百合.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (108, 28, '麦冬', '麦冬', '麦冬', '15g', '/images/ingredients/麦冬.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (109, 28, '冰糖', '冰糖', '冰糖', '适量', '/images/ingredients/冰糖.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (110, 29, '龙眼肉', '龙眼肉', '龙眼肉', '30g', '/images/ingredients/龙眼肉.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (111, 29, '大米', '大米', '大米', '100g', '/images/ingredients/大米.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (112, 29, '红枣', '红枣', '红枣', '5颗', '/images/ingredients/红枣.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (113, 30, '五味子', '五味子', '五味子', '10g', '/images/ingredients/五味子.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (114, 30, '枸杞', '枸杞', '枸杞', '10g', '/images/ingredients/枸杞.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (115, 30, '水', '水', '水', '500ml', '/images/ingredients/水.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (116, 31, '远志', '远志', '远志', '10g', '/images/ingredients/远志.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (117, 31, '莲子', '莲子', '莲子', '30g', '/images/ingredients/莲子.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (118, 31, '冰糖', '冰糖', '冰糖', '适量', '/images/ingredients/冰糖.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (119, 32, '灵芝孢子粉', '灵芝孢子粉', '灵芝孢子粉', '3g', '/images/ingredients/灵芝孢子粉.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (120, 32, '蜂蜜', '蜂蜜', '蜂蜜', '适量', '/images/ingredients/蜂蜜.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (121, 32, '温水', '温水', '温水', '200ml', '/images/ingredients/温水.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (122, 33, '桃胶', '桃胶', '桃胶', '15g', '/images/ingredients/桃胶.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (123, 33, '银耳', '银耳', '银耳', '20g', '/images/ingredients/银耳.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (124, 33, '冰糖', '冰糖', '冰糖', '适量', '/images/ingredients/冰糖.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (125, 33, '枸杞', '枸杞', '枸杞', '10g', '/images/ingredients/枸杞.jpg', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (126, 34, '燕窝', '燕窝', '燕窝', '5g', '/images/ingredients/燕窝.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (127, 34, '雪梨', '雪梨', '雪梨', '1个', '/images/ingredients/雪梨.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (128, 34, '冰糖', '冰糖', '冰糖', '适量', '/images/ingredients/冰糖.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (129, 34, '枸杞', '枸杞', '枸杞', '少许', '/images/ingredients/枸杞.jpg', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (130, 35, '玫瑰花', '玫瑰花', '玫瑰花', '10g', '/images/ingredients/玫瑰花.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (131, 35, '冰糖', '冰糖', '冰糖', '适量', '/images/ingredients/冰糖.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (132, 35, '水', '水', '水', '500ml', '/images/ingredients/水.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (133, 36, '木瓜', '木瓜', '木瓜', '半个', '/images/ingredients/木瓜.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (134, 36, '雪蛤', '雪蛤', '雪蛤', '5g', '/images/ingredients/雪蛤.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (135, 36, '冰糖', '冰糖', '冰糖', '适量', '/images/ingredients/冰糖.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (136, 36, '牛奶', '牛奶', '牛奶', '200ml', '/images/ingredients/牛奶.jpg', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (137, 37, '柠檬', '柠檬', '柠檬', '半个', '/images/ingredients/柠檬.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (138, 37, '蜂蜜', '蜂蜜', '蜂蜜', '2勺', '/images/ingredients/蜂蜜.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (139, 37, '温水', '温水', '温水', '300ml', '/images/ingredients/温水.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (140, 38, '紫薯', '紫薯', '紫薯', '150g', '/images/ingredients/紫薯.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (141, 38, '银耳', '银耳', '银耳', '20g', '/images/ingredients/银耳.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (142, 38, '冰糖', '冰糖', '冰糖', '适量', '/images/ingredients/冰糖.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (143, 39, '猪蹄', '猪蹄', '猪蹄', '1只', '/images/ingredients/猪蹄.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (144, 39, '鸡爪', '鸡爪', '鸡爪', '200g', '/images/ingredients/鸡爪.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (145, 39, '红枣', '红枣', '红枣', '8颗', '/images/ingredients/红枣.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (146, 39, '姜片', '姜片', '姜片', '3片', '/images/ingredients/姜片.jpg', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (147, 40, '绿豆', '绿豆', '绿豆', '100g', '/images/ingredients/绿豆.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (148, 40, '冰糖', '冰糖', '冰糖', '适量', '/images/ingredients/冰糖.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (149, 40, '水', '水', '水', '800ml', '/images/ingredients/水.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (150, 41, '苦瓜', '苦瓜', '苦瓜', '200g', '/images/ingredients/苦瓜.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (151, 41, '排骨', '排骨', '排骨', '300g', '/images/ingredients/排骨.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (152, 41, '黄豆', '黄豆', '黄豆', '50g', '/images/ingredients/黄豆.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (153, 41, '姜片', '姜片', '姜片', '3片', '/images/ingredients/姜片.jpg', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (154, 42, '金银花', '金银花', '金银花', '10g', '/images/ingredients/金银花.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (155, 42, '菊花', '菊花', '菊花', '10g', '/images/ingredients/菊花.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (156, 42, '冰糖', '冰糖', '冰糖', '适量', '/images/ingredients/冰糖.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (157, 43, '冬瓜', '冬瓜', '冬瓜', '300g', '/images/ingredients/冬瓜.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (158, 43, '薏米', '薏米', '薏米', '50g', '/images/ingredients/薏米.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (159, 43, '排骨', '排骨', '排骨', '200g', '/images/ingredients/排骨.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (160, 43, '姜片', '姜片', '姜片', '2片', '/images/ingredients/姜片.jpg', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (161, 44, '蒲公英', '蒲公英', '蒲公英', '15g', '/images/ingredients/蒲公英.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (162, 44, '冰糖', '冰糖', '冰糖', '适量', '/images/ingredients/冰糖.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (163, 44, '水', '水', '水', '500ml', '/images/ingredients/水.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (164, 45, '莲藕', '莲藕', '莲藕', '300g', '/images/ingredients/莲藕.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (165, 45, '排骨', '排骨', '排骨', '300g', '/images/ingredients/排骨.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (166, 45, '红枣', '红枣', '红枣', '6颗', '/images/ingredients/红枣.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (167, 45, '枸杞', '枸杞', '枸杞', '10g', '/images/ingredients/枸杞.jpg', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (168, 46, '芹菜', '芹菜', '芹菜', '200g', '/images/ingredients/芹菜.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (169, 46, '苹果', '苹果', '苹果', '1个', '/images/ingredients/苹果.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (170, 46, '蜂蜜', '蜂蜜', '蜂蜜', '适量', '/images/ingredients/蜂蜜.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (171, 46, '水', '水', '水', '200ml', '/images/ingredients/水.jpg', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (172, 47, '山楂', '山楂', '山楂', '15g', '/images/ingredients/山楂.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (173, 47, '荷叶', '荷叶', '荷叶', '10g', '/images/ingredients/荷叶.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (174, 47, '冰糖', '冰糖', '冰糖', '适量', '/images/ingredients/冰糖.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (175, 48, '决明子', '决明子', '决明子', '15g', '/images/ingredients/决明子.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (176, 48, '菊花', '菊花', '菊花', '10g', '/images/ingredients/菊花.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (177, 48, '枸杞', '枸杞', '枸杞', '10g', '/images/ingredients/枸杞.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (178, 49, '黑木耳', '黑木耳', '黑木耳', '30g', '/images/ingredients/黑木耳.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (179, 49, '红枣', '红枣', '红枣', '10颗', '/images/ingredients/红枣.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (180, 49, '冰糖', '冰糖', '冰糖', '适量', '/images/ingredients/冰糖.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (181, 50, '海带', '海带', '海带', '100g', '/images/ingredients/海带.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (182, 50, '豆腐', '豆腐', '豆腐', '200g', '/images/ingredients/豆腐.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (183, 50, '虾皮', '虾皮', '虾皮', '10g', '/images/ingredients/虾皮.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (184, 50, '姜丝', '姜丝', '姜丝', '少许', '/images/ingredients/姜丝.jpg', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (185, 51, '燕麦', '燕麦', '燕麦', '80g', '/images/ingredients/燕麦.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (186, 51, '牛奶', '牛奶', '牛奶', '250ml', '/images/ingredients/牛奶.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (187, 51, '蜂蜜', '蜂蜜', '蜂蜜', '适量', '/images/ingredients/蜂蜜.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (188, 51, '坚果', '坚果', '坚果', '少许', '/images/ingredients/坚果.jpg', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (189, 52, '黄芪', '黄芪', '黄芪', '15g', '/images/ingredients/黄芪.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (190, 52, '党参', '党参', '党参', '15g', '/images/ingredients/党参.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (191, 52, '土鸡', '土鸡', '土鸡', '半只', '/images/ingredients/土鸡.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (192, 52, '红枣', '红枣', '红枣', '8颗', '/images/ingredients/红枣.jpg', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (193, 53, '虫草花', '虫草花', '虫草花', '20g', '/images/ingredients/虫草花.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (194, 53, '排骨', '排骨', '排骨', '400g', '/images/ingredients/排骨.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (195, 53, '枸杞', '枸杞', '枸杞', '10g', '/images/ingredients/枸杞.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (196, 53, '姜片', '姜片', '姜片', '3片', '/images/ingredients/姜片.jpg', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (197, 54, '灵芝', '灵芝', '灵芝', '10g', '/images/ingredients/灵芝.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (198, 54, '土鸡', '土鸡', '土鸡', '半只', '/images/ingredients/土鸡.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (199, 54, '红枣', '红枣', '红枣', '8颗', '/images/ingredients/红枣.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (200, 54, '枸杞', '枸杞', '枸杞', '10g', '/images/ingredients/枸杞.jpg', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (201, 55, '人参', '人参', '人参', '5g', '/images/ingredients/人参.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (202, 55, '枸杞', '枸杞', '枸杞', '15g', '/images/ingredients/枸杞.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (203, 55, '红枣', '红枣', '红枣', '5颗', '/images/ingredients/红枣.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (204, 55, '冰糖', '冰糖', '冰糖', '适量', '/images/ingredients/冰糖.jpg', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (205, 56, '花胶', '花胶', '花胶', '20g', '/images/ingredients/花胶.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (206, 56, '土鸡', '土鸡', '土鸡', '半只', '/images/ingredients/土鸡.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (207, 56, '红枣', '红枣', '红枣', '8颗', '/images/ingredients/红枣.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (208, 56, '枸杞', '枸杞', '枸杞', '10g', '/images/ingredients/枸杞.jpg', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (209, 57, '牛蒡', '牛蒡', '牛蒡', '200g', '/images/ingredients/牛蒡.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (210, 57, '排骨', '排骨', '排骨', '300g', '/images/ingredients/排骨.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (211, 57, '胡萝卜', '胡萝卜', '胡萝卜', '1根', '/images/ingredients/胡萝卜.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (212, 57, '姜片', '姜片', '姜片', '3片', '/images/ingredients/姜片.jpg', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (213, 58, '红豆', '红豆', '红豆', '50g', '/images/ingredients/红豆.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (214, 58, '薏米', '薏米', '薏米', '50g', '/images/ingredients/薏米.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (215, 58, '冰糖', '冰糖', '冰糖', '适量', '/images/ingredients/冰糖.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (216, 59, '茯苓', '茯苓', '茯苓', '15g', '/images/ingredients/茯苓.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (217, 59, '白术', '白术', '白术', '15g', '/images/ingredients/白术.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (218, 59, '红枣', '红枣', '红枣', '6颗', '/images/ingredients/红枣.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (219, 59, '冰糖', '冰糖', '冰糖', '适量', '/images/ingredients/冰糖.jpg', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (220, 60, '冬瓜', '冬瓜', '冬瓜', '400g', '/images/ingredients/冬瓜.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (221, 60, '荷叶', '荷叶', '荷叶', '10g', '/images/ingredients/荷叶.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (222, 60, '薏米', '薏米', '薏米', '30g', '/images/ingredients/薏米.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (223, 61, '玉米须', '玉米须', '玉米须', '30g', '/images/ingredients/玉米须.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (224, 61, '水', '水', '水', '500ml', '/images/ingredients/水.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (225, 62, '赤小豆', '赤小豆', '赤小豆', '50g', '/images/ingredients/赤小豆.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (226, 62, '鲫鱼', '鲫鱼', '鲫鱼', '1条', '/images/ingredients/鲫鱼.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (227, 62, '姜片', '姜片', '姜片', '3片', '/images/ingredients/姜片.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (228, 62, '陈皮', '陈皮', '陈皮', '5g', '/images/ingredients/陈皮.jpg', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (229, 63, '土茯苓', '土茯苓', '土茯苓', '30g', '/images/ingredients/土茯苓.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (230, 63, '草龟', '草龟', '草龟', '1只', '/images/ingredients/草龟.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (231, 63, '瘦肉', '瘦肉', '瘦肉', '200g', '/images/ingredients/瘦肉.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (232, 63, '姜片', '姜片', '姜片', '3片', '/images/ingredients/姜片.jpg', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (233, 64, '杜仲', '杜仲', '杜仲', '15g', '/images/ingredients/杜仲.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (234, 64, '猪腰', '猪腰', '猪腰', '2个', '/images/ingredients/猪腰.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (235, 64, '枸杞', '枸杞', '枸杞', '10g', '/images/ingredients/枸杞.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (236, 64, '姜片', '姜片', '姜片', '3片', '/images/ingredients/姜片.jpg', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (237, 65, '枸杞', '枸杞', '枸杞', '20g', '/images/ingredients/枸杞.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (238, 65, '羊肉', '羊肉', '羊肉', '500g', '/images/ingredients/羊肉.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (239, 65, '当归', '当归', '当归', '10g', '/images/ingredients/当归.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (240, 65, '姜片', '姜片', '姜片', '5片', '/images/ingredients/姜片.jpg', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (241, 66, '韭菜', '韭菜', '韭菜', '200g', '/images/ingredients/韭菜.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (242, 66, '虾仁', '虾仁', '虾仁', '150g', '/images/ingredients/虾仁.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (243, 66, '姜丝', '姜丝', '姜丝', '少许', '/images/ingredients/姜丝.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (244, 66, '料酒', '料酒', '料酒', '适量', '/images/ingredients/料酒.jpg', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (245, 67, '核桃仁', '核桃仁', '核桃仁', '30g', '/images/ingredients/核桃仁.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (246, 67, '大米', '大米', '大米', '100g', '/images/ingredients/大米.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (247, 67, '冰糖', '冰糖', '冰糖', '适量', '/images/ingredients/冰糖.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (248, 68, '海参', '海参', '海参', '2只', '/images/ingredients/海参.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (249, 68, '小米', '小米', '小米', '100g', '/images/ingredients/小米.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (250, 68, '姜丝', '姜丝', '姜丝', '少许', '/images/ingredients/姜丝.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (251, 68, '葱花', '葱花', '葱花', '少许', '/images/ingredients/葱花.jpg', 3);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (252, 69, '肉苁蓉', '肉苁蓉', '肉苁蓉', '15g', '/images/ingredients/肉苁蓉.jpg', 0);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (253, 69, '羊肉', '羊肉', '羊肉', '500g', '/images/ingredients/羊肉.jpg', 1);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (254, 69, '枸杞', '枸杞', '枸杞', '15g', '/images/ingredients/枸杞.jpg', 2);
INSERT INTO recipe_ingredients (id, recipe_id, name_zh_cn, name_zh_tw, name_en, amount, image, sort_order)
VALUES (255, 69, '姜片', '姜片', '姜片', '5片', '/images/ingredients/姜片.jpg', 3);

SELECT '食材数据插入完成: 255条' AS message;

-- ============================================
-- 4. 制作步骤数据
-- ============================================

INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (1, 1, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/山药小米粥_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (2, 1, 2, '将山药主料处理干净，切成适当大小', '将山药主料处理干净，切成适当大小', 'Step 2: 将山药主料处理干净，切成适当大小', '/images/steps/山药小米粥_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (3, 1, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/山药小米粥_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (4, 1, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/山药小米粥_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (5, 1, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/山药小米粥_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (6, 1, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/山药小米粥_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (7, 2, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/南瓜红枣粥_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (8, 2, 2, '将南瓜主料处理干净，切成适当大小', '将南瓜主料处理干净，切成适当大小', 'Step 2: 将南瓜主料处理干净，切成适当大小', '/images/steps/南瓜红枣粥_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (9, 2, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/南瓜红枣粥_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (10, 2, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/南瓜红枣粥_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (11, 2, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/南瓜红枣粥_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (12, 2, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/南瓜红枣粥_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (13, 3, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/猴头菇炖鸡汤_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (14, 3, 2, '将猴头主料处理干净，切成适当大小', '将猴头主料处理干净，切成适当大小', 'Step 2: 将猴头主料处理干净，切成适当大小', '/images/steps/猴头菇炖鸡汤_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (15, 3, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/猴头菇炖鸡汤_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (16, 3, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/猴头菇炖鸡汤_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (17, 3, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/猴头菇炖鸡汤_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (18, 3, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/猴头菇炖鸡汤_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (19, 4, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/莲子百合粥_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (20, 4, 2, '将莲子主料处理干净，切成适当大小', '将莲子主料处理干净，切成适当大小', 'Step 2: 将莲子主料处理干净，切成适当大小', '/images/steps/莲子百合粥_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (21, 4, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/莲子百合粥_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (22, 4, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/莲子百合粥_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (23, 4, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/莲子百合粥_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (24, 4, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/莲子百合粥_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (25, 5, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/茯苓山药排骨汤_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (26, 5, 2, '将茯苓主料处理干净，切成适当大小', '将茯苓主料处理干净，切成适当大小', 'Step 2: 将茯苓主料处理干净，切成适当大小', '/images/steps/茯苓山药排骨汤_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (27, 5, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/茯苓山药排骨汤_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (28, 5, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/茯苓山药排骨汤_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (29, 5, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/茯苓山药排骨汤_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (30, 5, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/茯苓山药排骨汤_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (31, 6, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/陈皮瘦肉粥_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (32, 6, 2, '将陈皮主料处理干净，切成适当大小', '将陈皮主料处理干净，切成适当大小', 'Step 2: 将陈皮主料处理干净，切成适当大小', '/images/steps/陈皮瘦肉粥_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (33, 6, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/陈皮瘦肉粥_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (34, 6, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/陈皮瘦肉粥_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (35, 6, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/陈皮瘦肉粥_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (36, 6, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/陈皮瘦肉粥_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (37, 7, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/芡实薏米粥_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (38, 7, 2, '将芡实主料处理干净，切成适当大小', '将芡实主料处理干净，切成适当大小', 'Step 2: 将芡实主料处理干净，切成适当大小', '/images/steps/芡实薏米粥_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (39, 7, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/芡实薏米粥_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (40, 7, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/芡实薏米粥_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (41, 7, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/芡实薏米粥_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (42, 7, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/芡实薏米粥_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (43, 8, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/生姜红糖暖胃汤_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (44, 8, 2, '将生姜主料处理干净，切成适当大小', '将生姜主料处理干净，切成适当大小', 'Step 2: 将生姜主料处理干净，切成适当大小', '/images/steps/生姜红糖暖胃汤_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (45, 8, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/生姜红糖暖胃汤_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (46, 8, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/生姜红糖暖胃汤_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (47, 8, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/生姜红糖暖胃汤_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (48, 8, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/生姜红糖暖胃汤_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (49, 9, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/川贝雪梨汤_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (50, 9, 2, '将川贝主料处理干净，切成适当大小', '将川贝主料处理干净，切成适当大小', 'Step 2: 将川贝主料处理干净，切成适当大小', '/images/steps/川贝雪梨汤_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (51, 9, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/川贝雪梨汤_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (52, 9, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/川贝雪梨汤_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (53, 9, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/川贝雪梨汤_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (54, 9, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/川贝雪梨汤_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (55, 10, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/银耳莲子羹_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (56, 10, 2, '将银耳主料处理干净，切成适当大小', '将银耳主料处理干净，切成适当大小', 'Step 2: 将银耳主料处理干净，切成适当大小', '/images/steps/银耳莲子羹_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (57, 10, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/银耳莲子羹_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (58, 10, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/银耳莲子羹_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (59, 10, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/银耳莲子羹_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (60, 10, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/银耳莲子羹_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (61, 11, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/百合杏仁粥_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (62, 11, 2, '将百合主料处理干净，切成适当大小', '将百合主料处理干净，切成适当大小', 'Step 2: 将百合主料处理干净，切成适当大小', '/images/steps/百合杏仁粥_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (63, 11, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/百合杏仁粥_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (64, 11, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/百合杏仁粥_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (65, 11, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/百合杏仁粥_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (66, 11, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/百合杏仁粥_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (67, 12, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/枇杷叶瘦肉汤_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (68, 12, 2, '将枇杷主料处理干净，切成适当大小', '将枇杷主料处理干净，切成适当大小', 'Step 2: 将枇杷主料处理干净，切成适当大小', '/images/steps/枇杷叶瘦肉汤_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (69, 12, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/枇杷叶瘦肉汤_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (70, 12, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/枇杷叶瘦肉汤_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (71, 12, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/枇杷叶瘦肉汤_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (72, 12, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/枇杷叶瘦肉汤_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (73, 13, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/沙参玉竹老鸭汤_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (74, 13, 2, '将沙参主料处理干净，切成适当大小', '将沙参主料处理干净，切成适当大小', 'Step 2: 将沙参主料处理干净，切成适当大小', '/images/steps/沙参玉竹老鸭汤_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (75, 13, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/沙参玉竹老鸭汤_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (76, 13, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/沙参玉竹老鸭汤_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (77, 13, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/沙参玉竹老鸭汤_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (78, 13, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/沙参玉竹老鸭汤_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (79, 14, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/罗汉果菊花茶_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (80, 14, 2, '将罗汉主料处理干净，切成适当大小', '将罗汉主料处理干净，切成适当大小', 'Step 2: 将罗汉主料处理干净，切成适当大小', '/images/steps/罗汉果菊花茶_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (81, 14, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/罗汉果菊花茶_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (82, 14, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/罗汉果菊花茶_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (83, 14, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/罗汉果菊花茶_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (84, 14, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/罗汉果菊花茶_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (85, 15, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/白萝卜蜂蜜饮_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (86, 15, 2, '将白萝主料处理干净，切成适当大小', '将白萝主料处理干净，切成适当大小', 'Step 2: 将白萝主料处理干净，切成适当大小', '/images/steps/白萝卜蜂蜜饮_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (87, 15, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/白萝卜蜂蜜饮_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (88, 15, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/白萝卜蜂蜜饮_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (89, 15, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/白萝卜蜂蜜饮_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (90, 15, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/白萝卜蜂蜜饮_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (91, 16, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/南北杏猪肺汤_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (92, 16, 2, '将南北主料处理干净，切成适当大小', '将南北主料处理干净，切成适当大小', 'Step 2: 将南北主料处理干净，切成适当大小', '/images/steps/南北杏猪肺汤_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (93, 16, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/南北杏猪肺汤_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (94, 16, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/南北杏猪肺汤_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (95, 16, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/南北杏猪肺汤_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (96, 16, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/南北杏猪肺汤_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (97, 17, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/当归红枣乌鸡汤_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (98, 17, 2, '将当归主料处理干净，切成适当大小', '将当归主料处理干净，切成适当大小', 'Step 2: 将当归主料处理干净，切成适当大小', '/images/steps/当归红枣乌鸡汤_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (99, 17, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/当归红枣乌鸡汤_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (100, 17, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/当归红枣乌鸡汤_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (101, 17, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/当归红枣乌鸡汤_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (102, 17, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/当归红枣乌鸡汤_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (103, 18, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/阿胶红糖粥_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (104, 18, 2, '将阿胶主料处理干净，切成适当大小', '将阿胶主料处理干净，切成适当大小', 'Step 2: 将阿胶主料处理干净，切成适当大小', '/images/steps/阿胶红糖粥_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (105, 18, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/阿胶红糖粥_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (106, 18, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/阿胶红糖粥_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (107, 18, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/阿胶红糖粥_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (108, 18, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/阿胶红糖粥_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (109, 19, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/枸杞桂圆红枣茶_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (110, 19, 2, '将枸杞主料处理干净，切成适当大小', '将枸杞主料处理干净，切成适当大小', 'Step 2: 将枸杞主料处理干净，切成适当大小', '/images/steps/枸杞桂圆红枣茶_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (111, 19, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/枸杞桂圆红枣茶_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (112, 19, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/枸杞桂圆红枣茶_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (113, 19, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/枸杞桂圆红枣茶_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (114, 19, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/枸杞桂圆红枣茶_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (115, 20, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/花生红衣猪蹄汤_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (116, 20, 2, '将花生主料处理干净，切成适当大小', '将花生主料处理干净，切成适当大小', 'Step 2: 将花生主料处理干净，切成适当大小', '/images/steps/花生红衣猪蹄汤_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (117, 20, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/花生红衣猪蹄汤_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (118, 20, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/花生红衣猪蹄汤_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (119, 20, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/花生红衣猪蹄汤_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (120, 20, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/花生红衣猪蹄汤_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (121, 21, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/四物汤_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (122, 21, 2, '将四物主料处理干净，切成适当大小', '将四物主料处理干净，切成适当大小', 'Step 2: 将四物主料处理干净，切成适当大小', '/images/steps/四物汤_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (123, 21, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/四物汤_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (124, 21, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/四物汤_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (125, 21, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/四物汤_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (126, 21, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/四物汤_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (127, 22, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/猪肝菠菜汤_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (128, 22, 2, '将猪肝主料处理干净，切成适当大小', '将猪肝主料处理干净，切成适当大小', 'Step 2: 将猪肝主料处理干净，切成适当大小', '/images/steps/猪肝菠菜汤_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (129, 22, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/猪肝菠菜汤_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (130, 22, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/猪肝菠菜汤_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (131, 22, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/猪肝菠菜汤_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (132, 22, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/猪肝菠菜汤_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (133, 23, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/黑芝麻糊_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (134, 23, 2, '将黑芝主料处理干净，切成适当大小', '将黑芝主料处理干净，切成适当大小', 'Step 2: 将黑芝主料处理干净，切成适当大小', '/images/steps/黑芝麻糊_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (135, 23, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/黑芝麻糊_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (136, 23, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/黑芝麻糊_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (137, 23, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/黑芝麻糊_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (138, 23, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/黑芝麻糊_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (139, 24, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/桂圆莲子羹_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (140, 24, 2, '将桂圆主料处理干净，切成适当大小', '将桂圆主料处理干净，切成适当大小', 'Step 2: 将桂圆主料处理干净，切成适当大小', '/images/steps/桂圆莲子羹_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (141, 24, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/桂圆莲子羹_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (142, 24, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/桂圆莲子羹_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (143, 24, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/桂圆莲子羹_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (144, 24, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/桂圆莲子羹_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (145, 25, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/红豆薏米补血粥_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (146, 25, 2, '将红豆主料处理干净，切成适当大小', '将红豆主料处理干净，切成适当大小', 'Step 2: 将红豆主料处理干净，切成适当大小', '/images/steps/红豆薏米补血粥_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (147, 25, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/红豆薏米补血粥_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (148, 25, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/红豆薏米补血粥_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (149, 25, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/红豆薏米补血粥_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (150, 25, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/红豆薏米补血粥_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (151, 26, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/酸枣仁安神茶_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (152, 26, 2, '将酸枣主料处理干净，切成适当大小', '将酸枣主料处理干净，切成适当大小', 'Step 2: 将酸枣主料处理干净，切成适当大小', '/images/steps/酸枣仁安神茶_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (153, 26, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/酸枣仁安神茶_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (154, 26, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/酸枣仁安神茶_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (155, 26, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/酸枣仁安神茶_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (156, 26, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/酸枣仁安神茶_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (157, 27, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/柏子仁粥_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (158, 27, 2, '将柏子主料处理干净，切成适当大小', '将柏子主料处理干净，切成适当大小', 'Step 2: 将柏子主料处理干净，切成适当大小', '/images/steps/柏子仁粥_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (159, 27, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/柏子仁粥_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (160, 27, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/柏子仁粥_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (161, 27, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/柏子仁粥_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (162, 27, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/柏子仁粥_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (163, 28, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/百合麦冬汤_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (164, 28, 2, '将百合主料处理干净，切成适当大小', '将百合主料处理干净，切成适当大小', 'Step 2: 将百合主料处理干净，切成适当大小', '/images/steps/百合麦冬汤_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (165, 28, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/百合麦冬汤_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (166, 28, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/百合麦冬汤_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (167, 28, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/百合麦冬汤_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (168, 28, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/百合麦冬汤_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (169, 29, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/龙眼肉粥_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (170, 29, 2, '将龙眼主料处理干净，切成适当大小', '将龙眼主料处理干净，切成适当大小', 'Step 2: 将龙眼主料处理干净，切成适当大小', '/images/steps/龙眼肉粥_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (171, 29, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/龙眼肉粥_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (172, 29, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/龙眼肉粥_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (173, 29, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/龙眼肉粥_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (174, 29, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/龙眼肉粥_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (175, 30, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/五味子茶_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (176, 30, 2, '将五味主料处理干净，切成适当大小', '将五味主料处理干净，切成适当大小', 'Step 2: 将五味主料处理干净，切成适当大小', '/images/steps/五味子茶_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (177, 30, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/五味子茶_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (178, 30, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/五味子茶_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (179, 30, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/五味子茶_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (180, 30, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/五味子茶_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (181, 31, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/远志莲子汤_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (182, 31, 2, '将远志主料处理干净，切成适当大小', '将远志主料处理干净，切成适当大小', 'Step 2: 将远志主料处理干净，切成适当大小', '/images/steps/远志莲子汤_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (183, 31, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/远志莲子汤_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (184, 31, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/远志莲子汤_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (185, 31, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/远志莲子汤_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (186, 31, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/远志莲子汤_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (187, 32, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/灵芝孢子粉饮_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (188, 32, 2, '将灵芝主料处理干净，切成适当大小', '将灵芝主料处理干净，切成适当大小', 'Step 2: 将灵芝主料处理干净，切成适当大小', '/images/steps/灵芝孢子粉饮_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (189, 32, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/灵芝孢子粉饮_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (190, 32, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/灵芝孢子粉饮_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (191, 32, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/灵芝孢子粉饮_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (192, 32, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/灵芝孢子粉饮_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (193, 33, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/桃胶银耳羹_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (194, 33, 2, '将桃胶主料处理干净，切成适当大小', '将桃胶主料处理干净，切成适当大小', 'Step 2: 将桃胶主料处理干净，切成适当大小', '/images/steps/桃胶银耳羹_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (195, 33, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/桃胶银耳羹_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (196, 33, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/桃胶银耳羹_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (197, 33, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/桃胶银耳羹_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (198, 33, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/桃胶银耳羹_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (199, 34, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/燕窝炖雪梨_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (200, 34, 2, '将燕窝主料处理干净，切成适当大小', '将燕窝主料处理干净，切成适当大小', 'Step 2: 将燕窝主料处理干净，切成适当大小', '/images/steps/燕窝炖雪梨_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (201, 34, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/燕窝炖雪梨_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (202, 34, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/燕窝炖雪梨_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (203, 34, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/燕窝炖雪梨_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (204, 34, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/燕窝炖雪梨_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (205, 35, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/玫瑰花茶_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (206, 35, 2, '将玫瑰主料处理干净，切成适当大小', '将玫瑰主料处理干净，切成适当大小', 'Step 2: 将玫瑰主料处理干净，切成适当大小', '/images/steps/玫瑰花茶_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (207, 35, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/玫瑰花茶_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (208, 35, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/玫瑰花茶_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (209, 35, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/玫瑰花茶_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (210, 35, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/玫瑰花茶_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (211, 36, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/木瓜炖雪蛤_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (212, 36, 2, '将木瓜主料处理干净，切成适当大小', '将木瓜主料处理干净，切成适当大小', 'Step 2: 将木瓜主料处理干净，切成适当大小', '/images/steps/木瓜炖雪蛤_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (213, 36, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/木瓜炖雪蛤_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (214, 36, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/木瓜炖雪蛤_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (215, 36, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/木瓜炖雪蛤_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (216, 36, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/木瓜炖雪蛤_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (217, 37, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/蜂蜜柠檬水_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (218, 37, 2, '将蜂蜜主料处理干净，切成适当大小', '将蜂蜜主料处理干净，切成适当大小', 'Step 2: 将蜂蜜主料处理干净，切成适当大小', '/images/steps/蜂蜜柠檬水_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (219, 37, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/蜂蜜柠檬水_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (220, 37, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/蜂蜜柠檬水_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (221, 37, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/蜂蜜柠檬水_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (222, 37, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/蜂蜜柠檬水_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (223, 38, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/紫薯银耳羹_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (224, 38, 2, '将紫薯主料处理干净，切成适当大小', '将紫薯主料处理干净，切成适当大小', 'Step 2: 将紫薯主料处理干净，切成适当大小', '/images/steps/紫薯银耳羹_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (225, 38, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/紫薯银耳羹_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (226, 38, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/紫薯银耳羹_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (227, 38, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/紫薯银耳羹_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (228, 38, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/紫薯银耳羹_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (229, 39, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/胶原蛋白汤_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (230, 39, 2, '将胶原主料处理干净，切成适当大小', '将胶原主料处理干净，切成适当大小', 'Step 2: 将胶原主料处理干净，切成适当大小', '/images/steps/胶原蛋白汤_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (231, 39, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/胶原蛋白汤_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (232, 39, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/胶原蛋白汤_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (233, 39, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/胶原蛋白汤_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (234, 39, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/胶原蛋白汤_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (235, 40, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/绿豆汤_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (236, 40, 2, '将绿豆主料处理干净，切成适当大小', '将绿豆主料处理干净，切成适当大小', 'Step 2: 将绿豆主料处理干净，切成适当大小', '/images/steps/绿豆汤_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (237, 40, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/绿豆汤_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (238, 40, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/绿豆汤_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (239, 40, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/绿豆汤_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (240, 40, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/绿豆汤_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (241, 41, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/苦瓜排骨汤_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (242, 41, 2, '将苦瓜主料处理干净，切成适当大小', '将苦瓜主料处理干净，切成适当大小', 'Step 2: 将苦瓜主料处理干净，切成适当大小', '/images/steps/苦瓜排骨汤_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (243, 41, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/苦瓜排骨汤_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (244, 41, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/苦瓜排骨汤_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (245, 41, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/苦瓜排骨汤_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (246, 41, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/苦瓜排骨汤_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (247, 42, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/金银花菊花茶_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (248, 42, 2, '将金银主料处理干净，切成适当大小', '将金银主料处理干净，切成适当大小', 'Step 2: 将金银主料处理干净，切成适当大小', '/images/steps/金银花菊花茶_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (249, 42, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/金银花菊花茶_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (250, 42, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/金银花菊花茶_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (251, 42, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/金银花菊花茶_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (252, 42, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/金银花菊花茶_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (253, 43, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/冬瓜薏米汤_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (254, 43, 2, '将冬瓜主料处理干净，切成适当大小', '将冬瓜主料处理干净，切成适当大小', 'Step 2: 将冬瓜主料处理干净，切成适当大小', '/images/steps/冬瓜薏米汤_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (255, 43, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/冬瓜薏米汤_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (256, 43, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/冬瓜薏米汤_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (257, 43, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/冬瓜薏米汤_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (258, 43, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/冬瓜薏米汤_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (259, 44, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/蒲公英茶_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (260, 44, 2, '将蒲公主料处理干净，切成适当大小', '将蒲公主料处理干净，切成适当大小', 'Step 2: 将蒲公主料处理干净，切成适当大小', '/images/steps/蒲公英茶_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (261, 44, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/蒲公英茶_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (262, 44, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/蒲公英茶_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (263, 44, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/蒲公英茶_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (264, 44, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/蒲公英茶_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (265, 45, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/莲藕排骨汤_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (266, 45, 2, '将莲藕主料处理干净，切成适当大小', '将莲藕主料处理干净，切成适当大小', 'Step 2: 将莲藕主料处理干净，切成适当大小', '/images/steps/莲藕排骨汤_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (267, 45, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/莲藕排骨汤_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (268, 45, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/莲藕排骨汤_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (269, 45, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/莲藕排骨汤_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (270, 45, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/莲藕排骨汤_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (271, 46, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/芹菜汁_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (272, 46, 2, '将芹菜主料处理干净，切成适当大小', '将芹菜主料处理干净，切成适当大小', 'Step 2: 将芹菜主料处理干净，切成适当大小', '/images/steps/芹菜汁_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (273, 46, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/芹菜汁_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (274, 46, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/芹菜汁_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (275, 46, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/芹菜汁_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (276, 46, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/芹菜汁_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (277, 47, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/山楂荷叶茶_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (278, 47, 2, '将山楂主料处理干净，切成适当大小', '将山楂主料处理干净，切成适当大小', 'Step 2: 将山楂主料处理干净，切成适当大小', '/images/steps/山楂荷叶茶_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (279, 47, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/山楂荷叶茶_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (280, 47, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/山楂荷叶茶_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (281, 47, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/山楂荷叶茶_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (282, 47, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/山楂荷叶茶_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (283, 48, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/决明子茶_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (284, 48, 2, '将决明主料处理干净，切成适当大小', '将决明主料处理干净，切成适当大小', 'Step 2: 将决明主料处理干净，切成适当大小', '/images/steps/决明子茶_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (285, 48, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/决明子茶_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (286, 48, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/决明子茶_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (287, 48, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/决明子茶_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (288, 48, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/决明子茶_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (289, 49, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/黑木耳红枣汤_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (290, 49, 2, '将黑木主料处理干净，切成适当大小', '将黑木主料处理干净，切成适当大小', 'Step 2: 将黑木主料处理干净，切成适当大小', '/images/steps/黑木耳红枣汤_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (291, 49, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/黑木耳红枣汤_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (292, 49, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/黑木耳红枣汤_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (293, 49, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/黑木耳红枣汤_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (294, 49, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/黑木耳红枣汤_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (295, 50, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/海带豆腐汤_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (296, 50, 2, '将海带主料处理干净，切成适当大小', '将海带主料处理干净，切成适当大小', 'Step 2: 将海带主料处理干净，切成适当大小', '/images/steps/海带豆腐汤_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (297, 50, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/海带豆腐汤_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (298, 50, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/海带豆腐汤_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (299, 50, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/海带豆腐汤_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (300, 50, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/海带豆腐汤_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (301, 51, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/燕麦粥_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (302, 51, 2, '将燕麦主料处理干净，切成适当大小', '将燕麦主料处理干净，切成适当大小', 'Step 2: 将燕麦主料处理干净，切成适当大小', '/images/steps/燕麦粥_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (303, 51, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/燕麦粥_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (304, 51, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/燕麦粥_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (305, 51, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/燕麦粥_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (306, 51, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/燕麦粥_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (307, 52, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/黄芪党参鸡汤_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (308, 52, 2, '将黄芪主料处理干净，切成适当大小', '将黄芪主料处理干净，切成适当大小', 'Step 2: 将黄芪主料处理干净，切成适当大小', '/images/steps/黄芪党参鸡汤_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (309, 52, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/黄芪党参鸡汤_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (310, 52, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/黄芪党参鸡汤_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (311, 52, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/黄芪党参鸡汤_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (312, 52, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/黄芪党参鸡汤_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (313, 53, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/虫草花炖排骨_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (314, 53, 2, '将虫草主料处理干净，切成适当大小', '将虫草主料处理干净，切成适当大小', 'Step 2: 将虫草主料处理干净，切成适当大小', '/images/steps/虫草花炖排骨_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (315, 53, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/虫草花炖排骨_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (316, 53, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/虫草花炖排骨_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (317, 53, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/虫草花炖排骨_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (318, 53, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/虫草花炖排骨_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (319, 54, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/灵芝煲鸡汤_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (320, 54, 2, '将灵芝主料处理干净，切成适当大小', '将灵芝主料处理干净，切成适当大小', 'Step 2: 将灵芝主料处理干净，切成适当大小', '/images/steps/灵芝煲鸡汤_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (321, 54, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/灵芝煲鸡汤_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (322, 54, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/灵芝煲鸡汤_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (323, 54, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/灵芝煲鸡汤_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (324, 54, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/灵芝煲鸡汤_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (325, 55, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/人参枸杞茶_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (326, 55, 2, '将人参主料处理干净，切成适当大小', '将人参主料处理干净，切成适当大小', 'Step 2: 将人参主料处理干净，切成适当大小', '/images/steps/人参枸杞茶_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (327, 55, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/人参枸杞茶_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (328, 55, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/人参枸杞茶_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (329, 55, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/人参枸杞茶_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (330, 55, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/人参枸杞茶_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (331, 56, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/花胶炖鸡汤_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (332, 56, 2, '将花胶主料处理干净，切成适当大小', '将花胶主料处理干净，切成适当大小', 'Step 2: 将花胶主料处理干净，切成适当大小', '/images/steps/花胶炖鸡汤_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (333, 56, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/花胶炖鸡汤_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (334, 56, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/花胶炖鸡汤_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (335, 56, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/花胶炖鸡汤_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (336, 56, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/花胶炖鸡汤_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (337, 57, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/牛蒡排骨汤_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (338, 57, 2, '将牛蒡主料处理干净，切成适当大小', '将牛蒡主料处理干净，切成适当大小', 'Step 2: 将牛蒡主料处理干净，切成适当大小', '/images/steps/牛蒡排骨汤_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (339, 57, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/牛蒡排骨汤_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (340, 57, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/牛蒡排骨汤_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (341, 57, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/牛蒡排骨汤_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (342, 57, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/牛蒡排骨汤_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (343, 58, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/红豆薏米水_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (344, 58, 2, '将红豆主料处理干净，切成适当大小', '将红豆主料处理干净，切成适当大小', 'Step 2: 将红豆主料处理干净，切成适当大小', '/images/steps/红豆薏米水_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (345, 58, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/红豆薏米水_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (346, 58, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/红豆薏米水_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (347, 58, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/红豆薏米水_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (348, 58, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/红豆薏米水_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (349, 59, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/茯苓白术汤_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (350, 59, 2, '将茯苓主料处理干净，切成适当大小', '将茯苓主料处理干净，切成适当大小', 'Step 2: 将茯苓主料处理干净，切成适当大小', '/images/steps/茯苓白术汤_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (351, 59, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/茯苓白术汤_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (352, 59, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/茯苓白术汤_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (353, 59, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/茯苓白术汤_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (354, 59, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/茯苓白术汤_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (355, 60, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/冬瓜荷叶汤_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (356, 60, 2, '将冬瓜主料处理干净，切成适当大小', '将冬瓜主料处理干净，切成适当大小', 'Step 2: 将冬瓜主料处理干净，切成适当大小', '/images/steps/冬瓜荷叶汤_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (357, 60, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/冬瓜荷叶汤_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (358, 60, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/冬瓜荷叶汤_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (359, 60, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/冬瓜荷叶汤_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (360, 60, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/冬瓜荷叶汤_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (361, 61, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/玉米须茶_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (362, 61, 2, '将玉米主料处理干净，切成适当大小', '将玉米主料处理干净，切成适当大小', 'Step 2: 将玉米主料处理干净，切成适当大小', '/images/steps/玉米须茶_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (363, 61, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/玉米须茶_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (364, 61, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/玉米须茶_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (365, 61, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/玉米须茶_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (366, 61, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/玉米须茶_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (367, 62, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/赤小豆鲫鱼汤_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (368, 62, 2, '将赤小主料处理干净，切成适当大小', '将赤小主料处理干净，切成适当大小', 'Step 2: 将赤小主料处理干净，切成适当大小', '/images/steps/赤小豆鲫鱼汤_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (369, 62, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/赤小豆鲫鱼汤_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (370, 62, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/赤小豆鲫鱼汤_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (371, 62, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/赤小豆鲫鱼汤_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (372, 62, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/赤小豆鲫鱼汤_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (373, 63, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/土茯苓煲龟_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (374, 63, 2, '将土茯主料处理干净，切成适当大小', '将土茯主料处理干净，切成适当大小', 'Step 2: 将土茯主料处理干净，切成适当大小', '/images/steps/土茯苓煲龟_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (375, 63, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/土茯苓煲龟_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (376, 63, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/土茯苓煲龟_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (377, 63, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/土茯苓煲龟_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (378, 63, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/土茯苓煲龟_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (379, 64, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/杜仲猪腰汤_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (380, 64, 2, '将杜仲主料处理干净，切成适当大小', '将杜仲主料处理干净，切成适当大小', 'Step 2: 将杜仲主料处理干净，切成适当大小', '/images/steps/杜仲猪腰汤_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (381, 64, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/杜仲猪腰汤_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (382, 64, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/杜仲猪腰汤_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (383, 64, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/杜仲猪腰汤_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (384, 64, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/杜仲猪腰汤_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (385, 65, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/枸杞羊肉汤_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (386, 65, 2, '将枸杞主料处理干净，切成适当大小', '将枸杞主料处理干净，切成适当大小', 'Step 2: 将枸杞主料处理干净，切成适当大小', '/images/steps/枸杞羊肉汤_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (387, 65, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/枸杞羊肉汤_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (388, 65, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/枸杞羊肉汤_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (389, 65, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/枸杞羊肉汤_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (390, 65, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/枸杞羊肉汤_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (391, 66, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/韭菜炒虾仁_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (392, 66, 2, '将韭菜主料处理干净，切成适当大小', '将韭菜主料处理干净，切成适当大小', 'Step 2: 将韭菜主料处理干净，切成适当大小', '/images/steps/韭菜炒虾仁_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (393, 66, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/韭菜炒虾仁_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (394, 66, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/韭菜炒虾仁_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (395, 66, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/韭菜炒虾仁_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (396, 66, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/韭菜炒虾仁_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (397, 67, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/核桃仁粥_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (398, 67, 2, '将核桃主料处理干净，切成适当大小', '将核桃主料处理干净，切成适当大小', 'Step 2: 将核桃主料处理干净，切成适当大小', '/images/steps/核桃仁粥_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (399, 67, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/核桃仁粥_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (400, 67, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/核桃仁粥_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (401, 67, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/核桃仁粥_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (402, 67, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/核桃仁粥_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (403, 68, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/海参小米粥_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (404, 68, 2, '将海参主料处理干净，切成适当大小', '将海参主料处理干净，切成适当大小', 'Step 2: 将海参主料处理干净，切成适当大小', '/images/steps/海参小米粥_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (405, 68, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/海参小米粥_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (406, 68, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/海参小米粥_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (407, 68, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/海参小米粥_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (408, 68, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/海参小米粥_6.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (409, 69, 1, '准备所有食材，清洗干净', '准备所有食材，清洗干净', 'Step 1: 准备所有食材，清洗干净', '/images/steps/肉苁蓉炖羊肉_1.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (410, 69, 2, '将肉苁主料处理干净，切成适当大小', '将肉苁主料处理干净，切成适当大小', 'Step 2: 将肉苁主料处理干净，切成适当大小', '/images/steps/肉苁蓉炖羊肉_2.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (411, 69, 3, '锅中加入适量清水，大火烧开', '锅中加入适量清水，大火烧开', 'Step 3: 锅中加入适量清水，大火烧开', '/images/steps/肉苁蓉炖羊肉_3.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (412, 69, 4, '放入主料，转小火慢炖', '放入主料，转小火慢炖', 'Step 4: 放入主料，转小火慢炖', '/images/steps/肉苁蓉炖羊肉_4.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (413, 69, 5, '加入辅料，继续炖煮', '加入辅料，继续炖煮', 'Step 5: 加入辅料，继续炖煮', '/images/steps/肉苁蓉炖羊肉_5.jpg');
INSERT INTO recipe_steps (id, recipe_id, step_order, description_zh_cn, description_zh_tw, description_en, image)
VALUES (414, 69, 6, '调味出锅，趁热食用', '调味出锅，趁热食用', 'Step 6: 调味出锅，趁热食用', '/images/steps/肉苁蓉炖羊肉_6.jpg');

SELECT '步骤数据插入完成: 414条' AS message;

-- ============================================
-- 5. 内容数据 (30条)
-- ============================================

INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (1, '白领熬夜党必备养生食谱', 'wechat_video', 'https://example.com/content/1', '/images/contents/content_1.jpg', '养生达人小王', 'video', '["节气", "美食", "养生"]', 5494, 1, '2026-03-02 23:47:20', '2026-03-02 23:47:20');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (2, '减肥瘦身食疗方', 'wechat_video', 'https://example.com/content/2', '/images/contents/content_2.jpg', '食疗养生专家', 'video', '["美食", "健康", "中医"]', 7046, 1, '2026-03-07 23:47:20', '2026-03-07 23:47:20');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (3, '产后恢复食疗方', 'wechat_article', 'https://example.com/content/3', '/images/contents/content_3.jpg', '中医食疗大全', 'article', '["养生", "美食", "食疗"]', 1929, 1, '2026-01-19 23:47:20', '2026-01-19 23:47:20');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (4, '节气养生食疗指南', 'wechat_video', 'https://example.com/content/4', '/images/contents/content_4.jpg', '中医养生堂', 'video', '["食疗", "养生", "中医"]', 3441, 1, '2026-03-09 23:47:20', '2026-03-09 23:47:20');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (5, '补气养血的食疗秘方', 'douyin', 'https://example.com/content/5', '/images/contents/content_5.jpg', '健康美食家', 'video', '["食疗", "节气", "养生"]', 2864, 1, '2026-01-20 23:47:20', '2026-01-20 23:47:20');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (6, '早餐养生粥谱推荐', 'self', 'https://example.com/content/6', '/images/contents/content_6.jpg', 'Health-Diet官方', 'article', '["节气", "美食", "中医"]', 3541, 1, '2026-01-26 23:47:20', '2026-01-26 23:47:20');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (7, '美容养颜食疗食谱', 'douyin', 'https://example.com/content/7', '/images/contents/content_7.jpg', '老中医食疗', 'video', '["食疗", "中医", "健康"]', 881, 1, '2026-02-08 23:47:20', '2026-02-08 23:47:20');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (8, '夏季清热解暑食疗方推荐', 'wechat_article', 'https://example.com/content/8', '/images/contents/content_8.jpg', '健康生活指南', 'article', '["节气", "养生", "食疗"]', 5465, 1, '2026-02-23 23:47:20', '2026-02-23 23:47:20');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (9, '产后恢复食疗方', 'wechat_article', 'https://example.com/content/9', '/images/contents/content_9.jpg', '健康生活指南', 'article', '["美食", "食疗", "节气"]', 3031, 1, '2026-02-17 23:47:20', '2026-02-17 23:47:20');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (10, '儿童健脾养胃营养餐', 'wechat_article', 'https://example.com/content/10', '/images/contents/content_10.jpg', '养生食谱精选', 'article', '["养生", "中医", "健康"]', 4087, 1, '2026-02-02 23:47:20', '2026-02-02 23:47:20');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (11, '养胃护胃食疗大全', 'wechat_article', 'https://example.com/content/11', '/images/contents/content_11.jpg', '中医食疗大全', 'article', '["中医", "保健", "食疗"]', 3849, 1, '2026-01-20 23:47:20', '2026-01-20 23:47:20');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (12, '增强免疫力的食疗方', 'wechat_video', 'https://example.com/content/12', '/images/contents/content_12.jpg', '食疗养生专家', 'video', '["健康", "美食", "中医"]', 2273, 1, '2026-02-27 23:47:20', '2026-02-27 23:47:20');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (13, '运动员营养食疗', 'douyin', 'https://example.com/content/13', '/images/contents/content_13.jpg', '健康美食家', 'video', '["健康", "保健", "养生"]', 1250, 1, '2026-02-05 23:47:20', '2026-02-05 23:47:20');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (14, '润肺止咳食疗秘方', 'self', 'https://example.com/content/14', '/images/contents/content_14.jpg', 'Health-Diet官方', 'article', '["养生", "中医", "美食"]', 4398, 1, '2026-01-14 23:47:20', '2026-01-14 23:47:20');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (15, '降压降脂食疗食谱', 'wechat_video', 'https://example.com/content/15', '/images/contents/content_15.jpg', '养生达人小王', 'video', '["食疗", "美食", "养生"]', 4011, 1, '2026-01-12 23:47:20', '2026-01-12 23:47:20');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (16, '办公室养生茶饮推荐', 'wechat_video', 'https://example.com/content/16', '/images/contents/content_16.jpg', '养生达人小王', 'video', '["节气", "保健", "美食"]', 5168, 1, '2026-01-25 23:47:20', '2026-01-25 23:47:20');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (17, '运动员营养食疗', 'self', 'https://example.com/content/17', '/images/contents/content_17.jpg', 'Health-Diet官方', 'article', '["养生", "保健", "健康"]', 9613, 1, '2026-02-22 23:47:20', '2026-02-22 23:47:20');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (18, '学生健脑食疗方', 'self', 'https://example.com/content/18', '/images/contents/content_18.jpg', 'Health-Diet官方', 'article', '["健康", "养生", "美食"]', 2404, 1, '2026-01-18 23:47:20', '2026-01-18 23:47:20');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (19, '安神助眠的食疗方案', 'self', 'https://example.com/content/19', '/images/contents/content_19.jpg', 'Health-Diet官方', 'article', '["保健", "健康", "节气"]', 2182, 1, '2026-01-14 23:47:20', '2026-01-14 23:47:20');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (20, '祛湿排毒食疗方推荐', 'douyin', 'https://example.com/content/20', '/images/contents/content_20.jpg', '健康美食家', 'video', '["美食", "节气", "中医"]', 5765, 1, '2026-02-02 23:47:20', '2026-02-02 23:47:20');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (21, '节气养生食疗指南', 'wechat_video', 'https://example.com/content/21', '/images/contents/content_21.jpg', '中医养生堂', 'video', '["保健", "食疗", "健康"]', 7660, 1, '2026-02-05 23:47:20', '2026-02-05 23:47:20');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (22, '白领熬夜党必备养生食谱', 'wechat_video', 'https://example.com/content/22', '/images/contents/content_22.jpg', '养生达人小王', 'video', '["美食", "健康", "节气"]', 4501, 1, '2026-01-20 23:47:20', '2026-01-20 23:47:20');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (23, '早餐养生粥谱推荐', 'wechat_article', 'https://example.com/content/23', '/images/contents/content_23.jpg', '中医食疗大全', 'article', '["中医", "美食", "养生"]', 8547, 1, '2026-02-02 23:47:20', '2026-02-02 23:47:20');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (24, '安神助眠的食疗方案', 'wechat_video', 'https://example.com/content/24', '/images/contents/content_24.jpg', '中医养生堂', 'video', '["节气", "美食", "食疗"]', 643, 1, '2026-02-15 23:47:20', '2026-02-15 23:47:20');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (25, '四季养生食疗指南', 'wechat_article', 'https://example.com/content/25', '/images/contents/content_25.jpg', '健康生活指南', 'article', '["保健", "健康", "食疗"]', 3980, 1, '2026-01-18 23:47:20', '2026-01-18 23:47:20');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (26, '清热解毒食疗方案', 'douyin', 'https://example.com/content/26', '/images/contents/content_26.jpg', '健康美食家', 'video', '["养生", "节气", "中医"]', 6227, 1, '2026-02-01 23:47:20', '2026-02-01 23:47:20');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (27, '中老年人的养胃食疗方案', 'wechat_article', 'https://example.com/content/27', '/images/contents/content_27.jpg', '中医食疗大全', 'article', '["中医", "食疗", "节气"]', 8542, 1, '2026-02-27 23:47:20', '2026-02-27 23:47:20');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (28, '清热解毒食疗方案', 'douyin', 'https://example.com/content/28', '/images/contents/content_28.jpg', '养生小姐姐', 'video', '["食疗", "中医", "健康"]', 2540, 1, '2026-02-26 23:47:20', '2026-02-26 23:47:20');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (29, '白领熬夜党必备养生食谱', 'wechat_article', 'https://example.com/content/29', '/images/contents/content_29.jpg', '健康生活指南', 'article', '["健康", "中医", "节气"]', 9007, 1, '2026-02-28 23:47:20', '2026-02-28 23:47:20');
INSERT INTO contents (id, title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at)
VALUES (30, '夏季清热解暑食疗方推荐', 'douyin', 'https://example.com/content/30', '/images/contents/content_30.jpg', '健康美食家', 'video', '["食疗", "健康", "保健"]', 5320, 1, '2026-02-26 23:47:20', '2026-02-26 23:47:20');

SELECT '内容数据插入完成: 30条' AS message;

-- ============================================
-- 6. 收藏数据
-- ============================================

INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (1, 1, 2, '2026-02-03 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (2, 1, 9, '2026-01-19 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (3, 1, 28, '2026-03-04 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (4, 1, 64, '2026-02-27 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (5, 1, 38, '2026-02-21 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (6, 1, 3, '2026-02-26 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (7, 1, 63, '2026-03-02 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (8, 1, 4, '2026-02-18 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (9, 1, 56, '2026-01-16 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (10, 1, 33, '2026-02-05 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (11, 2, 49, '2026-01-30 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (12, 2, 22, '2026-02-02 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (13, 2, 28, '2026-02-01 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (14, 2, 7, '2026-02-12 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (15, 2, 63, '2026-01-20 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (16, 2, 9, '2026-02-02 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (17, 2, 35, '2026-02-08 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (18, 2, 29, '2026-03-01 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (19, 2, 10, '2026-02-03 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (20, 2, 67, '2026-02-14 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (21, 3, 60, '2026-02-06 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (22, 3, 13, '2026-01-22 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (23, 3, 39, '2026-01-10 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (24, 3, 30, '2026-01-23 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (25, 3, 23, '2026-01-10 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (26, 3, 33, '2026-02-27 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (27, 3, 28, '2026-02-14 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (28, 3, 57, '2026-01-24 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (29, 3, 26, '2026-01-22 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (30, 3, 3, '2026-01-19 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (31, 4, 12, '2026-02-27 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (32, 4, 19, '2026-02-09 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (33, 4, 57, '2026-02-26 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (34, 4, 5, '2026-02-03 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (35, 4, 38, '2026-02-10 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (36, 4, 54, '2026-02-16 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (37, 4, 31, '2026-01-18 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (38, 4, 63, '2026-01-23 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (39, 5, 46, '2026-01-26 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (40, 5, 43, '2026-02-14 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (41, 5, 39, '2026-02-23 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (42, 5, 2, '2026-01-14 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (43, 5, 42, '2026-03-01 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (44, 5, 28, '2026-02-27 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (45, 5, 45, '2026-01-20 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (46, 5, 9, '2026-02-03 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (47, 6, 16, '2026-02-19 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (48, 6, 10, '2026-03-02 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (49, 6, 59, '2026-02-22 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (50, 6, 30, '2026-02-14 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (51, 6, 66, '2026-03-06 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (52, 6, 17, '2026-03-03 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (53, 6, 14, '2026-02-14 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (54, 6, 55, '2026-01-18 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (55, 6, 37, '2026-01-15 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (56, 6, 15, '2026-02-09 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (57, 6, 39, '2026-02-26 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (58, 6, 19, '2026-01-17 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (59, 7, 20, '2026-02-02 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (60, 7, 54, '2026-01-28 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (61, 7, 46, '2026-02-15 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (62, 7, 17, '2026-01-11 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (63, 7, 53, '2026-01-12 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (64, 7, 32, '2026-02-22 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (65, 8, 38, '2026-02-24 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (66, 8, 4, '2026-01-21 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (67, 8, 13, '2026-01-18 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (68, 8, 16, '2026-02-19 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (69, 8, 69, '2026-02-18 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (70, 8, 61, '2026-03-09 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (71, 8, 57, '2026-03-02 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (72, 8, 9, '2026-01-26 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (73, 8, 34, '2026-01-12 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (74, 9, 39, '2026-02-26 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (75, 9, 7, '2026-03-06 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (76, 9, 41, '2026-01-11 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (77, 9, 60, '2026-02-17 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (78, 9, 56, '2026-02-25 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (79, 9, 28, '2026-01-29 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (80, 9, 25, '2026-01-16 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (81, 9, 30, '2026-01-09 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (82, 9, 26, '2026-02-23 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (83, 9, 6, '2026-01-11 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (84, 9, 57, '2026-02-15 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (85, 9, 44, '2026-02-24 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (86, 9, 47, '2026-01-23 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (87, 10, 23, '2026-02-24 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (88, 10, 1, '2026-02-15 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (89, 10, 65, '2026-01-11 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (90, 10, 10, '2026-02-17 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (91, 10, 49, '2026-01-23 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (92, 11, 48, '2026-02-08 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (93, 11, 42, '2026-02-12 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (94, 11, 12, '2026-02-09 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (95, 11, 13, '2026-02-11 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (96, 11, 19, '2026-02-20 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (97, 11, 8, '2026-02-11 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (98, 11, 56, '2026-01-26 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (99, 11, 7, '2026-01-12 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (100, 12, 53, '2026-03-08 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (101, 12, 48, '2026-01-24 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (102, 12, 9, '2026-01-18 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (103, 12, 63, '2026-02-14 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (104, 12, 22, '2026-02-03 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (105, 12, 29, '2026-02-20 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (106, 13, 17, '2026-03-08 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (107, 13, 18, '2026-01-26 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (108, 13, 10, '2026-03-06 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (109, 13, 8, '2026-01-17 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (110, 13, 6, '2026-01-10 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (111, 13, 30, '2026-02-18 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (112, 13, 49, '2026-02-16 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (113, 13, 44, '2026-01-12 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (114, 13, 32, '2026-02-15 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (115, 13, 46, '2026-02-13 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (116, 13, 59, '2026-01-29 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (117, 13, 54, '2026-03-08 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (118, 13, 51, '2026-02-22 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (119, 13, 29, '2026-03-01 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (120, 13, 63, '2026-01-26 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (121, 14, 8, '2026-02-07 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (122, 14, 43, '2026-02-02 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (123, 14, 9, '2026-03-07 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (124, 14, 67, '2026-03-09 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (125, 14, 33, '2026-01-22 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (126, 14, 27, '2026-01-27 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (127, 14, 6, '2026-02-07 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (128, 14, 57, '2026-02-15 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (129, 14, 44, '2026-01-30 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (130, 14, 42, '2026-01-10 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (131, 14, 35, '2026-02-08 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (132, 14, 26, '2026-02-23 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (133, 14, 55, '2026-03-07 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (134, 14, 56, '2026-03-04 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (135, 15, 41, '2026-02-16 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (136, 15, 7, '2026-02-18 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (137, 15, 39, '2026-02-28 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (138, 15, 35, '2026-01-26 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (139, 15, 68, '2026-02-09 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (140, 15, 45, '2026-01-14 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (141, 15, 13, '2026-02-14 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (142, 15, 42, '2026-02-13 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (143, 15, 25, '2026-01-17 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (144, 15, 14, '2026-02-14 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (145, 16, 22, '2026-01-30 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (146, 16, 26, '2026-02-15 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (147, 16, 42, '2026-02-05 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (148, 16, 17, '2026-03-05 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (149, 16, 63, '2026-01-14 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (150, 16, 34, '2026-02-07 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (151, 16, 5, '2026-02-07 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (152, 16, 3, '2026-01-23 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (153, 16, 35, '2026-02-28 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (154, 16, 30, '2026-02-16 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (155, 16, 32, '2026-01-25 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (156, 16, 43, '2026-03-06 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (157, 16, 44, '2026-02-06 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (158, 16, 29, '2026-01-26 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (159, 17, 18, '2026-02-18 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (160, 17, 38, '2026-01-19 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (161, 17, 30, '2026-01-21 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (162, 17, 34, '2026-02-18 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (163, 17, 2, '2026-03-05 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (164, 17, 54, '2026-01-19 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (165, 17, 22, '2026-01-17 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (166, 17, 39, '2026-02-18 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (167, 17, 15, '2026-03-04 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (168, 17, 55, '2026-02-15 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (169, 18, 2, '2026-01-28 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (170, 18, 6, '2026-01-12 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (171, 18, 52, '2026-01-10 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (172, 18, 18, '2026-02-27 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (173, 18, 67, '2026-02-28 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (174, 18, 29, '2026-02-25 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (175, 18, 20, '2026-01-28 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (176, 18, 63, '2026-03-08 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (177, 18, 55, '2026-02-19 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (178, 18, 24, '2026-01-16 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (179, 19, 40, '2026-02-26 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (180, 19, 22, '2026-01-23 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (181, 19, 14, '2026-01-29 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (182, 19, 33, '2026-01-28 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (183, 19, 65, '2026-02-15 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (184, 19, 52, '2026-03-03 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (185, 19, 39, '2026-02-18 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (186, 19, 38, '2026-01-17 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (187, 19, 44, '2026-02-23 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (188, 19, 59, '2026-02-01 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (189, 19, 36, '2026-02-01 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (190, 19, 47, '2026-01-11 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (191, 20, 52, '2026-03-03 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (192, 20, 5, '2026-01-20 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (193, 20, 25, '2026-02-04 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (194, 20, 15, '2026-01-28 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (195, 20, 30, '2026-01-29 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (196, 20, 38, '2026-02-13 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (197, 20, 44, '2026-01-22 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (198, 20, 48, '2026-01-17 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (199, 20, 45, '2026-01-26 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (200, 20, 32, '2026-02-21 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (201, 20, 16, '2026-01-26 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (202, 20, 18, '2026-02-03 23:47:20');
INSERT INTO favorites (id, user_id, recipe_id, created_at)
VALUES (203, 20, 50, '2026-02-26 23:47:20');

SELECT '收藏数据插入完成: 203条' AS message;

-- ============================================
-- 7. 浏览历史数据
-- ============================================

INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (1, 1, 41, '2026-03-07 00:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-07 00:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (2, 1, 66, '2026-03-04 20:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-04 20:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (3, 1, 21, '2026-02-11 02:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-11 02:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (4, 1, 48, '2026-02-25 12:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-25 12:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (5, 1, 52, '2026-03-06 19:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-06 19:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (6, 1, 64, '2026-02-08 17:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-08 17:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (7, 1, 29, '2026-03-08 00:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-08 00:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (8, 1, 33, '2026-02-20 22:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-20 22:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (9, 1, 43, '2026-03-08 06:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-08 06:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (10, 1, 9, '2026-02-16 08:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-16 08:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (11, 1, 54, '2026-02-18 01:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-18 01:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (12, 1, 30, '2026-02-11 15:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-11 15:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (13, 1, 50, '2026-02-19 08:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-19 08:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (14, 1, 34, '2026-02-11 04:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-11 04:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (15, 1, 61, '2026-02-08 15:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-08 15:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (16, 1, 42, '2026-02-27 16:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-27 16:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (17, 2, 9, '2026-03-07 18:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-07 18:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (18, 2, 69, '2026-02-24 17:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-24 17:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (19, 2, 66, '2026-03-08 09:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-08 09:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (20, 2, 25, '2026-03-07 12:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-07 12:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (21, 2, 14, '2026-03-01 14:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-01 14:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (22, 2, 47, '2026-02-09 05:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-09 05:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (23, 2, 18, '2026-02-11 18:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-11 18:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (24, 2, 19, '2026-02-27 23:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-27 23:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (25, 2, 35, '2026-02-15 18:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-15 18:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (26, 2, 48, '2026-02-18 01:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-18 01:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (27, 2, 31, '2026-02-28 07:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-28 07:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (28, 2, 24, '2026-02-19 18:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-19 18:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (29, 2, 43, '2026-02-26 16:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-26 16:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (30, 2, 65, '2026-02-19 09:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-19 09:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (31, 2, 27, '2026-03-06 02:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-06 02:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (32, 2, 10, '2026-02-17 08:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-17 08:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (33, 2, 12, '2026-02-13 13:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-13 13:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (34, 2, 63, '2026-02-16 00:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-16 00:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (35, 2, 60, '2026-03-03 15:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-03 15:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (36, 3, 4, '2026-02-13 06:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-13 06:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (37, 3, 17, '2026-02-25 06:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-25 06:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (38, 3, 42, '2026-03-08 21:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-08 21:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (39, 3, 60, '2026-02-28 02:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-28 02:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (40, 3, 27, '2026-02-08 17:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-08 17:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (41, 3, 47, '2026-03-07 05:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-07 05:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (42, 3, 6, '2026-02-25 19:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-25 19:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (43, 3, 12, '2026-02-12 04:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-12 04:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (44, 3, 19, '2026-02-24 02:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-24 02:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (45, 3, 10, '2026-03-04 16:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-04 16:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (46, 3, 67, '2026-02-19 14:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-19 14:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (47, 3, 35, '2026-03-04 19:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-04 19:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (48, 3, 32, '2026-02-08 10:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-08 10:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (49, 3, 28, '2026-03-05 14:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-05 14:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (50, 3, 55, '2026-03-04 02:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-04 02:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (51, 3, 41, '2026-02-11 06:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-11 06:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (52, 3, 61, '2026-02-19 09:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-19 09:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (53, 3, 30, '2026-02-14 17:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-14 17:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (54, 3, 29, '2026-02-22 12:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-22 12:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (55, 3, 2, '2026-02-13 18:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-13 18:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (56, 3, 54, '2026-02-25 12:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-25 12:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (57, 3, 46, '2026-02-22 11:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-22 11:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (58, 3, 38, '2026-02-14 19:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-14 19:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (59, 3, 65, '2026-02-28 08:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-28 08:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (60, 3, 51, '2026-03-09 10:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-09 10:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (61, 3, 57, '2026-02-09 01:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-09 01:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (62, 3, 21, '2026-02-25 21:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-25 21:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (63, 3, 58, '2026-03-05 22:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-05 22:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (64, 3, 69, '2026-02-18 10:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-18 10:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (65, 4, 23, '2026-02-25 15:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-25 15:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (66, 4, 39, '2026-02-21 18:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-21 18:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (67, 4, 17, '2026-02-28 21:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-28 21:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (68, 4, 13, '2026-02-26 03:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-26 03:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (69, 4, 53, '2026-02-08 12:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-08 12:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (70, 4, 37, '2026-03-06 03:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-06 03:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (71, 4, 52, '2026-03-03 20:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-03 20:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (72, 4, 60, '2026-03-01 08:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-01 08:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (73, 4, 15, '2026-02-15 03:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-15 03:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (74, 4, 12, '2026-02-08 05:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-08 05:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (75, 4, 65, '2026-03-01 15:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-01 15:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (76, 4, 64, '2026-03-05 18:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-05 18:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (77, 4, 61, '2026-02-15 02:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-15 02:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (78, 4, 26, '2026-02-13 19:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-13 19:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (79, 4, 7, '2026-02-27 08:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-27 08:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (80, 4, 27, '2026-02-09 01:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-09 01:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (81, 4, 46, '2026-02-25 02:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-25 02:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (82, 4, 6, '2026-02-14 10:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-14 10:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (83, 4, 58, '2026-02-08 15:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-08 15:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (84, 4, 35, '2026-02-24 08:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-24 08:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (85, 4, 48, '2026-03-09 21:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-09 21:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (86, 4, 25, '2026-02-08 08:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-08 08:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (87, 4, 54, '2026-03-06 10:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-06 10:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (88, 4, 22, '2026-02-10 00:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-10 00:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (89, 4, 55, '2026-02-22 01:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-22 01:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (90, 5, 34, '2026-02-13 01:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-13 01:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (91, 5, 60, '2026-02-10 14:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-10 14:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (92, 5, 1, '2026-03-07 04:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-07 04:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (93, 5, 4, '2026-02-13 04:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-13 04:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (94, 5, 30, '2026-03-06 05:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-06 05:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (95, 5, 21, '2026-02-23 11:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-23 11:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (96, 5, 43, '2026-02-20 02:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-20 02:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (97, 5, 13, '2026-03-02 17:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-02 17:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (98, 5, 3, '2026-02-09 04:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-09 04:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (99, 5, 53, '2026-02-23 09:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-23 09:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (100, 5, 50, '2026-03-07 09:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-07 09:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (101, 5, 44, '2026-02-21 12:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-21 12:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (102, 5, 39, '2026-02-25 21:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-25 21:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (103, 5, 2, '2026-02-09 09:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-09 09:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (104, 5, 20, '2026-03-02 20:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-02 20:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (105, 5, 32, '2026-02-18 19:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-18 19:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (106, 5, 16, '2026-02-28 14:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-28 14:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (107, 5, 47, '2026-02-11 05:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-11 05:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (108, 5, 46, '2026-02-13 16:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-13 16:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (109, 5, 58, '2026-02-28 22:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-28 22:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (110, 5, 19, '2026-02-17 15:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-17 15:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (111, 5, 69, '2026-03-04 10:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-04 10:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (112, 5, 64, '2026-02-09 06:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-09 06:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (113, 5, 22, '2026-02-08 06:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-08 06:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (114, 5, 17, '2026-02-15 21:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-15 21:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (115, 5, 14, '2026-02-24 21:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-24 21:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (116, 6, 38, '2026-02-19 10:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-19 10:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (117, 6, 45, '2026-03-03 17:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-03 17:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (118, 6, 15, '2026-02-09 07:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-09 07:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (119, 6, 62, '2026-02-09 07:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-09 07:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (120, 6, 37, '2026-02-18 04:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-18 04:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (121, 6, 29, '2026-02-25 21:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-25 21:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (122, 6, 12, '2026-02-17 17:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-17 17:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (123, 6, 14, '2026-02-18 00:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-18 00:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (124, 6, 26, '2026-02-08 00:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-08 00:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (125, 6, 24, '2026-03-01 00:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-01 00:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (126, 6, 52, '2026-02-27 13:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-27 13:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (127, 6, 6, '2026-03-01 02:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-01 02:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (128, 6, 30, '2026-02-18 11:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-18 11:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (129, 6, 61, '2026-03-01 18:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-01 18:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (130, 6, 47, '2026-03-09 06:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-09 06:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (131, 6, 36, '2026-02-11 15:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-11 15:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (132, 6, 60, '2026-02-15 23:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-15 23:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (133, 6, 67, '2026-02-10 19:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-10 19:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (134, 6, 59, '2026-02-08 23:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-08 23:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (135, 6, 42, '2026-02-13 22:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-13 22:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (136, 6, 23, '2026-03-06 03:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-06 03:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (137, 6, 7, '2026-03-02 00:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-02 00:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (138, 6, 2, '2026-02-28 09:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-28 09:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (139, 6, 48, '2026-02-19 14:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-19 14:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (140, 6, 19, '2026-03-06 11:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-06 11:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (141, 6, 64, '2026-02-21 10:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-21 10:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (142, 6, 43, '2026-02-09 19:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-09 19:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (143, 6, 28, '2026-02-09 04:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-09 04:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (144, 7, 9, '2026-02-14 08:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-14 08:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (145, 7, 22, '2026-02-10 01:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-10 01:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (146, 7, 59, '2026-02-10 00:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-10 00:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (147, 7, 51, '2026-02-10 22:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-10 22:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (148, 7, 62, '2026-03-07 16:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-07 16:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (149, 7, 57, '2026-03-07 04:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-07 04:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (150, 7, 7, '2026-03-06 15:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-06 15:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (151, 7, 23, '2026-02-19 11:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-19 11:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (152, 7, 26, '2026-02-15 06:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-15 06:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (153, 7, 2, '2026-02-28 21:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-28 21:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (154, 7, 25, '2026-02-20 18:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-20 18:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (155, 7, 21, '2026-02-13 14:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-13 14:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (156, 7, 3, '2026-02-09 21:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-09 21:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (157, 7, 52, '2026-02-12 02:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-12 02:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (158, 7, 50, '2026-02-08 13:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-08 13:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (159, 7, 39, '2026-02-18 22:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-18 22:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (160, 7, 38, '2026-02-15 02:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-15 02:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (161, 7, 56, '2026-02-08 14:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-08 14:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (162, 7, 65, '2026-03-09 14:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-09 14:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (163, 7, 5, '2026-03-03 13:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-03 13:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (164, 7, 66, '2026-02-20 01:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-20 01:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (165, 7, 16, '2026-03-01 18:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-01 18:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (166, 7, 64, '2026-03-08 17:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-08 17:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (167, 7, 19, '2026-02-11 05:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-11 05:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (168, 7, 41, '2026-03-06 22:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-06 22:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (169, 7, 49, '2026-02-10 02:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-10 02:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (170, 7, 48, '2026-03-03 00:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-03 00:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (171, 7, 4, '2026-03-01 10:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-01 10:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (172, 7, 36, '2026-02-17 22:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-17 22:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (173, 8, 43, '2026-03-01 15:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-01 15:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (174, 8, 1, '2026-02-12 22:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-12 22:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (175, 8, 41, '2026-02-26 19:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-26 19:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (176, 8, 25, '2026-02-13 10:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-13 10:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (177, 8, 17, '2026-02-14 11:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-14 11:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (178, 8, 37, '2026-02-11 23:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-11 23:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (179, 8, 64, '2026-03-07 15:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-07 15:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (180, 8, 66, '2026-02-20 00:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-20 00:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (181, 8, 11, '2026-02-09 04:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-09 04:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (182, 8, 68, '2026-03-06 07:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-06 07:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (183, 8, 9, '2026-02-14 18:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-14 18:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (184, 8, 4, '2026-03-08 18:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-08 18:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (185, 8, 51, '2026-02-24 00:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-24 00:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (186, 8, 58, '2026-03-02 03:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-02 03:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (187, 8, 35, '2026-02-14 10:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-14 10:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (188, 8, 10, '2026-02-18 09:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-18 09:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (189, 9, 3, '2026-02-10 18:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-10 18:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (190, 9, 49, '2026-02-12 13:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-12 13:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (191, 9, 4, '2026-03-08 13:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-08 13:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (192, 9, 69, '2026-02-20 08:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-20 08:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (193, 9, 19, '2026-02-21 01:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-21 01:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (194, 9, 57, '2026-02-20 03:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-20 03:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (195, 9, 16, '2026-03-09 21:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-09 21:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (196, 9, 27, '2026-03-04 13:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-04 13:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (197, 9, 39, '2026-02-28 21:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-28 21:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (198, 9, 58, '2026-02-16 00:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-16 00:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (199, 9, 11, '2026-03-01 11:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-01 11:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (200, 9, 21, '2026-03-09 12:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-09 12:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (201, 9, 42, '2026-02-10 19:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-10 19:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (202, 9, 8, '2026-03-02 16:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-02 16:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (203, 9, 29, '2026-02-13 22:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-13 22:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (204, 9, 20, '2026-02-11 08:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-11 08:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (205, 9, 41, '2026-02-23 07:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-23 07:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (206, 9, 53, '2026-02-09 18:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-09 18:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (207, 9, 68, '2026-03-06 19:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-06 19:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (208, 9, 9, '2026-02-22 07:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-22 07:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (209, 9, 30, '2026-02-11 04:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-11 04:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (210, 9, 32, '2026-02-13 02:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-13 02:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (211, 9, 61, '2026-03-02 11:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-02 11:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (212, 9, 48, '2026-02-09 08:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-09 08:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (213, 9, 43, '2026-02-23 09:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-23 09:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (214, 9, 50, '2026-02-25 15:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-25 15:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (215, 9, 10, '2026-02-20 23:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-20 23:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (216, 9, 33, '2026-03-05 14:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-05 14:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (217, 9, 64, '2026-02-11 18:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-11 18:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (218, 9, 44, '2026-02-20 12:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-20 12:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (219, 10, 27, '2026-02-11 14:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-11 14:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (220, 10, 19, '2026-03-01 19:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-01 19:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (221, 10, 6, '2026-03-02 04:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-02 04:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (222, 10, 20, '2026-02-24 13:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-24 13:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (223, 10, 30, '2026-03-04 22:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-04 22:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (224, 10, 60, '2026-02-19 08:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-19 08:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (225, 10, 14, '2026-02-24 02:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-24 02:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (226, 10, 36, '2026-03-07 11:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-07 11:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (227, 10, 32, '2026-02-25 19:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-25 19:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (228, 10, 11, '2026-02-26 18:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-26 18:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (229, 10, 4, '2026-03-03 07:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-03 07:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (230, 10, 45, '2026-02-22 04:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-22 04:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (231, 10, 63, '2026-02-28 22:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-28 22:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (232, 10, 9, '2026-03-04 19:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-04 19:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (233, 10, 43, '2026-02-19 00:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-19 00:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (234, 10, 53, '2026-02-18 08:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-18 08:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (235, 10, 39, '2026-03-01 01:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-01 01:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (236, 10, 28, '2026-02-24 08:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-24 08:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (237, 10, 13, '2026-03-03 21:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-03 21:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (238, 10, 55, '2026-02-14 00:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-14 00:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (239, 11, 12, '2026-02-20 07:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-20 07:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (240, 11, 8, '2026-03-02 15:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-02 15:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (241, 11, 2, '2026-02-10 15:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-10 15:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (242, 11, 25, '2026-02-13 10:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-13 10:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (243, 11, 50, '2026-03-08 18:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-08 18:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (244, 11, 28, '2026-02-22 18:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-22 18:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (245, 11, 57, '2026-02-16 01:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-16 01:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (246, 11, 13, '2026-03-07 12:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-07 12:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (247, 11, 17, '2026-02-20 22:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-20 22:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (248, 11, 20, '2026-02-13 06:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-13 06:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (249, 11, 43, '2026-02-24 19:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-24 19:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (250, 11, 39, '2026-02-27 15:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-27 15:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (251, 11, 33, '2026-02-21 05:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-21 05:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (252, 11, 44, '2026-03-05 04:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-05 04:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (253, 11, 67, '2026-02-24 02:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-24 02:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (254, 11, 68, '2026-02-21 07:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-21 07:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (255, 11, 40, '2026-02-13 10:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-13 10:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (256, 11, 31, '2026-02-26 18:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-26 18:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (257, 11, 61, '2026-02-18 05:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-18 05:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (258, 12, 69, '2026-02-15 19:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-15 19:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (259, 12, 14, '2026-03-08 14:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-08 14:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (260, 12, 52, '2026-03-09 17:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-09 17:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (261, 12, 51, '2026-02-17 22:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-17 22:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (262, 12, 3, '2026-03-07 10:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-07 10:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (263, 12, 55, '2026-02-20 00:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-20 00:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (264, 12, 21, '2026-02-19 23:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-19 23:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (265, 12, 17, '2026-02-12 14:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-12 14:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (266, 12, 44, '2026-02-16 01:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-16 01:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (267, 12, 36, '2026-02-28 03:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-28 03:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (268, 12, 4, '2026-02-28 00:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-28 00:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (269, 12, 26, '2026-02-25 16:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-25 16:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (270, 12, 16, '2026-02-12 22:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-12 22:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (271, 13, 42, '2026-02-20 20:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-20 20:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (272, 13, 24, '2026-02-16 06:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-16 06:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (273, 13, 5, '2026-02-20 12:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-20 12:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (274, 13, 45, '2026-02-26 08:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-26 08:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (275, 13, 65, '2026-03-07 04:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-07 04:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (276, 13, 46, '2026-02-10 11:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-10 11:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (277, 13, 11, '2026-02-27 05:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-27 05:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (278, 13, 43, '2026-02-23 13:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-23 13:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (279, 13, 59, '2026-02-10 20:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-10 20:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (280, 13, 60, '2026-02-21 13:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-21 13:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (281, 13, 56, '2026-02-19 02:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-19 02:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (282, 13, 63, '2026-03-04 12:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-04 12:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (283, 13, 48, '2026-03-02 18:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-02 18:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (284, 13, 64, '2026-02-17 13:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-17 13:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (285, 13, 1, '2026-03-04 09:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-04 09:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (286, 13, 31, '2026-02-12 13:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-12 13:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (287, 13, 67, '2026-02-26 20:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-26 20:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (288, 13, 52, '2026-02-28 06:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-28 06:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (289, 13, 38, '2026-02-14 17:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-14 17:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (290, 13, 44, '2026-03-02 17:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-02 17:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (291, 14, 59, '2026-02-26 03:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-26 03:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (292, 14, 28, '2026-03-08 08:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-08 08:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (293, 14, 55, '2026-02-13 17:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-13 17:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (294, 14, 33, '2026-03-01 07:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-01 07:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (295, 14, 44, '2026-02-08 07:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-08 07:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (296, 14, 23, '2026-02-12 04:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-12 04:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (297, 14, 58, '2026-03-07 20:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-07 20:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (298, 14, 14, '2026-02-11 21:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-11 21:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (299, 14, 16, '2026-02-20 00:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-20 00:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (300, 14, 66, '2026-02-13 19:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-13 19:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (301, 14, 11, '2026-03-07 07:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-07 07:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (302, 14, 13, '2026-03-08 02:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-08 02:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (303, 14, 31, '2026-03-02 23:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-02 23:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (304, 14, 10, '2026-02-11 11:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-11 11:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (305, 14, 1, '2026-02-11 15:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-11 15:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (306, 14, 64, '2026-02-22 18:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-22 18:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (307, 14, 25, '2026-02-19 00:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-19 00:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (308, 15, 33, '2026-02-19 21:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-19 21:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (309, 15, 34, '2026-02-22 01:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-22 01:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (310, 15, 41, '2026-02-26 07:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-26 07:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (311, 15, 8, '2026-02-22 18:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-22 18:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (312, 15, 46, '2026-02-26 23:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-26 23:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (313, 15, 54, '2026-02-18 22:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-18 22:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (314, 15, 13, '2026-02-14 01:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-14 01:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (315, 15, 35, '2026-02-16 15:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-16 15:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (316, 15, 14, '2026-02-08 20:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-08 20:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (317, 15, 16, '2026-02-14 21:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-14 21:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (318, 15, 7, '2026-02-28 00:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-28 00:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (319, 15, 3, '2026-02-19 01:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-19 01:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (320, 15, 26, '2026-03-07 11:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-07 11:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (321, 15, 50, '2026-02-12 21:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-12 21:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (322, 15, 11, '2026-02-25 15:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-25 15:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (323, 15, 55, '2026-03-06 15:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-06 15:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (324, 15, 1, '2026-02-27 05:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-27 05:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (325, 15, 22, '2026-03-05 13:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-05 13:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (326, 15, 25, '2026-03-07 19:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-07 19:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (327, 15, 39, '2026-02-18 18:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-18 18:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (328, 15, 52, '2026-03-07 00:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-07 00:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (329, 15, 23, '2026-03-05 22:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-05 22:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (330, 15, 15, '2026-03-01 11:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-01 11:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (331, 15, 59, '2026-02-10 02:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-10 02:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (332, 15, 56, '2026-03-07 08:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-07 08:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (333, 15, 58, '2026-03-02 07:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-02 07:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (334, 15, 28, '2026-02-27 22:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-27 22:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (335, 15, 62, '2026-03-04 12:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-04 12:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (336, 15, 37, '2026-03-03 10:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-03 10:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (337, 16, 64, '2026-02-14 23:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-14 23:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (338, 16, 67, '2026-02-24 22:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-24 22:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (339, 16, 43, '2026-03-02 11:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-02 11:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (340, 16, 31, '2026-02-22 09:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-22 09:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (341, 16, 18, '2026-02-21 03:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-21 03:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (342, 16, 69, '2026-02-08 14:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-08 14:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (343, 16, 37, '2026-03-04 17:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-04 17:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (344, 16, 21, '2026-03-08 17:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-08 17:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (345, 16, 10, '2026-02-16 04:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-16 04:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (346, 16, 60, '2026-02-13 07:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-13 07:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (347, 16, 51, '2026-02-11 19:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-11 19:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (348, 16, 35, '2026-03-05 10:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-05 10:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (349, 16, 13, '2026-03-07 00:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-07 00:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (350, 16, 58, '2026-02-12 00:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-12 00:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (351, 17, 17, '2026-02-20 03:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-20 03:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (352, 17, 68, '2026-02-12 20:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-12 20:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (353, 17, 24, '2026-02-21 12:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-21 12:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (354, 17, 5, '2026-02-22 12:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-22 12:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (355, 17, 38, '2026-02-16 16:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-16 16:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (356, 17, 25, '2026-03-01 09:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-01 09:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (357, 17, 63, '2026-02-12 07:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-12 07:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (358, 17, 20, '2026-02-22 22:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-22 22:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (359, 17, 58, '2026-02-12 08:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-12 08:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (360, 17, 54, '2026-02-14 13:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-14 13:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (361, 17, 4, '2026-02-28 05:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-28 05:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (362, 17, 46, '2026-02-22 01:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-22 01:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (363, 17, 37, '2026-02-14 12:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-14 12:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (364, 17, 26, '2026-02-27 14:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-27 14:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (365, 17, 59, '2026-02-15 04:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-15 04:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (366, 17, 28, '2026-02-21 10:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-21 10:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (367, 17, 21, '2026-02-18 00:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-18 00:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (368, 17, 10, '2026-02-15 23:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-15 23:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (369, 17, 22, '2026-02-15 10:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-15 10:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (370, 18, 12, '2026-02-15 14:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-15 14:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (371, 18, 48, '2026-02-19 03:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-19 03:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (372, 18, 68, '2026-02-20 04:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-20 04:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (373, 18, 1, '2026-02-25 15:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-25 15:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (374, 18, 3, '2026-03-09 11:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-09 11:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (375, 18, 25, '2026-03-03 01:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-03 01:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (376, 18, 19, '2026-02-09 08:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-09 08:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (377, 18, 29, '2026-02-26 08:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-26 08:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (378, 18, 44, '2026-03-08 11:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-08 11:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (379, 18, 16, '2026-02-17 04:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-17 04:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (380, 18, 23, '2026-02-09 06:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-09 06:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (381, 18, 39, '2026-03-04 20:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-04 20:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (382, 18, 30, '2026-02-23 01:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-23 01:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (383, 18, 37, '2026-03-06 14:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-06 14:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (384, 18, 43, '2026-02-28 07:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-28 07:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (385, 18, 10, '2026-02-10 11:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-10 11:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (386, 18, 58, '2026-02-26 05:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-26 05:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (387, 18, 14, '2026-03-01 08:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-01 08:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (388, 18, 59, '2026-03-09 22:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-09 22:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (389, 18, 5, '2026-03-04 14:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-04 14:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (390, 18, 32, '2026-02-28 00:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-28 00:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (391, 18, 63, '2026-02-17 08:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-17 08:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (392, 18, 57, '2026-03-05 19:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-05 19:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (393, 19, 5, '2026-03-01 17:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-01 17:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (394, 19, 17, '2026-03-07 19:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-07 19:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (395, 19, 23, '2026-02-10 23:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-10 23:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (396, 19, 40, '2026-03-06 14:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-06 14:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (397, 19, 35, '2026-02-16 11:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-16 11:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (398, 19, 59, '2026-02-15 03:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-15 03:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (399, 19, 21, '2026-02-22 18:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-22 18:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (400, 19, 30, '2026-02-24 23:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-24 23:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (401, 19, 32, '2026-02-22 01:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-22 01:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (402, 19, 56, '2026-03-09 14:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-09 14:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (403, 19, 34, '2026-03-02 21:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-02 21:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (404, 20, 38, '2026-02-20 18:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-20 18:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (405, 20, 53, '2026-02-18 21:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-18 21:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (406, 20, 51, '2026-02-21 14:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-21 14:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (407, 20, 56, '2026-03-02 09:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-02 09:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (408, 20, 46, '2026-02-16 21:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-16 21:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (409, 20, 69, '2026-02-24 21:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-24 21:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (410, 20, 41, '2026-02-21 12:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-21 12:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (411, 20, 19, '2026-02-26 16:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-26 16:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (412, 20, 60, '2026-02-22 04:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-22 04:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (413, 20, 62, '2026-03-02 08:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-03-02 08:47:20';
INSERT INTO user_history (id, user_id, recipe_id, viewed_at)
VALUES (414, 20, 39, '2026-02-28 05:47:20')
ON CONFLICT (user_id, recipe_id) DO UPDATE SET viewed_at = '2026-02-28 05:47:20';

SELECT '浏览历史数据插入完成: 414条' AS message;

-- ============================================
-- 8. 评论数据 (100+条)
-- ============================================

INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (1, 1, 10, '希望能出更多类似的食谱', 4, '[]', 4, 0, 1, '2026-01-04 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (2, 1, 4, '每天一碗，身体棒棒的', 3, '[]', 20, 0, 1, '2026-02-03 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (3, 1, 3, '按照步骤做的，效果很明显', 3, '[]', 50, 3, 1, '2025-12-15 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (4, 1, 3, '孕妇可以喝这个吗？', 4, '[]', 41, 0, 1, '2026-01-30 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (5, 2, 1, '做法详细，新手也能学会', 4, '["/images/comments/comment_5_1.jpg"]', 13, 1, 1, '2026-01-09 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (6, 3, 4, '做法详细，新手也能学会', 5, '["/images/comments/comment_6_1.jpg"]', 37, 1, 1, '2026-02-01 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (7, 3, 14, '坚持喝了一个月，效果明显', 3, '[]', 27, 0, 1, '2026-02-18 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (8, 4, 4, '老人小孩都适合喝', 3, '[]', 22, 2, 1, '2025-12-14 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (9, 4, 15, '感谢分享这么好的食谱', 3, '[]', 25, 2, 1, '2026-02-14 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (10, 4, 20, '这个汤真的很滋补', 5, '[]', 47, 0, 1, '2025-12-12 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (11, 4, 18, '做法详细，新手也能学会', 5, '[]', 11, 3, 1, '2026-01-14 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (12, 5, 5, '味道清淡不油腻，喜欢', 5, '[]', 47, 2, 1, '2026-01-15 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (13, 6, 10, '味道清淡不油腻，喜欢', 5, '["/images/comments/comment_13_1.jpg"]', 41, 1, 1, '2026-01-10 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (14, 6, 17, '夏天喝这个很解暑', 4, '[]', 17, 2, 1, '2026-01-11 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (15, 6, 1, '真的很有效，坚持喝了一周感觉好多了！', 5, '[]', 49, 4, 1, '2025-12-13 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (16, 7, 19, '第一次做就成功了，开心', 3, '[]', 26, 0, 1, '2026-02-12 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (17, 7, 17, '糖尿病患者能喝吗？', 3, '[]', 29, 1, 1, '2026-02-09 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (18, 7, 13, '喝了一段时间，感觉气色好了很多', 5, '[]', 3, 3, 1, '2025-12-30 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (19, 7, 13, '第一次做就成功了，开心', 4, '[]', 6, 5, 1, '2026-02-18 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (20, 7, 3, '按照步骤做的，效果很明显', 3, '[]', 48, 2, 1, '2026-01-25 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (21, 8, 6, '第一次做就成功了，开心', 4, '[]', 13, 0, 1, '2026-01-01 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (22, 8, 3, '坚持喝了一个月，效果明显', 5, '[]', 3, 2, 1, '2025-12-20 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (23, 8, 15, '食材容易买到，很方便', 4, '[]', 40, 3, 1, '2026-01-23 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (24, 9, 17, '这个配方很专业，点赞', 5, '["/images/comments/comment_24_1.jpg"]', 11, 1, 1, '2026-02-01 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (25, 10, 5, '孩子很喜欢喝，谢谢分享', 3, '[]', 2, 3, 1, '2025-12-20 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (26, 10, 20, '冬天喝这个太舒服了', 3, '[]', 16, 0, 1, '2026-01-23 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (27, 10, 13, '感谢分享这么好的食谱', 3, '[]', 45, 1, 1, '2026-02-27 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (28, 11, 13, '真的很有效，坚持喝了一周感觉好多了！', 5, '["/images/comments/comment_28_1.jpg"]', 47, 2, 1, '2026-02-17 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (29, 11, 1, '这个配方很专业，点赞', 5, '["/images/comments/comment_29_1.jpg"]', 23, 3, 1, '2026-02-05 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (30, 11, 14, '这个汤真的很滋补', 4, '[]', 30, 4, 1, '2025-12-25 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (31, 11, 15, '孕妇可以喝这个吗？', 5, '[]', 0, 4, 1, '2025-12-21 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (32, 11, 11, '第一次做就成功了，开心', 3, '[]', 44, 1, 1, '2026-01-17 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (33, 12, 18, '做法详细，新手也能学会', 4, '[]', 33, 0, 1, '2026-01-01 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (34, 12, 5, '夏天喝这个很解暑', 5, '[]', 36, 2, 1, '2026-02-01 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (35, 12, 17, '味道清淡不油腻，喜欢', 4, '[]', 18, 5, 1, '2026-02-24 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (36, 13, 1, '给家人做了这个，都说很好喝', 3, '[]', 8, 4, 1, '2026-01-23 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (37, 14, 19, '已经收藏，准备明天试试', 4, '[]', 21, 0, 1, '2026-02-24 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (38, 14, 2, '这个配方太棒了，收藏了', 5, '[]', 22, 3, 1, '2026-03-04 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (39, 14, 13, '希望能出更多类似的食谱', 4, '[]', 21, 3, 1, '2026-01-31 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (40, 14, 1, '请问可以天天喝吗？', 4, '[]', 30, 2, 1, '2026-01-18 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (41, 14, 2, '这个配方太棒了，收藏了', 5, '["/images/comments/comment_41_1.jpg"]', 7, 3, 1, '2026-01-10 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (42, 15, 10, '这个汤真的很滋补', 3, '[]', 23, 1, 1, '2026-01-19 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (43, 16, 10, '这个汤真的很滋补', 5, '["/images/comments/comment_43_1.jpg"]', 11, 3, 1, '2026-02-01 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (44, 16, 16, '按照步骤做的，效果很明显', 4, '[]', 25, 3, 1, '2026-01-28 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (45, 17, 17, '食材容易买到，很方便', 3, '["/images/comments/comment_45_1.jpg"]', 28, 5, 1, '2026-02-16 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (46, 17, 20, '每天一碗，身体棒棒的', 3, '["/images/comments/comment_46_1.jpg"]', 6, 1, 1, '2025-12-19 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (47, 17, 19, '食材容易买到，很方便', 5, '[]', 26, 5, 1, '2026-01-12 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (48, 18, 9, '老人小孩都适合喝', 3, '[]', 32, 5, 1, '2026-01-22 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (49, 18, 11, '请问可以天天喝吗？', 4, '[]', 8, 4, 1, '2026-01-02 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (50, 18, 13, '营养价值很高', 3, '[]', 32, 5, 1, '2026-03-02 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (51, 18, 2, '坚持喝了一个月，效果明显', 3, '[]', 19, 1, 1, '2026-02-10 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (52, 19, 11, '这个配方很专业，点赞', 3, '[]', 36, 4, 1, '2026-02-26 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (53, 19, 8, '每天一碗，身体棒棒的', 4, '[]', 19, 2, 1, '2025-12-19 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (54, 19, 13, '孕妇可以喝这个吗？', 5, '[]', 17, 4, 1, '2026-01-01 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (55, 19, 1, '味道不错，做法也很简单，推荐给大家', 3, '[]', 25, 2, 1, '2026-01-04 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (56, 20, 5, '味道清淡不油腻，喜欢', 4, '[]', 1, 2, 1, '2026-01-28 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (57, 21, 20, '推荐给朋友了，都说不错', 3, '["/images/comments/comment_57_1.jpg"]', 18, 2, 1, '2026-01-05 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (58, 21, 6, '老人小孩都适合喝', 5, '[]', 19, 4, 1, '2026-01-26 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (59, 21, 5, '按照步骤做的，效果很明显', 3, '[]', 37, 0, 1, '2026-01-04 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (60, 21, 6, '营养价值很高', 4, '[]', 7, 4, 1, '2026-02-04 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (61, 22, 14, '已经收藏，准备明天试试', 5, '["/images/comments/comment_61_1.jpg"]', 27, 5, 1, '2026-03-09 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (62, 22, 12, '做法详细，新手也能学会', 4, '[]', 4, 4, 1, '2026-01-28 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (63, 22, 5, '孩子很喜欢喝，谢谢分享', 4, '[]', 46, 5, 1, '2025-12-28 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (64, 22, 3, '感谢分享这么好的食谱', 5, '[]', 29, 0, 1, '2026-02-26 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (65, 22, 1, '食材容易买到，很方便', 5, '[]', 2, 3, 1, '2026-01-03 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (66, 23, 7, '这个汤真的很滋补', 4, '["/images/comments/comment_66_1.jpg"]', 36, 5, 1, '2025-12-28 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (67, 23, 12, '希望能出更多类似的食谱', 5, '[]', 25, 3, 1, '2026-02-19 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (68, 23, 15, '这个配方太棒了，收藏了', 4, '[]', 23, 5, 1, '2025-12-12 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (69, 24, 15, '做法简单快捷，适合上班族', 3, '[]', 12, 1, 1, '2026-01-06 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (70, 24, 2, '这个配方很专业，点赞', 3, '[]', 34, 1, 1, '2025-12-21 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (71, 24, 18, '做法详细，新手也能学会', 3, '[]', 11, 1, 1, '2025-12-22 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (72, 24, 11, '给家人做了这个，都说很好喝', 4, '[]', 2, 5, 1, '2026-03-05 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (73, 25, 9, '味道不错，做法也很简单，推荐给大家', 4, '[]', 33, 5, 1, '2026-03-02 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (74, 25, 2, '每天一碗，身体棒棒的', 5, '[]', 43, 5, 1, '2026-01-08 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (75, 25, 10, '给家人做了这个，都说很好喝', 5, '[]', 49, 4, 1, '2026-01-31 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (76, 25, 9, '做法详细，新手也能学会', 5, '[]', 46, 3, 1, '2026-01-16 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (77, 26, 6, '这个配方太棒了，收藏了', 4, '[]', 1, 1, 1, '2026-02-05 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (78, 26, 2, '做法详细，新手也能学会', 5, '[]', 19, 4, 1, '2025-12-18 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (79, 26, 1, '已经加入收藏夹了', 3, '["/images/comments/comment_79_1.jpg"]', 25, 4, 1, '2026-01-11 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (80, 26, 3, '每天一碗，身体棒棒的', 3, '[]', 48, 2, 1, '2026-02-18 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (81, 26, 17, '食材容易买到，很方便', 5, '[]', 20, 1, 1, '2026-02-17 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (82, 27, 5, '请问可以用其他食材代替吗？', 4, '["/images/comments/comment_82_1.jpg"]', 2, 3, 1, '2025-12-21 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (83, 27, 9, '老人小孩都适合喝', 3, '[]', 2, 5, 1, '2026-01-31 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (84, 27, 19, '做法简单快捷，适合上班族', 3, '[]', 32, 1, 1, '2026-02-26 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (85, 27, 13, '真的很有效，坚持喝了一周感觉好多了！', 3, '[]', 30, 4, 1, '2026-02-18 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (86, 27, 15, '给家人做了这个，都说很好喝', 4, '[]', 7, 3, 1, '2026-01-03 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (87, 28, 17, '这个配方很专业，点赞', 4, '[]', 50, 0, 1, '2026-01-22 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (88, 28, 8, '营养价值很高', 5, '["/images/comments/comment_88_1.jpg"]', 19, 2, 1, '2026-01-01 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (89, 28, 9, '请问可以用其他食材代替吗？', 4, '[]', 33, 2, 1, '2026-01-26 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (90, 28, 9, '希望能出更多类似的食谱', 5, '["/images/comments/comment_90_1.jpg"]', 16, 0, 1, '2026-01-26 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (91, 28, 5, '这个汤真的很滋补', 3, '[]', 31, 0, 1, '2026-01-29 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (92, 29, 12, '老人小孩都适合喝', 5, '["/images/comments/comment_92_1.jpg"]', 9, 5, 1, '2025-12-27 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (93, 29, 17, '真的很有效，坚持喝了一周感觉好多了！', 5, '[]', 43, 5, 1, '2026-01-18 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (94, 29, 14, '这个配方很专业，点赞', 4, '[]', 5, 5, 1, '2026-02-25 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (95, 29, 9, '第一次做就成功了，开心', 3, '[]', 18, 0, 1, '2026-02-25 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (96, 30, 13, '冬天喝这个太舒服了', 5, '["/images/comments/comment_96_1.jpg"]', 10, 1, 1, '2026-02-02 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (97, 30, 3, '糖尿病患者能喝吗？', 3, '[]', 11, 2, 1, '2026-02-21 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (98, 30, 1, '喝了一段时间，感觉气色好了很多', 3, '[]', 25, 2, 1, '2026-02-10 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (99, 30, 4, '坚持喝了一个月，效果明显', 5, '[]', 38, 2, 1, '2025-12-31 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (100, 30, 3, '喝了一段时间，感觉气色好了很多', 4, '["/images/comments/comment_100_1.jpg"]', 23, 2, 1, '2026-01-12 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (101, 31, 14, '喝了一段时间，感觉气色好了很多', 4, '[]', 35, 1, 1, '2026-01-27 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (102, 31, 16, '味道不错，做法也很简单，推荐给大家', 4, '[]', 26, 5, 1, '2026-02-03 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (103, 32, 18, '做法简单快捷，适合上班族', 3, '["/images/comments/comment_103_1.jpg"]', 15, 4, 1, '2025-12-17 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (104, 32, 7, '做法详细，新手也能学会', 5, '[]', 19, 0, 1, '2025-12-19 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (105, 32, 1, '食材容易买到，很方便', 4, '[]', 36, 0, 1, '2026-02-09 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (106, 33, 10, '推荐给朋友了，都说不错', 5, '[]', 31, 2, 1, '2026-03-01 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (107, 33, 11, '第一次做就成功了，开心', 3, '[]', 19, 2, 1, '2026-02-05 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (108, 33, 14, '喝了一段时间，感觉气色好了很多', 5, '[]', 43, 5, 1, '2026-01-28 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (109, 34, 12, '喝了一段时间，感觉气色好了很多', 3, '[]', 50, 3, 1, '2026-02-27 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (110, 34, 3, '味道清淡不油腻，喜欢', 5, '[]', 31, 3, 1, '2026-02-07 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (111, 35, 5, '冬天喝这个太舒服了', 5, '["/images/comments/comment_111_1.jpg"]', 38, 5, 1, '2026-01-18 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (112, 35, 7, '请问可以用其他食材代替吗？', 4, '[]', 38, 2, 1, '2026-01-06 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (113, 35, 4, '已经收藏，准备明天试试', 5, '[]', 5, 0, 1, '2026-01-28 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (114, 36, 7, '坚持喝了一个月，效果明显', 4, '[]', 19, 0, 1, '2026-01-12 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (115, 37, 9, '这个汤真的很滋补', 4, '[]', 10, 1, 1, '2026-02-16 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (116, 38, 4, '这个汤真的很滋补', 3, '["/images/comments/comment_116_1.jpg"]', 33, 4, 1, '2026-01-30 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (117, 38, 17, '已经加入收藏夹了', 3, '[]', 1, 4, 1, '2025-12-19 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (118, 38, 9, '坚持喝了一个月，效果明显', 3, '[]', 24, 2, 1, '2026-02-18 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (119, 39, 10, '夏天喝这个很解暑', 5, '["/images/comments/comment_119_1.jpg"]', 25, 3, 1, '2025-12-19 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (120, 39, 8, '这个配方太棒了，收藏了', 5, '[]', 30, 1, 1, '2026-02-03 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (121, 40, 17, '做法简单快捷，适合上班族', 4, '[]', 6, 1, 1, '2026-03-02 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (122, 40, 5, '这个汤真的很滋补', 4, '["/images/comments/comment_122_1.jpg"]', 41, 3, 1, '2026-03-05 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (123, 40, 1, '推荐给朋友了，都说不错', 4, '[]', 42, 5, 1, '2026-01-02 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (124, 40, 15, '请问可以天天喝吗？', 3, '[]', 25, 2, 1, '2026-03-01 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (125, 40, 16, '孕妇可以喝这个吗？', 3, '[]', 1, 3, 1, '2026-02-11 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (126, 41, 2, '孩子很喜欢喝，谢谢分享', 5, '[]', 19, 4, 1, '2026-02-14 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (127, 42, 20, '按照步骤做的，效果很明显', 3, '[]', 34, 3, 1, '2026-03-01 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (128, 42, 20, '冬天喝这个太舒服了', 3, '[]', 19, 5, 1, '2026-03-07 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (129, 43, 3, '味道不错，做法也很简单，推荐给大家', 3, '[]', 15, 0, 1, '2026-01-18 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (130, 43, 15, '这个配方太棒了，收藏了', 5, '["/images/comments/comment_130_1.jpg"]', 45, 5, 1, '2026-01-04 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (131, 43, 8, '糖尿病患者能喝吗？', 4, '[]', 7, 1, 1, '2026-01-29 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (132, 43, 11, '老人小孩都适合喝', 4, '[]', 48, 2, 1, '2026-02-09 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (133, 43, 11, '给家人做了这个，都说很好喝', 4, '["/images/comments/comment_133_1.jpg"]', 45, 2, 1, '2026-01-04 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (134, 44, 15, '第一次做就成功了，开心', 4, '[]', 15, 5, 1, '2026-02-19 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (135, 44, 8, '这个配方太棒了，收藏了', 4, '[]', 45, 3, 1, '2025-12-19 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (136, 44, 10, '第一次做就成功了，开心', 4, '[]', 34, 1, 1, '2026-01-04 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (137, 44, 15, '每天一碗，身体棒棒的', 4, '[]', 42, 5, 1, '2025-12-12 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (138, 45, 9, '这个配方太棒了，收藏了', 5, '[]', 44, 5, 1, '2026-02-04 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (139, 45, 2, '推荐给朋友了，都说不错', 5, '[]', 29, 5, 1, '2026-02-14 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (140, 45, 1, '这个配方很专业，点赞', 3, '[]', 13, 1, 1, '2025-12-24 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (141, 45, 5, '已经收藏，准备明天试试', 3, '[]', 5, 4, 1, '2026-02-11 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (142, 46, 1, '请问可以用其他食材代替吗？', 3, '[]', 22, 3, 1, '2026-01-31 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (143, 46, 7, '按照步骤做的，效果很明显', 4, '[]', 39, 0, 1, '2025-12-23 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (144, 46, 6, '希望能出更多类似的食谱', 5, '[]', 15, 5, 1, '2026-02-07 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (145, 46, 8, '做法详细，新手也能学会', 4, '[]', 22, 5, 1, '2025-12-28 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (146, 47, 4, '老人小孩都适合喝', 5, '["/images/comments/comment_146_1.jpg"]', 23, 3, 1, '2026-03-06 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (147, 47, 1, '给家人做了这个，都说很好喝', 3, '[]', 28, 2, 1, '2026-02-27 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (148, 47, 11, '冬天喝这个太舒服了', 5, '["/images/comments/comment_148_1.jpg"]', 30, 1, 1, '2026-01-30 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (149, 48, 4, '这个配方太棒了，收藏了', 3, '[]', 19, 0, 1, '2026-02-15 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (150, 48, 9, '味道不错，做法也很简单，推荐给大家', 5, '["/images/comments/comment_150_1.jpg"]', 50, 2, 1, '2026-01-15 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (151, 49, 3, '味道清淡不油腻，喜欢', 3, '[]', 4, 0, 1, '2026-01-16 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (152, 49, 10, '请问可以天天喝吗？', 5, '[]', 46, 1, 1, '2026-03-07 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (153, 49, 8, '按照步骤做的，效果很明显', 4, '["/images/comments/comment_153_1.jpg"]', 9, 4, 1, '2025-12-13 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (154, 49, 3, '喝了一段时间，感觉气色好了很多', 4, '[]', 47, 5, 1, '2026-01-14 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (155, 50, 9, '这个配方很专业，点赞', 5, '[]', 6, 4, 1, '2026-01-05 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (156, 50, 2, '感谢分享这么好的食谱', 4, '[]', 4, 5, 1, '2026-01-06 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (157, 50, 14, '这个配方很专业，点赞', 5, '[]', 19, 2, 1, '2025-12-24 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (158, 50, 7, '火候要掌握多久啊？', 3, '["/images/comments/comment_158_1.jpg"]', 11, 0, 1, '2026-01-15 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (159, 51, 4, '孕妇可以喝这个吗？', 5, '[]', 30, 2, 1, '2026-02-27 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (160, 51, 17, '这个配方很专业，点赞', 3, '[]', 20, 4, 1, '2026-01-12 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (161, 51, 2, '真的很有效，坚持喝了一周感觉好多了！', 4, '[]', 18, 5, 1, '2025-12-27 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (162, 51, 10, '已经加入收藏夹了', 3, '[]', 34, 0, 1, '2025-12-12 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (163, 52, 16, '第一次做就成功了，开心', 3, '[]', 6, 1, 1, '2026-02-17 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (164, 52, 7, '冬天喝这个太舒服了', 5, '[]', 40, 4, 1, '2026-02-27 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (165, 53, 8, '已经加入收藏夹了', 5, '[]', 39, 5, 1, '2025-12-10 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (166, 53, 6, '火候要掌握多久啊？', 4, '[]', 16, 3, 1, '2026-01-31 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (167, 53, 18, '做法简单快捷，适合上班族', 3, '[]', 14, 2, 1, '2025-12-11 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (168, 53, 6, '坚持喝了一个月，效果明显', 4, '[]', 25, 4, 1, '2026-01-20 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (169, 54, 20, '坚持喝了一个月，效果明显', 3, '[]', 17, 0, 1, '2026-02-08 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (170, 55, 17, '第一次做就成功了，开心', 4, '[]', 22, 1, 1, '2026-01-29 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (171, 55, 13, '希望能出更多类似的食谱', 5, '[]', 16, 4, 1, '2025-12-21 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (172, 56, 5, '这个汤真的很滋补', 3, '[]', 6, 1, 1, '2025-12-24 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (173, 56, 13, '坚持喝了一个月，效果明显', 3, '[]', 47, 2, 1, '2025-12-25 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (174, 56, 7, '感谢分享这么好的食谱', 4, '[]', 50, 4, 1, '2026-01-20 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (175, 57, 16, '真的很有效，坚持喝了一周感觉好多了！', 5, '[]', 41, 3, 1, '2025-12-27 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (176, 57, 4, '孕妇可以喝这个吗？', 3, '[]', 25, 2, 1, '2026-03-04 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (177, 57, 20, '做法详细，新手也能学会', 3, '[]', 21, 5, 1, '2026-01-31 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (178, 57, 15, '感谢分享这么好的食谱', 3, '[]', 12, 2, 1, '2026-02-25 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (179, 58, 20, '请问可以用其他食材代替吗？', 4, '["/images/comments/comment_179_1.jpg"]', 50, 4, 1, '2026-02-09 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (180, 59, 15, '希望能出更多类似的食谱', 5, '["/images/comments/comment_180_1.jpg"]', 46, 2, 1, '2026-02-20 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (181, 59, 9, '做法简单快捷，适合上班族', 3, '["/images/comments/comment_181_1.jpg"]', 46, 3, 1, '2025-12-30 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (182, 60, 9, '坚持喝了一个月，效果明显', 5, '[]', 33, 1, 1, '2026-03-03 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (183, 60, 11, '这个配方太棒了，收藏了', 5, '[]', 9, 3, 1, '2026-01-05 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (184, 61, 18, '坚持喝了一个月，效果明显', 4, '[]', 49, 5, 1, '2026-01-25 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (185, 61, 18, '做法详细，新手也能学会', 3, '[]', 26, 4, 1, '2026-01-01 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (186, 61, 2, '请问可以用其他食材代替吗？', 4, '[]', 12, 5, 1, '2026-01-25 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (187, 62, 20, '这个配方太棒了，收藏了', 4, '[]', 22, 5, 1, '2026-03-03 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (188, 62, 9, '希望能出更多类似的食谱', 5, '[]', 10, 1, 1, '2026-01-28 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (189, 63, 2, '按照步骤做的，效果很明显', 3, '["/images/comments/comment_189_1.jpg"]', 29, 2, 1, '2026-02-26 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (190, 63, 1, '已经加入收藏夹了', 5, '[]', 35, 5, 1, '2026-02-25 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (191, 63, 15, '第一次做就成功了，开心', 3, '[]', 2, 0, 1, '2026-03-07 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (192, 63, 10, '老人小孩都适合喝', 4, '["/images/comments/comment_192_1.jpg"]', 23, 2, 1, '2026-03-03 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (193, 63, 16, '这个汤真的很滋补', 3, '[]', 1, 5, 1, '2026-03-04 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (194, 64, 6, '糖尿病患者能喝吗？', 5, '[]', 23, 0, 1, '2026-01-01 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (195, 64, 6, '给家人做了这个，都说很好喝', 4, '[]', 44, 1, 1, '2026-01-20 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (196, 64, 13, '第一次做就成功了，开心', 5, '[]', 41, 3, 1, '2026-02-05 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (197, 64, 8, '夏天喝这个很解暑', 4, '[]', 8, 3, 1, '2025-12-17 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (198, 64, 18, '感谢分享这么好的食谱', 5, '[]', 23, 3, 1, '2026-01-26 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (199, 65, 15, '火候要掌握多久啊？', 3, '[]', 1, 0, 1, '2026-02-11 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (200, 65, 8, '味道不错，做法也很简单，推荐给大家', 3, '[]', 13, 2, 1, '2026-01-31 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (201, 65, 19, '按照步骤做的，效果很明显', 5, '[]', 19, 1, 1, '2026-01-02 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (202, 66, 13, '已经收藏，准备明天试试', 3, '[]', 18, 4, 1, '2025-12-16 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (203, 66, 4, '食材容易买到，很方便', 3, '[]', 35, 2, 1, '2025-12-20 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (204, 67, 19, '孩子很喜欢喝，谢谢分享', 3, '[]', 21, 5, 1, '2026-01-12 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (205, 67, 17, '感谢分享这么好的食谱', 3, '[]', 1, 3, 1, '2026-02-18 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (206, 67, 20, '推荐给朋友了，都说不错', 5, '[]', 18, 4, 1, '2025-12-13 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (207, 67, 2, '第一次做就成功了，开心', 3, '["/images/comments/comment_207_1.jpg"]', 50, 2, 1, '2025-12-30 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (208, 68, 4, '每天一碗，身体棒棒的', 3, '[]', 48, 3, 1, '2026-01-06 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (209, 68, 5, '火候要掌握多久啊？', 4, '[]', 0, 5, 1, '2026-03-02 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (210, 68, 11, '按照步骤做的，效果很明显', 3, '[]', 18, 3, 1, '2025-12-10 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (211, 69, 20, '冬天喝这个太舒服了', 3, '[]', 50, 1, 1, '2026-01-06 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (212, 69, 20, '孩子很喜欢喝，谢谢分享', 4, '[]', 32, 4, 1, '2025-12-21 23:47:20');
INSERT INTO comments (id, recipe_id, user_id, content, rating, images, likes, reply_count, status, created_at)
VALUES (213, 69, 4, '希望能出更多类似的食谱', 3, '[]', 6, 2, 1, '2026-02-06 23:47:20');

SELECT '评论数据插入完成: 213条' AS message;

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