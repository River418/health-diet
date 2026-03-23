import { NextRequest, NextResponse } from 'next/server';
import { ApiResponse, Recipe, PaginationData, Category, User, Ingredient, RecipeStep } from '@/types';

const mockCategories: Category[] = [
  { id: '1', name: '养生食谱', slug: 'health-recipes', sortOrder: 1, isActive: true, createdAt: '', updatedAt: '' },
  { id: '2', name: '减脂餐', slug: 'weight-loss', sortOrder: 2, isActive: true, createdAt: '', updatedAt: '' },
  { id: '3', name: '儿童营养', slug: 'kids-nutrition', sortOrder: 3, isActive: true, createdAt: '', updatedAt: '' },
];

const mockAuthors: User[] = [
  { id: '1', username: 'admin', email: 'admin@health-diet.com', role: 'admin', createdAt: '', updatedAt: '' },
];

const mockRecipes: Recipe[] = [
  {
    id: '1',
    title: '清蒸鲈鱼',
    description: '清淡鲜美的清蒸鲈鱼，营养丰富，适合全家享用',
    coverImage: 'https://picsum.photos/seed/recipe1/300/200',
    categoryId: '1',
    category: mockCategories[0],
    authorId: '1',
    author: mockAuthors[0],
    tags: ['海鲜', '清蒸', '养生'],
    difficulty: 'medium',
    prepTime: 15,
    cookTime: 20,
    servings: 4,
    isPublished: true,
    viewCount: 1250,
    likeCount: 89,
    ingredients: [
      { id: '1', name: '鲈鱼', amount: '1', unit: '条' },
      { id: '2', name: '姜丝', amount: '20', unit: '克' },
      { id: '3', name: '葱段', amount: '30', unit: '克' },
      { id: '4', name: '蒸鱼豉油', amount: '2', unit: '勺' },
    ],
    steps: [
      { id: '1', order: 1, description: '鲈鱼洗净，在鱼身两面划几刀' },
      { id: '2', order: 2, description: '鱼身铺上姜丝和葱段' },
      { id: '3', order: 3, description: '水开后放入蒸锅，大火蒸10分钟' },
      { id: '4', order: 4, description: '取出后淋上蒸鱼豉油即可' },
    ],
    nutritionInfo: { calories: 180, protein: 28, carbs: 2, fat: 6 },
    createdAt: '2024-03-10T10:00:00Z',
    updatedAt: '2024-03-10T10:00:00Z',
  },
  {
    id: '2',
    title: '蒜蓉西兰花',
    description: '简单快手的蒜蓉西兰花，保留蔬菜的鲜脆口感',
    coverImage: 'https://picsum.photos/seed/recipe2/300/200',
    categoryId: '2',
    category: mockCategories[1],
    authorId: '1',
    author: mockAuthors[0],
    tags: ['蔬菜', '快手菜', '减脂'],
    difficulty: 'easy',
    prepTime: 5,
    cookTime: 5,
    servings: 2,
    isPublished: true,
    viewCount: 980,
    likeCount: 76,
    ingredients: [
      { id: '1', name: '西兰花', amount: '300', unit: '克' },
      { id: '2', name: '蒜末', amount: '15', unit: '克' },
      { id: '3', name: '盐', amount: '适量', unit: '' },
      { id: '4', name: '食用油', amount: '1', unit: '勺' },
    ],
    steps: [
      { id: '1', order: 1, description: '西兰花切小朵，焯水1分钟' },
      { id: '2', order: 2, description: '热锅下油，爆香蒜末' },
      { id: '3', order: 3, description: '加入西兰花翻炒' },
      { id: '4', order: 4, description: '加盐调味，出锅' },
    ],
    nutritionInfo: { calories: 80, protein: 4, carbs: 8, fat: 4 },
    createdAt: '2024-03-11T10:00:00Z',
    updatedAt: '2024-03-11T10:00:00Z',
  },
  {
    id: '3',
    title: '番茄牛腩',
    description: '酸甜可口的番茄牛腩，营养丰富，老少皆宜',
    coverImage: 'https://picsum.photos/seed/recipe3/300/200',
    categoryId: '1',
    category: mockCategories[0],
    authorId: '1',
    author: mockAuthors[0],
    tags: ['牛肉', '番茄', '炖菜'],
    difficulty: 'hard',
    prepTime: 20,
    cookTime: 90,
    servings: 6,
    isPublished: true,
    viewCount: 2100,
    likeCount: 156,
    ingredients: [
      { id: '1', name: '牛腩', amount: '500', unit: '克' },
      { id: '2', name: '番茄', amount: '3', unit: '个' },
      { id: '3', name: '土豆', amount: '2', unit: '个' },
      { id: '4', name: '葱姜蒜', amount: '适量', unit: '' },
    ],
    steps: [
      { id: '1', order: 1, description: '牛腩切块，冷水下锅焯水' },
      { id: '2', order: 2, description: '番茄切块，土豆切块' },
      { id: '3', order: 3, description: '热锅下油，炒香葱姜蒜' },
      { id: '4', order: 4, description: '加入牛腩翻炒，加番茄继续炒' },
      { id: '5', order: 5, description: '加水没过食材，大火烧开转小火炖1.5小时' },
      { id: '6', order: 6, description: '加入土豆再炖20分钟即可' },
    ],
    nutritionInfo: { calories: 320, protein: 25, carbs: 18, fat: 15 },
    createdAt: '2024-03-12T10:00:00Z',
    updatedAt: '2024-03-12T10:00:00Z',
  },
  {
    id: '4',
    title: '凉拌黄瓜',
    description: '清爽解腻的凉拌黄瓜，夏日必备凉菜',
    categoryId: '2',
    category: mockCategories[1],
    authorId: '1',
    author: mockAuthors[0],
    tags: ['凉菜', '黄瓜', '减脂'],
    difficulty: 'easy',
    prepTime: 10,
    cookTime: 0,
    servings: 2,
    isPublished: false,
    viewCount: 0,
    likeCount: 0,
    ingredients: [
      { id: '1', name: '黄瓜', amount: '2', unit: '根' },
      { id: '2', name: '蒜末', amount: '10', unit: '克' },
      { id: '3', name: '香醋', amount: '2', unit: '勺' },
      { id: '4', name: '辣椒油', amount: '1', unit: '勺' },
    ],
    steps: [
      { id: '1', order: 1, description: '黄瓜拍碎切段' },
      { id: '2', order: 2, description: '加入蒜末、香醋、辣椒油拌匀' },
    ],
    nutritionInfo: { calories: 45, protein: 1, carbs: 6, fat: 2 },
    createdAt: '2024-03-13T10:00:00Z',
    updatedAt: '2024-03-13T10:00:00Z',
  },
];

let recipes = [...mockRecipes];

export async function GET(request: NextRequest) {
  const { searchParams } = new URL(request.url);
  const page = parseInt(searchParams.get('page') || '1');
  const pageSize = parseInt(searchParams.get('pageSize') || '10');
  const search = searchParams.get('search') || '';
  const categoryId = searchParams.get('categoryId') || '';
  const difficulty = searchParams.get('difficulty') || '';
  const status = searchParams.get('status') || '';

  let filtered = recipes;
  if (search) {
    filtered = filtered.filter(
      (r) =>
        r.title.toLowerCase().includes(search.toLowerCase()) ||
        r.description?.toLowerCase().includes(search.toLowerCase())
    );
  }
  if (categoryId) {
    filtered = filtered.filter((r) => r.categoryId === categoryId);
  }
  if (difficulty) {
    filtered = filtered.filter((r) => r.difficulty === difficulty);
  }
  if (status === 'published') {
    filtered = filtered.filter((r) => r.isPublished);
  } else if (status === 'draft') {
    filtered = filtered.filter((r) => !r.isPublished);
  }

  const start = (page - 1) * pageSize;
  const list = filtered.slice(start, start + pageSize);

  return NextResponse.json<ApiResponse<PaginationData<Recipe>>>({
    code: 200,
    message: 'success',
    data: {
      list,
      total: filtered.length,
      page,
      pageSize,
    },
    timestamp: new Date().toISOString(),
  });
}

export async function POST(request: NextRequest) {
  try {
    const body = await request.json();
    const category = mockCategories.find((c) => c.id === body.categoryId);
    const newRecipe: Recipe = {
      ...body,
      id: Date.now().toString(),
      category,
      authorId: '1',
      author: mockAuthors[0],
      viewCount: 0,
      likeCount: 0,
      createdAt: new Date().toISOString(),
      updatedAt: new Date().toISOString(),
    };
    recipes.push(newRecipe);

    return NextResponse.json<ApiResponse<Recipe>>({
      code: 200,
      message: '创建成功',
      data: newRecipe,
      timestamp: new Date().toISOString(),
    });
  } catch {
    return NextResponse.json<ApiResponse<null>>(
      {
        code: 500,
        message: '创建失败',
        data: null,
        timestamp: new Date().toISOString(),
      },
      { status: 500 }
    );
  }
}