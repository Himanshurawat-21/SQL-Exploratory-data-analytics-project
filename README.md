# SQL for Business Analytics: An Exploratory Data Analysis

## 📌 Project Overview

This project leverages SQL to conduct a comprehensive exploratory data analysis (EDA) on a sales dataset. The primary objective is to extract actionable business insights regarding customer behavior, product performance, and overall sales trends.

## 📂 Dataset

The project uses three CSV files located in the `dataset/gold/` directory:

| File | Description |
|---|---|
| **dim_customers.csv** | Stores details about each customer: `customer_id`, `name`, `location`. |
| **dim_products.csv** | Information about each product: `product_id`, `name`, `category`. |
| **fact_sales.csv** | Records all transaction details. Fields include: `sale_id`, `product_id`, `customer_id`, `sale_date`, `quantity`, `price` (unit price at time of sale). |

### Schema & Relationships

- **fact_sales** is the *fact* table.  
- **dim_customers** and **dim_products** are *dimension* tables.  
- `fact_sales.customer_id` → `dim_customers.customer_id`  
- `fact_sales.product_id` → `dim_products.product_id`  

This forms a star schema.

---

## 🔎 Key Business Questions Addressed

The analyses (in `scripts/sales_analysis.sql`) answer several business-critical questions:

1. What is the **total sales revenue** generated?  
2. Which are the top 5 **best-selling products** by revenue?  
3. How is the sales distributed across **product categories**?  
4. What are the **monthly sales trends** over time?  
5. Who are the **top 5 most valuable customers** by total spending?  
6. Which **customer locations** generate the most sales?

---

## ⚙ Technologies Used

- SQL (standard ANSI SQL, should work in most RDBMS: PostgreSQL, MySQL, SQL Server, etc.)  
- Dataset format: CSV files  
- Local / development environment: any SQL client or command line tool capable of importing CSV and executing SQL queries

---

## ▶️ How to Run / Reproduce

1. **Clone the repository**  
   ```bash
   git clone https://github.com/Himanshurawat-21/SQL-Exploratory-data-analytics-project.git
   cd SQL-Exploratory-data-analytics-project
   
2. **Setup database & tables**
        CREATE TABLE dim_customers (
        customer_id INT PRIMARY KEY,
        name VARCHAR(100),
        location VARCHAR(100)
      );
      
      CREATE TABLE dim_products (
        product_id INT PRIMARY KEY,
        name VARCHAR(100),
        category VARCHAR(100)
      );
      
      CREATE TABLE fact_sales (
        sale_id INT PRIMARY KEY,
        product_id INT,
        customer_id INT,
        sale_date DATE,
        quantity INT,
        price DECIMAL(10,2),
        FOREIGN KEY (product_id) REFERENCES dim_products(product_id),
        FOREIGN KEY (customer_id) REFERENCES dim_customers(customer_id)
      );

3. **Load data**

     Import CSVs from dataset/gold/ into the respective tables:
     
     dim_customers.csv → dim_customers
     
     dim_products.csv → dim_products
     
     fact_sales.csv → fact_sales

4. **Run analysis**

  Open scripts/sales_analysis.sql.
  
  Execute the queries to answer the business questions.
  -- Total revenue --
   SELECT SUM(quantity * price) AS total_revenue
   FROM fact_sales;

## 📜 License
MIT License

## 👤 Author
Himanshu Rawat
🔗 GitHub: Himanshurawat-21
