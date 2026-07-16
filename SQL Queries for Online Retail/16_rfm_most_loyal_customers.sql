-- Find customers with a top score in all categories. 
-- These would be considered our top/most loyal customers that we might want to cater towards.

SELECT 
customerid
FROM rfm
WHERE recency_score = 5
AND frequency_score = 5
AND monetary_score = 5;

-- We see 465 customers (out of 5881, or 7.9%) meet this requirement. 

--If we expand the query to customers with at least scores of 4 in each category:
SELECT 
	customerid,
	recency_score,
	frequency_score,
	monetary_score
FROM rfm
WHERE recency_score >= 4
AND frequency_score >= 4
AND monetary_score >= 4;

-- 1297 customers (22.1%) fulfill this requirement

-- Can adjust scores to filter by as necessary
-- (e.g., perhaps find customers with high frequency and monetary and low recency scores
-- [once loyal customers who have forgotten about our business] some targeted promotions 
-- to encourage them to come back)
