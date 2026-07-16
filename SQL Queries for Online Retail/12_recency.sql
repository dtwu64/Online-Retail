-- Recency: find most recent purchase per customer
SELECT
    customerid,
    MAX(invoicedate) AS most_recent_purchase
FROM orders
GROUP BY customerid
ORDER BY most_recent_purchase DESC;
