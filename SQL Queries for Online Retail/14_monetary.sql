-- Monetary Value: calculate how much each customer has spent
SELECT 
	customerid,
	ROUND(CAST(SUM(revenue) AS DECIMAL), 2) AS customer_revenue
FROM orders
GROUP BY customerid
ORDER BY customer_revenue DESC;
