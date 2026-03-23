'use client';

import React, { useState, useEffect, useCallback } from 'react';
import {
  Table,
  Button,
  Space,
  Tag,
  Input,
  Select,
  message,
  Popconfirm,
  Card,
  Image,
} from 'antd';
import {
  PlusOutlined,
  EditOutlined,
  DeleteOutlined,
  FileTextOutlined,
  EyeOutlined,
  LikeOutlined,
} from '@ant-design/icons';
import { useRouter } from 'next/navigation';
import { Stream, Category, PaginationData } from '@/types';
import { api } from '@/utils/api';

const { Option } = Select;

export default function FeedsPage() {
  const router = useRouter();
  const [feeds, setFeeds] = useState<Stream[]>([]);
  const [categories, setCategories] = useState<Category[]>([]);
  const [loading, setLoading] = useState(false);
  const [pagination, setPagination] = useState({ page: 1, pageSize: 10, total: 0 });
  const [searchText, setSearchText] = useState('');
  const [filterCategory, setFilterCategory] = useState<string>('');
  const [filterStatus, setFilterStatus] = useState<string>('');

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

  const fetchFeeds = useCallback(async (page = 1, pageSize = 10, search = '', categoryId = '', status = '') => {
    setLoading(true);
    try {
      const params: Record<string, unknown> = { page, pageSize, search };
      if (categoryId) params.categoryId = categoryId;
      if (status) params.isPublished = status === 'published';
      
      const response = await api.get<PaginationData<Stream>>('/feeds', {
        params,
      });
      setFeeds(response.data.data.list);
      setPagination({
        page: response.data.data.page,
        pageSize: response.data.data.pageSize,
        total: response.data.data.total,
      });
    } catch {
      message.error('获取信息流列表失败');
    } finally {
      setLoading(false);
    }
  }, []);

  useEffect(() => {
    fetchCategories();
    fetchFeeds();
  }, [fetchCategories, fetchFeeds]);

  const handleSearch = (value: string) => {
    setSearchText(value);
    fetchFeeds(1, pagination.pageSize, value, filterCategory, filterStatus);
  };

  useEffect(() => {
    fetchFeeds(1, pagination.pageSize, searchText, filterCategory, filterStatus);
  }, [filterCategory, filterStatus, fetchFeeds, pagination.pageSize, searchText]);

  const handleTableChange = (newPagination: { current?: number; pageSize?: number }) => {
    fetchFeeds(
      newPagination.current || 1,
      newPagination.pageSize || 10,
      searchText,
      filterCategory,
      filterStatus
    );
  };

  const handleAdd = () => {
    router.push('/feeds/create');
  };

  const handleEdit = (id: string) => {
    router.push(`/feeds/${id}/edit`);
  };

  const handleDelete = async (id: string) => {
    try {
      await api.delete(`/feeds/${id}`);
      message.success('删除成功');
      fetchFeeds(pagination.page, pagination.pageSize, searchText, filterCategory, filterStatus);
    } catch {
      message.error('删除失败');
    }
  };

  const columns = [
    {
      title: '封面',
      dataIndex: 'coverImage',
      key: 'coverImage',
      width: 100,
      render: (coverImage: string) => (
        coverImage ? (
          <Image
            src={coverImage}
            alt="cover"
            width={60}
            height={40}
            className="object-cover rounded"
            fallback="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNk+M9QDwADhgGAWjR9awAAAABJRU5ErkJggg=="
          />
        ) : (
          <div className="w-[60px] h-[40px] bg-gray-100 rounded flex items-center justify-center">
            <FileTextOutlined className="text-gray-400" />
          </div>
        )
      ),
    },
    {
      title: '标题',
      dataIndex: 'title',
      key: 'title',
      width: 200,
      ellipsis: true,
      render: (text: string) => <span className="font-medium">{text}</span>,
    },
    {
      title: '分类',
      dataIndex: 'category',
      key: 'category',
      width: 120,
      render: (category: Category) => (
        <Tag color="blue">{category?.name || '-'}</Tag>
      ),
    },
    {
      title: '作者',
      dataIndex: 'author',
      key: 'author',
      width: 100,
      render: (author: { username: string }) => author?.username || '-',
    },
    {
      title: '统计数据',
      key: 'stats',
      width: 150,
      render: (_: unknown, record: Stream) => (
        <Space size="small">
          <span className="text-gray-500 text-sm">
            <EyeOutlined /> {record.viewCount}
          </span>
          <span className="text-gray-500 text-sm">
            <LikeOutlined /> {record.likeCount}
          </span>
        </Space>
      ),
    },
    {
      title: '状态',
      dataIndex: 'isPublished',
      key: 'isPublished',
      width: 100,
      align: 'center' as const,
      render: (isPublished: boolean) => (
        <Tag color={isPublished ? 'success' : 'default'}>
          {isPublished ? '已发布' : '草稿'}
        </Tag>
      ),
    },
    {
      title: '发布时间',
      dataIndex: 'publishedAt',
      key: 'publishedAt',
      width: 180,
      render: (date: string) => date ? new Date(date).toLocaleString('zh-CN') : '-',
    },
    {
      title: '操作',
      key: 'action',
      width: 150,
      align: 'center' as const,
      render: (_: unknown, record: Stream) => (
        <Space size="small">
          <Button
            type="text"
            icon={<EditOutlined />}
            onClick={() => handleEdit(record.id)}
          />
          <Popconfirm
            title="确认删除"
            description="确定要删除这条信息流吗？此操作不可恢复。"
            onConfirm={() => handleDelete(record.id)}
            okText="确定"
            cancelText="取消"
          >
            <Button type="text" danger icon={<DeleteOutlined />} />
          </Popconfirm>
        </Space>
      ),
    },
  ];

  return (
    <Card
      title={
        <div className="flex items-center gap-2">
          <FileTextOutlined />
          <span>信息流管理</span>
        </div>
      }
      extra={
        <Space>
          <Input.Search
            placeholder="搜索标题"
            allowClear
            onSearch={handleSearch}
            style={{ width: 200 }}
          />
          <Select
            placeholder="分类"
            allowClear
            style={{ width: 120 }}
            value={filterCategory || undefined}
            onChange={(value) => setFilterCategory(value || '')}
          >
            {categories.map((cat) => (
              <Option key={cat.id} value={cat.id}>
                {cat.name}
              </Option>
            ))}
          </Select>
          <Select
            placeholder="状态"
            allowClear
            style={{ width: 100 }}
            value={filterStatus || undefined}
            onChange={(value) => setFilterStatus(value || '')}
          >
            <Option value="published">已发布</Option>
            <Option value="draft">草稿</Option>
          </Select>
          <Button type="primary" icon={<PlusOutlined />} onClick={handleAdd}>
            新增信息流
          </Button>
        </Space>
      }
    >
      <Table
        columns={columns}
        dataSource={feeds}
        rowKey="id"
        loading={loading}
        pagination={{
          current: pagination.page,
          pageSize: pagination.pageSize,
          total: pagination.total,
          showSizeChanger: true,
          showTotal: (total) => `共 ${total} 条`,
        }}
        onChange={handleTableChange}
      />
    </Card>
  );
}