'use client';

import React, { useEffect, useState } from 'react';
import { Form, Input, InputNumber, Switch, Button, Card, message, Spin } from 'antd';
import { useRouter, useParams } from 'next/navigation';
import { ArrowLeftOutlined } from '@ant-design/icons';
import { Category, ApiResponse } from '@/types';
import { api } from '@/utils/api';

export default function EditCategoryPage() {
  const router = useRouter();
  const params = useParams();
  const [form] = Form.useForm();
  const [loading, setLoading] = useState(false);
  const [fetching, setFetching] = useState(true);

  useEffect(() => {
    const fetchCategory = async () => {
      try {
        const response = await api.get<Category>(`/categories/${params.id}`);
        form.setFieldsValue(response.data.data);
      } catch {
        message.error('获取分类信息失败');
        router.push('/categories');
      } finally {
        setFetching(false);
      }
    };
    fetchCategory();
  }, [params.id, form, router]);

  const handleSubmit = async (values: Partial<Category>) => {
    setLoading(true);
    try {
      await api.put<Category>(`/categories/${params.id}`, values);
      message.success('更新成功');
      router.push('/categories');
    } catch {
      message.error('更新失败');
    } finally {
      setLoading(false);
    }
  };

  if (fetching) {
    return (
      <div className="flex items-center justify-center min-h-[400px]">
        <Spin size="large" />
      </div>
    );
  }

  return (
    <Card
      title={
        <div className="flex items-center gap-2">
          <Button type="text" icon={<ArrowLeftOutlined />} onClick={() => router.back()} />
          <span>编辑分类</span>
        </div>
      }
    >
      <Form
        form={form}
        layout="vertical"
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
            保存
          </Button>
          <Button style={{ marginLeft: 8 }} onClick={() => router.back()}>
            取消
          </Button>
        </Form.Item>
      </Form>
    </Card>
  );
}