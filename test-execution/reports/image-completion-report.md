# Health-Diet 图片资源补全报告

**报告时间**: 2026-03-14 17:25  
**报告人**: QA Agent  
**项目路径**: /Users/river/Documents/health-diet

---

## 核心结论

1. **图片资源严重缺失**：数据库中引用了69个食谱封面图和255个食材图片，但实际图片文件全部缺失
2. **前端代码已配置图片路径**：代码中已预留图片引用逻辑，但缺少实际图片文件
3. **测试环境图片显示异常**：当前截图显示大量空白区域和缺失图片占位符
4. **建议优先级**：P0-食谱封面图 > P1-食材图片 > P2-步骤图片 > P3-用户头像

---

## 1. 图片缺失清单

### 1.1 食谱封面图（69个缺失）

**存储路径**: `/images/recipes/` (数据库引用路径)
**实际路径**: `frontend/src/assets/images/recipes/` (前端实际目录，目前为空)

| 序号 | 食谱名称 | 数据库引用路径 | 状态 |
|-----|---------|---------------|------|
| 1 | 山药小米粥 | /images/recipes/山药小米粥.jpg | ❌ 缺失 |
| 2 | 南瓜红枣粥 | /images/recipes/南瓜红枣粥.jpg | ❌ 缺失 |
| 3 | 猴头菇炖鸡汤 | /images/recipes/猴头菇炖鸡汤.jpg | ❌ 缺失 |
| 4 | 莲子百合粥 | /images/recipes/莲子百合粥.jpg | ❌ 缺失 |
| 5 | 茯苓山药排骨汤 | /images/recipes/茯苓山药排骨汤.jpg | ❌ 缺失 |
| 6 | 陈皮瘦肉粥 | /images/recipes/陈皮瘦肉粥.jpg | ❌ 缺失 |
| 7 | 芡实薏米粥 | /images/recipes/芡实薏米粥.jpg | ❌ 缺失 |
| 8 | 生姜红糖暖胃汤 | /images/recipes/生姜红糖暖胃汤.jpg | ❌ 缺失 |
| 9 | 川贝雪梨汤 | /images/recipes/川贝雪梨汤.jpg | ❌ 缺失 |
| 10 | 银耳莲子羹 | /images/recipes/银耳莲子羹.jpg | ❌ 缺失 |
| ... | ... | ... | ... |
| 69 | 肉苁蓉炖羊肉 | /images/recipes/肉苁蓉炖羊肉.jpg | ❌ 缺失 |

**完整列表**: 见数据库 seed_data.sql 中 recipes 表的 cover_image 字段

### 1.2 食材图片（约80+个缺失）

**存储路径**: `/images/ingredients/`
**实际路径**: `frontend/src/assets/images/ingredients/` (目前为空)

**缺失的主要食材图片**:
- 基础食材: 山药、小米、红枣、大米、南瓜、银耳、莲子、百合等
- 药材类: 当归、黄芪、党参、茯苓、白术、枸杞等
- 肉类: 土鸡、排骨、瘦肉、乌鸡、老鸭、猪蹄等
- 其他: 各种蔬菜、水果、调味料等

**完整列表**: 见数据库 seed_data.sql 中 recipe_ingredients 表的 image 字段

### 1.3 步骤图片（414个缺失）

**存储路径**: `/images/steps/`
**计算方式**: 69个食谱 × 6个步骤 = 414张步骤图片

**命名格式**: `{食谱名}_{步骤序号}.jpg`

示例:
- /images/steps/山药小米粥_1.jpg
- /images/steps/山药小米粥_2.jpg
- ...
- /images/steps/肉苁蓉炖羊肉_6.jpg

### 1.4 Banner图片（3个缺失）

**代码中硬编码的Banner图片**:
- /assets/images/banner-spring.jpg
- /assets/images/banner-autumn.jpg
- /assets/images/banner-spleen.jpg

### 1.5 内容资讯图片（3个缺失）

**代码中硬编码的内容图片**:
- /assets/images/content/spring-health.jpg
- /assets/images/content/elderly-diet.jpg
- /assets/images/content/beauty-food.jpg

### 1.6 默认占位图（建议创建）

**建议创建的占位图**:
- /assets/images/recipe-default.png (食谱默认图)
- /assets/images/ingredient-default.png (食材默认图)
- /assets/images/avatar-default.png (用户默认头像)
- /assets/images/banner-default.jpg (Banner默认图)

---

## 2. 图片规范要求

根据项目 design/assets/images/image-specs.md 文件:

### 2.1 尺寸规范

| 类型 | 比例 | 推荐尺寸 | 格式 |
|-----|------|---------|------|
| 食谱封面 | 16:9 | 750×422px | JPG/WebP |
| 食材图片 | 1:1 | 200×200px | PNG/WebP |
| 步骤图片 | 4:3 | 800×600px | JPG/WebP |
| Banner | 16:9 | 750×422px | JPG/WebP |
| 用户头像 | 1:1 | 144×144px | JPG/PNG |

### 2.2 文件大小限制

- 食谱封面: < 200KB
- 食材图片: < 50KB
- 步骤图片: < 150KB
- Banner: < 300KB
- 用户头像: < 30KB

### 2.3 命名规范

```
[type]_[id]_[size].[ext]

示例:
recipe_123_cover.jpg
recipe_123_step_1.jpg
ingredient_red_dates_thumb.png
user_456_avatar.jpg
banner_home_1.jpg
```

---

## 3. 图片获取建议

### 3.1 食谱封面图

**推荐来源**:
1. **AI生成**: 使用 Midjourney/Stable Diffusion 生成食疗主题图片
2. **免费图库**: Unsplash、Pexels、Pixabay (搜索关键词: chinese soup, herbal tea, congee)
3. **购买正版**: 视觉中国、图虫网

**AI生成提示词示例**:
```
Chinese traditional medicinal food photography, 
red date and silver ear fungus sweet soup in a white ceramic bowl, 
warm lighting, top-down angle, clean background, 
professional food photography, 4K, highly detailed
```

### 3.2 食材图片

**推荐来源**:
1. **免费图库**: 透明背景的 PNG 素材网站 (如 pngtree、cleanpng)
2. **自行拍摄**: 统一光线和角度拍摄
3. **AI生成**: 生成单个食材透明背景图

### 3.3 临时解决方案

**方案A: 使用占位图服务**
```javascript
// 修改图片加载逻辑，使用占位图服务
const getImageUrl = (path) => {
  if (imageExists(path)) {
    return path;
  }
  // 使用占位图服务
  return `https://via.placeholder.com/750x422?text=${encodeURIComponent(recipeName)}`;
};
```

**方案B: 使用渐变色占位**
```css
.image-placeholder {
  background: linear-gradient(135deg, #f5f5f5 0%, #e0e0e0 100%);
  display: flex;
  align-items: center;
  justify-content: center;
}
```

---

## 4. 实施建议

### 4.1 优先级排序

| 优先级 | 图片类型 | 数量 | 影响范围 |
|-------|---------|------|---------|
| P0 | 食谱封面图 | 69 | 首页、列表页、详情页 |
| P1 | 食材图片 | 80+ | 详情页食材清单 |
| P2 | 步骤图片 | 414 | 详情页制作步骤 |
| P3 | Banner图 | 3 | 首页轮播 |
| P3 | 内容资讯图 | 3 | 资讯列表 |
| P4 | 用户头像 | 20 | 评论、个人中心 |

### 4.2 实施步骤

**第一步: 创建默认占位图**
```bash
mkdir -p frontend/src/assets/images/recipes
mkdir -p frontend/src/assets/images/ingredients
mkdir -p frontend/src/assets/images/steps
mkdir -p frontend/src/assets/images/content
```

**第二步: 批量生成/获取食谱封面图**
- 使用AI工具批量生成69张食谱封面
- 或从免费图库筛选匹配图片

**第三步: 获取食材图片**
- 优先获取常用食材（红枣、枸杞、山药等）
- 使用透明背景PNG格式

**第四步: 逐步补充步骤图片**
- 优先核心食谱的步骤图
- 其他食谱可用通用烹饪步骤图替代

---

## 5. 当前截图问题分析

从现有截图观察到的图片相关问题:

| 页面 | 问题描述 | 严重程度 |
|-----|---------|---------|
| 首页 | Banner区域空白，推荐配方无图片 | 🔴 高 |
| 首页 | 养生资讯无封面图 | 🟡 中 |
| 分类页 | 金刚位图标显示正常，但食谱列表无图 | 🟡 中 |
| 详情页 | 封面图缺失，食材图片缺失 | 🔴 高 |
| 详情页 | 步骤图片缺失 | 🟡 中 |
| 收藏页 | 空状态显示正常 | ✅ 正常 |
| 个人中心 | 头像为默认占位 | 🟢 低 |

---

## 6. 下一步行动

### 立即执行
1. [ ] 创建图片目录结构
2. [ ] 设计并生成默认占位图
3. [ ] 获取/生成69张食谱封面图（P0）

### 短期执行（1-2天）
4. [ ] 获取常用食材图片（P1）
5. [ ] 生成3张Banner图片
6. [ ] 生成内容资讯图片

### 中期执行（3-5天）
7. [ ] 补充步骤图片（P2）
8. [ ] 生成用户头像
9. [ ] 图片压缩和优化

---

*报告生成时间: 2026-03-14 17:25*
