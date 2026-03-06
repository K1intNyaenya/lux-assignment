SQL Query Practice – Data Engineering

This repository contains a collection of SQL practice queries designed for data engineering and analytics practice. The exercises are based on a sales database schema with tables such as products, sales, customers, and inventory.

These queries cover joins, aggregations, window functions, subqueries, and date-based calculations — essential skills for data engineering and analytics roles.

Database Name

All queries use the following database:

assignment
Tables in assignment

##Table	Columns
products	product_id, product_name, price, category
sales	sale_id, product_id, customer_id, quantity_sold, total_amount, sale_date
customers	customer_id, first_name, last_name, membership_status, registration_date
inventory	product_id, stock_quantity
Key SQL Concepts Covered

Joins: INNER JOIN, LEFT JOIN, FULL JOIN, SELF JOIN

Aggregations: SUM(), COUNT(), MAX(), MIN(), AVG()

Grouping & Filtering: GROUP BY, HAVING, WHERE

Date Functions: EXTRACT(), DATE_TRUNC(), INTERVAL

Window Functions: SUM() OVER (PARTITION BY ...), ROW_NUMBER(), RANK()

Subqueries & CTEs: WITH clauses, NOT EXISTS, filtering with aggregated data

Example Queries

Total sales per product by month

Most frequent customer by number of purchases

Customers who spent the most in 2023

Products sold more than a certain threshold

Products not sold in the last 6 months

Low stock inventory and remaining stock analysis

Setup Instructions

Create the database:

CREATE DATABASE assignment;
\c assignment

Create the tables and insert sample data using the provided assignment.sql file.

psql -U your_user -d assignment -f assignment.sql

Run the SQL queries in *.sql files or directly in your SQL client (PostgreSQL, DBeaver, or pgAdmin).

Usage

Practice writing queries for sales analytics, inventory management, and customer analysis.

Understand how to combine joins, aggregations, and window functions.

Useful for data engineering and analytics interviews.

Author

Clinton Ombui – Data Engineering & Analytics Practice
GitHub Profile

💡 Tip: Once you create assignment.sql with table schemas and sample data, anyone can clone your repo and run the queries exactly as intended.

If you want, I can also generate a ready-to-use assignment.sql file with all four tables (products, sales, customers, inventory) and some sample data for testing your queries.

Do you want me to do that next?