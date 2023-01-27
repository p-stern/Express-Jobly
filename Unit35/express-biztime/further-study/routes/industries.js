const express = require("express");
const ExpressError = require("../expressError")
const router = express.Router();
const db = require("../db");
const slugify = require('slugify');

router.get('/', async (req, res, next) => {
    try {
        const results = await db.query(`SELECT * FROM industries`);
        return res.json({ industries: results.rows })
    } catch (e) {
        return next(e);
    }
})

router.post('/', async (req, res, next) => {
    try {
        const { code, industry } = req.body;

        let slugified_code = slugify(code, {
            remove: ' ', // remove characters that match regex, defaults to `undefined`
            lower: true,      // convert to lower case, defaults to `false`
            strict: true,     // strip special characters except replacement, defaults to `false`
            trim: true         // trim leading and trailing replacement chars, defaults to `true`
        });

        const results = await db.query('INSERT INTO industries (code,industry) VALUES ($1, $2) RETURNING code, industry', [slugified_code, industry]);
        return res.status(201).json({ industry: results.rows[0] })
    } catch (e) {
        return next(e)
    }
})

router.post('/:code', async (req, res, next) => {
    try {
        const { code } = req.params;
        const { company_code } = req.body;

        if (!company_code) {
            throw new ExpressError(`Can't associate company with industry with code of ${code}`, 404)
        }

        const results = await db.query('INSERT INTO companies_industries (company_code, industry_code) VALUES ($1, $2) RETURNING company_code, industry_code', [company_code, code]);

        if (results.rows.length === 0) {
            throw new ExpressError(`Can't associate company with industry with code of ${code}`, 404)
        }

        return res.status(201).json(results.rows)
    } catch (e) {
        return next(e)
    }
})

module.exports = router;