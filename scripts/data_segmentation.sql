---------- Data Segmentation ------------------
-- Segment products into costs ranges and count how many products fall into each segment.
WITH product_segments AS (
SELECT
product_key,
CASE WHEN cost < 100 THEN 'Below 100'
	 WHEN cost BETWEEN 100 AND 500 THEN '100-500'
	 WHEN cost BETWEEN 500 AND 1000 THEN '500-1000'
	 ELSE 'Above 1000'
END AS cost_range
FROM gold.dim_products
)

SELECT
cost_range,
COUNT(product_key) AS total_product
FROM product_segments
GROUP BY cost_range
ORDER BY total_product DESC;


/* Group customers into three segments based on their spending behavior:
  -- VIP: at least 12 months of history and spending more than 5000.
  -- Regular: at least 12 months of history but spending 5000 or less
  -- New: lifespan less than 12 months
and find the total number of customers by each group 
*/
WITH customer_segements AS(
SELECT
c.customer_key,
SUM(f.sales_amount) AS total_spending,
MIN(f.order_date) AS firt_order,
MAX(f.order_date) AS last_order,
DATEDIFF(month, MIN(f.order_date), MAX(f.order_date)) AS lifespan
FROM gold.fact_sales AS f
LEFT JOIN gold.dim_customers as c
ON f.customer_key = c.customer_key
GROUP BY c.customer_key
)
SELECT
SUM(total_spending) AS total_spendings,
COUNT(customer_key) AS total_customers,
customer_segement
FROM (
SELECT
customer_key,
total_spending,
lifespan,
CASE WHEN total_spending > 5000 AND lifespan >= 12 THEN 'VIP'
	 WHEN total_spending <= 5000 AND lifespan >= 12 THEN 'Regular'
	ELSE 'New'
END customer_segement
FROM customer_segements
)t
GROUP BY customer_segement
ORDER BY total_spendings DESC;
 

