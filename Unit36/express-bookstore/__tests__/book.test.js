process.env.NODE_ENV = "test";

const request = require("supertest");
const app = require("../app");
const db = require("../db");
const Book = require("../models/book");

beforeEach(async function () {
  await db.query("DELETE FROM books");
  let b = await Book.create({
    isbn: "12345678",
    amazon_url: "http://www.something.com",
    author: "Dr. Seuss",
    language: "English",
    pages: 15,
    publisher: "Suess Books",
    title: "The Cat In The Hat",
    year: 1952
  });
});

afterEach(async function () {
  await db.query("DELETE FROM books");
});


/** GET / => {books: [book, ...]}  */
describe("GET /", function () {
  test("can GET", async function () {
    let response = await request(app)
      .get("/books");

    expect(response.body.books[0]).toEqual({
      isbn: "12345678",
      amazon_url: "http://www.something.com",
      author: "Dr. Seuss",
      language: "English",
      pages: 15,
      publisher: "Suess Books",
      title: "The Cat In The Hat",
      year: 1952
    });
  })
});

/** GET /[id]  => {book: book} */
describe("GET /:id", function () {
  test("can GET id", async function () {
    let response = await request(app)
      .get("/books/12345678");

    expect(response.body.book).toEqual({
      isbn: "12345678",
      amazon_url: "http://www.something.com",
      author: "Dr. Seuss",
      language: "English",
      pages: 15,
      publisher: "Suess Books",
      title: "The Cat In The Hat",
      year: 1952
    });
  })

  test("can't GET id", async function () {
    let response = await request(app)
      .get("/books/22222222");

    expect(response.status).toEqual(404);
  });
});


/** POST /   bookData => {book: newBook}  */
describe("POST /", function () {
  test("can POST new book", async function () {
    let response = await request(app)
      .post("/books")
      .send({
        isbn: "22222222",
        amazon_url: "http://www.something.com",
        author: "Stan Lee/Steve Ditko",
        language: "English",
        pages: 9,
        publisher: "Marvel Comics",
        title: "Spider-Man",
        year: 1962
      });

    expect(response.body.book).toEqual({
      isbn: "22222222",
      amazon_url: "http://www.something.com",
      author: "Stan Lee/Steve Ditko",
      language: "English",
      pages: 9,
      publisher: "Marvel Comics",
      title: "Spider-Man",
      year: 1962
    });

    expect(response.status).toEqual(201);
  });

  test("can't POST new book", async function () {
    let response = await request(app)
      .post("/books")
      .send({
        isbn: "987654321"
      });

    expect(response.status).toEqual(400);
  })
});


/** PUT /[isbn]   bookData => {book: updatedBook}  */
describe("PUT /", function () {
  test("can update book", async function () {
    let response = await request(app)
      .put("/books/12345678")
      .send({
        amazon_url: "http://www.something.net",
        author: "Stan Lee/Steve Ditko",
        language: "French",
        pages: 9,
        publisher: "Marvel Comics",
        title: "Le Spider-Homme",
        year: 1962
      });

    expect(response.body.book).toEqual({
      isbn: "12345678",
      amazon_url: "http://www.something.net",
      author: "Stan Lee/Steve Ditko",
      language: "French",
      pages: 9,
      publisher: "Marvel Comics",
      title: "Le Spider-Homme",
      year: 1962
    });

    expect(response.status).toEqual(200);
  });

  test("can't update book", async function () {
    let response = await request(app)
      .post("/books/12345678")
      .send({
        isbn: "987654321"
      });

    expect(response.status).toEqual(404);
  });

  test("can't update book", async function () {
    let response = await request(app)
      .put("/books/12345678")
      .send({
        amazon_url: 6,
        author: 2,
        language: 12,
        pages: "A",
        publisher: 0,
        title: 1,
        year: "1962"
      });

    expect(response.status).toEqual(400);
  })
});

/** DELETE /[isbn]   => {message: "Book deleted"} */
describe("DELETE /", function () {
  test("can delete book", async function () {
    let response = await request(app)
      .delete("/books/12345678");

    expect(response.status).toEqual(200);
  });

  test("can't delete book", async function () {
    let response = await request(app)
      .delete("/books/2323232323");

    expect(response.status).toEqual(404);
  })
});

afterAll(async function () {
  await db.end();
});