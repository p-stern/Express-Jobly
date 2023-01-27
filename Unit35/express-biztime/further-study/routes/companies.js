const express = require("express");
const ExpressError = require("../expressError")
const router = express.Router();
const db = require("../db");
const slugify = require('slugify');

router.get('/', async (req, res, next) => {
    try {
        const results = await db.query(`SELECT * FROM companies`);
        return res.json({ companies: results.rows })
    } catch (e) {
        return next(e);
    }
})
router.get('/:code', async (req, res, next) => {
    try {
        const { code } = req.params;
        const results = await db.query(
            `SELECT c.code, c.name, c.description, i.id, i.comp_code, i.amt, i.paid, i.add_date, i.paid_date
             FROM companies c
             LEFT JOIN invoices i
             ON c.code = i.comp_code 
             WHERE code = $1`, [code])
        if (results.rows.length === 0) {
            throw new ExpressError(`Can't find company with code of ${code}`, 404)
        }

        let invoices = [];
        for (let i = 0; i < results.rowCount; i++) {
            invoices.push(results.rows[i].id)
        };

        const industryResults = await db.query(
            `SELECT c.code, i.industry
             FROM companies c        
             LEFT JOIN companies_industries ci
             ON c.code = ci.company_code 
             LEFT JOIN industries i
             ON ci.industry_code = i.code
             WHERE c.code = $1`, [code])

        let industries = [];
        for (let i = 0; i < industryResults.rowCount; i++) {
            industries.push(industryResults.rows[i].industry)
        };


        const company = {
            "code": results.rows[0].code,
            "name": results.rows[0].name,
            "description": results.rows[0].description,
            "invoices": invoices,
            "industries": industries
        }

        return res.send({ "company": company })
    } catch (e) {
        return next(e)
    }
})

router.post('/', async (req, res, next) => {
    try {
        const { code, name, description } = req.body;

        let slugified_code = slugify(code, {
            remove: ' ', // remove characters that match regex, defaults to `undefined`
            lower: true,      // convert to lower case, defaults to `false`
            strict: true,     // strip special characters except replacement, defaults to `false`
            trim: true         // trim leading and trailing replacement chars, defaults to `true`
        });

        const results = await db.query('INSERT INTO companies (code, name, description) VALUES ($1, $2, $3) RETURNING code, name, description', [slugified_code, name, description]);
        return res.status(201).json({ company: results.rows[0] })
    } catch (e) {
        return next(e)
    }
})

router.put('/:code', async (req, res, next) => {
    try {
        const { code } = req.params;
        const { name, description } = req.body;
        const results = await db.query('UPDATE companies SET name=$1, description=$2 WHERE code=$3 RETURNING code, name, description', [name, description, code])
        if (results.rows.length === 0) {
            throw new ExpressError(`Can't update company with code of ${code}`, 404)
        }

        return res.send({ company: results.rows[0] })
    } catch (e) {
        return next(e)
    }
})

router.delete('/:code', async (req, res, next) => {
    try {
        const { code } = req.params;
        const results = await db.query('DELETE FROM companies WHERE code = $1', [code])
        if (results.rowCount > 0) {
            return res.send({ status: "deleted" })
        }
        else {
            throw new ExpressError(`Can't delete company with code of ${code}`, 404)
        }
    } catch (e) {
        return next(e)
    }
})


module.exports = router;