'use client';

import React, { useEffect, useState, useCallback } from 'react';
import {
  Form,
  Input,
  Button,
  Card,
  message,
  Spin,
  Select,
  Switch,
  InputNumber,
  Divider,
  Space,
} from 'antd';
import { PlusOutlined, MinusCircleOutlined, ArrowLeftOutlined } from '@ant-design/icons';
import { useRouter, useParams } from 'next/navigation';
import { Recipe, Category, PaginationData, RecipeStep, NutritionInfo } from '@/types';
import { api } from '@/utils/api';

const { Option } = Select;
const { TextArea } = Input;

const defaultNutritionInfo: NutritionInfo = {
  calories: 0,
  protein: 0,
  carbs: 0,
  fat: 0,
  fiber: 0,
};

export default function EditRecipePage() {
  const router = useRouter();
  const params = useParams();
  const [form] = Form.useForm();
  const [loading, setLoading] = useState(false);
  const [fetching, setFetching] = useState(true);
  const [categories, setCategories] = useState<Category[]>([]);

  const fetchData = useCallback(async () => {
    try {
      const [categoriesRes, recipeRes] = await Promise.all([
        api.get<PaginationData<Category>>('/categories', {
          params: { pageSize: 100 },
        }),
        api.get<Recipe>(`/recipes/${params.id}`),
      ]);
      
      setCategories(categoriesRes.data.data.list);
      const recipeData = recipeRes.data.data;
      form.setFieldsValue({
        ...recipeData,
        tags: recipeData.tags || [],
        ingredients: recipeData.ingredients?.length > 0 ? recipeData.ingredients : [{ name: '', amount: '', unit: '' }],
        steps: recipeData.steps?.length > 0 ? recipeData.steps : [{ description: '' }],
        nutritionInfo: recipeData.nutritionInfo || defaultNutritionInfo,
      });
    } catch {
      message.error('获取食谱信息失败');
      router.push('/recipes');
    } finally {
      setFetching(false);
    }
  }, [params.id, form, router]);

  useEffect(() => {
    fetchData();
  }, [fetchData]);

  const handleSubmit = async (values: Partial<Recipe>) => {
    setLoading(true);
    try {
      const data = {
        ...values,
        tags: values.tags || [],
        ingredients: values.ingredients || [],
        steps: (values.steps || []).map((step: RecipeStep, index: number) => ({
          ...step,
          order: index + 1,
        })),
        nutritionInfo: values.nutritionInfo || defaultNutritionInfo,
      };
      await api.put<Recipe>(`/recipes/${params.id}`, data);
      message.success('更新成功');
      router.push('/recipes');
    } catch {
      message.error('更新失败');
    } finally {
      setLoading(false);
    }
  };

  if (fetching) {
    return (
      <div className="flex items-center justify-center min-h-[400px]">
        <Spin size="large" />
      </div>
    );
  }

  return (
    <Card
      title={
        <div className="flex items-center gap-2">
          <Button type="text" icon={<ArrowLeftOutlined />} onClick={() => router.back()} />
          <span>编辑食谱</span>
        </div>
      }
    >
      <Form
        form={form}
        layout="vertical"
        onFinish={handleSubmit}
        style={{ maxWidth: 900 }}
      >
        <Divider>基本信息</Divider>
        
        <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
          <Form.Item
            name="title"
            label="食谱名称"
            rules={[{ required: true, message: '请输入食谱名称' }]}
          >
            <Input placeholder="请输入食谱名称" maxLength={100} />
          </Form.Item>

          <Form.Item
            name="categoryId"
            label="分类"
            rules={[{ required: true, message: '请选择分类' }]}
          >
            <Select placeholder="请选择分类">
              {categories.map((cat) => (
                <Option key={cat.id} value={cat.id}>
                  {cat.name}
                </Option>
              ))}
            </Select>
          </Form.Item>
        </div>

        <Form.Item name="description" label="描述">
          <TextArea rows={2} placeholder="请输入食谱描述（选填）" maxLength={300} showCount />
        </Form.Item>

        <Form.Item name="coverImage" label="封面图片">
          <Input placeholder="请输入封面图片URL（选填）" />
        </Form.Item>

        <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
          <Form.Item name="difficulty" label="难度" rules={[{ required: true }]}>
            <Select>
              <Option value="easy">简单</Option>
              <Option value="medium">中等</Option>
              <Option value="hard">困难</Option>
            </Select>
          </Form.Item>

          <Form.Item name="prepTime" label="准备时间(分钟)" rules={[{ required: true }]}>
            <InputNumber min={0} style={{ width: '100%' }} />
          </Form.Item>

          <Form.Item name="cookTime" label="烹饪时间(分钟)" rules={[{ required: true }]}>
            <InputNumber min={0} style={{ width: '100%' }} />
          </Form.Item>

          <Form.Item name="servings" label="份量(人份)" rules={[{ required: true }]}>
            <InputNumber min={1} style={{ width: '100%' }} />
          </Form.Item>
        </div>

        <Form.Item name="tags" label="标签">
          <Select mode="tags" placeholder="输入标签后按回车添加" style={{ width: '100%' }} />
        </Form.Item>

        <Divider>食材清单</Divider>
        
        <Form.List name="ingredients">
          {(fields, { add, remove }) => (
            <>
              {fields.map(({ key, name, ...restField }) => (
                <Space key={key} style={{ display: 'flex', marginBottom: 8 }} align="baseline">
                  <Form.Item
                    {...restField}
                    name={[name, 'name']}
                    rules={[{ required: true, message: '请输入食材名称' }]}
                  >
                    <Input placeholder="食材名称" style={{ width: 150 }} />
                  </Form.Item>
                  <Form.Item
                    {...restField}
                    name={[name, 'amount']}
                    rules={[{ required: true, message: '请输入用量' }]}
                  >
                    <Input placeholder="用量" style={{ width: 100 }} />
                  </Form.Item>
                  <Form.Item
                    {...restField}
                    name={[name, 'unit']}
                    rules={[{ required: true, message: '请输入单位' }]}
                  >
                    <Input placeholder="单位" style={{ width: 80 }} />
                  </Form.Item>
                  {fields.length > 1 && (
                    <MinusCircleOutlined onClick={() => remove(name)} className="text-red-500" />
                  )}
                </Space>
              ))}
              <Form.Item>
                <Button type="dashed" onClick={() => add()} block icon={<PlusOutlined />}>
                  添加食材
                </Button>
              </Form.Item>
            </>
          )}
        </Form.List>

        <Divider>制作步骤</Divider>
        
        <Form.List name="steps">
          {(fields, { add, remove }) => (
            <>
              {fields.map(({ key, name, ...restField }, index) => (
                <Space key={key} style={{ display: 'flex', marginBottom: 8 }} align="baseline">
                  <span className="w-8 h-8 rounded-full bg-blue-500 text-white flex items-center justify-center text-sm font-medium">
                    {index + 1}
                  </span>
                  <Form.Item
                    {...restField}
                    name={[name, 'description']}
                    rules={[{ required: true, message: '请输入步骤描述' }]}
                    style={{ flex: 1, marginBottom: 0 }}
                  >
                    <TextArea rows={2} placeholder="请输入步骤描述" style={{ width: 500 }} />
                  </Form.Item>
                  <Form.Item {...restField} name={[name, 'image']} style={{ marginBottom: 0 }}>
                    <Input placeholder="步骤图片URL（选填）" style={{ width: 200 }} />
                  </Form.Item>
                  {fields.length > 1 && (
                    <MinusCircleOutlined onClick={() => remove(name)} className="text-red-500" />
                  )}
                </Space>
              ))}
              <Form.Item>
                <Button type="dashed" onClick={() => add()} block icon={<PlusOutlined />}>
                  添加步骤
                </Button>
              </Form.Item>
            </>
          )}
        </Form.List>

        <Divider>营养信息（选填）</Divider>
        
        <div className="grid grid-cols-2 md:grid-cols-5 gap-4">
          <Form.Item name={['nutritionInfo', 'calories']} label="热量(kcal)">
            <InputNumber min={0} style={{ width: '100%' }} />
          </Form.Item>
          <Form.Item name={['nutritionInfo', 'protein']} label="蛋白质(g)">
            <InputNumber min={0} style={{ width: '100%' }} />
          </Form.Item>
          <Form.Item name={['nutritionInfo', 'carbs']} label="碳水(g)">
            <InputNumber min={0} style={{ width: '100%' }} />
          </Form.Item>
          <Form.Item name={['nutritionInfo', 'fat']} label="脂肪(g)">
            <InputNumber min={0} style={{ width: '100%' }} />
          </Form.Item>
          <Form.Item name={['nutritionInfo', 'fiber']} label="纤维(g)">
            <InputNumber min={0} style={{ width: '100%' }} />
          </Form.Item>
        </div>

        <Divider />

        <Form.Item name="isPublished" label="发布状态" valuePropName="checked">
          <Switch checkedChildren="发布" unCheckedChildren="草稿" />
        </Form.Item>

        <Form.Item>
          <Button type="primary" htmlType="submit" loading={loading}>
            保存
          </Button>
          <Button style={{ marginLeft: 8 }} onClick={() => router.back()}>
            取消
          </Button>
        </Form.Item>
      </Form>
    </Card>
  );
}