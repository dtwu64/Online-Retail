-- Monthly revenue in order of monthly revenue (find worst performing months)

SELECT 
	DATE_TRUNC('month', invoicedate) AS month,
	SUM(revenue) AS monthly_revenue
FROM orders
GROUP BY DATE_TRUNC('month', invoicedate)
ORDER BY SUM(revenue);

-- 7 worst performing months starting from worst:  2/11, 4/11, 2/10, 12/11, 1/10, 1/11, 12/10
-- Looks like this business tends to struggle in the months of Dec-Feb
-- Perhaps they could run special promotions or increase ads during this period to boost sales
