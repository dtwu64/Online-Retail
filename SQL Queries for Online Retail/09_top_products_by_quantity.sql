-- Top Products by Quantity

SELECT description, SUM(quantity) as total_quantity
FROM orders
GROUP BY description
ORDER BY SUM(quantity) DESC
LIMIT 10;

-- or using same categories as before:
SELECT 
	CASE WHEN description LIKE '%STAND%' THEN 'stand'
		WHEN description LIKE '%LIGHT%' THEN 'light-related'
		WHEN description LIKE '%BUNTING%' THEN 'bunting'
		WHEN description LIKE '%LUNCH%' THEN 'lunch'
		WHEN description LIKE '%BAG%' OR description LIKE '%SHOPPER%' THEN 'bag/shopper'
		WHEN description LIKE '%ORNAMENT%' OR description LIKE '%CHRISTMAS%' THEN 'Christmas-related'
		WHEN description LIKE '%FRAME%' THEN 'frame'
		WHEN description LIKE '%PARASOL%' THEN 'parasol'
		WHEN description LIKE '%BOTTLE%' THEN 'bottle'
		WHEN description LIKE '%BOARD%' THEN 'board'
		WHEN description LIKE '%BUNTING%' THEN 'bunting'
		WHEN description LIKE '%BOX%' OR description LIKE '%STORAGE%' THEN 'box/storage'
		WHEN description LIKE '%SIGN%' THEN 'sign'
		WHEN description LIKE '%MAT%' THEN 'mat'
		WHEN description LIKE '%CLOCK%' THEN 'clock'
		WHEN description LIKE '%TEA%' THEN 'tea-related'
		WHEN description LIKE '%WICKER%' THEN 'wicker'
		WHEN description LIKE '%BLOCK%' THEN 'blocks'
		WHEN description LIKE '%GLASS%' THEN 'glass products'
		WHEN description LIKE '%POSTAGE%' THEN 'postage'
		ELSE 'other'
	END AS product_category,
	SUM(quantity) AS total_quantity_per_category
FROM orders
GROUP BY product_category
ORDER BY SUM(quantity) DESC;

-- This might not be as useful as using revenue since one category might have both small items 
-- (that people buy in large quantities) and large items (that people tend to buy fewer of); 
-- but if a category is near the top of both tables, then that could be a best-selling category 
-- to capitalize on (design more of those products, advertise them more to get new customers, etc.)
