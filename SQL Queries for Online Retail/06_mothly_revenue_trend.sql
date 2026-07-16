-- Calculate monthly revenue and order chronologically

SELECT 
	DATE_TRUNC('month', invoicedate) AS month,
	SUM(revenue) AS monthly_revenue
FROM orders
GROUP BY DATE_TRUNC('month', invoicedate)
ORDER BY DATE_TRUNC('month', invoicedate);

-- This query was used as one of the data sources for Tableau