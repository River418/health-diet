-- 用户表 (users)
-- PRD 7.6.1
CREATE TABLE IF NOT EXISTS users (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT '主键ID',
    wx_openid VARCHAR(64) UNIQUE COMMENT '微信openid',
    dy_openid VARCHAR(64) UNIQUE COMMENT '抖音openid',
    nickname VARCHAR(64) NOT NULL COMMENT '昵称',
    avatar VARCHAR(255) NOT NULL COMMENT '头像URL',
    phone VARCHAR(20) COMMENT '手机号',
    language VARCHAR(10) NOT NULL DEFAULT 'zh-CN' COMMENT '偏好语言: zh-CN/zh-TW/en',
    status TINYINT NOT NULL DEFAULT 1 COMMENT '状态: 0-禁用, 1-正常',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    
    INDEX idx_phone (phone),
    INDEX idx_status (status),
    INDEX idx_created_at (created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';
