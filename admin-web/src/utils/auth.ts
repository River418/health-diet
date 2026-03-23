import { useAuthStore } from '@/stores';

// 检查用户是否有权限
export const hasPermission = (requiredRole: string[]): boolean => {
  const { user } = useAuthStore.getState();
  if (!user) return false;
  return requiredRole.includes(user.role);
};

// 检查是否是管理员
export const isAdmin = (): boolean => {
  const { user } = useAuthStore.getState();
  return user?.role === 'admin';
};

// 检查是否是编辑或管理员
export const isEditor = (): boolean => {
  const { user } = useAuthStore.getState();
  return user?.role === 'editor' || user?.role === 'admin';
};

// 获取 token
export const getToken = (): string | null => {
  return useAuthStore.getState().token;
};
