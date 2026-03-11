# Health-Diet 数据库迁移总结

## 概述
将项目从 MySQL 迁移到 PostgreSQL，包括数据库迁移文件、后端配置和代码修改。

## 修改的文件列表

### 1. SQL 迁移文件 (11个)
- `database/migrations/001_create_users_table.sql`
- `database/migrations/002_create_recipes_table.sql`
- `database/migrations/003_create_recipe_ingredients_table.sql`
- `database/migrations/004_create_recipe_steps_table.sql`
- `database/migrations/005_create_categories_table.sql`
- `database/migrations/006_create_comments_table.sql`
- `database/migrations/007_create_favorites_table.sql`
- `database/migrations/008_create_contents_table.sql`
- `database/migrations/009_create_mq_messages_table.sql`
- `database/migrations/010_create_user_history_table.sql`
- `database/migrations/011_create_kingkong_config_table.sql`

### 2. 后端配置文件
- `backend/src/config/database.js` - 数据库连接配置

### 3. 后端路由文件 (6个)
- `backend/src/routes/auth.js` - 认证路由
- `backend/src/routes/user.js` - 用户路由
- `backend/src/routes/recipe.js` - 配方路由
- `backend/src/routes/category.js` - 分类路由
- `backend/src/routes/comment.js` - 评论路由
- `backend/src/routes/content.js` - 内容路由
- `backend/src/routes/search.js` - 搜索路由

### 4. 其他文件
- `backend/package.json` - 依赖更新 (mysql2 → pg)
- `backend/src/app.js` - 应用入口文件注释更新

### 5. 新增文件
- `database/migrate_to_postgres.js` - PostgreSQL 迁移执行脚本
- `database/verify_postgresql.sql` - 验证脚本

## 主要语法转换

### MySQL → PostgreSQL

| MySQL | PostgreSQL |
|-------|------------|
| `BIGINT UNSIGNED AUTO_INCREMENT` | `BIGSERIAL` |
| `TINYINT` | `SMALLINT` |
| `JSON` | `JSONB` |
| `DATETIME` | `TIMESTAMP` |
| `ON UPDATE CURRENT_TIMESTAMP` | 触发器实现 |
| `JSON_CONTAINS(column, ?)` | `column @> ?` |
| `ON DUPLICATE KEY UPDATE` | `ON CONFLICT ... DO UPDATE` |
| `LIKE` (不区分大小写) | `ILIKE` |
| `?` 参数占位符 | `$1, $2, ...` 参数占位符 |
| `LIMIT ? OFFSET ?` | `LIMIT $1 OFFSET $2` |
| `ENUM` 类型 | 自定义 ENUM 类型 |
| `NOW()` | `CURRENT_TIMESTAMP` |
| `result.insertId` | `result.rows[0].id` |
| `result.affectedRows` | `result.rowCount` |

## 验证步骤

### 1. 安装 PostgreSQL
```bash
# macOS
brew install postgresql
brew services start postgresql

# 创建数据库
createdb health_diet
```

### 2. 配置环境变量
```bash
export DB_HOST=localhost
export DB_PORT=5432
export DB_USER=postgres
export DB_PASSWORD=your_password
export DB_NAME=health_diet
```

### 3. 执行迁移
```bash
cd /Users/river/Documents/health-diet/backend
node ../database/migrate_to_postgres.js
```

### 4. 验证表结构
```bash
psql -d health_diet -f database/verify_postgresql.sql
```

### 5. 启动后端服务
```bash
cd /Users/river/Documents/health-diet/backend
npm run dev
```

### 6. 测试 API
```bash
# 健康检查
curl http://localhost:3000/api/v1/health

# 获取分类列表
curl http://localhost:3000/api/v1/categories

# 获取配方列表
curl http://localhost:3000/api/v1/recipes
```

## 注意事项

1. **全文搜索**: PostgreSQL 使用 `to_tsvector` 和 `gin` 索引替代 MySQL 的 `FULLTEXT INDEX`
2. **JSON 操作**: PostgreSQL 的 JSONB 操作符 `@>` 替代 MySQL 的 `JSON_CONTAINS`
3. **UPSERT**: PostgreSQL 使用 `ON CONFLICT` 替代 MySQL 的 `ON DUPLICATE KEY UPDATE`
4. **大小写敏感**: PostgreSQL 的 `ILIKE` 替代 MySQL 的 `LIKE` 实现不区分大小写搜索
5. **参数绑定**: PostgreSQL 使用 `$1, $2...` 替代 MySQL 的 `?`
