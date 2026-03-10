# Health-Diet UI 设计文档

## 项目概述

本文档包含 Health-Diet 食疗养生小程序的完整 UI 设计规范，包括设计系统、组件库和页面设计稿。

## 文档结构

```
design/
├── README.md                      # 本文档
├── design-system/                 # 设计系统
│   └── design-tokens.md          # 设计令牌规范
├── components/                    # 组件库
│   └── component-library.md     # 组件规范
├── pages/                         # 页面设计稿
│   ├── home-page.md             # 首页
│   ├── category-page.md         # 分类页
│   ├── recipe-detail-page.md    # 配方详情页
│   ├── profile-page.md          # 个人中心页
│   └── login-page.md            # 登录页
└── assets/                        # 设计资源
    ├── icons/                    # 图标资源
    └── images/                   # 图片资源
```

## 设计系统概览

### 色彩系统
- **主色**: #4CAF50 (健康绿)
- **辅助色**: #FF9800 (橙色), #2196F3 (蓝色), #F44336 (红色)
- **中性色**: #333333 ~ #CCCCCC 文字层级
- **背景色**: #F5F5F5 (页面), #FFFFFF (卡片)

### 字体系统
- **字体族**: PingFang SC, Microsoft YaHei, sans-serif
- **字号范围**: 10px ~ 28px
- **字重**: Regular (400), Medium (500), Semibold (600), Bold (700)

### 间距系统
- **基础单位**: 8px
- **常用间距**: 4px, 8px, 12px, 16px, 24px, 32px
- **页面边距**: 16px

## 页面清单

| 页面 | 文件 | 描述 |
|------|------|------|
| 首页 | `pages/home-page.md` | 金刚位、推荐配方、信息流 |
| 分类页 | `pages/category-page.md` | 人群/节气/疗效/食材分类 |
| 配方详情页 | `pages/recipe-detail-page.md` | 配方详情、步骤、评论 |
| 个人中心页 | `pages/profile-page.md` | 用户信息、收藏、设置 |
| 登录页 | `pages/login-page.md` | 微信/抖音一键登录 |

## 核心组件

### 基础组件
- Button (按钮)
- Input (输入框)
- Tag (标签)
- Avatar (头像)
- Icon (图标)

### 复合组件
- Card (卡片)
- List (列表)
- Modal (弹窗)
- Toast (轻提示)
- Loading (加载)
- Empty (空状态)
- Search Bar (搜索栏)
- KingKong (金刚位)

### 页面组件
- Navigation Bar (导航栏)
- Tab Bar (底部标签栏)
- Filter Bar (筛选栏)

## 设计原则

1. **清晰易读**: 大字号、高对比度，确保中老年用户轻松阅读
2. **温暖亲和**: 绿色主色调传递健康、自然的品牌调性
3. **简洁高效**: 信息层级清晰，减少认知负担
4. **适老友好**: 支持大字模式，触控区域充足

## 适老化设计

- **大字模式**: 所有字号提升 2-4px
- **高对比度**: 文字对比度 ≥ 4.5:1
- **触控友好**: 按钮最小尺寸 44x44px (标准) / 56x56px (大字模式)
- **视觉清晰**: 图标尺寸不小于 24px

## 多语言支持

支持三种语言:
- 简体中文 (zh-CN)
- 繁体中文 (zh-TW)
- English (en)

## 合规提示

所有配方相关页面必须显示免责声明:
- 位置: 页面顶部和底部固定
- 样式: 黄色背景 (#FFF3CD)，棕色文字 (#856404)
- 内容: "⚠️ 食疗养生，不替代药物治疗。如有身体不适，请及时就医。"

## 使用说明

1. 开发前请仔细阅读 `design-system/design-tokens.md`
2. 组件使用参考 `components/component-library.md`
3. 页面实现参考 `pages/` 目录下的对应文档
4. 所有尺寸、颜色、间距请严格遵循设计规范

## 版本记录

| 版本 | 日期 | 变更内容 |
|------|------|---------|
| v1.0 | 2026-03-10 | 初始版本，完成设计系统和核心页面设计 |

---

*Health-Diet Design System v1.0*  
*Designed for Health-Diet 食疗养生小程序*
