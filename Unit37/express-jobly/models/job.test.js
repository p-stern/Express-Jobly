"use strict";

const db = require("../db.js");
const { BadRequestError, NotFoundError } = require("../expressError");
const Job = require("./job.js");
const {
  commonBeforeAll,
  commonBeforeEach,
  commonAfterEach,
  commonAfterAll,
} = require("./_testCommon");

beforeAll(commonBeforeAll);
beforeEach(commonBeforeEach);
afterEach(commonAfterEach);
afterAll(commonAfterAll);

/************************************** create */

describe("create", function () {
  const newJob1 = {
    title: "Ditch digger",
    salary: 250000,
    equity: "0.3",
    companyHandle: "c1",
  };
  const newJob2 = {
    title: "Mud slinger",
    salary: 110000,
    equity: "0.4",
    companyHandle: "c2",
  };
  const newJob3 = {
    title: "Mattress tag cutter-offer",
    salary: 210000,
    equity: "0.5",
    companyHandle: "c3",
  };

  test("works", async function () {
    let job1 = await Job.create(newJob1);
    expect(job1).toEqual(
      {
        id: expect.any(Number),
        title: "Ditch digger",
        salary: 250000,
        equity: "0.3",
        companyHandle: "c1",
      },
    );
    let job2 = await Job.create(newJob2);
    expect(job2).toEqual(
      {
        id: expect.any(Number),
        title: "Mud slinger",
        salary: 110000,
        equity: "0.4",
        companyHandle: "c2",
      },
    );
    let job3 = await Job.create(newJob3);
    expect(job3).toEqual(
      {
        id: expect.any(Number),
        title: "Mattress tag cutter-offer",
        salary: 210000,
        equity: "0.5",
        companyHandle: "c3",
      },
    );
  });
});

/************************************** findAll */

describe("findAll", function () {
  test("works: no filter", async function () {
    let jobs = await Job.findAll();
    expect(jobs).toEqual([
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
      {
        id: expect.any(Number),
        title: "C4",
        salary: 400000,
        equity: null,
        companyHandle: "c1",
      },
      {
        id: expect.any(Number),
        title: "C5",
        salary: 500000,
        equity: "0.0",
        companyHandle: "c2",
      },
    ]);
  });
});

// /************************************** findAll with filters */

describe("findAll", function () {
  test("works: with title filter", async function () {
    let q = { title: 'c2' }
    let jobs = await Job.findAll(q);
    expect(jobs.length).toEqual(1);
  });
  test("works: with min filter", async function () {
    let q = { minSalary: 400000 }
    let jobs = await Job.findAll(q);
    expect(jobs.length).toEqual(2);
  });
  test("works: with hasEquity true filter", async function () {
    let q = { hasEquity: true }
    let jobs = await Job.findAll(q);
    expect(jobs.length).toEqual(3);
  });
  test("works: with hasEquity false filter", async function () {
    let q = { hasEquity: false }
    let jobs = await Job.findAll(q);
    expect(jobs.length).toEqual(5);
  });
  test("works: with hasEquity undefined filter", async function () {
    let q = {}
    let jobs = await Job.findAll(q);
    expect(jobs.length).toEqual(5);
  });
  test("works: with title and min filters", async function () {
    let q = { title: 'c', minSalary: 200000 }
    let jobs = await Job.findAll(q);
    expect(jobs.length).toEqual(4);
  });
  test("works: with title and hasEquity filters", async function () {
    let q = { title: 'c', hasEquity: true }
    let jobs = await Job.findAll(q);
    expect(jobs.length).toEqual(3);
  });
  test("works: with min & hasEquity filters", async function () {
    let q = { minSalary: 200000, hasEquity: true }
    let jobs = await Job.findAll(q);
    expect(jobs.length).toEqual(2);
  });
  test("works: with title, min & hasEquity filters", async function () {
    let q = { title: 'c', minSalary: 300000, hasEquity: true }
    let jobs = await Job.findAll(q);
    expect(jobs.length).toEqual(1);
  });
});


// /************************************** get */

describe("get", function () {
  test("works", async function () {
    let job = await Job.get(1);
    expect(job).toEqual({
      id: 1,
      title: "C1",
      salary: 100000,
      equity: "0.1",
      companyHandle: "c1",
    });
  });

  test("not found if no such job", async function () {
    try {
      await Job.get(47);
      fail();
    } catch (err) {
      expect(err instanceof NotFoundError).toBeTruthy();
    }
  });
});

// /************************************** update */

describe("update", function () {
  const updateData = {
    title: "Ditch digger",
    salary: 250000,
    equity: "0.6",
  };

  test("works", async function () {
    let job = await Job.update(1, updateData);
    expect(job).toEqual({
      id: 1,
      companyHandle: "c1",
      ...updateData,
    });

    const result = await db.query(
      `SELECT id, title, salary, equity, company_handle
           FROM jobs
           WHERE id = 1`);
    expect(result.rows).toEqual([{
      id: 1,
      title: "Ditch digger",
      salary: 250000,
      equity: "0.6",
      company_handle: "c1",
    }]);
  });

  test("works: null fields", async function () {
    const updateDataSetNulls = {
      title: "Ditch digger",
      salary: 250000,
      equity: null,
    };

    let job = await Job.update(1, updateDataSetNulls);
    expect(job).toEqual({
      id: 1,
      companyHandle: "c1",
      ...updateDataSetNulls,
    });

    const result = await db.query(
      `SELECT id, title, salary, equity, company_handle
           FROM jobs
           WHERE id = 1`);
    expect(result.rows).toEqual([{
      id: 1,
      title: "Ditch digger",
      salary: 250000,
      equity: null,
      company_handle: "c1",
    }]);
  });

  test("not found if no such job", async function () {
    try {
      await Job.update(47, updateData);
      fail();
    } catch (err) {
      expect(err instanceof NotFoundError).toBeTruthy();
    }
  });

  test("bad request with no data", async function () {
    try {
      await Job.update(3, {});
      fail();
    } catch (err) {
      expect(err instanceof BadRequestError).toBeTruthy();
    }
  });
});

// /************************************** remove */

describe("remove", function () {
  test("works", async function () {
    await Job.remove(1);
    const res = await db.query(
      "SELECT id FROM jobs WHERE id=1");
    expect(res.rows.length).toEqual(0);
  });

  test("not found if no such job", async function () {
    try {
      await Job.remove(47);
      fail();
    } catch (err) {
      expect(err instanceof NotFoundError).toBeTruthy();
    }
  });
});
