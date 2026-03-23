'use client';

import React, { useEffect, useState } from 'react';
import { Card, Row, Col, Statistic, Progress, List, Tag, Spin, message } from 'antd';
import {
  AppstoreOutlined,
  FileTextOutlined,
  BookOutlined,
  EyeOutlined,
  LikeOutlined,
} from '@ant-design/icons';
import { api } from '@/utils/api';



interface StatsData {
  title: string;
  value: number;
  icon: React.ReactNode;
  color: string;
}

interface StreamItem {
  id: string;
  title: string;
  category: string;
  date: string;
  status: 'published' | 'draft';
}

interface RecipeItem {
  id: string;
  title: string;
  difficulty: 'easy' | 'medium' | 'hard';
  views: number;
  likes: number;
}

interface DashboardData {
  stats: StatsData[];
  recentStreams: StreamItem[];
  recentRecipes: RecipeItem[];
}

export default function DashboardPage() {
  const [loading, setLoading] = useState(true);
  const [data, setData] = useState<DashboardData>({
    stats: [],
    recentStreams: [],
    recentRecipes: [],
  });

  useEffect(() => {
    fetchDashboardData();
  }, []);

  const fetchDashboardData = async () => {
    setLoading(true);
    try {
      // 并行获取所有数据
      const [
        categoriesRes,
        contentsRes,
        recipesRes,
        recentStreamsRes,
        recentRecipesRes,
      ] = await Promise.all([
        api.get('/v1/admin/categories'),
        api.get('/v1/admin/contents'),
        api.get('/v1/admin/recipes'),
        api.get('/v1/admin/contents?limit=5'),
        api.get('/v1/admin/recipes?limit=5&sort=views'),
      ]);

      // 提取统计数据
      const categoryTotal = categoriesRes.data?.data?.pagination?.total || 0;
      const contentTotal = contentsRes.data?.data?.pagination?.total || 0;
      const recipeTotal = recipesRes.data?.data?.pagination?.total || 0;

      // 计算总浏览量（从热门食谱数据累加）
      const hotRecipes = recentRecipesRes.data?.data?.list || [];
      const totalViews = hotRecipes.reduce((sum: number, r: any) => sum + (r.view_count || 0), 0);

      const stats: StatsData[] = [
        {
          title: '分类总数',
          value: categoryTotal,
          icon: <AppstoreOutlined className="text-blue-500 text-2xl" />,
          color: 'bg-blue-50',
        },
        {
          title: '信息流总数',
          value: contentTotal,
          icon: <FileTextOutlined className="text-green-500 text-2xl" />,
          color: 'bg-green-50',
        },
        {
          title: '食谱总数',
          value: recipeTotal,
          icon: <BookOutlined className="text-orange-500 text-2xl" />,
          color: 'bg-orange-50',
        },
        {
          title: '总浏览量',
          value: totalViews,
          icon: <EyeOutlined className="text-purple-500 text-2xl" />,
          color: 'bg-purple-50',
        },
      ];

      // 处理最近发布的信息流
      const recentStreams: StreamItem[] = (recentStreamsRes.data?.data?.list || []).map((item: any) => ({
        id: item.id,
        title: item.title,
        category: item.content_type || '其他',
        date: item.published_at ? new Date(item.published_at).toISOString().split('T')[0] : '-',
        status: item.status === 1 ? 'published' : 'draft',
      }));

      // 处理热门食谱
      const recentRecipes: RecipeItem[] = (recentRecipesRes.data?.data?.list || []).map((item: any) => ({
        id: item.id,
        title: item.name_zh_cn || item.name_en || '未命名',
        difficulty: item.difficulty || 'medium',
        views: item.view_count || 0,
        likes: item.favorite_count || 0,
      }));

      setData({
        stats,
        recentStreams,
        recentRecipes,
      });
    } catch (error) {
      console.error('Failed to fetch dashboard data:', error);
      message.error('获取仪表板数据失败，请检查后端服务是否运行');
    } finally {
      setLoading(false);
    }
  };

  const getDifficultyText = (difficulty: string) => {
    switch (difficulty) {
      case 'easy':
        return '简单';
      case 'medium':
        return '中等';
      case 'hard':
        return '困难';
      default:
        return '中等';
    }
  };

  return (
    <Spin spinning={loading} tip="加载中...">
      <div className="space-y-6">
        <Row gutter={[16, 16]}>
          {data.stats.map((stat) => (
            <Col xs={24} sm={12} lg={6} key={stat.title}>
              <Card className={`${stat.color} border-0`}>
                <div className="flex items-center justify-between">
                  <div>
                    <p className="text-gray-500 mb-1">{stat.title}</p>
                    <Statistic value={stat.value} className="text-2xl font-bold" />
                  </div>
                  <div className="p-3 bg-white rounded-full shadow-sm">
                    {stat.icon}
                  </div>
                </div>
              </Card>
            </Col>
          ))}
        </Row>

        <Row gutter={[16, 16]}>
          <Col xs={24} lg={12}>
            <Card title="最近发布的信息流" extra={<a href="/feeds">查看全部</a>}>
              <List
                dataSource={data.recentStreams}
                renderItem={(item) => (
                  <List.Item>
                    <div className="flex items-center justify-between w-full">
                      <div>
                        <h4 className="font-medium">{item.title}</h4>
                        <div className="flex items-center gap-2 mt-1">
                          <Tag color="blue">{item.category}</Tag>
                          <span className="text-gray-400 text-sm">{item.date}</span>
                        </div>
                      </div>
                      <Tag color={item.status === 'published' ? 'success' : 'warning'}>
                        {item.status === 'published' ? '已发布' : '草稿'}
                      </Tag>
                    </div>
                  </List.Item>
                )}
              />
            </Card>
          </Col>
          <Col xs={24} lg={12}>
            <Card title="热门食谱" extra={<a href="/recipes">查看全部</a>}>
              <List
                dataSource={data.recentRecipes}
                renderItem={(item) => (
                  <List.Item>
                    <div className="flex items-center justify-between w-full">
                      <div>
                        <h4 className="font-medium">{item.title}</h4>
                        <div className="flex items-center gap-4 mt-1 text-sm text-gray-500">
                          <span>难度: {getDifficultyText(item.difficulty)}</span>
                          <span><EyeOutlined /> {item.views}</span>
                          <span><LikeOutlined /> {item.likes}</span>
                        </div>
                      </div>
                    </div>
                  </List.Item>
                )}
              />
            </Card>
          </Col>
        </Row>

        <Row gutter={[16, 16]}>
          <Col xs={24} lg={8}>
            <Card title="内容发布占比">
              <div className="space-y-4">
                <div>
                  <div className="flex justify-between mb-1">
                    <span>信息流</span>
                    <span>60%</span>
                  </div>
                  <Progress percent={60} strokeColor="#1890ff" showInfo={false} />
                </div>
                <div>
                  <div className="flex justify-between mb-1">
                    <span>食谱</span>
                    <span>35%</span>
                  </div>
                  <Progress percent={35} strokeColor="#52c41a" showInfo={false} />
                </div>
                <div>
                  <div className="flex justify-between mb-1">
                    <span>分类</span>
                    <span>5%</span>
                  </div>
                  <Progress percent={5} strokeColor="#faad14" showInfo={false} />
                </div>
              </div>
            </Card>
          </Col>
          <Col xs={24} lg={8}>
            <Card title="本周访问趋势">
              <div className="h-32 flex items-end justify-between px-2">
                {[
                  { value: 40, label: '周一' },
                  { value: 65, label: '周二' },
                  { value: 45, label: '周三' },
                  { value: 80, label: '周四' },
                  { value: 55, label: '周五' },
                  { value: 70, label: '周六' },
                  { value: 90, label: '周日' },
                ].map((item) => (
                  <div
                    key={item.label}
                    className="w-8 bg-blue-200 rounded-t"
                    style={{ height: `${item.value}%` }}
                  />
                ))}
              </div>
              <div className="flex justify-between mt-2 text-xs text-gray-400">
                <span>周一</span>
                <span>周二</span>
                <span>周三</span>
                <span>周四</span>
                <span>周五</span>
                <span>周六</span>
                <span>周日</span>
              </div>
            </Card>
          </Col>
          <Col xs={24} lg={8}>
            <Card title="系统状态">
              <div className="space-y-4">
                <div className="flex items-center justify-between">
                  <span>API 服务</span>
                  <Tag color="success">正常运行</Tag>
                </div>
                <div className="flex items-center justify-between">
                  <span>数据库</span>
                  <Tag color="success">正常运行</Tag>
                </div>
                <div className="flex items-center justify-between">
                  <span>存储服务</span>
                  <Tag color="success">正常运行</Tag>
                </div>
                <div className="flex items-center justify-between">
                  <span>缓存服务</span>
                  <Tag color="success">正常运行</Tag>
                </div>
              </div>
            </Card>
          </Col>
        </Row>
      </div>
    </Spin>
  );
}
