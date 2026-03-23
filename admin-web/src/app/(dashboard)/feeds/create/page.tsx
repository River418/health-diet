'use client';

import React, { useState, useEffect, useCallback } from 'react';
import {
  Form,
  Input,
  Button,
  Card,
  message,
  Select,
  Switch,
} from 'antd';
import { useRouter } from 'next/navigation';
import { ArrowLeftOutlined } from '@ant-design/icons';
import { Stream, Category, PaginationData } from '@/types';
import { api } from '@/utils/api';

const { Option } = Select;
const { TextArea } = Input;

export default function CreateFeedPage() {
  const router = useRouter();
  const [form] = Form.useForm();
  const [loading, setLoading] = useState(false);
  const [categories, setCategories] = useState<Category[]>([]);

  const fetchCategories = useCallback(async () => {
    try {
      const response = await api.get<PaginationData<Category>>('/categories', {
        params: { pageSize: 100 },
      });
      setCategories(response.data.data.list);
    } catch {
      message.error('获取分类列表失败');
    }
  }, []);

  useEffect(() => {
    fetchCategories();
  }, [fetchCategories]);

  const handleSubmit = async (values: Partial<Stream>) => {
    setLoading(true);
    try {
      const data = {
        ...values,
        tags: values.tags || [],
        isPublished: values.isPublished ?? false,
      };
      await api.post<Stream>('/feeds', data);
      message.success('创建成功');
      router.push('/feeds');
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
          <span>新增信息流</span>
        </div>
      }
    >
      <Form
        form={form}
        layout="vertical"
        initialValues={{ isActive: true, sortOrder: 0, isPublished: false }}
        onFinish={handleSubmit}
        style={{ maxWidth: 800 }}
      >
        <Form.Item
          name="title"
          label="标题"
          rules={[{ required: true, message: '请输入标题' }]}
        >
          <Input placeholder="请输入信息流标题" maxLength={100} />
        </Form.Item>

        <Form.Item
          name="summary"
          label="摘要"
        >
          <TextArea rows={2} placeholder="请输入摘要（选填）" maxLength={200} showCount />
        </Form.Item>

        <Form.Item
          name="coverImage"
          label="封面图片"
        >
          <Input placeholder="请输入封面图片URL（选填）" />
        </Form.Item>

        <Form.Item
          name="categoryId"
          label="分类"
          rules={[{ required: true, message: '请选择分类' }]}
        >
          <Select placeholder="请选择分类">
            {categories.map((cat) => (
              <Option key={cat.id} value={cat.id}>
                {cat.name}
              </Option>
            ))}
          </Select>
        </Form.Item>

        <Form.Item
          name="content"
          label="内容"
          rules={[{ required: true, message: '请输入内容' }]}
        >
          <TextArea rows={8} placeholder="请输入信息流内容" />
        </Form.Item>

        <Form.Item
          name="tags"
          label="标签"
        >
          <Select
            mode="tags"
            placeholder="输入标签后按回车添加"
            style={{ width: '100%' }}
          />
        </Form.Item>

        <Form.Item name="isPublished" label="发布状态" valuePropName="checked">
          <Switch checkedChildren="发布" unCheckedChildren="草稿" />
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