-- 1. Write a query to select all data from the `Customers` table.
SELECT * 
FROM assignment.customers;

-- 2. Write a query to select the total number of products from the `Products` table.
SELECT count(*) 
FROM assignment.products;

-- 3. Write a query to select the product name and its price from the `Products` table where the price is greater than 500.
SELECT p.product_name AS Product_name,
	   p.price AS Price
FROM products p
WHERE p.price > 500;

-- 4. Write a query to find the average price of all products from the `Products` table.
SELECT avg(price) as Average_price
FROM products;

-- 5. Write a query to find the total sales amount from the `Sales` table.
SELECT sum(total_amount) as Total_Sales
FROM sales;

-- 6. Write a query to select distinct membership statuses from the `Customers` table.
