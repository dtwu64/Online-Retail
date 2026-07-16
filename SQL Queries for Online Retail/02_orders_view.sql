-- Create view for ease of use. 
-- I want both tables (different timeframes) stacked on top of each other 
-- Create a column `total` for quantity * unit price. 
-- Also remove cancellations (invoice number starts with a “C”) and customers with missing ID

CREATE VIEW orders AS
SELECT *, (quantity*unitprice) AS revenue 
FROM orders_09_10
WHERE invoiceno NOT LIKE 'C%' AND
	customerid IS NOT NULL
UNION
SELECT *, (quantity*unitprice) AS revenue
FROM orders_10_11
WHERE invoiceno NOT LIKE 'C%' AND
	customerid IS NOT NULL;
