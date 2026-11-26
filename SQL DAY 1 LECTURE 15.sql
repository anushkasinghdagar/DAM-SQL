--THE CASE OF ITC AND ITS SALES
--Create an excel datasheet containing column name distributor ID,name,city,region,phone no.
--TABLE OF DISTRIBUTION--
CREATE TABLE distributors(
  distributors_id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  city TEXT,
  region TEXT,
  phone TEXT
  );
  
  --DROPPING THE TABLE--
  DROP TABLE distributors;
  
  --CREATE A TABLE WITH THE PRODUCTS CONTAINING PRODUCT ID,PRODUCT NAME,PRODUCT BRAND,CATEGORY,PRICE,STOCK--distributors
  CREATE TABLE products(
    product_id INTEGER PRIMARY KEY,
    product_name TEXT NOT NULL UNIQUE,
    product_brand TEXT,
    category TEXT,
    price REAL CHECK (price>0),
    stock INTEGER DEFAULT 0
    );
    
    --CREATE A TABLE CONTAINING SALES AND SHOULD HAVE COLUMNS NAMED SALES ID,PRODUCT ID,DISTRIBUTOR ID,SALES DATE,QUANTITY--
    
    CREATE TABLE sales(
    sale_id INTEGER PRIMARY KEY,
    product_id TEXT NOT NULL UNIQUE,
    distributor_id INTEGER,
    sales_date TEXT,
    quantity INTEGER CHECK (quantity>0),
    amount REAL,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (distributor_id) REFERENCES distributors(distributor_id)
    );
   
   --CHECKING THE COLUMN--
   PRAGMA table_info(sales);
    PRAGMA table_info(distributors);
     PRAGMA table_info(products);