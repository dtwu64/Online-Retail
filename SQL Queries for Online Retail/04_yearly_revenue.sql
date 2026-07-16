-- Calculate revenue per year

SELECT 
	EXTRACT(YEAR FROM invoicedate) AS invoice_year,
	ROUND(CAST(SUM(revenue) AS DECIMAL), 2) AS annual_revenue
FROM orders
GROUP BY EXTRACT(YEAR FROM invoicedate)
ORDER BY EXTRACT(YEAR FROM invoicedate) ASC;


-- 2009:  $683,504.01
-- 2010:  $8,374,496.09
-- 2011:  $8,316,804.16 

