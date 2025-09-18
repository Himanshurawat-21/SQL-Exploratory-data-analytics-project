# SQL for Business Analytics: An Exploratory Data Analysis
This project leverages SQL to conduct a comprehensive exploratory data analysis (EDA) on a sales dataset. The primary objective is to extract actionable business insights regarding customer behavior, product performance, and overall sales trends.

## Project Overview
The analysis is designed to answer critical business questions by querying a structured sales dataset. It moves beyond simple reporting to segment customers, evaluate product-line profitability, and identify growth patterns, providing a multi-faceted view of the business's performance.

## Dataset

The project uses three separate CSV files located in the `/dataset` directory:

* **`gold.dim_customers.csv`**: Stores details for each customer.
    * `customer_id`: Unique identifier for each customer.
    * `name`: Name of the customer.
    * `location`: The geographical location of the customer.
* **`gold.dim_products.csv`**: Contains information about each product.
    * `product_id`: Unique identifier for each product.
    * `name`: Name of the product.
    * `category`: Category the product belongs to.
* **`gold.fact_sales.csv`**: Records all transaction details, linking customers and products.
    * `sale_id`: Unique identifier for each sale transaction.
    * `product_id`: Foreign key referencing the `products` table.
    * `customer_id`: Foreign key referencing the `customers` table.
    * `sale_date`: The date of the sale.
    * `quantity`: The number of units sold.
    * `price`: The price per unit at the time of sale.

### Database Schema

The tables are related as follows, forming a star schema:



`sales` (fact table) is connected to `customers` and `products` (dimension tables) via `customer_id` and `product_id` respectively.

---

## Key Business Questions Addressed

The SQL queries located in the `scripts/sales_analysis.sql` file are designed to answer the following business questions:

1.  What is the total sales revenue generated?
2.  Which are the top 5 best-selling products by revenue?
3.  What is the sales distribution across different product categories?
4.  How do sales trends vary on a monthly basis?
5.  Who are the top 5 most valuable customers by total spending?
6.  Which geographical locations (customer locations) generate the most sales?

---

## Technologies Used

* **Language:** SQL
* **Database Environment:** The scripts are written in standard SQL and are compatible with most relational database management systems (RDBMS) like MySQL, PostgreSQL, SQL Server, etc.

---

## How to Replicate

Follow these steps to set up the environment and run the analysis:

1.  **Clone the Repository:**
    ```bash
    git clone [https://github.com/Himanshurawat-21/SQL-Exploratory-data-analytics-project.git](https://github.com/Himanshurawat-21/SQL-Exploratory-data-analytics-project.git)
    cd SQL-Exploratory-data-analytics-project
    ```

2.  **Database Setup:**
    * Create a new database in your chosen RDBMS (e.g., `sales_db`).
    * Create the `customers`, `products`, and `sales` tables according to the schema described above.

3.  **Data Ingestion:**
    * Import the data from the CSV files in the `/dataset` directory into their corresponding tables. Most SQL clients provide a tool for importing CSV data.

4.  **Run the Analysis Script:**
    * Open the `scripts/sales_analysis.sql` file.
    * Execute the SQL queries against your populated database to perform the analysis and see the results.

