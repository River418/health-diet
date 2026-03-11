# Health-Diet 测试数据说明

## 数据文件

- `seed_data.sql` - 完整的测试数据SQL文件（约4000行）
- `generate_seed_data.py` - Python数据生成脚本
- `verify_seed_data.sql` - 数据验证脚本

## 数据量统计

| 数据表 | 记录数 | 说明 |
|--------|--------|------|
| users | 20 | 测试用户 |
| recipes | 69 | 食疗配方 |
| recipe_ingredients | 255 | 配方食材 |
| recipe_steps | 414 | 制作步骤 |
| categories | 42 | 分类数据（已存在） |
| contents | 30 | 内容数据 |
| favorites | 203 | 收藏记录 |
| user_history | 414 | 浏览历史 |
| comments | 213 | 评论数据 |
| **总计** | **~1600** | - |

## 配方数据覆盖

### 疗效分类（10种）
- 健脾养胃: 8条
- 润肺止咳: 8条
- 补气养血: 9条
- 安神助眠: 7条
- 美容养颜: 7条
- 清热解毒: 6条
- 降压降脂: 6条
- 增强免疫: 6条
- 祛湿排毒: 6条
- 补肾壮阳: 6条

### 人群分类（5种）
- 中老年: 覆盖大部分配方
- 白领: 适合办公室人群
- 女性: 美容养颜、补血类
- 儿童: 温和调理类
- 通用: 适合各类人群

### 节气分类（28种）
- 四季: 春夏秋冬
- 24节气: 立春、雨水、惊蛰...大寒

## 内容数据来源

- wechat_video: 微信视频号
- wechat_article: 微信公众号
- douyin: 抖音
- self: 平台自制内容

## 使用方式

### 1. 初始化数据库（如未初始化）
```bash
# 执行迁移脚本
psql -U your_username -d health_diet -f ../migrations/*.sql
```

### 2. 导入测试数据
```bash
# 执行测试数据脚本
psql -U your_username -d health_diet -f seed_data.sql
```

### 3. 验证数据完整性
```bash
# 执行验证脚本
psql -U your_username -d health_diet -f verify_seed_data.sql
```

### 4. 重新生成数据（可选）
```bash
# 修改generate_seed_data.py中的数据
python3 generate_seed_data.py
```

## 注意事项

1. 执行前请确保PostgreSQL数据库已创建并初始化表结构
2. 数据ID从1开始连续编号，执行前请确保表为空或使用TRUNCATE清空
3. 食材和步骤图片路径为占位符，实际使用时需替换为真实图片URL
4. 用户头像使用DiceBear API生成

## 数据特点

- **真实性**: 配方基于传统中医食疗理论
- **多样性**: 覆盖不同人群、节气、疗效
- **关联性**: 用户-收藏-评论-浏览历史完整关联
- **随机性**: 浏览量、收藏数、评分等数据随机生成
