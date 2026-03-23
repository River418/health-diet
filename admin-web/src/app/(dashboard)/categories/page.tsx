'use client';

import React, { useState, useEffect } from 'react';
import {
  Table,
  Button,
  Space,
  Tag,
  Modal,
  Form,
  Input,
  Select,
  Switch,
  message,
  Popconfirm,
  Card,
  InputNumber,
} from 'antd';
import {
  PlusOutlined,
  EditOutlined,
  DeleteOutlined,
  AppstoreOutlined,
} from '@ant-design/icons';
import { useRouter } from 'next/navigation';
import { Category, ApiResponse, PaginationData } from '@/types';
import { api } from '@/utils/api';

const { Option } = Select;

export default function CategoriesPage() {
  const router = useRouter();
  const [categories, setCategories] = useState<Category[]>([]);
  const [loading, setLoading] = useState(false);
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [editingCategory, setEditingCategory] = useState<Category | null>(null);
  const [form] = Form.useForm();
  const [pagination, setPagination] = useState({ page: 1, pageSize: 10, total: 0 });
  const [searchText, setSearchText] = useState('');

  const fetchCategories = async (page = 1, pageSize = 10, search = '') => {
    setLoading(true);
    try {
      const response = await api.get<PaginationData<Category>>('/categories', {
        params: { page, pageSize, search },
      });
      setCategories(response.data.data.list);
      setPagination({
        page: response.data.data.page,
        pageSize: response.data.data.pageSize,
        total: response.data.data.total,
      });
    } catch {
      message.error('获取分类列表失败');
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchCategories();
  }, []);

  const handleSearch = (value: string) => {
    setSearchText(value);
    fetchCategories(1, pagination.pageSize, value);
  };

  const handleTableChange = (newPagination: { current?: number; pageSize?: number }) => {
    fetchCategories(newPagination.current || 1, newPagination.pageSize || 10, searchText);
  };

  const handleAdd = () => {
    router.push('/categories/create');
  };

  const handleEdit = (id: string) => {
    router.push(`/categories/${id}/edit`);
  };

  const handleDelete = async (id: string) => {
    try {
      await api.delete(`/categories/${id}`);
      message.success('删除成功');
      fetchCategories(pagination.page, pagination.pageSize, searchText);
    } catch {
      message.error('删除失败');
    }
  };

  const columns = [
    {
      title: '分类名称',
      dataIndex: 'name',
      key: 'name',
      render: (text: string, record: Category) => (
        <div>
          <div className="font-medium">{text}</div>
          <div className="text-gray-400 text-sm">/{record.slug}</div>
        </div>
      ),
    },
    {
      title: '描述',
      dataIndex: 'description',
      key: 'description',
      ellipsis: true,
    },
    {
      title: '排序',
      dataIndex: 'sortOrder',
      key: 'sortOrder',
      width: 80,
      align: 'center' as const,
    },
    {
      title: '状态',
      dataIndex: 'isActive',
      key: 'isActive',
      width: 100,
      align: 'center' as const,
      render: (isActive: boolean) => (
        <Tag color={isActive ? 'success' : 'default'}>
          {isActive ? '启用' : '禁用'}
        </Tag>
      ),
    },
    {
      title: '创建时间',
      dataIndex: 'createdAt',
      key: 'createdAt',
      width: 180,
      render: (date: string) => new Date(date).toLocaleString('zh-CN'),
    },
    {
      title: '操作',
      key: 'action',
      width: 150,
      align: 'center' as const,
      render: (_: unknown, record: Category) => (
        <Space size="small">
          <Button
            type="text"
            icon={<EditOutlined />}
            onClick={() => handleEdit(record.id)}
          />
          <Popconfirm
            title="确认删除"
            description="确定要删除这个分类吗？此操作不可恢复。"
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
          <AppstoreOutlined />
          <span>分类管理</span>
        </div>
      }
      extra={
        <Space>
          <Input.Search
            placeholder="搜索分类"
            allowClear
            onSearch={handleSearch}
            style={{ width: 200 }}
          />
          <Button type="primary" icon={<PlusOutlined />} onClick={handleAdd}>
            新增分类
          </Button>
        </Space>
      }
    >
      <Table
        columns={columns}
        dataSource={categories}
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