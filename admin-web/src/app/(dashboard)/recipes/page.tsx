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
  BookOutlined,
  EyeOutlined,
  LikeOutlined,
  ClockCircleOutlined,
} from '@ant-design/icons';
import { useRouter } from 'next/navigation';
import { Recipe, Category, PaginationData } from '@/types';
import { api } from '@/utils/api';

const { Option } = Select;

const difficultyMap: Record<string, { color: string; text: string }> = {
  easy: { color: 'success', text: '简单' },
  medium: { color: 'warning', text: '中等' },
  hard: { color: 'error', text: '困难' },
};

export default function RecipesPage() {
  const router = useRouter();
  const [recipes, setRecipes] = useState<Recipe[]>([]);
  const [categories, setCategories] = useState<Category[]>([]);
  const [loading, setLoading] = useState(false);
  const [pagination, setPagination] = useState({ page: 1, pageSize: 10, total: 0 });
  const [searchText, setSearchText] = useState('');
  const [filterCategory, setFilterCategory] = useState<string>('');
  const [filterDifficulty, setFilterDifficulty] = useState<string>('');
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

  const fetchRecipes = useCallback(async (page = 1, pageSize = 10, search = '', categoryId = '', difficulty = '', status = '') => {
    setLoading(true);
    try {
      const params: Record<string, unknown> = { page, pageSize, search };
      if (categoryId) params.categoryId = categoryId;
      if (difficulty) params.difficulty = difficulty;
      if (status) params.isPublished = status === 'published';
      
      const response = await api.get<PaginationData<Recipe>>('/recipes', {
        params,
      });
      setRecipes(response.data.data.list);
      setPagination({
        page: response.data.data.page,
        pageSize: response.data.data.pageSize,
        total: response.data.data.total,
      });
    } catch {
      message.error('获取食谱列表失败');
    } finally {
      setLoading(false);
    }
  }, []);

  useEffect(() => {
    fetchCategories();
    fetchRecipes();
  }, [fetchCategories, fetchRecipes]);

  const handleSearch = (value: string) => {
    setSearchText(value);
    fetchRecipes(1, pagination.pageSize, value, filterCategory, filterDifficulty, filterStatus);
  };

  useEffect(() => {
    fetchRecipes(1, pagination.pageSize, searchText, filterCategory, filterDifficulty, filterStatus);
  }, [filterCategory, filterDifficulty, filterStatus, fetchRecipes, pagination.pageSize, searchText]);

  const handleTableChange = (newPagination: { current?: number; pageSize?: number }) => {
    fetchRecipes(
      newPagination.current || 1,
      newPagination.pageSize || 10,
      searchText,
      filterCategory,
      filterDifficulty,
      filterStatus
    );
  };

  const handleAdd = () => {
    router.push('/recipes/create');
  };

  const handleEdit = (id: string) => {
    router.push(`/recipes/${id}/edit`);
  };

  const handleDelete = async (id: string) => {
    try {
      await api.delete(`/recipes/${id}`);
      message.success('删除成功');
      fetchRecipes(pagination.page, pagination.pageSize, searchText, filterCategory, filterDifficulty, filterStatus);
    } catch {
      message.error('删除失败');
    }
  };

  const formatTime = (minutes: number) => {
    if (minutes < 60) return `${minutes}分钟`;
    const hours = Math.floor(minutes / 60);
    const mins = minutes % 60;
    return mins > 0 ? `${hours}小时${mins}分钟` : `${hours}小时`;
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
            <BookOutlined className="text-gray-400" />
          </div>
        )
      ),
    },
    {
      title: '食谱名称',
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
      width: 100,
      render: (category: Category) => (
        <Tag color="blue">{category?.name || '-'}</Tag>
      ),
    },
    {
      title: '难度',
      dataIndex: 'difficulty',
      key: 'difficulty',
      width: 80,
      align: 'center' as const,
      render: (difficulty: string) => {
        const config = difficultyMap[difficulty] || { color: 'default', text: difficulty };
        return <Tag color={config.color}>{config.text}</Tag>;
      },
    },
    {
      title: '时间',
      key: 'time',
      width: 140,
      render: (_: unknown, record: Recipe) => (
        <Space direction="vertical" size={0}>
          <span className="text-gray-500 text-xs">
            <ClockCircleOutlined /> 准备: {formatTime(record.prepTime)}
          </span>
          <span className="text-gray-500 text-xs">
            <ClockCircleOutlined /> 烹饪: {formatTime(record.cookTime)}
          </span>
        </Space>
      ),
    },
    {
      title: '份量',
      dataIndex: 'servings',
      key: 'servings',
      width: 80,
      align: 'center' as const,
      render: (servings: number) => `${servings}人份`,
    },
    {
      title: '统计数据',
      key: 'stats',
      width: 120,
      render: (_: unknown, record: Recipe) => (
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
      width: 80,
      align: 'center' as const,
      render: (isPublished: boolean) => (
        <Tag color={isPublished ? 'success' : 'default'}>
          {isPublished ? '已发布' : '草稿'}
        </Tag>
      ),
    },
    {
      title: '操作',
      key: 'action',
      width: 120,
      align: 'center' as const,
      render: (_: unknown, record: Recipe) => (
        <Space size="small">
          <Button
            type="text"
            icon={<EditOutlined />}
            onClick={() => handleEdit(record.id)}
          />
          <Popconfirm
            title="确认删除"
            description="确定要删除这个食谱吗？此操作不可恢复。"
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
          <BookOutlined />
          <span>食谱管理</span>
        </div>
      }
      extra={
        <Space wrap>
          <Input.Search
            placeholder="搜索食谱名称"
            allowClear
            onSearch={handleSearch}
            style={{ width: 180 }}
          />
          <Select
            placeholder="分类"
            allowClear
            style={{ width: 100 }}
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
            placeholder="难度"
            allowClear
            style={{ width: 90 }}
            value={filterDifficulty || undefined}
            onChange={(value) => setFilterDifficulty(value || '')}
          >
            <Option value="easy">简单</Option>
            <Option value="medium">中等</Option>
            <Option value="hard">困难</Option>
          </Select>
          <Select
            placeholder="状态"
            allowClear
            style={{ width: 90 }}
            value={filterStatus || undefined}
            onChange={(value) => setFilterStatus(value || '')}
          >
            <Option value="published">已发布</Option>
            <Option value="draft">草稿</Option>
          </Select>
          <Button type="primary" icon={<PlusOutlined />} onClick={handleAdd}>
            新增食谱
          </Button>
        </Space>
      }
    >
      <Table
        columns={columns}
        dataSource={recipes}
        rowKey="id"
        loading={loading}
        scroll={{ x: 1200 }}
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