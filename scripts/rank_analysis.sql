------------------ Rank Analysis -------------------------
-- Which 5 products generate the highest revenue
SELECT
TOP 5
p.product_name,
SUM(sales_amount) AS total_revenue
FROM gold.fact_sales as f
LEFT JOIN gold.dim_products as p
ON f.product_key = p.product_key
GROUP BY p.product_name
ORDER BY total_revenue DESC

-- Using RANK()
SELECT *
FROM (
	SELECT
	p.product_name,
	SUM(sales_amount) AS total_revenue,
	RANK() OVER(ORDER BY SUM(sales_amount) DESC) AS rank_products
	FROM gold.fact_sales as f
	LEFT JOIN gold.dim_products as p
	ON f.product_key = p.product_key
GROUP BY p.product_name)t WHERE rank_products <= 5;

-- Which are the 5 worst performing products in terms of sales
SELECT
TOP 5
p.product_name,
SUM(sales_amount) AS total_revenue
FROM gold.fact_sales as f
LEFT JOIN gold.dim_products as p
ON f.product_key = p.product_key
GROUP BY p.product_name
ORDER BY total_revenue;

-- Find the top 10 customers who have generated the highest revenue
SELECT
TOP 10
c.customer_key,
c.first_name,
c.last_name,
SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales as f
LEFT JOIN gold.dim_customers as c
ON f.customer_key = c.customer_key
GROUP BY c.customer_key, c.first_name, c.last_name
ORDER BY total_revenue DESC

-- The 3 customers with the fewest orders placed
SELECT
TOP 3
c.customer_key,
c.first_name,
c.last_name,
COUNT( DISTINCT f.order_number) AS order_placed
FROM gold.fact_sales as f
LEFT JOIN gold.dim_customers as c
ON f.customer_key = c.customer_key
GROUP BY c.customer_key, c.first_name, c.last_name
ORDER BY order_placed ASC