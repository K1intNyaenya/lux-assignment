# SQL Query Practice – Data Engineering

This repository contains a collection of **SQL practice queries** for data engineering and analytics practice.  
The exercises are based on a **sales database schema** with tables such as `products`, `sales`, `customers`, and `inventory`.

These queries cover **joins, aggregations, window functions, subqueries, and date-based calculations**, which are essential skills for data engineering and analytics roles.

---

## Database Name

All queries use the following database:


### Tables in `assignment`

| Table      | Columns                                                                 |
|------------|------------------------------------------------------------------------|
| products   | `product_id`, `product_name`, `price`, `category`                      |
| sales      | `sale_id`, `product_id`, `customer_id`, `quantity_sold`, `total_amount`, `sale_date` |
| customers  | `customer_id`, `first_name`, `last_name`, `membership_status`, `registration_date` |
| inventory  | `product_id`, `stock_quantity`                                         |

---

## Key SQL Concepts Covered

- **Joins:** `INNER JOIN`, `LEFT JOIN`, `FULL JOIN`, `SELF JOIN`  
- **Aggregations:** `SUM()`, `COUNT()`, `MAX()`, `MIN()`, `AVG()`  
- **Grouping & Filtering:** `GROUP BY`, `HAVING`, `WHERE`  
- **Date Functions:** `EXTRACT()`, `DATE_TRUNC()`, `INTERVAL`  
- **Window Functions:** `SUM() OVER (PARTITION BY ...)`, `ROW_NUMBER()`, `RANK()`  
- **Subqueries & CTEs:** `WITH` clauses, `NOT EXISTS`, filtering with aggregated data  

---

## Example Queries

1. Total sales per product by month  
2. Most frequent customer by number of purchases  
3. Customers who spent the most in 2023  
4. Products sold more than a certain threshold  
5. Products not sold in the last 6 months  
6. Low stock inventory and remaining stock analysis  

---

## Setup Instructions

1. Create the database:

```sql
CREATE DATABASE assignment;
\c assignment

psql -U your_user -d assignment -f sales_sd.sql