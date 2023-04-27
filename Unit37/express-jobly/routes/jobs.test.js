"use strict";

const request = require("supertest");

const db = require("../db");
const app = require("../app");

const {
    commonBeforeAll,
    commonBeforeEach,
    commonAfterEach,
    commonAfterAll,
    u1Token,
    u2Admin,
    testIds,
} = require("./_testCommon");

beforeAll(commonBeforeAll);
beforeEach(commonBeforeEach);
afterEach(commonAfterEach);
afterAll(commonAfterAll);

/************************************** POST /jobs */

describe("POST /jobs", function () {
    const newJob = {
        title: "New",
        salary: 100000,
        equity: "0.1",
        companyHandle: "c1",
    };

    test("not ok for non-admin", async function () {
        const resp = await request(app)
            .post("/jobs")
            .send(newJob)
            .set("authorization", `Bearer ${u1Token}`);
        expect(resp.statusCode).toEqual(401);
    });

    test("ok for admin", async function () {
        const resp = await request(app)
            .post("/jobs")
            .send(newJob)
            .set("authorization", `Bearer ${u2Admin}`);
        expect(resp.statusCode).toEqual(201);
        expect(resp.body).toEqual({
            job: {
                id: expect.any(Number),
                ...newJob,
            }

        });
    });

    test("bad request with missing data", async function () {
        const resp = await request(app)
            .post("/jobs")
            .send({
                id: 1,
                salary: 100000,
            })
            .set("authorization", `Bearer ${u2Admin}`);
        expect(resp.statusCode).toEqual(400);
    });

    test("bad request with invalid data", async function () {
        const resp = await request(app)
            .post("/jobs")
            .send({
                ...newJob,
                companyHandle: 33,
            })
            .set("authorization", `Bearer ${u2Admin}`);
        expect(resp.statusCode).toEqual(400);
    });
});

/************************************** GET /jobs */

describe("GET /jobs", function () {
    test("ok for anon", async function () {
        const resp = await request(app).get("/jobs");
        expect(resp.body).toEqual({
            jobs:
                [
                    {
                        id: expect.any(Number),
                        title: "C1",
                        salary: 100000,
                        equity: "0.1",
                        companyHandle: "c1",
                    },
                    {
                        id: expect.any(Number),
                        title: "C2",
                        salary: 200000,
                        equity: "0.2",
                        companyHandle: "c2",
                    },
                    {
                        id: expect.any(Number),
                        title: "C3",
                        salary: 300000,
                        equity: "0.3",
                        companyHandle: "c3",
                    },
                ],
        });
    });

    test("fails: test next() handler", async function () {
        // there's no normal failure event which will cause this route to fail ---
        // thus making it hard to test that the error-handler works with it. This
        // should cause an error, all right :)
        await db.query("DROP TABLE jobs CASCADE");
        const resp = await request(app)
            .get("/jobs")
            .set("authorization", `Bearer ${u1Token}`);
        expect(resp.statusCode).toEqual(500);
    });
});

// /************************************** GET /jobs/:id */

describe("GET /jobs/:id", function () {
    test("works for anon", async function () {
        const resp = await request(app).get(`/jobs/${testIds[0]}`);
        expect(resp.body).toEqual({
            job: {
                id: testIds[0],
                title: "C1",
                salary: 100000,
                equity: "0.1",
                companyHandle: "c1",
            },
        });
    });


    test("not found for no such job", async function () {
        const resp = await request(app).get(`/jobs/47`);
        expect(resp.statusCode).toEqual(404);
    });
});

// /************************************** PATCH /jobs/:id */

describe("PATCH /jobs/:id", function () {
    test("works for users", async function () {
        const resp = await request(app)
            .patch(`/jobs/${testIds[0]}`)
            .send({
                title: "C1-new",
            })
            .set("authorization", `Bearer ${u2Admin}`);
        expect(resp.body).toEqual({
            job: {
                id: testIds[0],
                title: "C1-new",
                salary: 100000,
                equity: "0.1",
                companyHandle: "c1",
            },
        });
    });

    test("unauth for anon", async function () {
        const resp = await request(app)
            .patch(`/jobs/${testIds[1]}`)
            .send({
                title: "C2-new",
            })
        expect(resp.statusCode).toEqual(401);
    });

    test("not found on no such job", async function () {
        const resp = await request(app)
            .patch(`/jobs/47`)
            .send({
                title: "new nope",
            })
            .set("authorization", `Bearer ${u2Admin}`);
        expect(resp.statusCode).toEqual(404);
    });

    test("bad request on id change attempt", async function () {
        const resp = await request(app)
            .patch(`/jobs/c1`)
            .send({
                id: "c1-new",
            })
            .set("authorization", `Bearer ${u2Admin}`);
        expect(resp.statusCode).toEqual(400);
    });

    test("bad request on invalid data", async function () {
        const resp = await request(app)
            .patch(`/jobs/c1`)
            .send({
                companyHandle: 33,
            })
            .set("authorization", `Bearer ${u2Admin}`);
        expect(resp.statusCode).toEqual(400);
    });
});

// /************************************** DELETE /jobs/:id */

describe("DELETE /jobs/:id", function () {
    test("works for users", async function () {
        const resp = await request(app)
            .delete(`/jobs/${testIds[2]}`)
            .set("authorization", `Bearer ${u2Admin}`);
        expect(resp.body).toEqual({ deleted: testIds[2] });
    });

    test("unauth for anon", async function () {
        const resp = await request(app)
            .delete(`/jobs/c1`)
            .set("authorization", `Bearer ${u1Token}`);
        expect(resp.statusCode).toEqual(401);
    });

    test("not found for no such job", async function () {
        const resp = await request(app)
            .delete(`/jobs/47`)
            .set("authorization", `Bearer ${u2Admin}`);
        expect(resp.statusCode).toEqual(404);
    });
});
