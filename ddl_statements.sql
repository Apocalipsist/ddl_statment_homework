-- DDL (Data Definition Language) Statements
-- Syntax:
-- Create Table table_name( col_name DATA_TYPE,...)
-- table_name - all lowercase in singular form

-- Create the customer table
CREATE TABLE customer(
-- column_name DATATYPE <CONSTRAINTS>,
	customer_id SERIAL PRIMARY KEY,  -- PRIMARY KEY specifies BOTH UNIQUE AND NOT NULL
	first_name VARCHAR(50) NOT NULL,  ---NOT NULL  MEANS THAT THIS COLLUMN CANNOT BE EMPTY
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(50),
	address VARCHAR(100),
	loyalty_member BOOLEAN DEFAULT FALSE
);



-- Confirm customer table was created
SELECT *
FROM customer;

--Add column to a table
--ALTER TABLE table_name_to_alter ADD COLUMN new_col_name DATATYPE 
ALTER TABLE customer 
ADD COLUMN username VARCHAR(20);

--Change DataType of a column
--change email datatype to VARCHAR(30)
--ALTER TABLE table_name_to_alter ALTER COLUMN col_name TYPE NEW_DATATYPE
ALTER TABLE customer
ALTER COLUMN email TYPE varchar(30);

--Change the name of column
--ALTER TABLE table_name RENAME COLUMN curr_col_name TO new_col_name
ALTER TABLE customer 
RENAME COLUMN email TO email_address;


SELECT *
FROM customer;

-- Create Order Table with a Foreign Key to customer table
CREATE TABLE order_(
	order_id SERIAL PRIMARY KEY,	
	order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	date_shipped TIMESTAMP,
	customer_id integer NOT NULL,
--Syntax: FOREIGN KEY (column_in_domestic_table) REFERENCES foreign_table_name(column_in_foreign_table)
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

-- Creating Table to delete
CREATE TABLE "order"(
	order_id SERIAL PRIMARY KEY,	
	order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	date_shipped TIMESTAMP,
	customer_id integer NOT NULL,
--Syntax: FOREIGN KEY (column_in_domestic_table) REFERENCES foreign_table_name(column_in_foreign_table)
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);
-- To delete a table, use DROP
-- DROP TABLE table_name_to_drop
DROP TABLE "order";

-- DROP TABLE IF EXISTS table_name_to_drop
DROP TABLE IF EXISTS "order";

-- Create Order-Product Table (Join Table between the Order and Product table)
CREATE TABLE order_product(
	order_id INTEGER NOT NULL,
	FOREIGN KEY(order_id) REFERENCES order_(order_id),
	product_id INTEGER NOT NULL
--	FOREIGN KEY (product_id) REFERENCES (product_id)     -- CANNOT REFFERNCE A TABLE THAT DOES NOT EXIST
);


-- Create the Product table AND THEN  alter order_product to add foreign KEY 
CREATE TABLE product(
	product_id SERIAL PRIMARY KEY,
	prod_name VARCHAR(25),
	description VARCHAR(200),
	price NUMERIC(5,2),
	quantity INTEGER
);


-- Alter order_product table to add to foreign key
ALTER TABLE order_product 
ADD FOREIGN KEY (product_id) REFERENCES product(product_id);


-- Rename a table
-- ALTER TABLE table_name RENAME TO new_name;
ALTER TABLE product
RENAME TO item;
-- Or vice-a-versa
ALTER TABLE item
RENAME TO product;

-- create a test table to eventually drop
CREATE TABLE test(
	test_id SERIAL PRIMARY KEY,
	col_1 INTEGER,
	col_2 BOOLEAN
);

-- Drop a column
-- ALTER TABLE table_name DROP column col_name;
-- BE VERY CAREFUL WITH DROP - NO UNDOING
ALTER TABLE test
DROP COLUMN col_1;

SELECT*
FROM test;

--remove TABLE completely use DROP table
--IF EXISTS will ONLY DROP IF the TABLE EXISTS, otherwise will skip
DROP TABLE IF EXISTS test;


--CREATE a seller table
CREATE TABLE seller(
	vendor_id SERIAL PRIMARY KEY,
	name VARCHAR(25) NOT NULL,
	description VARCHAR(200),
	email_address VARCHAR(50),
	address VARCHAR(200)
);


--CREATE category table
CREATE TABLE category(
	category_id SERIAL PRIMARY KEY,
	name VARCHAR(25),
	color VARCHAR(6)
);
-- ADD seller_id and category_id to Product TABLE 
ALTER TABLE product 
ADD COLUMN seller_id INTEGER NOT NULL;

ALTER TABLE product 
ADD COLUMN category_id INTEGER NOT NULL;

-- Add foreign keys to those new columns
ALTER TABLE product 
ADD FOREIGN KEY(seller_id) REFERENCES seller(seller_id);

ALTER TABLE product 
ADD FOREIGN KEY(category_id) REFERENCES category(category_id);

SELECT *
FROM product;
	


