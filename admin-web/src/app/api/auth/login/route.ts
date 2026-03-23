import { NextRequest, NextResponse } from 'next/server';
import { ApiResponse, User, LoginResponse } from '@/types';

const mockUsers: Record<string, { password: string; user: User }> = {
  admin: {
    password: 'admin123',
    user: {
      id: '1',
      username: 'admin',
      email: 'admin@health-diet.com',
      role: 'admin',
      createdAt: '2024-01-01T00:00:00Z',
      updatedAt: '2024-01-01T00:00:00Z',
    },
  },
  editor: {
    password: 'editor123',
    user: {
      id: '2',
      username: 'editor',
      email: 'editor@health-diet.com',
      role: 'editor',
      createdAt: '2024-01-01T00:00:00Z',
      updatedAt: '2024-01-01T00:00:00Z',
    },
  },
};

export async function POST(request: NextRequest) {
  try {
    const body = await request.json();
    const { username, password } = body;

    const userData = mockUsers[username];

    if (!userData || userData.password !== password) {
      return NextResponse.json<ApiResponse<null>>(
        {
          code: 401,
          message: '用户名或密码错误',
          data: null,
          timestamp: new Date().toISOString(),
        },
        { status: 401 }
      );
    }

    const response: LoginResponse = {
      token: `mock-jwt-token-${username}-${Date.now()}`,
      user: userData.user,
    };

    return NextResponse.json<ApiResponse<LoginResponse>>({
      code: 200,
      message: '登录成功',
      data: response,
      timestamp: new Date().toISOString(),
    });
  } catch {
    return NextResponse.json<ApiResponse<null>>(
      {
        code: 500,
        message: '服务器错误',
        data: null,
        timestamp: new Date().toISOString(),
      },
      { status: 500 }
    );
  }
}