import { NextRequest, NextResponse } from 'next/server';
import { ApiResponse, Stream, Category, User } from '@/types';

const mockCategories: Category[] = [
  { id: '1', name: '养生食谱', slug: 'health-recipes', sortOrder: 1, isActive: true, createdAt: '', updatedAt: '' },
  { id: '2', name: '减脂餐', slug: 'weight-loss', sortOrder: 2, isActive: true, createdAt: '', updatedAt: '' },
  { id: '3', name: '儿童营养', slug: 'kids-nutrition', sortOrder: 3, isActive: true, createdAt: '', updatedAt: '' },
];

const mockAuthors: User[] = [
  { id: '1', username: 'admin', email: 'admin@health-diet.com', role: 'admin', createdAt: '', updatedAt: '' },
];

const mockStreams: Stream[] = [
  {
    id: '1',
    title: '春季养生食谱推荐',
    content: '春天是万物复苏的季节，也是养生的好时机...',
    summary: '春季养生食谱，帮助您调理身体',
    coverImage: 'https://picsum.photos/seed/stream1/300/200',
    categoryId: '1',
    category: mockCategories[0],
    authorId: '1',
    author: mockAuthors[0],
    tags: ['养生', '春季', '食谱'],
    isPublished: true,
    viewCount: 1250,
    likeCount: 89,
    publishedAt: '2024-03-15T10:00:00Z',
    createdAt: '2024-03-15T10:00:00Z',
    updatedAt: '2024-03-15T10:00:00Z',
  },
  {
    id: '2',
    title: '低卡减脂餐指南',
    content: '想要健康减脂，饮食是关键...',
    summary: '科学减脂餐搭配方案',
    coverImage: 'https://picsum.photos/seed/stream2/300/200',
    categoryId: '2',
    category: mockCategories[1],
    authorId: '1',
    author: mockAuthors[0],
    tags: ['减脂', '低卡', '健康'],
    isPublished: true,
    viewCount: 980,
    likeCount: 76,
    publishedAt: '2024-03-14T10:00:00Z',
    createdAt: '2024-03-14T10:00:00Z',
    updatedAt: '2024-03-14T10:00:00Z',
  },
  {
    id: '3',
    title: '儿童营养搭配',
    content: '儿童成长需要均衡的营养...',
    summary: '儿童健康成长的营养搭配方案',
    categoryId: '3',
    category: mockCategories[2],
    authorId: '1',
    author: mockAuthors[0],
    tags: ['儿童', '营养', '成长'],
    isPublished: false,
    viewCount: 0,
    likeCount: 0,
    createdAt: '2024-03-13T10:00:00Z',
    updatedAt: '2024-03-13T10:00:00Z',
  },
];

let streams = [...mockStreams];

export async function GET(
  _request: NextRequest,
  { params }: { params: Promise<{ id: string }> }
) {
  const { id } = await params;
  const stream = streams.find((s) => s.id === id);

  if (!stream) {
    return NextResponse.json<ApiResponse<null>>(
      {
        code: 404,
        message: '信息流不存在',
        data: null,
        timestamp: new Date().toISOString(),
      },
      { status: 404 }
    );
  }

  return NextResponse.json<ApiResponse<Stream>>({
    code: 200,
    message: 'success',
    data: stream,
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
    const index = streams.findIndex((s) => s.id === id);

    if (index === -1) {
      return NextResponse.json<ApiResponse<null>>(
        {
          code: 404,
          message: '信息流不存在',
          data: null,
          timestamp: new Date().toISOString(),
        },
        { status: 404 }
      );
    }

    const category = mockCategories.find((c) => c.id === body.categoryId);
    streams[index] = {
      ...streams[index],
      ...body,
      category,
      updatedAt: new Date().toISOString(),
      publishedAt: body.isPublished && !streams[index].isPublished 
        ? new Date().toISOString() 
        : streams[index].publishedAt,
    };

    return NextResponse.json<ApiResponse<Stream>>({
      code: 200,
      message: '更新成功',
      data: streams[index],
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
  const index = streams.findIndex((s) => s.id === id);

  if (index === -1) {
    return NextResponse.json<ApiResponse<null>>(
      {
        code: 404,
        message: '信息流不存在',
        data: null,
        timestamp: new Date().toISOString(),
      },
      { status: 404 }
    );
  }

  streams = streams.filter((s) => s.id !== id);

  return NextResponse.json<ApiResponse<null>>({
    code: 200,
    message: '删除成功',
    data: null,
    timestamp: new Date().toISOString(),
  });
}