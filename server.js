// server.js

// --- Imports ---
const express = require('express');
const bodyParser = require('body-parser');
const { Pool } = require('pg');
const shortid = require('shortid');

// --- Configuration ---
const app = express();
const PORT = process.env.PORT || 3000;

// --- Database Connection ---
// The application will use environment variables for database configuration.
// This is a best practice for security and portability.
const pool = new Pool({
    user: process.env.POSTGRES_USER,
    host: process.env.POSTGRES_HOST,
    database: process.env.POSTGRES_DB,
    password: process.env.POSTGRES_PASSWORD,
    port: 5432,
});

// --- Middleware ---
// Serves a simple HTML form for submitting URLs.
app.use(express.static('public'));
// Parses JSON bodies and URL-encoded data.
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// --- API Endpoints ---

/**
 * @route POST /shorten
 * @desc Shorten a long URL
 * @access Public
 */
app.post('/shorten', async(req, res) => {
    const { longUrl } = req.body;
    if (!longUrl) {
        return res.status(400).json({ error: 'URL is required' });
    }

    // A simple regex to validate the URL format.
    const urlRegex = /^(https?|ftp):\/\/[^\s/$.?#].[^\s]*$/i;
    if (!urlRegex.test(longUrl)) {
        return res.status(400).json({ error: 'Invalid URL format' });
    }

    const code = shortid.generate();

    try {
        const result = await pool.query(
            'INSERT INTO urls(code, original_url) VALUES($1, $2) RETURNING code', [code, longUrl]
        );
        const shortUrl = `${req.protocol}://${req.get('host')}/${result.rows[0].code}`;
        res.json({ shortUrl });
    } catch (err) {
        console.error('Database error:', err);
        res.status(500).json({ error: 'Server error' });
    }
});

/**
 * @route GET /:code
 * @desc Redirect to the original long URL
 * @access Public
 */
app.get('/:code', async(req, res) => {
    const { code } = req.params;

    try {
        const result = await pool.query('SELECT original_url FROM urls WHERE code = $1', [code]);

        if (result.rows.length > 0) {
            const { original_url } = result.rows[0];
            return res.redirect(original_url);
        } else {
            return res.status(404).json({ error: 'URL not found' });
        }
    } catch (err) {
        console.error('Database error:', err);
        res.status(500).json({ error: 'Server error' });
    }
});


// --- Server Initialization ---
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});