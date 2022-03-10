-- Add a product to the table with the name of “chair”, price of 44.00, and can_be_returned of false.
INSERT into products
    (name, price, can_be_returned)
VALUES
    ('chair', 44.00, '0');


-- Add a product to the table with the name of “stool”, price of 25.99, and can_be_returned of true.
INSERT into products
    (name, price, can_be_returned)
VALUES
    ('stool', 25.99, '1');


-- Add a product to the table with the name of “table”, price of 124.00, and can_be_returned of false.
INSERT into products
    (name, price, can_be_returned)
VALUES
    ('table', 124.00, '0');


-- Display all of the rows and columns in the table.
SELECT * FROM products;
 id | name  | price | can_be_returned
----+-------+-------+-----------------
  1 | chair |    44 | f
  2 | stool | 25.99 | t
  3 | table |   124 | f


-- Display all of the names of the products.
 SELECT name FROM products;
 name
-------
 chair
 stool
 table


-- Display all of the names and prices of the products.
 SELECT name, price FROM products;
 name  | price
-------+-------
 chair |    44
 stool | 25.99
 table |   124


-- Add a new product - make up whatever you would like!
INSERT into products
    (name, price, can_be_returned)
VALUES
    ('recliner', 169.95, '1');

-- Display only the products that can_be_returned.
SELECT name, can_be_returned
FROM products
WHERE can_be_returned = '1';
   name   | can_be_returned
----------+-----------------
 stool    | t
 recliner | t


-- Display only the products that have a price less than 44.00.
SELECT name, price
FROM products
WHERE price < 44;
 name  | price
-------+-------
 stool | 25.99


-- Display only the products that have a price in between 22.50 and 99.99.
SELECT name, price
FROM products
WHERE price BETWEEN 22.50 AND 99.99;
 name  | price
-------+-------
 chair |    44
 stool | 25.99


-- There’s a sale going on: Everything is $20 off! Update the database accordingly.
UPDATE products
   SET price = price - 20;


-- Because of the sale, everything that costs less than $25 has sold out.
-- Remove all products whose price meets this criteria.
DELETE FROM products
WHERE  price < 25;


-- And now the sale is over. For the remaining products, increase their price by $20.
UPDATE products
SET price = price + 20;


-- There is a new company policy: everything is returnable. Update the database accordingly.
UPDATE products
SET can_be_returned = '1';