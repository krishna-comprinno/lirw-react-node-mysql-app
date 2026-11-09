
const express = require('express');
const mysql = require('mysql2');
const bodyParser = require('body-parser');
const routes = require('./routes');
const cors = require('cors');
const db = require('./configs/db');

const app = express();

app.use(cors());
app.use(bodyParser.json());

// MySQL connection
db.connect((err) => {
    if (err) {
        console.error('Error connecting to MySQL: ' + err.stack);
        return;
    }

    console.log('Connected to MySQL Database');
});

// Health check endpoint
app.get('/health', (req, res) => {
    db.ping((err) => {
        if (err) {
            return res.status(503).json({
                status: 'unhealthy',
                database: 'disconnected'
            });
        }

        res.status(200).json({
            status: 'healthy',
            database: 'connected'
        });
    });
});

// Existing API routes
app.use('/api', routes);

//Test for ...

module.exports = app;
