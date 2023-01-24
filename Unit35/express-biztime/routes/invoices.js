const express = require("express");
const ExpressError = require("../expressError")
const router = express.Router();
const db = require("../db");

router.get('/', async (req, res, next) => {
    try {
        const results = await db.query(`SELECT * FROM invoices`);
        return res.json({ invoices: results.rows })
    } catch (e) {
        return next(e);
    }
})
router.get('/:id', async (req, res, next) => {
    try {
        const { id } = req.params;
        const results = await db.query(
            `SELECT i.id, i.comp_code, i.amt, i.paid, i.add_date, i.paid_date,
                    c.code, c.name, c.description
             FROM invoices i
             JOIN companies c
             ON i.comp_code = c.code
             WHERE i.id = $1`, [id])

        if (results.rows.length === 0) {
            throw new ExpressError(`Can't find invoice with id of ${id}`, 404)
        }
        const invoice = {
            "id": results.rows[0].id,
            "comp_code": results.rows[0].comp_code,
            "amt": results.rows[0].amt,
            "paid": results.rows[0].paid,
            "add_date": results.rows[0].add_date,
            "paid_date": results.rows[0].paid_date
        }
        const company = {
            "code": results.rows[0].code,
            "name": results.rows[0].name,
            "description": results.rows[0].description,
        }
        return res.send({ "invoice": invoice, "company": company })
    } catch (e) {
        return next(e)
    }
})

router.post('/', async (req, res, next) => {
    try {
        const { comp_code, amt } = req.body;
        const results = await db.query('INSERT INTO invoices (comp_code, amt) VALUES ($1, $2) RETURNING id, comp_code, amt, paid, add_date, paid_date', [comp_code, amt]);
        return res.status(201).json({ invoice: results.rows[0] })
    } catch (e) {
        return next(e)
    }
})

router.put('/:id', async (req, res, next) => {
    try {
        const { id } = req.params;
        const { amt } = req.body;
        const results = await db.query('UPDATE invoices SET amt=$1 WHERE id=$2 RETURNING id, comp_code, amt, paid, add_date, paid_date', [amt, id])
        if (results.rows.length === 0) {
            throw new ExpressError(`Can't update invoice with id of ${id}`, 404)
        }
        return res.send({ invoice: results.rows[0] })
    } catch (e) {
        return next(e)
    }
})

router.delete('/:id', async (req, res, next) => {
    try {
        const { id } = req.params;
        const results = await db.query('DELETE FROM invoices WHERE id = $1', [id])
        if (results.rowCount > 0) {
            return res.send({ status: "deleted" })
        }
        else {
            throw new ExpressError(`Can't delete invoice with id of ${id}`, 404)
        }
    } catch (e) {
        return next(e)
    }
})

module.exports = router;