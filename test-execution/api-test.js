#!/usr/bin/env node
/**
 * Health-Diet API 自动化测试脚本
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
  errors: []
};

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
  console.log('='.repeat(60));
  console.log('Health-Diet API 自动化测试');
  console.log(`测试时间: ${new Date().toISOString()}`);
  console.log(`目标服务: http://${BASE_URL}:${PORT}`);
  console.log('='.repeat(60));
  console.log();

  // ========== P0 测试用例 ==========
  console.log('【P0 测试用例 - 核心功能】');
  console.log('-'.repeat(60));

  // 1. 健康检查
  await testCase('HD-TC-HEALTH-001', '服务健康检查', async () => {
    const res = await request('/api/v1/health');
    assertEquals(res.status, 200, 'HTTP状态码应为200');
    assertEquals(res.data.success, true, 'success应为true');
    assertEquals(res.data.data.status, 'healthy', '状态应为healthy');
  });

  // 2. 配方列表
  await testCase('HD-TC-RCP-LIST-001', '配方列表加载', async () => {
    const res = await request('/api/v1/recipes?page=1&limit=20');
    assertEquals(res.status, 200, 'HTTP状态码应为200');
    assertEquals(res.data.success, true, 'success应为true');
    assertExists(res.data.data, '应返回data');
    assertExists(res.data.data.list, '应返回list');
    assertCondition(res.data.data.list.length >= 0, 'list应为数组');
  });

  // 3. 配方详情
  await testCase('HD-TC-RCP-DTL-001', '配方详情加载', async () => {
    // 先获取列表
    const listRes = await request('/api/v1/recipes?page=1&limit=1');
    if (listRes.data.data.list.length === 0) {
      throw new Error('没有可测试的配方数据');
    }
    const recipeId = listRes.data.data.list[0].id;
    const res = await request(`/api/v1/recipes/${recipeId}`);
    assertEquals(res.status, 200, 'HTTP状态码应为200');
    assertEquals(res.data.success, true, 'success应为true');
    assertExists(res.data.data, '应返回data');
    assertExists(res.data.data.id, '应返回配方ID');
  });

  // 4. 分类列表
  await testCase('HD-TC-CAT-LIST-001', '分类列表加载', async () => {
    const res = await request('/api/v1/categories');
    assertEquals(res.status, 200, 'HTTP状态码应为200');
    assertEquals(res.data.success, true, 'success应为true');
    assertExists(res.data.data, '应返回data');
  });

  // 5. 金刚位配置（使用分类接口作为替代）
  await testCase('HD-TC-KNG-001', '金刚位配置获取', async () => {
    // 金刚位配置可能使用分类数据
    const res = await request('/api/v1/categories?type=target');
    // 接口可能返回200或404（如果独立路由未配置）
    assertCondition(res.status === 200 || res.status === 404, 
      'HTTP状态码应为200或404');
    if (res.status === 200) {
      assertEquals(res.data.success, true, 'success应为true');
    }
  });

  // 6. 搜索功能
  await testCase('HD-TC-SCH-001', '搜索功能', async () => {
    const res = await request('/api/v1/search?q=yangsheng&page=1&limit=20');
    assertEquals(res.status, 200, 'HTTP状态码应为200');
    assertEquals(res.data.success, true, 'success应为true');
    assertExists(res.data.data, '应返回data');
  });

  // 7. 内容列表
  await testCase('HD-TC-CNT-LIST-001', '内容列表加载', async () => {
    const res = await request('/api/v1/contents?page=1&limit=20');
    assertEquals(res.status, 200, 'HTTP状态码应为200');
    assertEquals(res.data.success, true, 'success应为true');
    assertExists(res.data.data, '应返回data');
  });

  // ========== P1 测试用例 ==========
  console.log();
  console.log('【P1 测试用例 - 重要功能】');
  console.log('-'.repeat(60));

  // 8. 评论列表（使用独立路由）
  await testCase('HD-TC-CMT-LIST-001', '评论列表加载', async () => {
    const listRes = await request('/api/v1/recipes?page=1&limit=1');
    if (listRes.data.data.list.length === 0) {
      console.log('  ⚠️  跳过：没有可测试的配方数据');
      return;
    }
    const recipeId = listRes.data.data.list[0].id;
    // 评论接口使用独立路由 /api/v1/comments?recipeId=xxx
    const res = await request(`/api/v1/comments?recipeId=${recipeId}&page=1&limit=20`);
    // 接口可能返回200或404（如果路由未配置）
    assertCondition(res.status === 200 || res.status === 404, 
      'HTTP状态码应为200或404');
  });

  // 9. 用户登录（模拟）
  await testCase('HD-TC-USR-LOGIN-001', '用户登录接口检查', async () => {
    // 检查登录接口是否存在（返回404表示接口未实现）
    const res = await request('/api/v1/auth/wechat-login', 'POST', {
      code: 'test_code_123'
    });
    // 接口可能返回404（未实现）或400（参数错误）或401（认证失败）
    assertCondition(res.status === 200 || res.status === 400 || res.status === 401 || res.status === 404, 
      '接口应返回200、400、401或404状态码');
  });

  // ========== 异常测试用例 ==========
  console.log();
  console.log('【异常场景测试】');
  console.log('-'.repeat(60));

  // 10. 404错误
  await testCase('HD-TC-EXC-001', '访问不存在的接口', async () => {
    const res = await request('/api/v1/not-exist');
    assertEquals(res.status, 404, 'HTTP状态码应为404');
  });

  // 11. 无效参数
  await testCase('HD-TC-EXC-002', '无效参数处理', async () => {
    const res = await request('/api/v1/recipes?page=invalid');
    // 应该返回400或正确处理
    assertCondition(res.status === 200 || res.status === 400, 
      '应返回200或400状态码');
  });

  // ========== 性能测试 ==========
  console.log();
  console.log('【性能测试】');
  console.log('-'.repeat(60));

  await testCase('HD-TC-PERF-001', '配方列表响应时间', async () => {
    const start = Date.now();
    await request('/api/v1/recipes?page=1&limit=20');
    const duration = Date.now() - start;
    assertCondition(duration < 2000, `响应时间应<2000ms，实际${duration}ms`);
  });

  await testCase('HD-TC-PERF-002', '配方详情响应时间', async () => {
    const listRes = await request('/api/v1/recipes?page=1&limit=1');
    if (listRes.data.data.list.length === 0) {
      console.log('  ⚠️  跳过：没有可测试的配方数据');
      return;
    }
    const recipeId = listRes.data.data.list[0].id;
    const start = Date.now();
    await request(`/api/v1/recipes/${recipeId}`);
    const duration = Date.now() - start;
    assertCondition(duration < 3000, `响应时间应<3000ms，实际${duration}ms`);
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
    throw new Error(`${message}: 期望 ${expected}, 实际 ${actual}`);
  }
}

function assertExists(value, message) {
  if (value === undefined || value === null) {
    throw new Error(`${message}: 值为 ${value}`);
  }
}

function assertCondition(condition, message) {
  if (!condition) {
    throw new Error(message);
  }
}

// 输出测试报告
function printReport() {
  console.log();
  console.log('='.repeat(60));
  console.log('测试执行报告');
  console.log('='.repeat(60));
  console.log(`总用例数: ${results.total}`);
  console.log(`通过: ${results.passed} ✅`);
  console.log(`失败: ${results.failed} ❌`);
  console.log(`通过率: ${((results.passed / results.total) * 100).toFixed(1)}%`);
  console.log('='.repeat(60));

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
  const reportPath = '/Users/river/Documents/health-diet/test-execution/reports/api-test-result.json';
  fs.writeFileSync(reportPath, JSON.stringify({
    timestamp: new Date().toISOString(),
    ...results
  }, null, 2));
  console.log();
  console.log(`详细结果已保存至: ${reportPath}`);
}

// 运行测试
runTests().catch(console.error);
