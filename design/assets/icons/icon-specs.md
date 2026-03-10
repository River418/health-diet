# Health-Diet 图标规范

## 图标概述

Health-Diet 使用统一的图标系统，确保视觉一致性和品牌识别度。

## 图标风格

- **风格**: 线性图标 (Outline) 为主，填充图标 (Filled) 用于选中状态
- **线条粗细**: 2px
- **端点样式**: 圆角
- **拐角样式**: 圆角
- **设计原则**: 简洁、清晰、易识别

## 图标尺寸

| 尺寸名称 | 尺寸值 | 使用场景 |
|---------|--------|---------|
| XS | 12px | 内联小图标、角标 |
| SM | 16px | 紧凑空间、列表辅助 |
| MD | 20px | 按钮内图标、导航 |
| LG | 24px | 标准图标、Tab Bar |
| XL | 32px | 大按钮、功能入口 |
| 2XL | 48px | 金刚位图标 |
| 3XL | 64px | 空状态、引导页 |

## 图标颜色

| 颜色名称 | 色值 | 使用场景 |
|---------|------|---------|
| Primary | #4CAF50 | 主色强调、选中状态 |
| Secondary | #666666 | 次要图标、默认状态 |
| Muted | #999999 | 辅助图标、禁用状态 |
| White | #FFFFFF | 深色背景上 |
| Error | #F44336 | 错误状态 |
| Warning | #FF9800 | 警告状态 |

## 金刚位图标 (48px)

| 功能 | 图标描述 | 背景色 |
|------|---------|--------|
| 中老年养生 | 老人头像图标 | #E8F5E9 |
| 白领调理 | 公文包/电脑图标 | #E3F2FD |
| 节气养生 | 花朵/节气图标 | #FFF3E0 |
| 补气养血 | 血滴/心脏图标 | #FCE4EC |
| 健脾养胃 | 米饭/胃图标 | #E8F5E9 |
| 安神助眠 | 月亮/睡眠图标 | #EDE7F6 |
| 美容养颜 | 美容/面膜图标 | #FCE4EC |
| 更多分类 | 更多/网格图标 | #F5F5F5 |

## Tab Bar 图标 (24px)

| Tab | 默认图标 | 选中图标 |
|-----|---------|---------|
| 首页 | 首页轮廓 | 首页填充 |
| 分类 | 分类轮廓 | 分类填充 |
| 我的 | 我的轮廓 | 我的填充 |

## 功能图标 (24px)

| 功能 | 图标描述 |
|------|---------|
| 返回 | 左箭头 |
| 关闭 | X 号 |
| 搜索 | 放大镜 |
| 收藏 | 星星/心形 |
| 分享 | 分享箭头 |
| 更多 | 三个点 |
| 设置 | 齿轮 |
| 消息 | 铃铛 |
| 语言 | 地球 |
| 夜间模式 | 月亮/太阳 |
| 大字模式 | 大字号 A |
| 帮助 | 问号 |
| 关于 | 信息 i |
| 退出 | 退出箭头 |

## 图标资源清单

### 必需图标

```
icons/
├── navigation/
│   ├── back.svg
│   ├── close.svg
│   ├── more.svg
│   └── share.svg
├── action/
│   ├── search.svg
│   ├── favorite.svg
│   ├── favorite-filled.svg
│   ├── like.svg
│   ├── like-filled.svg
│   ├── comment.svg
│   ├── share.svg
│   └── settings.svg
├── tab/
│   ├── home.svg
│   ├── home-filled.svg
│   ├── category.svg
│   ├── category-filled.svg
│   ├── profile.svg
│   └── profile-filled.svg
├── kingkong/
│   ├── elderly.svg
│   ├── office.svg
│   ├── solar.svg
│   ├── blood.svg
│   ├── stomach.svg
│   ├── sleep.svg
│   ├── beauty.svg
│   └── more.svg
├── content/
│   ├── play.svg
│   ├── pause.svg
│   ├── video.svg
│   ├── image.svg
│   ├── article.svg
│   └── link.svg
├── status/
│   ├── success.svg
│   ├── error.svg
│   ├── warning.svg
│   ├── info.svg
│   ├── loading.svg
│   └── empty.svg
└── social/
    ├── wechat.svg
    ├── douyin.svg
    ├── phone.svg
    └── email.svg
```

## 图标使用规范

### 1. 图标与文字组合

```
┌─────────────────┐
│ [图标] 文字     │
└─────────────────┘
```

- 图标与文字间距: 8px
- 垂直对齐: 居中对齐

### 2. 图标按钮

```
┌─────────┐
│ [图标]  │
└─────────┘
```

- 按钮尺寸: 44px x 44px (标准)
- 图标尺寸: 24px
- 点击区域: 不小于 44px x 44px

### 3. 图标状态

| 状态 | 样式 |
|------|------|
| Default | 标准颜色 |
| Hover | 亮度提升 10% |
| Active | 亮度降低 10% |
| Disabled | 透明度 50% |
| Selected | Primary 颜色 |

## 图标导出规范

### SVG 格式
- 使用 SVG 格式导出
- 保留矢量路径，不转曲
- 删除不必要的元数据
- 优化路径节点

### PNG 格式 (备用)
- 提供 1x, 2x, 3x 版本
- 透明背景
- 抗锯齿处理

### 命名规范
```
[icon-name]@[size]x.png

示例:
home@1x.png (24px)
home@2x.png (48px)
home@3x.png (72px)
```

---

*图标规范 v1.0*  
*适用于 Health-Diet 食疗养生小程序*
