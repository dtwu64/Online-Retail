-- Calculate Total Revenue
-- There is an error without the type cast

SELECT ROUND(CAST(SUM(revenue) AS DECIMAL), 2) AS total_revenue
FROM orders;

-- Total revenue: $17,374,804.27

