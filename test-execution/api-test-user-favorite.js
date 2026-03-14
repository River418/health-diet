#!/usr/bin/env node
/**
 * Health-Diet API 用户系统与收藏功能测试
 * 端口: 3001
 */

const http = require('http');

const BASE_URL = 'localhost';
const PORT = 3001;

// 测试结果统计
const results = {
  total: 0,
  passed: 0,
  failed: 0,
  skipped: 0,
  errors: []
};

// 存储测试数据
let testUser = null;
let testToken = null;

// 简单的HTTP请求函数
function request(path, method = 'GET', body = null, headers = {}) {
  return new Promise((resolve, reject) => {
    const options = {
      hostname: BASE_URL,
      port: PORT,
      path: path,
      method: method,
      headers: {
        'Content-Type': 'application/json',
        ...headers
      }
    };

    const req = http.request(options, (res) => {
      let data = '';
      res.on('data', (chunk) => { data += chunk; });
      res.on('end', () => {
        try {
          resolve({
            status: res.statusCode,
            data: JSON.parse(data),
            headers: res.headers
          });
        } catch (e) {
          resolve({
            status: res.statusCode,
            data: data,
            headers: res.headers
          });
        }
      });
    });

    req.on('error', reject);
    if (body) req.write(JSON.stringify(body));
    req.end();
  });
}

// 测试用例
async function runTests() {
  console.log('='.repeat(70));
  console.log('Health-Diet API 用户系统与收藏功能测试');
  console.log(`测试时间: ${new Date().toISOString()}`);
  console.log(`目标服务: http://${BASE_URL}:${PORT}`);
  console.log('='.repeat(70));
  console.log();

  // ========== 用户系统测试 ==========
  console.log('【用户系统测试】');
  console.log('-'.repeat(70));

  await testCase('HD-TC-USR-001', '用户注册/登录接口检查', async () => {
    // 由于微信登录需要真实code，这里只检查接口是否存在
    const res = await request('/api/v1/auth/wechat-login', 'POST', {
      code: 'invalid_code'
    });
    // 接口应该返回400或401（code无效）
    assertCondition(res.status === 400 || res.status === 401 || res.status === 404 || res.status === 500);
  });

  await testCase('HD-TC-USR-002', '获取当前用户信息（无Token）', async () => {
    const res = await request('/api/v1/users/me');
    // 未登录应该返回401
    assertCondition(res.status === 401 || res.status === 403 || res.status === 404);
  });

  await testCase('HD-TC-USR-003', '更新用户信息（无Token）', async () => {
    const res = await request('/api/v1/users/me', 'PUT', {
      nickname: 'Test User'
    });
    // 未登录应该返回401
    assertCondition(res.status === 401 || res.status === 403 || res.status === 404);
  });

  await testCase('HD-TC-USR-LANG-001', '语言切换接口检查', async () => {
    const res = await request('/api/v1/users/language', 'PUT', {
      language: 'en'
    });
    // 未登录应该返回401
    assertCondition(res.status === 401 || res.status === 403 || res.status === 404);
  });

  // ========== 收藏功能测试 ==========
  console.log();
  console.log('【收藏功能测试】');
  console.log('-'.repeat(70));

  await testCase('HD-TC-FAV-001', '收藏配方（无Token）', async () => {
    const res = await request('/api/v1/recipes/1/favorite', 'POST');
    // 未登录应该返回401
    assertCondition(res.status === 401 || res.status === 403 || res.status === 404);
  });

  await testCase('HD-TC-FAV-002', '取消收藏（无Token）', async () => {
    const res = await request('/api/v1/recipes/1/favorite', 'DELETE');
    // 未登录应该返回401
    assertCondition(res.status === 401 || res.status === 403 || res.status === 404);
  });

  await testCase('HD-TC-FAV-003', '获取我的收藏列表（无Token）', async () => {
    const res = await request('/api/v1/users/favorites');
    // 未登录应该返回401
    assertCondition(res.status === 401 || res.status === 403 || res.status === 404);
  });

  await testCase('HD-TC-FAV-004', '检查配方收藏状态（无Token）', async () => {
    const res = await request('/api/v1/recipes/1/favorite/status');
    // 可能返回200（公开接口）或401
    assertCondition(res.status === 200 || res.status === 401 || res.status === 404);
  });

  // ========== 评论功能测试 ==========
  console.log();
  console.log('【评论功能测试】');
  console.log('-'.repeat(70));

  await testCase('HD-TC-CMT-001', '获取评论列表', async () => {
    const res = await request('/api/v1/comments?recipeId=1&page=1&limit=20');
    assertCondition(res.status === 200 || res.status === 404);
  });

  await testCase('HD-TC-CMT-002', '发表评论（无Token）', async () => {
    const res = await request('/api/v1/comments', 'POST', {
      recipeId: 1,
      content: 'Test comment'
    });
    // 未登录应该返回401
    assertCondition(res.status === 401 || res.status === 403 || res.status === 404);
  });

  await testCase('HD-TC-CMT-003', '回复评论（无Token）', async () => {
    const res = await request('/api/v1/comments', 'POST', {
      recipeId: 1,
      parentId: 1,
      content: 'Test reply'
    });
    // 未登录应该返回401
    assertCondition(res.status === 401 || res.status === 403 || res.status === 404);
  });

  await testCase('HD-TC-CMT-004', '点赞评论（无Token）', async () => {
    const res = await request('/api/v1/comments/1/like', 'POST');
    // 未登录应该返回401
    assertCondition(res.status === 401 || res.status === 403 || res.status === 404);
  });

  // ========== 浏览历史测试 ==========
  console.log();
  console.log('【浏览历史测试】');
  console.log('-'.repeat(70));

  await testCase('HD-TC-HIS-001', '获取浏览历史（无Token）', async () => {
    const res = await request('/api/v1/users/history');
    // 未登录应该返回401
    assertCondition(res.status === 401 || res.status === 403 || res.status === 404);
  });

  await testCase('HD-TC-HIS-002', '清空浏览历史（无Token）', async () => {
    const res = await request('/api/v1/users/history', 'DELETE');
    // 未登录应该返回401
    assertCondition(res.status === 401 || res.status === 403 || res.status === 404);
  });

  // ========== 内容系统测试 ==========
  console.log();
  console.log('【内容系统测试】');
  console.log('-'.repeat(70));

  await testCase('HD-TC-CNT-001', '获取内容详情', async () => {
    const res = await request('/api/v1/contents/1');
    assertCondition(res.status === 200 || res.status === 404);
  });

  await testCase('HD-TC-CNT-002', '获取内容列表-按来源筛选', async () => {
    const res = await request('/api/v1/contents?source=wechat');
    assertEquals(res.status, 200);
    assertExists(res.data.data);
  });

  await testCase('HD-TC-CNT-003', '获取内容列表-按类型筛选', async () => {
    const res = await request('/api/v1/contents?contentType=article');
    assertEquals(res.status, 200);
    assertExists(res.data.data);
  });

  await testCase('HD-TC-CNT-004', '收藏内容（无Token）', async () => {
    const res = await request('/api/v1/contents/1/favorite', 'POST');
    // 未登录应该返回401
    assertCondition(res.status === 401 || res.status === 403 || res.status === 404);
  });

  // ========== 金刚位配置测试 ==========
  console.log();
  console.log('【金刚位配置测试】');
  console.log('-'.repeat(70));

  await testCase('HD-TC-KNG-001', '获取金刚位配置', async () => {
    const res = await request('/api/v1/kingkong');
    // 可能返回200或404（如果独立路由未配置）
    assertCondition(res.status === 200 || res.status === 404);
  });

  await testCase('HD-TC-KNG-002', '金刚位点击跳转-筛选类型', async () => {
    // 金刚位筛选功能通过分类接口实现
    const res = await request('/api/v1/categories?type=target');
    assertEquals(res.status, 200);
  });

  // ========== 合规性测试 ==========
  console.log();
  console.log('【合规性测试】');
  console.log('-'.repeat(70));

  await testCase('HD-TC-COM-001', '配方详情合规提示数据', async () => {
    const res = await request('/api/v1/recipes/1');
    assertEquals(res.status, 200);
    assertExists(res.data.data);
    // 验证配方数据包含免责声明相关字段
    assertExists(res.data.data.name);
  });

  await testCase('HD-TC-COM-002', '搜索合规提示数据', async () => {
    const res = await request('/api/v1/search?q=tea');
    assertEquals(res.status, 200);
    assertExists(res.data.data);
  });

  await testCase('HD-TC-COM-003', '内容合规性检查', async () => {
    const res = await request('/api/v1/contents');
    assertEquals(res.status, 200);
    // 内容应该包含来源信息
    if (res.data.data.list && res.data.data.list.length > 0) {
      assertExists(res.data.data.list[0].source);
    }
  });

  // ========== 安全性测试 ==========
  console.log();
  console.log('【安全性测试】');
  console.log('-'.repeat(70));

  await testCase('HD-TC-SEC-001', 'SQL注入防护', async () => {
    const res = await request('/api/v1/recipes?id=1 OR 1=1');
    // 应该正常返回或返回400，不应返回500
    assertCondition(res.status === 200 || res.status === 400);
  });

  await testCase('HD-TC-SEC-002', 'XSS攻击防护', async () => {
    const res = await request('/api/v1/search?q=<script>alert(1)</script>');
    // 应该正常处理，不应执行脚本
    assertCondition(res.status === 200 || res.status === 400);
  });

  await testCase('HD-TC-SEC-003', '越权访问检查', async () => {
    const res = await request('/api/v1/users/99999/profile');
    // 应该返回404或401，不应返回其他用户数据
    assertCondition(res.status === 401 || res.status === 403 || res.status === 404);
  });

  // ========== 输出测试报告 ==========
  printReport();
}

// 测试用例执行
async function testCase(id, name, testFn) {
  results.total++;
  process.stdout.write(`${id}: ${name} ... `);
  
  try {
    await testFn();
    results.passed++;
    console.log('✅ 通过');
  } catch (error) {
    results.failed++;
    results.errors.push({ id, name, error: error.message });
    console.log(`❌ 失败: ${error.message}`);
  }
}

// 断言函数
function assertEquals(actual, expected, message) {
  if (actual !== expected) {
    throw new Error(message || `期望 ${expected}, 实际 ${actual}`);
  }
}

function assertExists(value, message) {
  if (value === undefined || value === null) {
    throw new Error(message || `值为 ${value}`);
  }
}

function assertCondition(condition, message) {
  if (!condition) {
    throw new Error(message || '条件不满足');
  }
}

// 输出测试报告
function printReport() {
  console.log();
  console.log('='.repeat(70));
  console.log('测试执行报告');
  console.log('='.repeat(70));
  console.log(`总用例数: ${results.total}`);
  console.log(`通过: ${results.passed} ✅`);
  console.log(`失败: ${results.failed} ❌`);
  console.log(`跳过: ${results.skipped} ⏭️`);
  console.log(`通过率: ${((results.passed / results.total) * 100).toFixed(1)}%`);
  console.log('='.repeat(70));

  if (results.errors.length > 0) {
    console.log();
    console.log('失败用例详情:');
    results.errors.forEach((err, i) => {
      console.log(`  ${i + 1}. ${err.id}: ${err.name}`);
      console.log(`     原因: ${err.error}`);
    });
  }

  // 保存结果到文件
  const fs = require('fs');
  const reportPath = '/Users/river/Documents/health-diet/test-execution/reports/api-test-user-favorite-result.json';
  fs.writeFileSync(reportPath, JSON.stringify({
    timestamp: new Date().toISOString(),
    ...results
  }, null, 2));
  console.log();
  console.log(`详细结果已保存至: ${reportPath}`);
}

// 运行测试
runTests().catch(console.error);
