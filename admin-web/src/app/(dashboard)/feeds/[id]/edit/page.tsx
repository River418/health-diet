'use client';

import React, { useEffect, useState, useCallback } from 'react';
import {
  Form,
  Input,
  Button,
  Card,
  message,
  Spin,
  Select,
  Switch,
} from 'antd';
import { useRouter, useParams } from 'next/navigation';
import { ArrowLeftOutlined } from '@ant-design/icons';
import { Stream, Category, PaginationData } from '@/types';
import { api } from '@/utils/api';

const { Option } = Select;
const { TextArea } = Input;

export default function EditFeedPage() {
  const router = useRouter();
  const params = useParams();
  const [form] = Form.useForm();
  const [loading, setLoading] = useState(false);
  const [fetching, setFetching] = useState(true);
  const [categories, setCategories] = useState<Category[]>([]);

  const fetchData = useCallback(async () => {
    try {
      const [categoriesRes, feedRes] = await Promise.all([
        api.get<PaginationData<Category>>('/categories', {
          params: { pageSize: 100 },
        }),
        api.get<Stream>(`/feeds/${params.id}`),
      ]);
      
      setCategories(categoriesRes.data.data.list);
      const feedData = feedRes.data.data;
      form.setFieldsValue({
        ...feedData,
        tags: feedData.tags || [],
      });
    } catch {
      message.error('获取信息流信息失败');
      router.push('/feeds');
    } finally {
      setFetching(false);
    }
  }, [params.id, form, router]);

  useEffect(() => {
    fetchData();
  }, [fetchData]);

  const handleSubmit = async (values: Partial<Stream>) => {
    setLoading(true);
    try {
      const data = {
        ...values,
        tags: values.tags || [],
      };
      await api.put<Stream>(`/feeds/${params.id}`, data);
      message.success('更新成功');
      router.push('/feeds');
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
          <span>编辑信息流</span>
        </div>
      }
    >
      <Form
        form={form}
        layout="vertical"
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