import { NextRequest, NextResponse } from 'next/server';
import { ApiResponse, Category, PaginationData } from '@/types';

const mockCategories: Category[] = [
  {
    id: '1',
    name: '养生食谱',
    slug: 'health-recipes',
    description: '各类养生食疗方案',
    sortOrder: 1,
    isActive: true,
    createdAt: '2024-01-15T10:00:00Z',
    updatedAt: '2024-03-15T10:00:00Z',
  },
  {
    id: '2',
    name: '减脂餐',
    slug: 'weight-loss',
    description: '低卡路里减脂食谱',
    sortOrder: 2,
    isActive: true,
    createdAt: '2024-01-16T10:00:00Z',
    updatedAt: '2024-03-16T10:00:00Z',
  },
  {
    id: '3',
    name: '儿童营养',
    slug: 'kids-nutrition',
    description: '儿童健康成长食谱',
    sortOrder: 3,
    isActive: true,
    createdAt: '2024-01-17T10:00:00Z',
    updatedAt: '2024-03-17T10:00:00Z',
  },
  {
    id: '4',
    name: '疾病调理',
    slug: 'disease-care',
    description: '疾病康复期饮食建议',
    sortOrder: 4,
    isActive: false,
    createdAt: '2024-01-18T10:00:00Z',
    updatedAt: '2024-03-18T10:00:00Z',
  },
  {
    id: '5',
    name: '素食主义',
    slug: 'vegetarian',
    description: '纯素食谱推荐',
    sortOrder: 5,
    isActive: true,
    createdAt: '2024-01-19T10:00:00Z',
    updatedAt: '2024-03-19T10:00:00Z',
  },
];

let categories = [...mockCategories];

export async function GET(request: NextRequest) {
  const { searchParams } = new URL(request.url);
  const page = parseInt(searchParams.get('page') || '1');
  const pageSize = parseInt(searchParams.get('pageSize') || '10');
  const search = searchParams.get('search') || '';

  let filtered = categories;
  if (search) {
    filtered = categories.filter(
      (c) =>
        c.name.toLowerCase().includes(search.toLowerCase()) ||
        c.description?.toLowerCase().includes(search.toLowerCase())
    );
  }

  const start = (page - 1) * pageSize;
  const list = filtered.slice(start, start + pageSize);

  return NextResponse.json<ApiResponse<PaginationData<Category>>>({
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
    const newCategory: Category = {
      ...body,
      id: Date.now().toString(),
      createdAt: new Date().toISOString(),
      updatedAt: new Date().toISOString(),
    };
    categories.push(newCategory);

    return NextResponse.json<ApiResponse<Category>>({
      code: 200,
      message: '创建成功',
      data: newCategory,
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