-- Create tables to store data

CREATE TABLE orders_09_10(
	InvoiceNo VARCHAR,
	StockCode VARCHAR,
	Description VARCHAR,
	Quantity SMALLINT,
	InvoiceDate TIMESTAMP,
	UnitPrice FLOAT,
	CustomerID VARCHAR,
	Country VARCHAR	
)

CREATE TABLE orders_10_11(
	InvoiceNo VARCHAR,
	StockCode VARCHAR,
	Description VARCHAR,
	Quantity SMALLINT,
	InvoiceDate TIMESTAMP,
	UnitPrice FLOAT,
	CustomerID VARCHAR,
	Country VARCHAR	
)

-- SMALLINT data type was originally picked for `quantity` because I didn't expect large orders
-- Turned out some entries in `quantity` were indeed too large, so switch to INT data type

ALTER TABLE orders_09_10
ALTER quantity TYPE INT;

ALTER TABLE orders_10_11
ALTER quantity TYPE INT;
