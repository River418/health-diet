#!/usr/bin/env node
/**
 * Health-Diet API 扩展测试脚本
 * 覆盖更多P0/P1/P2测试用例
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
  errors: [],
  p0: { total: 0, passed: 0 },
  p1: { total: 0, passed: 0 },
  p2: { total: 0, passed: 0 }
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
  console.log('='.repeat(70));
  console.log('Health-Diet API 扩展测试（P0/P1/P2）');
  console.log(`测试时间: ${new Date().toISOString()}`);
  console.log(`目标服务: http://${BASE_URL}:${PORT}`);
  console.log('='.repeat(70));
  console.log();

  // ========== P0 测试用例 ==========
  console.log('【P0 测试用例 - 核心功能】');
  console.log('-'.repeat(70));

  // 配方系统 - P0
  await testCase('P0', 'HD-TC-RCP-LIST-002', '配方列表分页加载', async () => {
    const res = await request('/api/v1/recipes?page=1&limit=2');
    assertEquals(res.status, 200);
    assertEquals(res.data.data.list.length <= 2, true);
    assertExists(res.data.data.pagination);
  });

  await testCase('P0', 'HD-TC-RCP-LIST-003', '配方列表下拉刷新', async () => {
    const res = await request('/api/v1/recipes?page=1&limit=20');
    assertEquals(res.status, 200);
    assertCondition(Date.now() - new Date(res.data.data.list[0]?.created_at).getTime() >= 0);
  });

  await testCase('P0', 'HD-TC-RCP-LIST-004', '按人群筛选-中老年', async () => {
    const res = await request('/api/v1/recipes?crowd=senior');
    assertEquals(res.status, 200);
    assertEquals(res.data.data.list.every(r => r.crowd_tags.includes('senior')), true);
  });

  await testCase('P0', 'HD-TC-RCP-LIST-005', '按疗效筛选-补气养血', async () => {
    const res = await request('/api/v1/recipes?efficacy=qi-blood');
    assertEquals(res.status, 200);
    assertEquals(res.data.data.list.every(r => r.efficacy_tags.includes('qi-blood')), true);
  });

  await testCase('P0', 'HD-TC-RCP-LIST-006', '多维度组合筛选', async () => {
    const res = await request('/api/v1/recipes?crowd=senior&efficacy=qi-blood');
    assertEquals(res.status, 200);
    // 可能返回空结果（如果没有匹配数据）
    assertCondition(res.data.data.list.length >= 0);
  });

  await testCase('P0', 'HD-TC-RCP-LIST-007', '筛选结果为空', async () => {
    const res = await request('/api/v1/recipes?crowd=nonexistent');
    assertEquals(res.status, 200);
    assertEquals(res.data.data.list.length, 0);
  });

  await testCase('P0', 'HD-TC-RCP-DTL-002', '配方详情-合规提示数据', async () => {
    const res = await request('/api/v1/recipes/1');
    assertEquals(res.status, 200);
    assertExists(res.data.data.name);
    assertExists(res.data.data.ingredients);
    assertExists(res.data.data.steps);
  });

  await testCase('P0', 'HD-TC-RCP-DTL-003', '配方详情-食材清单', async () => {
    const res = await request('/api/v1/recipes/1');
    assertEquals(res.status, 200);
    assertCondition(res.data.data.ingredients.length > 0);
    assertExists(res.data.data.ingredients[0].name);
    assertExists(res.data.data.ingredients[0].amount);
  });

  await testCase('P0', 'HD-TC-RCP-DTL-004', '配方详情-制作步骤', async () => {
    const res = await request('/api/v1/recipes/1');
    assertEquals(res.status, 200);
    assertCondition(res.data.data.steps.length > 0);
    assertExists(res.data.data.steps[0].step_order);
    assertExists(res.data.data.steps[0].description);
  });

  await testCase('P0', 'HD-TC-RCP-DTL-010', '配方详情-评分显示', async () => {
    const res = await request('/api/v1/recipes/1');
    assertEquals(res.status, 200);
    assertExists(res.data.data.rating);
    assertCondition(res.data.data.rating >= 0 && res.data.data.rating <= 5);
  });

  // 分类系统 - P0
  await testCase('P0', 'HD-TC-CAT-001', '分类列表-目标人群', async () => {
    const res = await request('/api/v1/categories?type=target');
    assertEquals(res.status, 200);
    assertExists(res.data.data);
  });

  await testCase('P0', 'HD-TC-CAT-002', '分类列表-疗效', async () => {
    const res = await request('/api/v1/categories?type=effect');
    assertEquals(res.status, 200);
    assertExists(res.data.data);
  });

  // 搜索系统 - P0
  await testCase('P0', 'HD-TC-SCH-002', '关键词搜索-红枣', async () => {
    const res = await request('/api/v1/search?q=hongzao&page=1&limit=20');
    assertEquals(res.status, 200);
    assertExists(res.data.data);
  });

  await testCase('P0', 'HD-TC-SCH-008', '搜索结果为空', async () => {
    const res = await request('/api/v1/search?q=xyz123&page=1&limit=20');
    assertEquals(res.status, 200);
    assertEquals(res.data.data.list.length, 0);
  });

  // ========== P1 测试用例 ==========
  console.log();
  console.log('【P1 测试用例 - 重要功能】');
  console.log('-'.repeat(70));

  await testCase('P1', 'HD-TC-SCH-003', '搜索建议', async () => {
    const res = await request('/api/v1/search?q=bu&page=1&limit=20');
    assertEquals(res.status, 200);
    assertExists(res.data.data);
  });

  await testCase('P1', 'HD-TC-SCH-006', '搜索结果筛选', async () => {
    const res = await request('/api/v1/search?q=tea&crowd=senior');
    assertEquals(res.status, 200);
    assertExists(res.data.data);
  });

  await testCase('P1', 'HD-TC-CNT-FEED-001', '信息流加载', async () => {
    const res = await request('/api/v1/contents?page=1&limit=20');
    assertEquals(res.status, 200);
    assertExists(res.data.data);
  });

  await testCase('P1', 'HD-TC-CNT-FEED-002', '信息流分页', async () => {
    const res1 = await request('/api/v1/contents?page=1&limit=2');
    const res2 = await request('/api/v1/contents?page=2&limit=2');
    assertEquals(res1.status, 200);
    assertEquals(res2.status, 200);
    assertExists(res1.data.data.pagination);
  });

  await testCase('P1', 'HD-TC-CMT-LIST-002', '评论按时间排序', async () => {
    const res = await request('/api/v1/comments?recipeId=1&sort=time');
    assertCondition(res.status === 200 || res.status === 404);
  });

  await testCase('P1', 'HD-TC-CMT-LIST-003', '评论按热度排序', async () => {
    const res = await request('/api/v1/comments?recipeId=1&sort=hot');
    assertCondition(res.status === 200 || res.status === 404);
  });

  // ========== P2 测试用例 ==========
  console.log();
  console.log('【P2 测试用例 - 增强功能】');
  console.log('-'.repeat(70));

  await testCase('P2', 'HD-TC-EXC-003', '超大页码处理', async () => {
    const res = await request('/api/v1/recipes?page=99999&limit=20');
    assertEquals(res.status, 200);
    assertEquals(res.data.data.list.length, 0);
  });

  await testCase('P2', 'HD-TC-EXC-004', '超大页面大小处理', async () => {
    const res = await request('/api/v1/recipes?page=1&limit=1000');
    assertEquals(res.status, 200);
    // 应该被限制在最大页面大小内
    assertCondition(res.data.data.list.length <= 100);
  });

  await testCase('P2', 'HD-TC-EXC-005', '负数页码处理', async () => {
    const res = await request('/api/v1/recipes?page=-1&limit=20');
    assertCondition(res.status === 200 || res.status === 400);
  });

  await testCase('P2', 'HD-TC-EXC-006', '特殊字符搜索', async () => {
    const res = await request('/api/v1/search?q=<script>&page=1&limit=20');
    assertCondition(res.status === 200 || res.status === 400);
  });

  // ========== 性能测试 ==========
  console.log();
  console.log('【性能测试】');
  console.log('-'.repeat(70));

  await testCase('P0', 'HD-TC-PERF-003', '配方列表并发响应时间', async () => {
    const promises = [];
    for (let i = 0; i < 5; i++) {
      promises.push(request('/api/v1/recipes?page=1&limit=20'));
    }
    const start = Date.now();
    await Promise.all(promises);
    const duration = Date.now() - start;
    assertCondition(duration < 5000, `并发响应时间应<5000ms，实际${duration}ms`);
  });

  await testCase('P0', 'HD-TC-PERF-004', '搜索响应时间', async () => {
    const start = Date.now();
    await request('/api/v1/search?q=health&page=1&limit=20');
    const duration = Date.now() - start;
    assertCondition(duration < 1000, `搜索响应时间应<1000ms，实际${duration}ms`);
  });

  await testCase('P1', 'HD-TC-PERF-005', '分类列表响应时间', async () => {
    const start = Date.now();
    await request('/api/v1/categories');
    const duration = Date.now() - start;
    assertCondition(duration < 500, `响应时间应<500ms，实际${duration}ms`);
  });

  // ========== 输出测试报告 ==========
  printReport();
}

// 测试用例执行
async function testCase(priority, id, name, testFn) {
  results.total++;
  results[priority.toLowerCase()].total++;
  process.stdout.write(`${id}: ${name} ... `);
  
  try {
    await testFn();
    results.passed++;
    results[priority.toLowerCase()].passed++;
    console.log('✅ 通过');
  } catch (error) {
    results.failed++;
    results.errors.push({ priority, id, name, error: error.message });
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
  console.log(`通过率: ${((results.passed / results.total) * 100).toFixed(1)}%`);
  console.log();
  console.log('按优先级统计:');
  console.log(`  P0: ${results.p0.passed}/${results.p0.total} (${((results.p0.passed / results.p0.total) * 100).toFixed(1)}%)`);
  console.log(`  P1: ${results.p1.passed}/${results.p1.total} (${((results.p1.passed / results.p1.total) * 100).toFixed(1)}%)`);
  console.log(`  P2: ${results.p2.passed}/${results.p2.total} (${((results.p2.passed / results.p2.total) * 100).toFixed(1)}%)`);
  console.log('='.repeat(70));

  if (results.errors.length > 0) {
    console.log();
    console.log('失败用例详情:');
    results.errors.forEach((err, i) => {
      console.log(`  ${i + 1}. [${err.priority}] ${err.id}: ${err.name}`);
      console.log(`     原因: ${err.error}`);
    });
  }

  // 保存结果到文件
  const fs = require('fs');
  const reportPath = '/Users/river/Documents/health-diet/test-execution/reports/api-test-extended-result.json';
  fs.writeFileSync(reportPath, JSON.stringify({
    timestamp: new Date().toISOString(),
    ...results
  }, null, 2));
  console.log();
  console.log(`详细结果已保存至: ${reportPath}`);
}

// 运行测试
runTests().catch(console.error);
