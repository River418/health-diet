-- 消息队列表 (mq_messages)
-- PRD 7.6.9
CREATE TABLE IF NOT EXISTS mq_messages (
    id BIGSERIAL PRIMARY KEY,
    queue_name VARCHAR(50) NOT NULL,
    message_type VARCHAR(50) NOT NULL,
    payload JSONB NOT NULL,
    status SMALLINT NOT NULL DEFAULT 0,
    retry_count SMALLINT NOT NULL DEFAULT 0,
    error_msg TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    processed_at TIMESTAMP
);

COMMENT ON TABLE mq_messages IS '消息队列表';
COMMENT ON COLUMN mq_messages.id IS '主键ID';
COMMENT ON COLUMN mq_messages.queue_name IS '队列名称';
COMMENT ON COLUMN mq_messages.message_type IS '消息类型';
COMMENT ON COLUMN mq_messages.payload IS '消息内容';
COMMENT ON COLUMN mq_messages.status IS '状态: 0-待处理, 1-处理中, 2-成功, 3-失败';
COMMENT ON COLUMN mq_messages.retry_count IS '重试次数';
COMMENT ON COLUMN mq_messages.error_msg IS '错误信息';
COMMENT ON COLUMN mq_messages.created_at IS '创建时间';
COMMENT ON COLUMN mq_messages.processed_at IS '处理时间';

CREATE INDEX idx_mq_messages_queue_status ON mq_messages(queue_name, status);
CREATE INDEX idx_mq_messages_status ON mq_messages(status);
CREATE INDEX idx_mq_messages_created_at ON mq_messages(created_at);
CREATE INDEX idx_mq_messages_processed_at ON mq_messages(processed_at);
