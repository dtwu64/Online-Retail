-- Frequency: count number of times each customer made an order
SELECT 
	customerid,
	COUNT(DISTINCT invoiceno) AS num_orders
FROM orders
GROUP BY customerid
ORDER BY num_orders DESC;
