# SQL Exploratory Data Analytics Project

## 📌 Overview

This project demonstrates how to perform **Exploratory Data Analysis (EDA)** using SQL on a structured dataset. It covers multiple analytical perspectives including:

* Sales performance analysis
* Customer segmentation
* Product trends
* Category distribution
* Location-based insights

The repository contains:

* **Dataset** (`dataset/`) – Contains CSV files for customers, products, and sales.
* **Scripts** (`scripts/`) – SQL queries for various analytical problems.
* **Docs** (`docs/`) – Documentation and notes.

---

## 📂 Dataset Structure

The dataset follows a **star schema** design with `sales_fact` as the central table.

### Tables

1. **customers**

   * `customer_id` (PK)
   * `name`
   * `location`
   * `age`

2. **products**

   * `product_id` (PK)
   * `product_name`
   * `category`
   * `price`

3. **sales\_fact**

   * `sale_id` (PK)
   * `customer_id` (FK → customers)
   * `product_id` (FK → products)
   * `quantity`
   * `sale_date`

---

## 🔎 Key Analyses Performed

The SQL scripts in `scripts/` provide insights into:

1. **Sales Performance**

   * Total revenue
   * Top-selling products
   * Best customers

2. **Product & Category Analysis**

   * Revenue contribution by category
   * Product sales distribution
   * Price vs sales trends

3. **Customer Analysis**

   * Customer lifetime value (CLV)
   * Purchase frequency
   * Location-based segmentation

4. **Time-based Analysis**

   * Monthly & yearly revenue trends
   * Seasonal analysis
   * Cumulative sales growth

---

## ▶️ How to Run

1. **Clone the repository**

   ```bash
   git clone https://github.com/Himanshurawat-21/SQL-Exploratory-data-analytics-project.git
   cd SQL-Exploratory-data-analytics-project
   ```

2. **Load the dataset** into your SQL database (MySQL / PostgreSQL / SQL Server):

   * Create tables based on schema above
   * Import CSV files from `dataset/`

3. **Run SQL scripts** from the `scripts/` folder.
   Example:

   ```sql
   -- Total revenue
   SELECT SUM(s.quantity * p.price) AS total_revenue
   FROM sales_fact s
   JOIN products p ON s.product_id = p.product_id;
   ```

4. **Check outputs** – Each query produces results that can be exported to CSV or visualized in BI tools.

---

## 📊 Example Outputs

* **Top 5 Products by Revenue**
* **Monthly Revenue Trend**
* **Customer Segmentation by Spend**
* **Category Contribution (Pie chart possible in Tableau/PowerBI)**

---

## 🚀 Future Improvements

* Add **parameterized queries** (date range, category filter).
* Optimize queries with **indexes** for faster performance.
* Create **dashboards** using Tableau/PowerBI.
* Extend dataset with promotions, discounts, and region hierarchies.

---

## 📜 License

This project is licensed under the **MIT License**.

---

## 👤 Author

**Himanshu Rawat**
📧 Contact: \[priyansh4929@gmail.com]
🔗 GitHub: [Himanshurawat-21](https://github.com/Himanshurawat-21)
