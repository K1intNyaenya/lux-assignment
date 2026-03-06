-- 1. Write a query to select all data from the `Customers` table.
SELECT * 
FROM assignment.customers;

-- 2. Write a query to select the total number of products from the `Products` table.
SELECT COUNT(*) 
FROM assignment.products;

-- 3. Write a query to select the product name and its price from the `Products` table where the price is greater than 500.
SELECT p.product_name AS Product_name,
	   p.price AS Price
FROM products p
WHERE p.price > 500;

-- 4. Write a query to find the average price of all products from the `Products` table.
SELECT AVG(price) as Average_price
FROM products;

-- 5. Write a query to find the total sales amount from the `Sales` table.
SELECT SUM(total_amount) as Total_Sales
FROM sales;

-- 6. Write a query to select distinct membership statuses from the `Customers` table.
SELECT DISTINCT membership_status 
FROM customers;

-- 7. Write a query to concatenate first and last names of all customers and show the result as `full_name`.
SELECT CONCAT(first_name, ' ' ,last_name) as Full_name
FROM customers;

-- 8. Write a query to find all products in the `Products` table where the category is 'Electronics'.
SELECT * 
FROM products
WHERE category = 'Electronics';

-- 9. Write a query to find the highest price from the `Products` table.
SELECT MAX(price) as Price
FROM products;

-- 10. Write a query to count the number of sales for each product from the `Sales` table.
SELECT product_id,
	   COUNT(*)
FROM sales 
GROUP BY product_id;

-- 11. Write a query to find the total quantity sold for each product from the `Sales` table.
SELECT product_id,
	   SUM(quantity_sold) as Total_Quantity_Sold
FROM sales 
GROUP BY product_id;

-- 12. Write a query to find the lowest price of products in the `Products` table.
SELECT MIN(price) as lowest_price
FROM products;

-- 13. Write a query to find customers who have purchased products with a price greater than 1000.
SELECT CONCAT(c.first_name, ' ', c.last_name)
FROM sales s
INNER JOIN customers c 
ON s.customer_id = c.customer_id 
WHERE s.total_amount > 1000;

-- 14. Write a query to join the `Sales` and `Products` tables on product_id, and select the product name and total sales amount.
SELECT p.product_name, s.total_amount  
FROM sales s 
INNER JOIN products p 
ON s.product_id = p.product_id;

-- 15. Write a query to join the `Customers` and `Sales` tables and find the total amount spent by each customer.
SELECT CONCAT(c.first_name, ' ', c.last_name), s.total_amount 
FROM sales s 
INNER JOIN customers c 
ON s.customer_id = c.customer_id;

-- 16. Write a query to join the `Customers`, `Sales`, and `Products` tables, and show each customer's first and last name, product name, and quantity sold.
SELECT CONCAT(c.first_name,' ',c.last_name) as Customer_name,
	   p.product_name as Product_name,
	   s.quantity_sold as Total_sales
FROM sales s 
INNER JOIN customers c 
ON s.customer_id = c.customer_id 
INNER JOIN products p 
ON s.product_id = p.product_id;

-- 17. Write a query to perform a self-join on the `Customers` table and find all pairs of customers who have the same membership status.
SELECT CONCAT(c1.first_name,' ',c1.last_name) as Customer1_Name,
	   CONCAT(c2.first_name,' ',c2.last_name) as Customer2_Name
FROM customers c1
JOIN customers c2
ON c1.membership_status = c2.membership_status
WHERE c1.customer_id < c2.customer_id;

-- 18. Write a query to join the `Sales` and `Products` tables, and calculate the total number of sales for each product.
SELECT p.product_id, COUNT(s.product_id) AS Number_of_pdts
FROM products p 
INNER JOIN sales s 
ON p.product_id = s.product_id 
GROUP BY p.product_id;

-- 19. Write a query to find the products in the `Products` table where the stock quantity is less than 10.
SELECT * 
FROM products
WHERE stock_quantity < 10;

-- 20. Write a query to join the `Sales` table and the `Products` table, and find products with sales greater than 5.
SELECT 
    p.product_name,
    COUNT(s.sale_id) AS total_sales
FROM sales s
INNER JOIN products p 
ON s.product_id = p.product_id
GROUP BY p.product_name
HAVING COUNT(s.sale_id) > 5;

-- 21. Write a query to select customers who have purchased products that are either in the 'Electronics' or 'Appliances' category.
select distinct concat(c.first_name,' ',c.last_name) as customer_name,
	   p.category as Product_category
from customers c 
inner join sales s 
on c.customer_id = s.customer_id 
inner join products p 
on s.product_id = s.product_id 
where p.category in('Electronics', 'Appliances');

-- 22. Write a query to calculate the total sales amount per product and group the result by product name.
SELECT p.product_name AS Product_name,
	   SUM(s.total_amount) AS Sales_per_product
FROM sales s 
INNER JOIN products p 
ON s.product_id = p.product_id 
GROUP BY p.product_name
ORDER BY sales_per_product ASC;

-- 23. Write a query to join the `Sales` table with the `Customers` table and select customers who made a purchase in the year 2023.
SELECT CONCAT(c.first_name,' ',c.last_name) AS name,
	   s.sale_date AS purchase_date
FROM sales s 
INNER JOIN customers c 
ON s.customer_id = c.customer_id 
WHERE s.sale_date BETWEEN '2023-01-01' AND '2023-12-31';

-- 24. Write a query to find the customers with the highest total sales in 2023.
SELECT 
    CONCAT(c.first_name,' ',c.last_name) AS customer_name,
    SUM(s.total_amount) AS total_sales
FROM sales s
INNER JOIN customers c 
ON s.customer_id = c.customer_id
WHERE s.sale_date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY c.customer_id, customer_name 
ORDER BY total_sales DESC;

-- 25. Write a query to join the `Products` and `Sales` tables and select the most expensive product sold.
WITH max_price AS (
    SELECT MAX(p.price) AS highest_price
    FROM products p
)
SELECT 
    p.product_id,
    p.product_name,
    p.price
FROM products p
INNER JOIN sales s
    ON p.product_id = s.product_id
JOIN max_price mp
    ON p.price = mp.highest_price;

