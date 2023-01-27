process.env.NODE_ENV = "test";
const request = require("supertest");

const app = require("../app");
const db = require("../db");

let tesla = { code: "tesla", name: "Tesla Motor Co.", description: "Maker of Tesla cars" };
let lipton = { code: "lipton", name: "Lipton Tea Company", description: "black tea manufacturer" };

let tesla_invoice = { comp_code: "tesla", amt: 100, paid: false, paid_date: null };
let lipton_invoice = { comp_code: "lipton", amt: 200, paid: false, paid_date: null };
let lipton_invoice_2 = { comp_code: "lipton", amt: 400, paid: true, paid_date: "2023-01-24" };

let invoice1;
let invoice2;

beforeEach(async function () {
    const company1 = await db.query(`INSERT INTO companies (code, name, description) VALUES ('${tesla.code}', '${tesla.name}', '${tesla.description}') RETURNING code, name, description`);
    const company2 = await db.query(`INSERT INTO companies (code, name, description) VALUES ('${lipton.code}', '${lipton.name}', '${lipton.description}') RETURNING code, name, description`);
    invoice1 = await db.query(`INSERT INTO invoices (comp_code, amt, paid, paid_date) VALUES ('${tesla_invoice.comp_code}', '${tesla_invoice.amt}', '${tesla_invoice.paid}', null) RETURNING id, comp_code, amt, paid, add_date, paid_date`);
    const invoice2 = await db.query(`INSERT INTO invoices (comp_code, amt, paid, paid_date) VALUES ('${lipton_invoice.comp_code}', '${lipton_invoice.amt}', '${lipton_invoice.paid}', null) RETURNING id, comp_code, amt, paid, add_date, paid_date`);
});

afterEach(async function () {
    const iResults = await db.query('DELETE FROM invoices');
    const cResults = await db.query('DELETE FROM companies');
});

afterAll(async function () {
    db.end();
});

describe("GET /invoices", () => {
    test("Get all invoices", async () => {
        const res = await request(app).get("/invoices")
        expect(res.statusCode).toBe(200)
        expect(res.body).toEqual({
            invoices: [
                { id: expect.any(Number), comp_code: "tesla", amt: 100, paid: false, add_date: expect.anything(), paid_date: null },
                { id: expect.any(Number), comp_code: "lipton", amt: 200, paid: false, add_date: expect.anything(), paid_date: null }
            ]
        })
    })
})

describe("GET /invoices/:id", () => {
    test("Get invoice by id", async () => {
        const res = await request(app).get(`/invoices/${invoice1.rows[0].id}`);
        expect(res.statusCode).toBe(200)
        expect(res.body).toEqual({
            invoice:
                { id: expect.any(Number), comp_code: "tesla", amt: 100, paid: false, add_date: expect.anything(), paid_date: null, company: { code: "tesla", name: "Tesla Motor Co.", description: "Maker of Tesla cars" } }
        })
    })
    test("Responds with 404 for invalid invoice", async () => {
        const res = await request(app).get('/invoices/50');
        expect(res.statusCode).toBe(404)
    })
})

describe("POST /invoices", () => {
    test("Creating an invoice", async () => {
        const res = await request(app).post("/invoices").send(lipton_invoice_2)
        expect(res.statusCode).toBe(201)
        expect(res.body).toEqual({ invoice: { id: expect.any(Number), comp_code: "lipton", amt: 400, paid: false, add_date: expect.anything(), paid_date: null } })
    })
    test("Responds with 500 if invoice is missing", async () => {
        const res = await request(app).post("/invoices").send({})
        expect(res.statusCode).toBe(500)
    })
})

describe("put /invoices/:id", () => {
    test("Updating an invoice's amt", async () => {
        const res = await request(app).put(`/invoices/${invoice1.rows[0].id}`).send({ amt: 250 })
        expect(res.statusCode).toBe(200)
        expect(res.body).toEqual({ invoice: { id: expect.any(Number), comp_code: "tesla", amt: 250, paid: false, add_date: expect.anything(), paid_date: null } })

    })
    test("Responds with 404 for invalid id", async () => {
        const res = await request(app).put('/invoices/55').send({ id: 55 })
        expect(res.statusCode).toBe(404)
    })
})

describe("DELETE /invoices/:id", () => {
    test("Deleting an invoice", async () => {
        const res = await request(app).delete(`/invoices/${invoice1.rows[0].id}`)
        expect(res.statusCode).toBe(200)
        expect(res.body).toEqual({ status: "deleted" })
    })
    test("Responds with 404 for deleting invalid invoice", async () => {
        const res = await request(app).put('/invoices/46');
        expect(res.statusCode).toBe(404)
    })
})