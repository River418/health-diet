import { NextRequest, NextResponse } from 'next/server';
import { ApiResponse, Recipe, Category, User } from '@/types';

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
    ],
    steps: [
      { id: '1', order: 1, description: '鲈鱼洗净，在鱼身两面划几刀' },
      { id: '2', order: 2, description: '鱼身铺上姜丝和葱段' },
    ],
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
    ],
    steps: [
      { id: '1', order: 1, description: '西兰花切小朵，焯水1分钟' },
      { id: '2', order: 2, description: '热锅下油，爆香蒜末' },
    ],
    createdAt: '2024-03-11T10:00:00Z',
    updatedAt: '2024-03-11T10:00:00Z',
  },
];

let recipes = [...mockRecipes];

export async function GET(
  _request: NextRequest,
  { params }: { params: Promise<{ id: string }> }
) {
  const { id } = await params;
  const recipe = recipes.find((r) => r.id === id);

  if (!recipe) {
    return NextResponse.json<ApiResponse<null>>(
      {
        code: 404,
        message: '食谱不存在',
        data: null,
        timestamp: new Date().toISOString(),
      },
      { status: 404 }
    );
  }

  return NextResponse.json<ApiResponse<Recipe>>({
    code: 200,
    message: 'success',
    data: recipe,
    timestamp: new Date().toISOString(),
  });
}

export async function PUT(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> }
) {
  try {
    const { id } = await params;
    const body = await request.json();
    const index = recipes.findIndex((r) => r.id === id);

    if (index === -1) {
      return NextResponse.json<ApiResponse<null>>(
        {
          code: 404,
          message: '食谱不存在',
          data: null,
          timestamp: new Date().toISOString(),
        },
        { status: 404 }
      );
    }

    const category = mockCategories.find((c) => c.id === body.categoryId);
    recipes[index] = {
      ...recipes[index],
      ...body,
      category,
      updatedAt: new Date().toISOString(),
    };

    return NextResponse.json<ApiResponse<Recipe>>({
      code: 200,
      message: '更新成功',
      data: recipes[index],
      timestamp: new Date().toISOString(),
    });
  } catch {
    return NextResponse.json<ApiResponse<null>>(
      {
        code: 500,
        message: '更新失败',
        data: null,
        timestamp: new Date().toISOString(),
      },
      { status: 500 }
    );
  }
}

export async function DELETE(
  _request: NextRequest,
  { params }: { params: Promise<{ id: string }> }
) {
  const { id } = await params;
  const index = recipes.findIndex((r) => r.id === id);

  if (index === -1) {
    return NextResponse.json<ApiResponse<null>>(
      {
        code: 404,
        message: '食谱不存在',
        data: null,
        timestamp: new Date().toISOString(),
      },
      { status: 404 }
    );
  }

  recipes = recipes.filter((r) => r.id !== id);

  return NextResponse.json<ApiResponse<null>>({
    code: 200,
    message: '删除成功',
    data: null,
    timestamp: new Date().toISOString(),
  });
}