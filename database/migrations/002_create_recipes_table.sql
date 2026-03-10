-- 配方表 (recipes)
-- PRD 7.6.2
CREATE TABLE IF NOT EXISTS recipes (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT '主键ID',
    name_zh_cn VARCHAR(100) NOT NULL COMMENT '名称(简中)',
    name_zh_tw VARCHAR(100) COMMENT '名称(繁中)',
    name_en VARCHAR(100) COMMENT '名称(英文)',
    description_zh_cn TEXT NOT NULL COMMENT '简介(简中)',
    description_zh_tw TEXT COMMENT '简介(繁中)',
    description_en TEXT COMMENT '简介(英文)',
    cover_image VARCHAR(255) NOT NULL COMMENT '封面图URL',
    video_url VARCHAR(255) COMMENT '视频URL',
    video_duration INT COMMENT '视频时长(秒)',
    crowd_tags JSON NOT NULL DEFAULT '[]' COMMENT '人群标签',
    efficacy_tags JSON NOT NULL DEFAULT '[]' COMMENT '功效标签',
    solar_term_tags JSON COMMENT '节气标签',
    nutrition JSON COMMENT '营养信息: {calories, protein, fat, carbs}',
    view_count INT NOT NULL DEFAULT 0 COMMENT '浏览数',
    favorite_count INT NOT NULL DEFAULT 0 COMMENT '收藏数',
    comment_count INT NOT NULL DEFAULT 0 COMMENT '评论数',
    rating DECIMAL(2,1) NOT NULL DEFAULT 5.0 COMMENT '评分(1-5)',
    status TINYINT NOT NULL DEFAULT 1 COMMENT '状态: 0-草稿, 1-已发布, 2-下架',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    
    INDEX idx_status (status),
    INDEX idx_created_at (created_at),
    INDEX idx_rating (rating),
    INDEX idx_view_count (view_count),
    FULLTEXT INDEX ft_name_zh_cn (name_zh_cn) WITH PARSER ngram
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='食疗配方表';
