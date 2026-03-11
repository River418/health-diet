-- Health-Diet 食疗养生小程序 - 测试数据验证脚本
-- 运行此脚本验证数据完整性

-- ============================================
-- 1. 基础数据统计
-- ============================================
SELECT '=== 基础数据统计 ===' AS section;

SELECT 
    'users' AS table_name, 
    COUNT(*) AS record_count 
FROM users
UNION ALL
SELECT 
    'recipes' AS table_name, 
    COUNT(*) AS record_count 
FROM recipes
UNION ALL
SELECT 
    'recipe_ingredients' AS table_name, 
    COUNT(*) AS record_count 
FROM recipe_ingredients
UNION ALL
SELECT 
    'recipe_steps' AS table_name, 
    COUNT(*) AS record_count 
FROM recipe_steps
UNION ALL
SELECT 
    'categories' AS table_name, 
    COUNT(*) AS record_count 
FROM categories
UNION ALL
SELECT 
    'contents' AS table_name, 
    COUNT(*) AS record_count 
FROM contents
UNION ALL
SELECT 
    'favorites' AS table_name, 
    COUNT(*) AS record_count 
FROM favorites
UNION ALL
SELECT 
    'user_history' AS table_name, 
    COUNT(*) AS record_count 
FROM user_history
UNION ALL
SELECT 
    'comments' AS table_name, 
    COUNT(*) AS record_count 
FROM comments
ORDER BY table_name;

-- ============================================
-- 2. 配方数据分布验证
-- ============================================
SELECT '=== 配方数据分布 ===' AS section;

-- 按疗效分类统计
SELECT 
    '按疗效分类' AS category_type,
    efficacy_tag,
    COUNT(*) AS recipe_count
FROM (
    SELECT jsonb_array_elements_text(efficacy_tags) AS efficacy_tag FROM recipes
) t
GROUP BY efficacy_tag
ORDER BY recipe_count DESC;

-- 按人群分类统计
SELECT 
    '按人群分类' AS category_type,
    crowd_tag,
    COUNT(*) AS recipe_count
FROM (
    SELECT jsonb_array_elements_text(crowd_tags) AS crowd_tag FROM recipes
) t
GROUP BY crowd_tag
ORDER BY recipe_count DESC;

-- 按节气分类统计
SELECT 
    '按节气分类' AS category_type,
    solar_tag,
    COUNT(*) AS recipe_count
FROM (
    SELECT jsonb_array_elements_text(solar_term_tags) AS solar_tag FROM recipes
) t
GROUP BY solar_tag
ORDER BY recipe_count DESC;

-- ============================================
-- 3. 内容数据分布验证
-- ============================================
SELECT '=== 内容数据分布 ===' AS section;

SELECT 
    source,
    content_type,
    COUNT(*) AS content_count
FROM contents
GROUP BY source, content_type
ORDER BY source, content_type;

-- ============================================
-- 4. 用户数据分布验证
-- ============================================
SELECT '=== 用户数据分布 ===' AS section;

-- 按语言分布
SELECT 
    language,
    COUNT(*) AS user_count
FROM users
GROUP BY language
ORDER BY user_count DESC;

-- 有微信绑定的用户
SELECT 
    '有微信绑定' AS user_type,
    COUNT(*) AS count
FROM users
WHERE wx_openid IS NOT NULL
UNION ALL
SELECT 
    '有抖音绑定' AS user_type,
    COUNT(*) AS count
FROM users
WHERE dy_openid IS NOT NULL
UNION ALL
SELECT 
    '有手机号' AS user_type,
    COUNT(*) AS count
FROM users
WHERE phone IS NOT NULL;

-- ============================================
-- 5. 收藏数据验证
-- ============================================
SELECT '=== 收藏数据分布 ===' AS section;

SELECT 
    u.nickname,
    COUNT(f.id) AS favorite_count
FROM users u
LEFT JOIN favorites f ON u.id = f.user_id
GROUP BY u.id, u.nickname
ORDER BY favorite_count DESC
LIMIT 10;

-- ============================================
-- 6. 评论数据验证
-- ============================================
SELECT '=== 评论数据分布 ===' AS section;

-- 评分分布
SELECT 
    rating,
    COUNT(*) AS comment_count
FROM comments
GROUP BY rating
ORDER BY rating DESC;

-- 评论最多的配方
SELECT 
    r.name_zh_cn,
    COUNT(c.id) AS comment_count
FROM recipes r
LEFT JOIN comments c ON r.id = c.recipe_id
GROUP BY r.id, r.name_zh_cn
ORDER BY comment_count DESC
LIMIT 10;

-- ============================================
-- 7. 数据完整性验证
-- ============================================
SELECT '=== 数据完整性检查 ===' AS section;

-- 检查孤立数据
SELECT 
    '孤立食材' AS check_item,
    COUNT(*) AS count
FROM recipe_ingredients ri
LEFT JOIN recipes r ON ri.recipe_id = r.id
WHERE r.id IS NULL
UNION ALL
SELECT 
    '孤立步骤' AS check_item,
    COUNT(*) AS count
FROM recipe_steps rs
LEFT JOIN recipes r ON rs.recipe_id = r.id
WHERE r.id IS NULL
UNION ALL
SELECT 
    '孤立收藏' AS check_item,
    COUNT(*) AS count
FROM favorites f
LEFT JOIN users u ON f.user_id = u.id
WHERE u.id IS NULL
UNION ALL
SELECT 
    '孤立评论' AS check_item,
    COUNT(*) AS count
FROM comments c
LEFT JOIN users u ON c.user_id = u.id
WHERE u.id IS NULL;

-- ============================================
-- 8. 汇总报告
-- ============================================
SELECT '=== 数据填充完成报告 ===' AS section;

SELECT 
    '总计' AS metric,
    (
        (SELECT COUNT(*) FROM users) +
        (SELECT COUNT(*) FROM recipes) +
        (SELECT COUNT(*) FROM recipe_ingredients) +
        (SELECT COUNT(*) FROM recipe_steps) +
        (SELECT COUNT(*) FROM contents) +
        (SELECT COUNT(*) FROM favorites) +
        (SELECT COUNT(*) FROM user_history) +
        (SELECT COUNT(*) FROM comments)
    ) AS total_records;
