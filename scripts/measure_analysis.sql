-- Explore All countries our customers come from
SELECT DISTINCT country
FROM gold.dim_customers;

-- Explore All Product categories "The Major Division"
SELECT DISTINCT category, subcategory, product_name
FROM gold.dim_products
ORDER BY 1,2,3;

-----------------Dates Exploration------------------------
-- Find the date of the first and last order
SELECT 
MIN(order_date) AS first_order_date,
MAX(order_date) AS last_order_date,
DATEDIFF(MONTH, MIN(order_date), MAX(order_date)) AS timespan_months
FROM gold.fact_sales;

-- Find the youngest and oldest customer
SELECT
MIN(birthdate) AS oldest,
MAX(birthdate) AS youngest,
DATEDIFF(YEAR, MIN(birthdate), GETDATE()) AS current_age_oldest_customer,
DATEDIFF(YEAR, MAX(birthdate), GETDATE()) AS current_age_youngest_customer
FROM gold.dim_customers;


---------------Measures Exploration--------------------
-- Find the Total Sales
SELECT SUM(sales_amount) AS total_sales
FROM gold.fact_sales;

-- Find how many items are sold
SELECT SUM(quantity) AS total_items
FROM gold.fact_sales;

-- Find the Average Selling price
SELECT AVG(price) AS average_price
FROM gold.fact_sales;

-- Find the Total numbers of Orders 
SELECT COUNT(DISTINCT order_number) AS number_of_orders
FROM gold.fact_sales;

-- Find the Total numbers of products
SELECT COUNT(DISTINCT product_key) AS number_of_products
FROM gold.dim_products;

-- Find the Total numbers of customers
SELECT COUNT(DISTINCT customer_key) AS number_of_customers
FROM gold.dim_customers;

-- Find the Total numbers of customers that has placed an order
SELECT COUNT(DISTINCT customer_key)
FROM gold.fact_sales
WHERE order_date IS NOT NULL

-- Generate a Report that shows all key matrices of the business.
SELECT 'Total Sales' AS	measure_name, SUM(sales_amount) AS measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Total Quantity', SUM(quantity) FROM gold.fact_sales
UNION ALL
SELECT 'Average price', AVG(price) FROM gold.fact_sales	
UNION ALL
SELECT 'Total Nr. Orders', COUNT(DISTINCT order_number) FROM gold.fact_sales
UNION ALL
SELECT 'Total Nr. Products', COUNT(DISTINCT product_key) FROM gold.dim_products
UNION ALL
SELECT 'Total Customers', COUNT(DISTINCT customer_key) FROM gold.dim_customers;