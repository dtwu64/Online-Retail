-- Combined view for RFM Analysis

-- According to investopedia.com: 
-- “RFM analysis numerically ranks a customer in each of these three categories, 
-- generally on a scale of 1 to 5 (the higher the number, the better the result). 
-- The “best” customer would receive a top score in every category.” 

-- First, combine the 3 previous queries into a single table and 
-- subtract each customer’s most recent purchase from 
-- overall most recent purchase to create a days_since_purchase column 
-- (suggestion to do this from ChatGPT)

-- Then, assign a score for each of the categories using NTILE.

CREATE VIEW rfm AS
WITH MaxDate AS (
    SELECT MAX(invoicedate) AS most_recent_purchase
    FROM orders
)
SELECT
    customerid,
	-- use overall most recent purchase (Dec. 9, 2011) as reference
    (CAST(md.most_recent_purchase AS DATE) - CAST(MAX(invoicedate) AS DATE)) AS days_since_purchase,
	-- NTILE will assign 1 to first group, but we want 5 to represent best score
	-- for days_since_purchase, 0 indicates most recent and should get best score, so order by DESC
	NTILE(5) OVER (
		ORDER BY (CAST(md.most_recent_purchase AS DATE) - CAST(MAX(invoicedate) AS DATE)) DESC
	) AS recency_score,
    COUNT(DISTINCT invoiceno) AS num_orders,
	-- for the other two categories, higher numbers are better, so order by ASC to give them a 5
	NTILE(5) OVER (ORDER BY COUNT(DISTINCT invoiceno) ASC) AS frequency_score,
    ROUND(CAST(SUM(revenue) AS DECIMAL), 2) AS customer_revenue,
	NTILE(5) OVER (ORDER BY ROUND(CAST(SUM(revenue) AS DECIMAL), 2) ASC) AS monetary_score
FROM orders
CROSS JOIN MaxDate md
GROUP BY customerid, md.most_recent_purchase
ORDER BY customer_revenue DESC;

-- To use as data source in Tableau:
-- SELECT * FROM rfm;
