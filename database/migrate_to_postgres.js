/**
 * PostgreSQL 数据库迁移脚本
 * 用于执行所有 SQL 迁移文件
 */

const { Pool } = require('pg');
const fs = require('fs');
const path = require('path');

// 从环境变量或配置文件读取数据库配置
const dbConfig = {
  host: process.env.DB_HOST || 'localhost',
  port: process.env.DB_PORT || 5432,
  user: process.env.DB_USER || 'postgres',
  password: process.env.DB_PASSWORD || '',
  database: process.env.DB_NAME || 'health_diet'
};

const pool = new Pool(dbConfig);

async function runMigrations() {
  const client = await pool.connect();
  
  try {
    console.log('开始执行 PostgreSQL 迁移...\n');
    
    // 获取所有 SQL 文件并按顺序排序
    const migrationsDir = path.join(__dirname, 'migrations');
    const files = fs.readdirSync(migrationsDir)
      .filter(f => f.endsWith('.sql'))
      .sort();
    
    console.log(`找到 ${files.length} 个迁移文件\n`);
    
    // 执行每个迁移文件
    for (const file of files) {
      console.log(`执行: ${file}`);
      const filePath = path.join(migrationsDir, file);
      const sql = fs.readFileSync(filePath, 'utf-8');
      
      try {
        await client.query(sql);
        console.log(`✓ ${file} 执行成功\n`);
      } catch (err) {
        console.error(`✗ ${file} 执行失败:`, err.message);
        throw err;
      }
    }
    
    console.log('\n========================================');
    console.log('所有迁移执行完成！');
    console.log('========================================\n');
    
    // 验证表创建情况
    const result = await client.query(`
      SELECT table_name 
      FROM information_schema.tables 
      WHERE table_schema = 'public' 
      ORDER BY table_name
    `);
    
    console.log('已创建的表:');
    result.rows.forEach(row => {
      console.log(`  - ${row.table_name}`);
    });
    
  } catch (error) {
    console.error('迁移失败:', error);
    process.exit(1);
  } finally {
    client.release();
    await pool.end();
  }
}

// 如果直接运行此脚本
if (require.main === module) {
  runMigrations();
}

module.exports = { runMigrations };
