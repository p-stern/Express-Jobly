process.env.NODE_ENV = "test";
const request = require("supertest");

const app = require("../app");
let items = require("../fakeDb");

let popsicle = { name: "popsicle", price: 1.45 };
let cheerios = { name: "cheerios", price: 3.40 };
let banana = { name: "banana", price: .99 }

beforeEach(function () {
    items.push(popsicle);
    items.push(cheerios);
});

afterEach(function () {
    //make sure this *mutates*, not redefines, `items`
    items.length = 0;
});

describe("GET /items", () => {
    test("Get all items", async () => {
        const res = await request(app).get("/items")
        expect(res.statusCode).toBe(200)
        expect(res.body).toEqual({ items: [popsicle, cheerios] })
    })
})

describe("GET /items/:name", () => {
    test("Get item by name", async () => {
        const res = await request(app).get(`/items/${popsicle.name}`);
        expect(res.statusCode).toBe(200)
        expect(res.body).toEqual({ item: popsicle })
    })
    test("Responds with 404 for invalid item", async () => {
        const res = await request(app).get(`/items/icecube`);
        expect(res.statusCode).toBe(404)
    })
})

describe("POST /items", () => {
    test("Creating an item", async () => {
        const res = await request(app).post("/items").send(banana)
        expect(res.statusCode).toBe(201)
        expect(res.body).toEqual({ item: banana })
    })
    test("Responds with 400 if name is missing", async () => {
        const res = await request(app).post("/items").send({})
        expect(res.statusCode).toBe(400)
    })
})

describe("PATCH /items/:name", () => {
    test("Updating an item's name", async () => {
        const res = await request(app).patch(`/items/${popsicle.name}`).send({ name: "fudgesicle", price: 1.45 })
        expect(res.statusCode).toBe(200)
        expect(res.body).toEqual({ item: { name: "fudgesicle", price: 1.45 } })

    })
    test("Updating an item's price", async () => {
        const res = await request(app).patch(`/items/${popsicle.name}`).send({ name: "fudgesicle", price: .45 })
        expect(res.statusCode).toBe(200)
        expect(res.body).toEqual({ item: { name: "fudgesicle", price: .45 } })

    })
    test("Updating an item's price", async () => {
        const res = await request(app).patch(`/items/${cheerios.name}`).send({ name: "cheerios", price: 4.40 })
        expect(res.statusCode).toBe(200)
        expect(res.body).toEqual({ item: { name: "cheerios", price: 4.40 } })
    })
    test("Responds with 404 for invalid name", async () => {
        const res = await request(app).patch(`/items/icecreamsandwich}`).send({ name: "fudgesicle" })
        expect(res.statusCode).toBe(404)
    })
})


describe("DELETE /items/:name", () => {
    test("Deleting an item", async () => {
        const res = await request(app).delete(`/items/${popsicle.name}`)
        expect(res.statusCode).toBe(200)
        expect(res.body).toEqual({ message: "Deleted" })
    })
    test("Responds with 404 for deleting invalid item", async () => {
        const res = await request(app).patch(`/items/hamface`);
        expect(res.statusCode).toBe(404)
    })
})