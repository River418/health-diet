import { NextRequest, NextResponse } from 'next/server';
import { ApiResponse, Category } from '@/types';

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

export async function GET(
  _request: NextRequest,
  { params }: { params: Promise<{ id: string }> }
) {
  const { id } = await params;
  const category = categories.find((c) => c.id === id);

  if (!category) {
    return NextResponse.json<ApiResponse<null>>(
      {
        code: 404,
        message: '分类不存在',
        data: null,
        timestamp: new Date().toISOString(),
      },
      { status: 404 }
    );
  }

  return NextResponse.json<ApiResponse<Category>>({
    code: 200,
    message: 'success',
    data: category,
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
    const index = categories.findIndex((c) => c.id === id);

    if (index === -1) {
      return NextResponse.json<ApiResponse<null>>(
        {
          code: 404,
          message: '分类不存在',
          data: null,
          timestamp: new Date().toISOString(),
        },
        { status: 404 }
      );
    }

    categories[index] = {
      ...categories[index],
      ...body,
      updatedAt: new Date().toISOString(),
    };

    return NextResponse.json<ApiResponse<Category>>({
      code: 200,
      message: '更新成功',
      data: categories[index],
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
  const index = categories.findIndex((c) => c.id === id);

  if (index === -1) {
    return NextResponse.json<ApiResponse<null>>(
      {
        code: 404,
        message: '分类不存在',
        data: null,
        timestamp: new Date().toISOString(),
      },
      { status: 404 }
    );
  }

  categories = categories.filter((c) => c.id !== id);

  return NextResponse.json<ApiResponse<null>>({
    code: 200,
    message: '删除成功',
    data: null,
    timestamp: new Date().toISOString(),
  });
}