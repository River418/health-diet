# Health-Diet 食疗养生小程序

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## 项目简介

Health-Diet 是一款面向中老年和白领群体的养生食疗配方查询小程序，提供科学、实用的食疗养生方案，帮助用户通过日常饮食调理身体、预防疾病。

## 核心功能

- 🔍 **多维度智能筛选** - 按人群、节气、功效、食材筛选
- 📱 **双平台覆盖** - 微信小程序 + 抖音小程序
- 🍵 **食疗配方库** - 丰富的食疗配方，含图文视频教程
- 💬 **用户互动** - 评论、收藏、分享功能
- 🌐 **多语言支持** - 简中/繁中/English
- ⚠️ **合规提示** - 医疗免责声明，确保合规

## 技术栈

### 前端
- **框架**: Taro 3.x + Vue 3
- **状态管理**: Pinia
- **国际化**: Vue I18n
- **样式**: SCSS

### 后端
- **运行时**: Node.js 18+ LTS
- **框架**: Express.js
- **数据库**: MySQL 8.0
- **缓存**: Redis 6.0
- **认证**: JWT

## 快速开始

### 克隆项目

```bash
git clone <repository-url>
cd health-diet
```

### 后端启动

```bash
cd backend
cp .env.example .env
# 编辑 .env 配置数据库和Redis
npm install
npm run dev
```

### 前端启动

```bash
cd frontend
npm install
npm run dev:weapp  # 微信小程序
# 或
npm run dev:tt     # 抖音小程序
```

## 项目文档

- [PRD 产品需求文档](./docs/PRD.md)
- [开发环境搭建指南](./docs/DEV_SETUP.md)
- [数据库设计文档](./database/migrations/)

## 开发阶段

当前阶段: **feature/dev 开发中**

### 已完成
- [x] 创建 feature/dev 分支
- [x] 初始化项目结构（前端 + 后端）
- [x] 数据库表结构（PRD 7.6节）
- [x] 后端基础框架搭建
- [x] 前端基础配置

### 进行中
- [ ] P0 功能开发（用户系统、配方查询、收藏）

## 许可证

MIT License

---

**⚠️ 免责声明**: 食疗养生，不替代药物治疗。如有身体不适，请及时就医。
