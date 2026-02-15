const express = require('express');
const pool = require('./config/db');
require('dotenv').config();

const app = express();
const port = process.env.PORT || 3000;

app.use(express.json());

app.get('/', (req, res) => {
    res.send('Cloud-Native Capstone App Running!');
});

app.get('/health', (req, res) => {
    res.status(200).json({ status: 'UP' });
});

app.get('/db-check', async (req, res) => {
    try {
        const result = await pool.query('SELECT NOW()');
        res.status(200).json({
            status: 'Database Connected',
            time: result.rows[0].now
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({
            status: 'Database Connection Failed',
            error: err.message
        });
    }
});

app.listen(port, () => {
    console.log(`App running on port ${port}`);
});
