'use client';

import React, { useState, useEffect } from 'react';
import { Form, Input, Button, Card, message, Spin } from 'antd';
import { UserOutlined, LockOutlined } from '@ant-design/icons';
import { useRouter, useSearchParams } from 'next/navigation';
import { useAuthStore } from '@/stores';
import { api } from '@/utils/api';
import { LoginRequest, User } from '@/types';

export default function LoginPage() {
  const [loading, setLoading] = useState(false);
  const router = useRouter();
  const searchParams = useSearchParams();
  const { login } = useAuthStore();

  // 处理 URL 中的 token 参数（用于自动化测试）
  useEffect(() => {
    const token = searchParams.get('token');
    if (token) {
      // 使用 token 获取用户信息并登录
      const user: User = {
        id: "1",
        username: "admin",
        email: "admin@health-diet.com",
        role: "super_admin",
        createdAt: new Date().toISOString(),
        updatedAt: new Date().toISOString(),
      };
      login(token, user);
      router.push('/dashboard');
    }
  }, [searchParams, login, router]);

  const onFinish = async (values: LoginRequest) => {
    setLoading(true);
    try {
      const response = await api.post('/admin/auth/login', {
        username: values.username,
        password: values.password,
      });

      if (response.data.success) {
        const { token, admin } = response.data.data;
        const user: User = {
          id: admin.id,
          username: admin.username,
          email: `${admin.username}@health-diet.com`,
          role: admin.role,
          createdAt: new Date().toISOString(),
          updatedAt: new Date().toISOString(),
        };
        login(token, user);
        message.success('登录成功！');
        router.push('/dashboard');
      } else {
        message.error(response.data.error || '登录失败');
      }
    } catch (error: any) {
      message.error(error.response?.data?.error || '登录失败，请检查用户名和密码');
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="min-h-screen flex items-center justify-center bg-gradient-to-br from-blue-500 to-purple-600 p-4">
      <Card className="w-full max-w-md shadow-2xl">
        <div className="text-center mb-8">
          <h1 className="text-3xl font-bold text-gray-800 mb-2">健康饮食管理后台</h1>
          <p className="text-gray-500">Health Diet Admin</p>
        </div>
        
        <Spin spinning={loading}>
          <Form
            name="login"
            initialValues={{ remember: true }}
            onFinish={onFinish}
            autoComplete="off"
            size="large"
          >
            <Form.Item
              name="username"
              rules={[{ required: true, message: '请输入用户名' }]}
            >
              <Input
                prefix={<UserOutlined className="text-gray-400" />}
                placeholder="用户名"
              />
            </Form.Item>

            <Form.Item
              name="password"
              rules={[{ required: true, message: '请输入密码' }]}
            >
              <Input.Password
                prefix={<LockOutlined className="text-gray-400" />}
                placeholder="密码"
              />
            </Form.Item>

            <Form.Item>
              <Button
                type="primary"
                htmlType="submit"
                className="w-full"
                loading={loading}
              >
                登录
              </Button>
            </Form.Item>
          </Form>
        </Spin>
        
        <div className="text-center text-gray-400 text-sm mt-4">
          <p>默认账号: admin / 密码: admin123</p>
        </div>
      </Card>
    </div>
  );
}