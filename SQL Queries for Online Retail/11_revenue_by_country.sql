-- Revenue by Country

SELECT 
country, 
ROUND(CAST(SUM(revenue) AS DECIMAL), 2) AS total_revenue_per_country
FROM orders
GROUP BY country
ORDER BY ROUND(CAST(SUM(revenue) AS DECIMAL), 2) DESC;

-- This is one of the data sources used for Tableau
