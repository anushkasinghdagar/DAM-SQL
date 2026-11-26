-- ===== SETUP =====
CREATE TABLE distributors (
    distributor_id INTEGER PRIMARY KEY,
    name           TEXT NOT NULL,
    city           TEXT,
    region         TEXT,
    phone          TEXT
);


CREATE TABLE products (
    product_id    INTEGER PRIMARY KEY,
    product_name  TEXT NOT NULL UNIQUE,
    brand         TEXT,
    category      TEXT NOT NULL,
    price         REAL CHECK (price > 0),
    stock         INTEGER DEFAULT 0
);



CREATE TABLE sales (
    sale_id         INTEGER PRIMARY KEY,
    product_id      INTEGER,
    distributor_id  INTEGER,
    sale_date       TEXT,
    quantity        INTEGER CHECK (quantity > 0),
    amount          REAL,
    FOREIGN KEY (product_id)     REFERENCES products(product_id),
    FOREIGN KEY (distributor_id) REFERENCES distributors(distributor_id)
);

--Checking the column--
PRAGMA table_info(distributors);
PRAGMA table_info(products);
PRAGMA table_info(sales);



INSERT INTO products VALUES (1, 'Aashirvaad Atta 5kg', 'Aashirvaad', 'Staples', 265, 120);
INSERT INTO products VALUES (2, 'Aashirvaad Salt', 'Aashirvaad', 'Staples', 28, 300);
INSERT INTO products VALUES (3, 'Sunfeast Dark Fantasy', 'Sunfeast', 'Biscuits', 40, 500);
INSERT INTO products VALUES (4, 'Sunfeast Marie Light', 'Sunfeast', 'Biscuits', 30, 450);
INSERT INTO products VALUES (5, 'Bingo Mad Angles', 'Bingo', 'Snacks', 20, 600);
INSERT INTO products VALUES (6, 'Bingo Tedhe Medhe', 'Bingo', 'Snacks', 10, 800);
INSERT INTO products VALUES (7, 'Yippee Noodles', 'Yippee', 'Noodles', 14, 700);
INSERT INTO products VALUES (8, 'Classmate Notebook', 'Classmate', 'Stationery', 55, 400);
INSERT INTO products VALUES (9, 'Fabelle Chocolate', 'Fabelle', 'Chocolates', 180, 90);
INSERT INTO products VALUES (10, 'Fiama Soap', 'Fiama', 'Personal Care', 70, 250);
INSERT INTO products VALUES (11, 'Vivel Soap', 'Vivel', 'Personal Care', 45, 0);
INSERT INTO products VALUES (12, 'Mangaldeep Agarbatti', 'Mangaldeep', 'Home Care', 60, 150);

INSERT INTO distributors VALUES (1, 'Sharma Traders', 'Delhi', 'North', '9811100001');
INSERT INTO distributors VALUES (2, 'Mumbai Foods', 'Mumbai', 'West', '9822200002');
INSERT INTO distributors VALUES (3, 'Kolkata Distributors', 'Kolkata', 'East', NULL);
INSERT INTO distributors VALUES (4, 'Chennai Agencies', 'Chennai', 'South', '9844400004');
INSERT INTO distributors VALUES (5, 'Pune Wholesale', 'Pune', 'West', NULL);

INSERT INTO sales VALUES (1, 1, 1, '2026-10-05', 50, 13250);
INSERT INTO sales VALUES (2, 3, 1, '2026-10-06', 200, 8000);
INSERT INTO sales VALUES (3, 5, 2, '2026-10-08', 300, 6000);
INSERT INTO sales VALUES (4, 7, 2, '2026-10-10', 400, 5600);
INSERT INTO sales VALUES (5, 2, 3, '2026-10-12', 100, 2800);
INSERT INTO sales VALUES (6, 9, 4, '2026-10-15', 40, 7200);
INSERT INTO sales VALUES (7, 10, 4, '2026-10-18', 120, 8400);
INSERT INTO sales VALUES (8, 8, 5, '2026-10-20', 150, 8250);
INSERT INTO sales VALUES (9, 4, 1, '2026-11-02', 180, 5400);
INSERT INTO sales VALUES (10, 6, 2, '2026-11-04', 500, 5000);
INSERT INTO sales VALUES (11, 1, 3, '2026-11-06', 60, 15900);
INSERT INTO sales VALUES (12, 12, 5, '2026-11-08', 80, 4800);
INSERT INTO sales VALUES (13, 3, 4, '2026-11-10', 250, 10000);
INSERT INTO sales VALUES (14, 5, 1, '2026-11-12', 350, 7000);
INSERT INTO sales VALUES (15, 9, 2, '2026-11-14', 30, 5400);

SELECT COUNT(*) AS products_loaded FROM products;


--- topic 1: select, district and aliases ---

--- saleshead wants to see the full list of itc distributors? ---
select* from distributors;

--- the marketing team needs the product name, brand and price. ---
select product_name, brand, price from products;

--- utilising the function name DISTINCT ---
--- which product category does the itc sells? ---
select distinct category from products;

--- which brand and category combination exist? ---
select distinct brand, category from products;

--- aliases ---
--- the report needs to change the name for product name and price as PRODUCT NAME AND MRP RESPECTIVELY.  ---
SELECT product_name as "PRODUCT NAME", price AS "MRP" from products;

--- topic 2: using the CLAUSE WHERE AND FILTERING WITH AND WITHOUT THE OPERATORS ---

--- list all the biscuit products from the table products? ---
select product_name from products where category = 'Biscuits'
select product_name, price from products where category = 'Biscuits'

--- which products are not in the staple category? ---
select * from products where category != 'Staples';

--- which product cost 100 or more, we have to print product name and price? ---
select product_name, price from products where price >= 100;

--- using and, or, not ---
--- which snacks product is less than 15 ---
select product_name, price from products where category = 'Snack' and price <= 15;

--- show products of the bingo yippee, we have to print all the produscts and the other brand ---
select product_name, brand from products where brand in ('Bingo', 'Yippee');
select product_name, brand, price from products where brand in ('Bingo', 'Yippee');

--- show the products that are not snacks and cost less than rupees 30 ---
select * from products where category != 'Snacks' and price < 30;