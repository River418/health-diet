import { NextRequest, NextResponse } from 'next/server';
import { ApiResponse, Stream, PaginationData, Category, User } from '@/types';

const mockCategories: Category[] = [
  { id: '1', name: '养生食谱', slug: 'health-recipes', sortOrder: 1, isActive: true, createdAt: '', updatedAt: '' },
  { id: '2', name: '减脂餐', slug: 'weight-loss', sortOrder: 2, isActive: true, createdAt: '', updatedAt: '' },
  { id: '3', name: '儿童营养', slug: 'kids-nutrition', sortOrder: 3, isActive: true, createdAt: '', updatedAt: '' },
];

const mockAuthors: User[] = [
  { id: '1', username: 'admin', email: 'admin@health-diet.com', role: 'admin', createdAt: '', updatedAt: '' },
  { id: '2', username: 'editor1', email: 'editor1@health-diet.com', role: 'editor', createdAt: '', updatedAt: '' },
];

const mockStreams: Stream[] = [
  {
    id: '1',
    title: '春季养生食谱推荐',
    content: '春天是万物复苏的季节，也是养生的好时机。本文为您推荐多款春季养生食谱，帮助您调理身体，增强免疫力...',
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
    content: '想要健康减脂，饮食是关键。本文介绍科学减脂餐搭配方案，让您在享受美食的同时轻松减脂...',
    summary: '科学减脂餐搭配方案',
    coverImage: 'https://picsum.photos/seed/stream2/300/200',
    categoryId: '2',
    category: mockCategories[1],
    authorId: '2',
    author: mockAuthors[1],
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
    content: '儿童成长需要均衡的营养。本文为家长们介绍儿童健康成长的营养搭配方案...',
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
  {
    id: '4',
    title: '糖尿病患者饮食建议',
    content: '糖尿病患者的饮食管理至关重要。本文提供专业的饮食建议，帮助患者更好地控制血糖...',
    summary: '糖尿病患者的专业饮食建议',
    coverImage: 'https://picsum.photos/seed/stream4/300/200',
    categoryId: '1',
    category: mockCategories[0],
    authorId: '1',
    author: mockAuthors[0],
    tags: ['糖尿病', '饮食', '健康'],
    isPublished: true,
    viewCount: 856,
    likeCount: 45,
    publishedAt: '2024-03-12T10:00:00Z',
    createdAt: '2024-03-12T10:00:00Z',
    updatedAt: '2024-03-12T10:00:00Z',
  },
];

let streams = [...mockStreams];

export async function GET(request: NextRequest) {
  const { searchParams } = new URL(request.url);
  const page = parseInt(searchParams.get('page') || '1');
  const pageSize = parseInt(searchParams.get('pageSize') || '10');
  const search = searchParams.get('search') || '';
  const categoryId = searchParams.get('categoryId') || '';
  const status = searchParams.get('status') || '';

  let filtered = streams;
  if (search) {
    filtered = filtered.filter(
      (s) =>
        s.title.toLowerCase().includes(search.toLowerCase()) ||
        s.summary?.toLowerCase().includes(search.toLowerCase())
    );
  }
  if (categoryId) {
    filtered = filtered.filter((s) => s.categoryId === categoryId);
  }
  if (status === 'published') {
    filtered = filtered.filter((s) => s.isPublished);
  } else if (status === 'draft') {
    filtered = filtered.filter((s) => !s.isPublished);
  }

  const start = (page - 1) * pageSize;
  const list = filtered.slice(start, start + pageSize);

  return NextResponse.json<ApiResponse<PaginationData<Stream>>>({
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
    const newStream: Stream = {
      ...body,
      id: Date.now().toString(),
      category,
      authorId: '1',
      author: mockAuthors[0],
      viewCount: 0,
      likeCount: 0,
      createdAt: new Date().toISOString(),
      updatedAt: new Date().toISOString(),
      publishedAt: body.isPublished ? new Date().toISOString() : undefined,
    };
    streams.push(newStream);

    return NextResponse.json<ApiResponse<Stream>>({
      code: 200,
      message: '创建成功',
      data: newStream,
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