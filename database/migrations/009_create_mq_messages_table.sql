-- 消息队列表 (mq_messages)
-- PRD 7.6.9
CREATE TABLE IF NOT EXISTS mq_messages (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY COMMENT '主键ID',
    queue_name VARCHAR(50) NOT NULL COMMENT '队列名称',
    message_type VARCHAR(50) NOT NULL COMMENT '消息类型',
    payload JSON NOT NULL COMMENT '消息内容',
    status TINYINT NOT NULL DEFAULT 0 COMMENT '状态: 0-待处理, 1-处理中, 2-成功, 3-失败',
    retry_count TINYINT NOT NULL DEFAULT 0 COMMENT '重试次数',
    error_msg TEXT COMMENT '错误信息',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    processed_at DATETIME COMMENT '处理时间',
    
    INDEX idx_queue_status (queue_name, status),
    INDEX idx_status (status),
    INDEX idx_created_at (created_at),
    INDEX idx_processed_at (processed_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='消息队列表';
