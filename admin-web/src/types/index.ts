// 用户类型
export interface User {
  id: string;
  username: string;
  email: string;
  role: 'admin' | 'editor' | 'viewer';
  avatar?: string;
  createdAt: string;
  updatedAt: string;
}

// 分类类型
export interface Category {
  id: string;
  name: string;
  slug: string;
  description?: string;
  icon?: string;
  sortOrder: number;
  isActive: boolean;
  parentId?: string;
  createdAt: string;
  updatedAt: string;
}

// 信息流类型
export interface Stream {
  id: string;
  title: string;
  content: string;
  summary?: string;
  coverImage?: string;
  categoryId: string;
  category?: Category;
  authorId: string;
  author?: User;
  tags: string[];
  isPublished: boolean;
  viewCount: number;
  likeCount: number;
  publishedAt?: string;
  createdAt: string;
  updatedAt: string;
}

// 食谱类型
export interface Recipe {
  id: string;
  title: string;
  description?: string;
  coverImage?: string;
  ingredients: Ingredient[];
  steps: RecipeStep[];
  nutritionInfo?: NutritionInfo;
  categoryId: string;
  category?: Category;
  authorId: string;
  author?: User;
  tags: string[];
  difficulty: 'easy' | 'medium' | 'hard';
  prepTime: number;
  cookTime: number;
  servings: number;
  isPublished: boolean;
  viewCount: number;
  likeCount: number;
  createdAt: string;
  updatedAt: string;
}

// 食材类型
export interface Ingredient {
  id: string;
  name: string;
  amount: string;
  unit: string;
}

// 食谱步骤类型
export interface RecipeStep {
  id: string;
  order: number;
  description: string;
  image?: string;
}

// 营养信息类型
export interface NutritionInfo {
  calories: number;
  protein: number;
  carbs: number;
  fat: number;
  fiber?: number;
}

// API 响应类型
export interface ApiResponse<T> {
  code: number;
  message: string;
  data: T;
  timestamp: string;
}

// 分页类型
export interface PaginationData<T> {
  list: T[];
  total: number;
  page: number;
  pageSize: number;
}

// 登录请求类型
export interface LoginRequest {
  username: string;
  password: string;
  remember?: boolean;
}

// 登录响应类型
export interface LoginResponse {
  token: string;
  user: User;
}
