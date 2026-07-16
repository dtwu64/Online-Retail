-- Combine top product by revenue and by quantity together to use as data source for Tableau:
WITH categorized_orders AS (
	SELECT *,
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
			WHEN description LIKE 'POSTAGE' THEN 'postage'
			WHEN description LIKE 'Manual' THEN 'manual'
			ELSE 'other'
		END AS product_category
	FROM orders
)
SELECT
	product_category,
	SUM(revenue) AS total_revenue_per_category,
	SUM(quantity) AS total_quantity_per_category
FROM categorized_orders
GROUP BY product_category
HAVING product_category NOT LIKE 'postage' AND
	product_category NOT LIKE 'manual'
ORDER BY SUM(revenue) DESC;
