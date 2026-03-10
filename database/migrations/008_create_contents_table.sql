-- 内容表 (contents)
-- PRD 7.6.8
CREATE TABLE IF NOT EXISTS contents (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT '主键ID',
    title VARCHAR(200) NOT NULL COMMENT '内容标题',
    source VARCHAR(50) NOT NULL COMMENT '来源: wechat_video/wechat_article/douyin/self',
    source_url VARCHAR(500) NOT NULL COMMENT '原文链接',
    cover_image VARCHAR(255) COMMENT '封面图',
    author VARCHAR(100) COMMENT '作者',
    content_type VARCHAR(20) NOT NULL COMMENT '类型: video/article',
    tags JSON COMMENT '标签',
    view_count INT NOT NULL DEFAULT 0 COMMENT '浏览数',
    status TINYINT NOT NULL DEFAULT 1 COMMENT '状态: 0-待审核, 1-已发布, 2-已下架',
    published_at DATETIME COMMENT '发布时间',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    
    INDEX idx_source (source),
    INDEX idx_content_type (content_type),
    INDEX idx_status (status),
    INDEX idx_published_at (published_at),
    INDEX idx_created_at (created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='内容信息流表';
