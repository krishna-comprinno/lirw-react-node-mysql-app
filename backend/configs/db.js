// const mysql = require('mysql2');
// require('dotenv').config();

// const db = mysql.createConnection({
//    host: process.env.DB_HOST || 'localhost',
//    port: process.env.DB_PORT || '3306',
//    user: process.env.DB_USER || 'root',
//    password: process.env.DB_PASSWORD || '',
//    database: process.env.DB_NAME || 'react_node_app'
// });

// module.exports = db;


const mysql = require('mysql2');
require('dotenv').config();

const db = mysql.createConnection({
  host: process.env.DB_HOST,
  port: Number(process.env.DB_PORT || 3306),
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME
});

module.exports = db;
