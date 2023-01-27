process.env.NODE_ENV = "test";
const request = require("supertest");

const app = require("../app");
const db = require("../db");

let tesla = { code: "tesla", name: "Tesla Motor Co.", description: "Maker of Tesla cars" };
let lipton = { code: "lipton", name: "Lipton Tea Company", description: "black tea manufacturer" };
let gibson = { code: "gibson", name: "Gibson Guitars", description: "Guitar luthiers" };

beforeEach(async function () {
    const company1 = await db.query(`INSERT INTO companies (code, name, description) VALUES ('${tesla.code}', '${tesla.name}', '${tesla.description}') RETURNING code, name, description`);
    const company2 = await db.query(`INSERT INTO companies (code, name, description) VALUES ('${lipton.code}', '${lipton.name}', '${lipton.description}') RETURNING code, name, description`);
});

afterEach(async function () {
    const results = await db.query('DELETE FROM companies');
});

afterAll(async function () {
    db.end();
});

describe("GET /companies", () => {
    test("Get all companies", async () => {
        const res = await request(app).get("/companies")
        expect(res.statusCode).toBe(200)
        expect(res.body).toEqual({
            companies: [
                { code: "tesla", name: "Tesla Motor Co.", description: "Maker of Tesla cars" },
                { code: "lipton", name: "Lipton Tea Company", description: "black tea manufacturer" }
            ]
        })
    })
})

describe("GET /companies/:code", () => {
    test("Get company by code", async () => {
        const res = await request(app).get(`/companies/${tesla.code}`);
        expect(res.statusCode).toBe(200)
        expect(res.body).toEqual({
            company:
                { code: "tesla", name: "Tesla Motor Co.", description: "Maker of Tesla cars", invoices: [null] }
        })
    })
    test("Responds with 404 for invalid company", async () => {
        const res = await request(app).get(`/companies/icecube`);
        expect(res.statusCode).toBe(404)
    })
})

describe("POST /companies", () => {
    test("Creating a company", async () => {
        const res = await request(app).post("/companies").send(gibson)
        expect(res.statusCode).toBe(201)
        expect(res.body).toEqual({ company: { code: "gibson", name: "Gibson Guitars", description: "Guitar luthiers" } })
    })
    test("Responds with 500 if code is missing", async () => {
        const res = await request(app).post("/companies").send({})
        expect(res.statusCode).toBe(500)
    })
})

describe("put /companies/:code", () => {
    test("Updating a company's name", async () => {
        const res = await request(app).put(`/companies/${tesla.code}`).send({ name: "Tesla Motor Company", description: "Maker of Tesla cars" })
        expect(res.statusCode).toBe(200)
        expect(res.body).toEqual({ company: { code: "tesla", name: "Tesla Motor Company", description: "Maker of Tesla cars" } })

    })
    test("Updating a company's description", async () => {
        const res = await request(app).put(`/companies/${tesla.code}`).send({ name: "Tesla Motor Co.", description: "Tesla autombolie manufacturer" })
        expect(res.statusCode).toBe(200)
        expect(res.body).toEqual({ company: { code: "tesla", name: "Tesla Motor Co.", description: "Tesla autombolie manufacturer" } })
    })

    test("Updating a company's name", async () => {
        const res = await request(app).put(`/companies/${lipton.code}`).send({ name: "Lipton T", description: "black tea manufacturer" })
        expect(res.statusCode).toBe(200)
        expect(res.body).toEqual({ company: { code: "lipton", name: "Lipton T", description: "black tea manufacturer" } })

    })
    test("Responds with 404 for invalid code", async () => {
        const res = await request(app).put(`/companies/icecreamsandwich`).send({ code: "ice" })
        expect(res.statusCode).toBe(404)
    })
})

describe("DELETE /companies/:code", () => {
    test("Deleting a company", async () => {
        const res = await request(app).delete(`/companies/${tesla.code}`)
        expect(res.statusCode).toBe(200)
        expect(res.body).toEqual({ status: "deleted" })
    })
    test("Responds with 404 for deleting invalid company", async () => {
        const res = await request(app).put(`/companies/hamface`);
        expect(res.statusCode).toBe(404)
    })
})