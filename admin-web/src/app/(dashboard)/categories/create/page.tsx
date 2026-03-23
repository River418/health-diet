'use client';

import React, { useEffect } from 'react';
import { Form, Input, InputNumber, Switch, Button, Card, message, Spin } from 'antd';
import { useRouter } from 'next/navigation';
import { ArrowLeftOutlined } from '@ant-design/icons';
import { Category, ApiResponse } from '@/types';
import { api } from '@/utils/api';

export default function CreateCategoryPage() {
  const router = useRouter();
  const [form] = Form.useForm();
  const [loading, setLoading] = React.useState(false);

  const handleSubmit = async (values: Partial<Category>) => {
    setLoading(true);
    try {
      await api.post<Category>('/categories', values);
      message.success('创建成功');
      router.push('/categories');
    } catch {
      message.error('创建失败');
    } finally {
      setLoading(false);
    }
  };

  return (
    <Card
      title={
        <div className="flex items-center gap-2">
          <Button type="text" icon={<ArrowLeftOutlined />} onClick={() => router.back()} />
          <span>新增分类</span>
        </div>
      }
    >
      <Form
        form={form}
        layout="vertical"
        initialValues={{ isActive: true, sortOrder: 0 }}
        onFinish={handleSubmit}
        style={{ maxWidth: 600 }}
      >
        <Form.Item
          name="name"
          label="分类名称"
          rules={[{ required: true, message: '请输入分类名称' }]}
        >
          <Input placeholder="请输入分类名称" />
        </Form.Item>

        <Form.Item
          name="slug"
          label="URL 标识"
          rules={[
            { required: true, message: '请输入 URL 标识' },
            { pattern: /^[a-z0-9-]+$/, message: '只能包含小写字母、数字和连字符' },
          ]}
        >
          <Input placeholder="例如: health-recipes" />
        </Form.Item>

        <Form.Item name="description" label="描述">
          <Input.TextArea rows={3} placeholder="请输入分类描述" />
        </Form.Item>

        <Form.Item
          name="sortOrder"
          label="排序"
          rules={[{ required: true, message: '请输入排序值' }]}
        >
          <InputNumber min={0} placeholder="数字越小排序越靠前" style={{ width: '100%' }} />
        </Form.Item>

        <Form.Item name="isActive" label="状态" valuePropName="checked">
          <Switch checkedChildren="启用" unCheckedChildren="禁用" />
        </Form.Item>

        <Form.Item>
          <Button type="primary" htmlType="submit" loading={loading}>
            创建
          </Button>
          <Button style={{ marginLeft: 8 }} onClick={() => router.back()}>
            取消
          </Button>
        </Form.Item>
      </Form>
    </Card>
  );
}