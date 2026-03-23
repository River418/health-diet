import { getToken } from './auth';
import { useAuthStore } from '@/stores';

const API_BASE_URL = process.env.NEXT_PUBLIC_API_URL || 'http://localhost:3001/api';

interface RequestOptions extends RequestInit {
  params?: Record<string, string>;
}

// 通用请求函数
export async function request<T>(
  url: string,
  options: RequestOptions = {}
): Promise<T> {
  const { params, ...fetchOptions } = options;
  
  // 构建完整 URL
  let fullUrl = `${API_BASE_URL}${url}`;
  if (params) {
    const queryString = new URLSearchParams(params).toString();
    fullUrl += `?${queryString}`;
  }
  
  // 设置默认 headers
  const headers: Record<string, string> = {
    'Content-Type': 'application/json',
    ...((fetchOptions.headers as Record<string, string>) || {}),
  };
  
  // 添加认证 token
  const token = getToken();
  if (token) {
    headers['Authorization'] = `Bearer ${token}`;
  }
  
  try {
    const response = await fetch(fullUrl, {
      ...fetchOptions,
      headers,
    });
    
    if (!response.ok) {
      // 处理 401 未授权
      if (response.status === 401) {
        useAuthStore.getState().logout();
        window.location.href = '/login';
        throw new Error('未授权，请重新登录');
      }
      
      const errorData = await response.json().catch(() => ({}));
      throw new Error(errorData.message || `请求失败: ${response.status}`);
    }
    
    return await response.json();
  } catch (error) {
    console.error('Request error:', error);
    throw error;
  }
}

// GET 请求
export function get<T>(url: string, params?: Record<string, string>) {
  return request<T>(url, { method: 'GET', params });
}

// POST 请求
export function post<T>(url: string, data?: unknown) {
  return request<T>(url, {
    method: 'POST',
    body: data ? JSON.stringify(data) : undefined,
  });
}

// PUT 请求
export function put<T>(url: string, data?: unknown) {
  return request<T>(url, {
    method: 'PUT',
    body: data ? JSON.stringify(data) : undefined,
  });
}

// DELETE 请求
export function del<T>(url: string) {
  return request<T>(url, { method: 'DELETE' });
}
