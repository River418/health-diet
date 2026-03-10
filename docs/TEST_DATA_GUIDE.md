# Health-Diet 食疗养生小程序 测试数据准备指南

**版本**: v1.0  
**创建时间**: 2026-03-10  
**适用范围**: 微信小程序、抖音小程序、iOS/Android App  

---

## 目录

1. [测试数据概述](#1-测试数据概述)
2. [平台测试账号](#2-平台测试账号)
3. [敏感词库](#3-敏感词库)
4. [配方测试数据](#4-配方测试数据)
5. [用户测试数据](#5-用户测试数据)
6. [评论测试数据](#6-评论测试数据)
7. [内容信息流测试数据](#7-内容信息流测试数据)
8. [测试数据生成工具](#8-测试数据生成工具)

---

## 1. 测试数据概述

### 1.1 测试数据分类

| 数据类别 | 用途 | 数据量级 | 优先级 |
|---------|------|---------|-------|
| **平台测试账号** | 微信/抖音登录测试 | 各10个 | P0 |
| **敏感词库** | 内容审核测试 | 500+词汇 | P0 |
| **配方数据** | 核心功能测试 | 100+配方 | P0 |
| **用户数据** | 用户系统测试 | 100+用户 | P0 |
| **评论数据** | 评论系统测试 | 1000+评论 | P1 |
| **内容数据** | 信息流测试 | 500+内容 | P1 |
| **收藏数据** | 收藏功能测试 | 2000+收藏 | P1 |

### 1.2 测试数据质量要求

- **真实性**: 数据应模拟真实用户场景
- **覆盖性**: 覆盖正常、边界、异常各类场景
- **多样性**: 支持多语言、多平台、多设备
- **安全性**: 测试账号与生产账号隔离
- **可维护性**: 数据结构化存储，便于更新

---

## 2. 平台测试账号

### 2.1 微信小程序测试账号

#### 2.1.1 测试号基本信息

| 账号编号 | 微信号 | 手机号 | 用途 | 状态 |
|---------|-------|-------|------|------|
| WX_TEST_001 | hd_test_001 | 138****0001 | 正常用户测试 | 已注册 |
| WX_TEST_002 | hd_test_002 | 138****0002 | 新用户测试 | 已注册 |
| WX_TEST_003 | hd_test_003 | 138****0003 | 多语言测试(繁中) | 已注册 |
| WX_TEST_004 | hd_test_004 | 138****0004 | 多语言测试(英文) | 已注册 |
| WX_TEST_005 | hd_test_005 | 138****0005 | 中老年用户模拟 | 已注册 |
| WX_TEST_006 | hd_test_006 | 138****0006 | 收藏功能测试 | 已注册 |
| WX_TEST_007 | hd_test_007 | 138****0007 | 评论功能测试 | 已注册 |
| WX_TEST_008 | hd_test_008 | 138****0008 | 异常场景测试 | 已注册 |
| WX_TEST_009 | hd_test_009 | 138****0009 | 性能测试专用 | 已注册 |
| WX_TEST_010 | hd_test_010 | 138****0010 | 回归测试专用 | 已注册 |

#### 2.1.2 微信小程序测试号配置

```json
{
  "test_accounts": [
    {
      "id": "WX_TEST_001",
      "appid": "wx_test_appid_001",
      "openid": "oTestWxOpenId001",
      "unionid": "uTestWxUnionId001",
      "nickname": "测试用户001",
      "avatar": "https://test-cdn.health-diet.com/avatars/test001.jpg",
      "phone": "13800000001",
      "language": "zh_CN",
      "country": "CN",
      "province": "Beijing",
      "city": "Beijing"
    }
  ]
}
```

#### 2.1.3 微信小程序测试号申请流程

1. **申请入口**: 微信公众平台 → 开发 → 开发管理 → 开发设置 → 测试号
2. **申请数量**: 最多可申请100个测试号
3. **有效期**: 长期有效，需定期维护
4. **权限配置**:
   - 服务器域名: 配置DEV/SIT/UAT环境域名
   - 业务域名: 配置H5页面域名
   - 接口权限: 开通用户信息、手机号等权限

### 2.2 抖音小程序测试账号

#### 2.2.1 测试号基本信息

| 账号编号 | 抖音号 | 手机号 | 用途 | 状态 |
|---------|-------|-------|------|------|
| DY_TEST_001 | hd_dy_001 | 139****0001 | 正常用户测试 | 已注册 |
| DY_TEST_002 | hd_dy_002 | 139****0002 | 新用户测试 | 已注册 |
| DY_TEST_003 | hd_dy_003 | 139****0003 | 多语言测试(繁中) | 已注册 |
| DY_TEST_004 | hd_dy_004 | 139****0004 | 多语言测试(英文) | 已注册 |
| DY_TEST_005 | hd_dy_005 | 139****0005 | 中老年用户模拟 | 已注册 |
| DY_TEST_006 | hd_dy_006 | 139****0006 | 收藏功能测试 | 已注册 |
| DY_TEST_007 | hd_dy_007 | 139****0007 | 评论功能测试 | 已注册 |
| DY_TEST_008 | hd_dy_008 | 139****0008 | 异常场景测试 | 已注册 |
| DY_TEST_009 | hd_dy_009 | 139****0009 | 性能测试专用 | 已注册 |
| DY_TEST_010 | hd_dy_010 | 139****0010 | 回归测试专用 | 已注册 |

#### 2.2.2 抖音小程序测试号配置

```json
{
  "test_accounts": [
    {
      "id": "DY_TEST_001",
      "appid": "tt_test_appid_001",
      "openid": "oTestDyOpenId001",
      "unionid": "uTestDyUnionId001",
      "nickname": "抖音测试用户001",
      "avatar": "https://test-cdn.health-diet.com/avatars/dy_test001.jpg",
      "phone": "13900000001",
      "language": "zh-CN"
    }
  ]
}
```

#### 2.2.3 抖音小程序测试号申请流程

1. **申请入口**: 抖音开放平台 → 应用管理 → 测试账号
2. **申请数量**: 最多可申请50个测试号
3. **有效期**: 90天，到期需续期
4. **权限配置**:
   - 服务器域名: 配置DEV/SIT/UAT环境域名
   - 接口权限: 开通用户信息、视频等权限

### 2.3 测试账号管理规范

#### 2.3.1 账号使用规范

| 规范项 | 要求 |
|-------|------|
| **账号隔离** | 测试账号与生产账号严格隔离 |
| **密码管理** | 使用统一密码策略，定期更换 |
| **使用登记** | 使用测试账号需登记使用人和用途 |
| **数据清理** | 定期清理测试产生的脏数据 |
| **权限控制** | 按需分配账号权限，最小权限原则 |

#### 2.3.2 账号密码策略

```yaml
# 测试账号密码策略
password_policy:
  min_length: 12
  complexity: "uppercase + lowercase + digits + special"
  expiration_days: 90
  history_count: 5
  lockout_threshold: 5
  
# 示例密码格式
# HealthDiet2026!Test
# HdTest@2026#001
```

---

## 3. 敏感词库

### 3.1 敏感词分类

| 分类 | 用途 | 词汇数量 | 测试场景 |
|-----|------|---------|---------|
| **政治敏感** | 政治内容审核 | 100+ | 评论过滤、内容审核 |
| **色情低俗** | 色情内容审核 | 150+ | 评论过滤、图片审核 |
| **暴力恐怖** | 暴力内容审核 | 80+ | 评论过滤、内容审核 |
| **广告垃圾** | 广告内容审核 | 100+ | 评论过滤、防刷屏 |
| **医疗误导** | 医疗合规审核 | 50+ | 配方描述审核 |
| **辱骂攻击** | 人身攻击审核 | 50+ | 评论过滤 |

### 3.2 敏感词库配置

```json
{
  "sensitive_words": {
    "political": {
      "level": "high",
      "action": "block",
      "words": [
        "测试政治敏感词001",
        "测试政治敏感词002",
        "测试政治敏感词003"
      ]
    },
    "pornographic": {
      "level": "high",
      "action": "block",
      "words": [
        "测试色情敏感词001",
        "测试色情敏感词002",
        "测试色情敏感词003"
      ]
    },
    "violent": {
      "level": "high",
      "action": "block",
      "words": [
        "测试暴力敏感词001",
        "测试暴力敏感词002",
        "测试暴力敏感词003"
      ]
    },
    "advertising": {
      "level": "medium",
      "action": "review",
      "words": [
        "加微信",
        "加V",
        "代购",
        "代理",
        "批发"
      ]
    },
    "medical_misleading": {
      "level": "high",
      "action": "block",
      "words": [
        "包治百病",
        "药到病除",
        "根治",
        "治愈",
        "特效药"
      ]
    },
    "abusive": {
      "level": "medium",
      "action": "review",
      "words": [
        "测试辱骂词001",
        "测试辱骂词002",
        "测试辱骂词003"
      ]
    }
  }
}
```

### 3.3 敏感词测试用例

| 测试场景 | 输入内容 | 预期结果 |
|---------|---------|---------|
| 政治敏感词过滤 | "这是一条包含测试政治敏感词001的评论" | 拦截，提示包含敏感词 |
| 色情敏感词过滤 | "这是一条包含测试色情敏感词001的评论" | 拦截，提示包含敏感词 |
| 医疗误导词过滤 | "这个配方包治百病" | 拦截，提示包含敏感词 |
| 广告词审核 | "请加微信购买" | 进入人工审核队列 |
| 正常评论 | "这个配方很好，推荐给大家" | 通过审核，正常发布 |
| 变形敏感词 | "测_试_政_治_敏_感_词" | 拦截，支持变形识别 |
| 拼音敏感词 | "ceshi zhengzhi minganci" | 拦截，支持拼音识别 |

### 3.4 敏感词库更新流程

```
[收集敏感词] → [分类整理] → [审核确认] → [更新词库] → [测试验证] → [发布上线]
     │              │            │            │            │            │
     ▼              ▼            ▼            ▼            ▼            ▼
  运营反馈      按分类整理    安全团队审核   更新JSON文件   自动化测试    灰度发布
  用户举报      去重排序      确认级别      版本控制      验证拦截效果   全量发布
```

---

## 4. 配方测试数据

### 4.1 配方数据结构设计

```typescript
interface TestRecipe {
  id: string;
  name: {
    zhCN: string;
    zhTW: string;
    en: string;
  };
  description: {
    zhCN: string;
    zhTW: string;
    en: string;
  };
  coverImage: string;
  images: string[];
  videoUrl?: string;
  videoDuration?: number;
  
  // 分类标签
  crowdTags: string[];
  efficacyTags: string[];
  solarTermTags?: string[];
  
  // 食材
  ingredients: {
    name: { zhCN: string; zhTW: string; en: string };
    amount: string;
    image?: string;
  }[];
  
  // 制作步骤
  steps: {
    order: number;
    description: { zhCN: string; zhTW: string; en: string };
    image?: string;
  }[];
  
  // 营养信息
  nutrition?: {
    calories: number;
    protein: number;
    fat: number;
    carbs: number;
  };
  
  // 统计数据
  viewCount: number;
  favoriteCount: number;
  commentCount: number;
  rating: number;
  
  status: 'published' | 'draft';
}
```

### 4.2 配方测试数据集

#### 4.2.1 按人群分类

**中老年养生配方 (10个)**

| 配方名称 | 功效 | 难度 | 制作时间 |
|---------|------|------|---------|
| 红枣枸杞茶 | 补气养血 | 简单 | 15分钟 |
| 山药排骨汤 | 健脾养胃 | 中等 | 90分钟 |
| 银耳莲子羹 | 安神助眠 | 简单 | 60分钟 |
| 黑芝麻糊 | 补肾乌发 | 简单 | 30分钟 |
| 当归生姜羊肉汤 | 温中补血 | 困难 | 120分钟 |
| 百合绿豆汤 | 清热解毒 | 简单 | 45分钟 |
| 桂圆红枣粥 | 补血安神 | 简单 | 40分钟 |
| 枸杞菊花茶 | 明目降压 | 简单 | 10分钟 |
| 薏米红豆汤 | 祛湿排毒 | 简单 | 60分钟 |
| 人参鸡汤 | 大补元气 | 困难 | 150分钟 |

**白领调理配方 (10个)**

| 配方名称 | 功效 | 难度 | 制作时间 |
|---------|------|------|---------|
| 菊花决明子茶 | 清肝明目 | 简单 | 10分钟 |
| 玫瑰红枣茶 | 疏肝理气 | 简单 | 15分钟 |
| 蜂蜜柠檬水 | 美容养颜 | 简单 | 5分钟 |
| 燕麦牛奶粥 | 养胃助眠 | 简单 | 20分钟 |
| 紫菜蛋花汤 | 补充碘质 | 简单 | 10分钟 |
| 菠菜猪肝汤 | 补血明目 | 中等 | 30分钟 |
| 番茄鸡蛋面 | 简单营养 | 简单 | 15分钟 |
| 酸奶水果沙拉 | 促进消化 | 简单 | 10分钟 |
| 核桃芝麻糊 | 补脑益智 | 简单 | 25分钟 |
| 绿豆百合汤 | 清热解暑 | 简单 | 40分钟 |

#### 4.2.2 按疗效分类

**补气养血配方 (5个)**

```json
{
  "recipes": [
    {
      "id": "recipe_001",
      "name": {
        "zhCN": "红枣枸杞茶",
        "zhTW": "紅棗枸杞茶",
        "en": "Red Date Goji Tea"
      },
      "description": {
        "zhCN": "补气养血的经典茶饮，适合气血两虚的人群",
        "zhTW": "補氣養血的經典茶飲，適合氣血兩虛的人群",
        "en": "A classic tea for tonifying blood and qi, suitable for people with deficiency of both"
      },
      "crowdTags": ["crowd_elderly", "crowd_female"],
      "efficacyTags": ["efficacy_blood"],
      "ingredients": [
        { "name": { "zhCN": "红枣", "zhTW": "紅棗", "en": "Red Date" }, "amount": "10颗" },
        { "name": { "zhCN": "枸杞", "zhTW": "枸杞", "en": "Goji Berry" }, "amount": "15克" },
        { "name": { "zhCN": "冰糖", "zhTW": "冰糖", "en": "Rock Sugar" }, "amount": "适量" }
      ],
      "steps": [
        { "order": 1, "description": { "zhCN": "红枣洗净去核", "zhTW": "紅棗洗淨去核", "en": "Wash and pit the red dates" } },
        { "order": 2, "description": { "zhCN": "枸杞用清水冲洗", "zhTW": "枸杞用清水沖洗", "en": "Rinse goji berries with water" } },
        { "order": 3, "description": { "zhCN": "将红枣、枸杞放入杯中，加入热水冲泡", "zhTW": "將紅棗、枸杞放入杯中，加入熱水沖泡", "en": "Put red dates and goji berries in a cup, add hot water" } },
        { "order": 4, "description": { "zhCN": "加盖焖10分钟即可饮用", "zhTW": "加蓋燜10分鐘即可飲用", "en": "Cover and steep for 10 minutes before drinking" } }
      ],
      "nutrition": { "calories": 80, "protein": 2, "fat": 0.5, "carbs": 18 },
      "viewCount": 15000,
      "favoriteCount": 2300,
      "commentCount": 156,
      "rating": 4.8
    }
  ]
}
```

### 4.3 配方图片资源

| 资源类型 | 数量 | 尺寸要求 | 格式 | 存储位置 |
|---------|------|---------|------|---------|
| 配方封面图 | 100张 | 750x422 (16:9) | JPG/PNG | /test-data/images/recipes/covers/ |
| 食材图片 | 200张 | 400x400 (1:1) | PNG | /test-data/images/ingredients/ |
| 步骤图片 | 500张 | 400x300 (4:3) | JPG | /test-data/images/recipes/steps/ |
| 配方视频 | 20个 | 720p/1080p | MP4 | /test-data/videos/recipes/ |

### 4.4 配方数据SQL

```sql
-- 插入测试配方数据
INSERT INTO recipes (
  name_zh_cn, name_zh_tw, name_en,
  description_zh_cn, description_zh_tw, description_en,
  cover_image, video_url, video_duration,
  crowd_tags, efficacy_tags, solar_term_tags,
  nutrition, view_count, favorite_count, comment_count, rating,
  status, created_at
) VALUES
(
  '红枣枸杞茶', '紅棗枸杞茶', 'Red Date Goji Tea',
  '补气养血的经典茶饮', '補氣養血的經典茶飲', 'Classic tea for blood and qi',
  'https://test-cdn.health-diet.com/recipes/cover_001.jpg',
  'https://test-cdn.health-diet.com/recipes/video_001.mp4', 180,
  '["crowd_elderly", "crowd_female"]', '["efficacy_blood"]', '["solar_spring"]',
  '{"calories": 80, "protein": 2, "fat": 0.5, "carbs": 18}',
  15000, 2300, 156, 4.8,
  1, NOW()
),
(
  '山药排骨汤', '山藥排骨湯', 'Yam Pork Rib Soup',
  '健脾养胃的滋补汤品', '健脾養胃的滋補湯品', 'Nourishing soup for spleen and stomach',
  'https://test-cdn.health-diet.com/recipes/cover_002.jpg', NULL, NULL,
  '["crowd_universal"]', '["efficacy_stomach"]', '["solar_autumn"]',
  '{"calories": 280, "protein": 25, "fat": 15, "carbs": 12}',
  12000, 1800, 98, 4.7,
  1, NOW()
);

-- 插入食材数据
INSERT INTO recipe_ingredients (recipe_id, name_zh_cn, name_zh_tw, name_en, amount, sort_order) VALUES
(1, '红枣', '紅棗', 'Red Date', '10颗', 1),
(1, '枸杞', '枸杞', 'Goji Berry', '15克', 2),
(1, '冰糖', '冰糖', 'Rock Sugar', '适量', 3),
(2, '山药', '山藥', 'Yam', '300克', 1),
(2, '排骨', '排骨', 'Pork Ribs', '500克', 2),
(2, '姜片', '姜片', 'Ginger Slices', '3片', 3);

-- 插入步骤数据
INSERT INTO recipe_steps (recipe_id, step_order, description_zh_cn, description_zh_tw, description_en) VALUES
(1, 1, '红枣洗净去核', '紅棗洗淨去核', 'Wash and pit the red dates'),
(1, 2, '枸杞用清水冲洗', '枸杞用清水沖洗', 'Rinse goji berries with water'),
(1, 3, '将红枣、枸杞放入杯中，加入热水冲泡', '將紅棗、枸杞放入杯中，加入熱水沖泡', 'Put in cup, add hot water'),
(1, 4, '加盖焖10分钟即可饮用', '加蓋燜10分鐘即可飲用', 'Cover and steep for 10 minutes'),
(2, 1, '排骨洗净焯水', '排骨洗淨焯水', 'Wash and blanch the pork ribs'),
(2, 2, '山药去皮切块', '山藥去皮切塊', 'Peel and cut yam into pieces'),
(2, 3, '将排骨、山药、姜片放入锅中，加水煮沸', '將排骨、山藥、姜片放入鍋中，加水煮沸', 'Put all ingredients in pot, boil');
```

---

## 5. 用户测试数据

### 5.1 用户角色定义

| 角色 | 描述 | 数量 | 测试场景 |
|-----|------|------|---------|
| **新用户** | 首次使用小程序 | 20 | 注册流程、引导页 |
| **活跃用户** | 经常使用小程序 | 30 | 核心功能测试 |
| **收藏用户** | 有大量收藏记录 | 20 | 收藏功能测试 |
| **评论用户** | 经常发表评论 | 20 | 评论功能测试 |
| **多语言用户** | 使用不同语言 | 10 | 多语言测试 |

### 5.2 用户测试数据

```json
{
  "test_users": [
    {
      "id": 1,
      "wx_openid": "test_wx_openid_001",
      "nickname": "养生达人小王",
      "avatar": "https://test-cdn.health-diet.com/avatars/user001.jpg",
      "phone": "13800000001",
      "language": "zh-CN",
      "role": "active_user",
      "created_at": "2026-01-15T10:30:00Z"
    },
    {
      "id": 2,
      "wx_openid": "test_wx_openid_002",
      "nickname": "健康生活的李阿姨",
      "avatar": "https://test-cdn.health-diet.com/avatars/user002.jpg",
      "phone": "13800000002",
      "language": "zh-CN",
      "role": "elderly_user",
      "created_at": "2026-02-01T14:20:00Z"
    },
    {
      "id": 3,
      "dy_openid": "test_dy_openid_001",
      "nickname": "上班族小张",
      "avatar": "https://test-cdn.health-diet.com/avatars/user003.jpg",
      "phone": "13900000001",
      "language": "zh-CN",
      "role": "office_worker",
      "created_at": "2026-01-20T09:15:00Z"
    },
    {
      "id": 4,
      "wx_openid": "test_wx_openid_004",
      "nickname": "Traditional Chinese",
      "avatar": "https://test-cdn.health-diet.com/avatars/user004.jpg",
      "phone": null,
      "language": "zh-TW",
      "role": "multi_lang_user",
      "created_at": "2026-02-10T16:45:00Z"
    },
    {
      "id": 5,
      "wx_openid": "test_wx_openid_005",
      "nickname": "Health Enthusiast",
      "avatar": "https://test-cdn.health-diet.com/avatars/user005.jpg",
      "phone": null,
      "language": "en",
      "role": "multi_lang_user",
      "created_at": "2026-02-15T11:30:00Z"
    }
  ]
}
```

### 5.3 用户数据SQL

```sql
-- 插入测试用户
INSERT INTO users (wx_openid, dy_openid, nickname, avatar, phone, language, status, created_at) VALUES
('test_wx_openid_001', NULL, '养生达人小王', 'https://test-cdn.health-diet.com/avatars/user001.jpg', '13800000001', 'zh-CN', 1, '2026-01-15 10:30:00'),
('test_wx_openid_002', NULL, '健康生活的李阿姨', 'https://test-cdn.health-diet.com/avatars/user002.jpg', '13800000002', 'zh-CN', 1, '2026-02-01 14:20:00'),
(NULL, 'test_dy_openid_001', '上班族小张', 'https://test-cdn.health-diet.com/avatars/user003.jpg', '13900000001', 'zh-CN', 1, '2026-01-20 09:15:00'),
('test_wx_openid_004', NULL, 'Traditional Chinese', 'https://test-cdn.health-diet.com/avatars/user004.jpg', NULL, 'zh-TW', 1, '2026-02-10 16:45:00'),
('test_wx_openid_005', NULL, 'Health Enthusiast', 'https://test-cdn.health-diet.com/avatars/user005.jpg', NULL, 'en', 1, '2026-02-15 11:30:00'),
('test_wx_openid_006', NULL, '新用户测试', 'https://test-cdn.health-diet.com/avatars/default.jpg', NULL, 'zh-CN', 1, NOW()),
('test_wx_openid_007', NULL, '收藏爱好者', 'https://test-cdn.health-diet.com/avatars/user007.jpg', '13800000007', 'zh-CN', 1, '2026-01-10 08:00:00'),
('test_wx_openid_008', NULL, '评论达人', 'https://test-cdn.health-diet.com/avatars/user008.jpg', '13800000008', 'zh-CN', 1, '2026-01-05 12:00:00'),
('test_wx_openid_009', NULL, '禁用用户测试', 'https://test-cdn.health-diet.com/avatars/default.jpg', NULL, 'zh-CN', 0, '2026-01-01 00:00:00'),
('test_wx_openid_010', NULL, '异常测试用户', 'https://test-cdn.health-diet.com/avatars/default.jpg', '13800000010', 'zh-CN', 1, NOW());
```

---

## 6. 评论测试数据

### 6.1 评论场景设计

| 场景 | 描述 | 数量 | 测试目的 |
|-----|------|------|---------|
| **正常评论** | 正常内容的评论 | 500 | 评论功能基础测试 |
| **带评分评论** | 包含1-5星评分 | 300 | 评分系统测试 |
| **带图片评论** | 包含图片的评论 | 100 | 图片上传测试 |
| **回复评论** | 嵌套回复结构 | 100 | 回复功能测试 |
| **敏感词评论** | 包含敏感词的评论 | 50 | 内容审核测试 |
| **长文本评论** | 超长文本评论 | 20 | 边界测试 |
| **多语言评论** | 不同语言评论 | 30 | 多语言测试 |

### 6.2 评论测试数据

```json
{
  "test_comments": [
    {
      "id": 1,
      "recipe_id": 1,
      "user_id": 1,
      "content": "这个配方真的很好，坚持喝了一个月，气色明显变好了！",
      "rating": 5,
      "likes": 25,
      "reply_count": 3,
      "status": 1,
      "created_at": "2026-02-15T10:30:00Z"
    },
    {
      "id": 2,
      "recipe_id": 1,
      "user_id": 2,
      "content": "简单易做，味道也不错，推荐给大家",
      "rating": 4,
      "likes": 12,
      "reply_count": 1,
      "status": 1,
      "created_at": "2026-02-16T14:20:00Z"
    },
    {
      "id": 3,
      "recipe_id": 1,
      "user_id": 3,
      "content": "This recipe is amazing! I drink it every morning.",
      "rating": 5,
      "likes": 8,
      "reply_count": 0,
      "status": 1,
      "created_at": "2026-02-17T09:15:00Z"
    },
    {
      "id": 4,
      "recipe_id": 2,
      "user_id": 1,
      "content": "汤很鲜美，老人小孩都喜欢喝",
      "rating": 5,
      "likes": 30,
      "reply_count": 5,
      "status": 1,
      "created_at": "2026-02-14T16:45:00Z"
    },
    {
      "id": 5,
      "recipe_id": 2,
      "user_id": 4,
      "content": "這個湯品很適合秋天喝，滋補又美味",
      "rating": 4,
      "likes": 15,
      "reply_count": 2,
      "status": 1,
      "created_at": "2026-02-18T11:30:00Z"
    },
    {
      "id": 6,
      "recipe_id": 1,
      "user_id": 5,
      "content": "测试敏感词：测试政治敏感词001",
      "rating": null,
      "likes": 0,
      "reply_count": 0,
      "status": 2,
      "created_at": "2026-02-19T13:00:00Z"
    },
    {
      "id": 7,
      "recipe_id": 1,
      "user_id": 2,
      "content": "这是一条很长的评论，用来测试长文本显示效果。这个配方真的很好，我已经坚持喝了一个月，感觉身体状态明显改善了很多。以前总是感觉疲劳，现在精神好多了。而且制作也很简单，每天花几分钟就能搞定。强烈推荐给需要补气养血的朋友们！",
      "rating": 5,
      "likes": 45,
      "reply_count": 8,
      "status": 1,
      "created_at": "2026-02-20T08:00:00Z"
    }
  ]
}
```

### 6.3 评论数据SQL

```sql
-- 插入测试评论
INSERT INTO comments (recipe_id, user_id, content, rating, likes, reply_count, status, created_at) VALUES
(1, 1, '这个配方真的很好，坚持喝了一个月，气色明显变好了！', 5, 25, 3, 1, '2026-02-15 10:30:00'),
(1, 2, '简单易做，味道也不错，推荐给大家', 4, 12, 1, 1, '2026-02-16 14:20:00'),
(1, 3, 'This recipe is amazing! I drink it every morning.', 5, 8, 0, 1, '2026-02-17 09:15:00'),
(2, 1, '汤很鲜美，老人小孩都喜欢喝', 5, 30, 5, 1, '2026-02-14 16:45:00'),
(2, 4, '這個湯品很適合秋天喝，滋補又美味', 4, 15, 2, 1, '2026-02-18 11:30:00'),
(1, 5, '测试敏感词：测试政治敏感词001', NULL, 0, 0, 2, '2026-02-19 13:00:00'),
(1, 2, '这是一条很长的评论，用来测试长文本显示效果。这个配方真的很好，我已经坚持喝了一个月，感觉身体状态明显改善了很多。', 5, 45, 8, 1, '2026-02-20 08:00:00'),
(1, 7, '我也试过这个配方，效果确实不错', NULL, 5, 0, 1, '2026-02-15 11:00:00'),
(1, 8, '请问可以天天喝吗？', NULL, 3, 2, 1, '2026-02-15 12:00:00'),
(2, 3, 'Yam and pork ribs are a perfect match!', 5, 10, 1, 1, '2026-02-15 10:00:00');

-- 插入评论回复
INSERT INTO comments (recipe_id, user_id, content, parent_id, likes, status, created_at) VALUES
(1, 2, '回复@养生达人小王：请问是早上喝还是晚上喝比较好？', 1, 3, 1, '2026-02-15 11:30:00'),
(1, 1, '回复@健康生活的李阿姨：我一般早上空腹喝，吸收更好', 1, 5, 1, '2026-02-15 12:00:00'),
(2, 4, '回复@上班族小张：請問需要加鹽嗎？', 5, 2, 1, '2026-02-18 12:00:00');
```

---

## 7. 内容信息流测试数据

### 7.1 内容类型定义

| 内容类型 | 描述 | 数量 | 来源 |
|---------|------|------|------|
| **养生视频** | 食疗制作教程 | 100 | 自建/合作 |
| **养生文章** | 节气养生指南 | 150 | 公众号/自建 |
| **食谱分享** | 用户心得分享 | 100 | UGC |
| **食材知识** | 食材功效介绍 | 100 | 自建 |
| **健康资讯** | 健康养生新闻 | 50 | 合作 |

### 7.2 内容测试数据

```json
{
  "test_contents": [
    {
      "id": 1,
      "title": "春季养生：养肝护肝的5个食疗方",
      "source": "self",
      "source_url": "https://health-diet.com/content/1",
      "cover_image": "https://test-cdn.health-diet.com/contents/cover_001.jpg",
      "author": "Health-Diet营养师",
      "content_type": "article",
      "tags": ["春季养生", "养肝", "食疗"],
      "view_count": 5000,
      "status": 1,
      "published_at": "2026-02-15T08:00:00Z"
    },
    {
      "id": 2,
      "title": "红枣枸杞茶的正确冲泡方法",
      "source": "wechat_video",
      "source_url": "https://video.weixin.com/xxx",
      "cover_image": "https://test-cdn.health-diet.com/contents/cover_002.jpg",
      "author": "养生达人",
      "content_type": "video",
      "tags": ["红枣", "枸杞", "茶饮"],
      "view_count": 8000,
      "status": 1,
      "published_at": "2026-02-16T10:00:00Z"
    },
    {
      "id": 3,
      "title": "秋季干燥怎么办？这些汤品帮你润肺",
      "source": "douyin",
      "source_url": "https://douyin.com/video/xxx",
      "cover_image": "https://test-cdn.health-diet.com/contents/cover_003.jpg",
      "author": "美食博主小李",
      "content_type": "video",
      "tags": ["秋季养生", "润肺", "汤品"],
      "view_count": 12000,
      "status": 1,
      "published_at": "2026-02-17T14:00:00Z"
    },
    {
      "id": 4,
      "title": "失眠人群的食疗方案大全",
      "source": "wechat_article",
      "source_url": "https://mp.weixin.qq.com/xxx",
      "cover_image": "https://test-cdn.health-diet.com/contents/cover_004.jpg",
      "author": "中医养生堂",
      "content_type": "article",
      "tags": ["失眠", "安神", "食疗"],
      "view_count": 3000,
      "status": 1,
      "published_at": "2026-02-18T09:00:00Z"
    }
  ]
}
```

### 7.3 内容数据SQL

```sql
-- 插入测试内容
INSERT INTO contents (title, source, source_url, cover_image, author, content_type, tags, view_count, status, published_at, created_at) VALUES
('春季养生：养肝护肝的5个食疗方', 'self', 'https://health-diet.com/content/1', 'https://test-cdn.health-diet.com/contents/cover_001.jpg', 'Health-Diet营养师', 'article', '["春季养生", "养肝", "食疗"]', 5000, 1, '2026-02-15 08:00:00', NOW()),
('红枣枸杞茶的正确冲泡方法', 'wechat_video', 'https://video.weixin.com/xxx', 'https://test-cdn.health-diet.com/contents/cover_002.jpg', '养生达人', 'video', '["红枣", "枸杞", "茶饮"]', 8000, 1, '2026-02-16 10:00:00', NOW()),
('秋季干燥怎么办？这些汤品帮你润肺', 'douyin', 'https://douyin.com/video/xxx', 'https://test-cdn.health-diet.com/contents/cover_003.jpg', '美食博主小李', 'video', '["秋季养生", "润肺", "汤品"]', 12000, 1, '2026-02-17 14:00:00', NOW()),
('失眠人群的食疗方案大全', 'wechat_article', 'https://mp.weixin.qq.com/xxx', 'https://test-cdn.health-diet.com/contents/cover_004.jpg', '中医养生堂', 'article', '["失眠", "安神", "食疗"]', 3000, 1, '2026-02-18 09:00:00', NOW()),
('冬季进补：当归生姜羊肉汤的做法', 'self', 'https://health-diet.com/content/5', 'https://test-cdn.health-diet.com/contents/cover_005.jpg', 'Health-Diet营养师', 'article', '["冬季养生", "进补", "羊肉汤"]', 6000, 1, '2026-02-19 11:00:00', NOW()),
('测试违规内容：包含测试政治敏感词001', 'self', 'https://health-diet.com/content/6', 'https://test-cdn.health-diet.com/contents/cover_006.jpg', '测试账号', 'article', '["测试"]', 0, 0, NULL, NOW());
```

---

## 8. 测试数据生成工具

### 8.1 数据生成脚本

```python
#!/usr/bin/env python3
# test_data_generator.py

import json
import random
import faker
from datetime import datetime, timedelta

faker = faker.Faker('zh_CN')

class TestDataGenerator:
    def __init__(self):
        self.recipes = []
        self.users = []
        self.comments = []
        self.contents = []
        
    def generate_users(self, count=100):
        """生成测试用户"""
        roles = ['new_user', 'active_user', 'favorite_user', 'comment_user', 'multi_lang_user']
        languages = ['zh-CN', 'zh-TW', 'en']
        
        for i in range(count):
            role = random.choice(roles)
            language = random.choice(languages)
            
            user = {
                'id': i + 1,
                'wx_openid': f'test_wx_openid_{i+1:03d}' if random.choice([True, False]) else None,
                'dy_openid': f'test_dy_openid_{i+1:03d}' if random.choice([True, False]) else None,
                'nickname': faker.name() if language == 'zh-CN' else faker.name(),
                'avatar': f'https://test-cdn.health-diet.com/avatars/user{i+1:03d}.jpg',
                'phone': faker.phone_number() if random.choice([True, False]) else None,
                'language': language,
                'role': role,
                'status': 1 if random.random() > 0.1 else 0,  # 10%禁用用户
                'created_at': faker.date_time_between('-6M', 'now').isoformat()
            }
            self.users.append(user)
        return self.users
    
    def generate_recipes(self, count=100):
        """生成测试配方"""
        crowds = ['crowd_elderly', 'crowd_office', 'crowd_female', 'crowd_children', 'crowd_universal']
        efficacies = ['efficacy_blood', 'efficacy_stomach', 'efficacy_sleep', 'efficacy_beauty', 
                      'efficacy_heatclear', 'efficacy_lung', 'efficacy_kidney', 'efficacy_damp']
        solar_terms = ['solar_spring', 'solar_summer', 'solar_autumn', 'solar_winter']
        
        recipe_names = [
            ('红枣枸杞茶', '紅棗枸杞茶', 'Red Date Goji Tea'),
            ('山药排骨汤', '山藥排骨湯', 'Yam Pork Rib Soup'),
            ('银耳莲子羹', '銀耳蓮子羹', 'White Fungus Lotus Seed Soup'),
            ('黑芝麻糊', '黑芝麻糊', 'Black Sesame Paste'),
            ('当归生姜羊肉汤', '當歸生薑羊肉湯', 'Angelica Ginger Lamb Soup'),
            ('百合绿豆汤', '百合綠豆湯', 'Lily Mung Bean Soup'),
            ('桂圆红枣粥', '桂圓紅棗粥', 'Longan Red Date Porridge'),
            ('枸杞菊花茶', '枸杞菊花茶', 'Goji Chrysanthemum Tea'),
            ('薏米红豆汤', '薏米紅豆湯', 'Barley Red Bean Soup'),
            ('人参鸡汤', '人參雞湯', 'Ginseng Chicken Soup'),
        ]
        
        for i in range(count):
            name_zh, name_tw, name_en = random.choice(recipe_names)
            
            recipe = {
                'id': i + 1,
                'name': {
                    'zhCN': name_zh,
                    'zhTW': name_tw,
                    'en': name_en
                },
                'description': {
                    'zhCN': faker.text(max_nb_chars=100),
                    'zhTW': faker.text(max_nb_chars=100),
                    'en': faker.text(max_nb_chars=100)
                },
                'cover_image': f'https://test-cdn.health-diet.com/recipes/cover_{i+1:03d}.jpg',
                'crowd_tags': random.sample(crowds, k=random.randint(1, 3)),
                'efficacy_tags': random.sample(efficacies, k=random.randint(1, 2)),
                'solar_term_tags': random.sample(solar_terms, k=random.randint(0, 2)),
                'view_count': random.randint(0, 50000),
                'favorite_count': random.randint(0, 5000),
                'comment_count': random.randint(0, 500),
                'rating': round(random.uniform(3.5, 5.0), 1),
                'status': 1 if random.random() > 0.1 else 0
            }
            self.recipes.append(recipe)
        return self.recipes
    
    def generate_comments(self, count=1000):
        """生成测试评论"""
        comment_templates = [
            '这个配方很好，{effect}',
            '已经坚持喝了一个月，{result}',
            '简单易做，{recommend}',
            '味道不错，{taste}',
            '{question}',
            '感谢分享，{thanks}'
        ]
        
        effects = ['效果很明显', '身体状态改善了很多', '气色变好了', '睡眠质量提高了']
        results = ['感觉精神好多了', '身体轻松了很多', '效果超出预期']
        recommends = ['推荐给大家', '值得尝试', '会继续坚持']
        tastes = ['家人都很喜欢', '口感很好', '比想象中好喝']
        questions = ['请问可以天天喝吗？', '有什么禁忌吗？', '孕妇可以喝吗？']
        thanks = ['学到了很多', '很有帮助', '会推荐给朋友']
        
        for i in range(count):
            template = random.choice(comment_templates)
            content = template.format(
                effect=random.choice(effects),
                result=random.choice(results),
                recommend=random.choice(recommends),
                taste=random.choice(tastes),
                question=random.choice(questions),
                thanks=random.choice(thanks)
            )
            
            comment = {
                'id': i + 1,
                'recipe_id': random.randint(1, 100),
                'user_id': random.randint(1, 100),
                'content': content,
                'rating': random.choice([1, 2, 3, 4, 5]) if random.choice([True, False]) else None,
                'likes': random.randint(0, 100),
                'reply_count': random.randint(0, 10),
                'status': 1 if random.random() > 0.05 else 2,  # 5%待审核
                'created_at': faker.date_time_between('-3M', 'now').isoformat()
            }
            self.comments.append(comment)
        return self.comments
    
    def generate_favorites(self, count=2000):
        """生成测试收藏数据"""
        favorites = []
        for i in range(count):
            favorite = {
                'id': i + 1,
                'user_id': random.randint(1, 100),
                'recipe_id': random.randint(1, 100),
                'created_at': faker.date_time_between('-6M', 'now').isoformat()
            }
            favorites.append(favorite)
        return favorites
    
    def export_to_json(self, output_dir='./test-data'):
        """导出测试数据到JSON文件"""
        import os
        os.makedirs(output_dir, exist_ok=True)
        
        with open(f'{output_dir}/users.json', 'w', encoding='utf-8') as f:
            json.dump(self.users, f, ensure_ascii=False, indent=2)
            
        with open(f'{output_dir}/recipes.json', 'w', encoding='utf-8') as f:
            json.dump(self.recipes, f, ensure_ascii=False, indent=2)
            
        with open(f'{output_dir}/comments.json', 'w', encoding='utf-8') as f:
            json.dump(self.comments, f, ensure_ascii=False, indent=2)
        
        print(f"测试数据已导出到 {output_dir}/")
        print(f"- 用户数据: {len(self.users)} 条")
        print(f"- 配方数据: {len(self.recipes)} 条")
        print(f"- 评论数据: {len(self.comments)} 条")

# 使用示例
if __name__ == '__main__':
    generator = TestDataGenerator()
    generator.generate_users(100)
    generator.generate_recipes(100)
    generator.generate_comments(1000)
    generator.export_to_json()
```

### 8.2 数据导入脚本

```bash
#!/bin/bash
# import_test_data.sh

DB_HOST="localhost"
DB_PORT="3306"
DB_NAME="health_diet_test"
DB_USER="hd_test"
DB_PASS="Hd_Test_2026"

echo "开始导入测试数据..."

# 导入用户数据
mysql -h$DB_HOST -P$DB_PORT -u$DB_USER -p$DB_PASS $DB_NAME < ./test-data/sql/users.sql
echo "✓ 用户数据导入完成"

# 导入配方数据
mysql -h$DB_HOST -P$DB_PORT -u$DB_USER -p$DB_PASS $DB_NAME < ./test-data/sql/recipes.sql
echo "✓ 配方数据导入完成"

# 导入评论数据
mysql -h$DB_HOST -P$DB_PORT -u$DB_USER -p$DB_PASS $DB_NAME < ./test-data/sql/comments.sql
echo "✓ 评论数据导入完成"

# 导入内容数据
mysql -h$DB_HOST -P$DB_PORT -u$DB_USER -p$DB_PASS $DB_NAME < ./test-data/sql/contents.sql
echo "✓ 内容数据导入完成"

echo "测试数据导入完成！"
```

---

## 附录

### A. 测试数据检查清单

- [ ] 微信小程序测试账号已申请并配置
- [ ] 抖音小程序测试账号已申请并配置
- [ ] 敏感词库已整理并导入
- [ ] 配方测试数据已生成（≥100个）
- [ ] 用户测试数据已生成（≥100个）
- [ ] 评论测试数据已生成（≥1000条）
- [ ] 内容信息流数据已生成（≥500条）
- [ ] 收藏测试数据已生成（≥2000条）
- [ ] 图片资源已上传至CDN
- [ ] 视频资源已上传至CDN
- [ ] 测试数据已导入测试环境
- [ ] 测试数据质量已验证

### B. 测试数据维护责任人

| 数据类型 | 责任人 | 更新频率 | 联系方式 |
|---------|-------|---------|---------|
| 平台测试账号 | 测试团队 | 每季度 | qa-team@health-diet.com |
| 敏感词库 | 安全团队 | 每月 | security@health-diet.com |
| 配方数据 | 产品团队 | 每周 | product@health-diet.com |
| 用户/评论数据 | 测试团队 | 按需 | qa-team@health-diet.com |
| 内容数据 | 运营团队 | 每日 | ops@health-diet.com |

### C. 测试数据版本控制

```
test-data/
├── v1.0.0/           # 初始版本
│   ├── users.sql
│   ├── recipes.sql
│   └── comments.sql
├── v1.1.0/           # 增加多语言数据
│   └── ...
└── latest/           # 最新版本（软链接）
    └── ...
```

---

**文档结束**

*本文档为 Health-Diet 食疗养生小程序的测试数据准备指南，涵盖平台测试账号、敏感词库、配方数据、用户数据、评论数据和内容数据的准备方法和示例数据。*
