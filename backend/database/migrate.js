const { Pool } = require('pg');
const fs = require('fs');
const path = require('path');
require('dotenv').config();

const dbConfig = {
  host: process.env.DB_HOST || 'localhost',
  port: process.env.DB_PORT || 5432,
  user: process.env.DB_USER || 'postgres',
  password: process.env.DB_PASSWORD || '',
  database: process.env.DB_NAME || 'health_diet'
};

const createMigrationTable = `
  CREATE TABLE IF NOT EXISTS migrations (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    executed_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
  );
`;

async function runMigrations() {
  const pool = new Pool(dbConfig);
  
  try {
    console.log('Connecting to database...');
    
    await pool.query(createMigrationTable);
    console.log('Migration tracking table ready');
    
    const migrationsDir = path.join(__dirname, 'migrations');
    const files = fs.readdirSync(migrationsDir)
      .filter(f => f.endsWith('.sql'))
      .sort();
    
    console.log(`Found ${files.length} migration files`);
    
    const { rows: executedMigrations } = await pool.query(
      'SELECT name FROM migrations'
    );
    const executed = new Set(executedMigrations.map(m => m.name));
    
    for (const file of files) {
      if (executed.has(file)) {
        console.log(`Skipping ${file} (already executed)`);
        continue;
      }
      
      console.log(`Running migration: ${file}`);
      
      const sql = fs.readFileSync(path.join(migrationsDir, file), 'utf8');
      
      await pool.query('BEGIN');
      
      try {
        await pool.query(sql);
        await pool.query('INSERT INTO migrations (name) VALUES ($1)', [file]);
        await pool.query('COMMIT');
        console.log(`✓ Migration ${file} completed`);
      } catch (error) {
        await pool.query('ROLLBACK');
        console.error(`✗ Migration ${file} failed:`, error.message);
        throw error;
      }
    }
    
    console.log('All migrations completed successfully');
  } catch (error) {
    console.error('Migration error:', error);
    process.exit(1);
  } finally {
    await pool.end();
  }
}

runMigrations();