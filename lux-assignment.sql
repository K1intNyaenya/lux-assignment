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
SELECT p.product_id,
       p.product_name,
       p.price
FROM products p
INNER JOIN sales s
ON p.product_id = s.product_id
JOIN max_price mp
ON p.price = mp.highest_price;

-- 26. Write a query to find the total number of customers who have purchased products worth more than 500.
WITH cc AS (
	SELECT s.customer_id, 
	  	   s.total_amount AS Cost
	FROM sales s 
	WHERE s.total_amount > 500
)
SELECT count(cc)
FROM cc;

-- 27. Write a query to join the `Products`, `Sales`, and `Customers` tables and find the total number of sales made by customers who are in the 'Gold' membership tier.
WITH gold_cus AS (
    SELECT c.customer_id AS id
    FROM customers c
    WHERE c.membership_status = 'Gold'
)
SELECT 
    p.product_name,
    COUNT(s.sale_id) AS total_sales
FROM sales s
INNER JOIN gold_cus gc
ON s.customer_id = gc.id
INNER JOIN products p
ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sales DESC;

-- 28. Write a query to join the `Products` and `Inventory` tables and find all products that have low stock (less than 10).
SELECT p.product_name,
	   i.stock_quantity 
FROM products p 
INNER JOIN inventory i 
ON p.product_id = i.product_id 
WHERE i.stock_quantity < 10;

-- 29. Write a query to find customers who have purchased more than 5 products and show the total quantity of products they have bought.
SELECT c.first_name AS name,
	   s.product_id AS pid,
	   s.quantity_sold AS qs
FROM sales s 
INNER JOIN customers c 
ON s.customer_id = c.customer_id 
WHERE s.quantity_sold > 5;

-- 31. Write a query to find the number of sales made in the month of December 2023.
SELECT count(*) AS Dec_total_sales
FROM sales s 
WHERE s.sale_date BETWEEN '2023-12-01' AND '2023-12-31';

-- 32. Write a query to find the total amount spent by each customer in 2023 and list the customers in descending order.
SELECT CONCAT(c.first_name,' ',c.last_name) AS name,
	   s.total_amount AS Amount
FROM sales s 
INNER JOIN customers c 
ON s.customer_id = c.customer_id 
WHERE s.sale_date BETWEEN '2023-01-01' AND '2023-12-31'
ORDER BY Amount DESC;

-- 33. Write a query to find all products that have been sold but have less than 5 units left in stock.
SELECT s.product_id AS pid,
	   p.product_name AS product_name,
	   i.stock_quantity AS Stock
FROM sales s 
INNER JOIN inventory i 
ON s.product_id = i.product_id 
INNER JOIN products p 
ON i.product_id = p.product_id 
WHERE i.stock_quantity < 5;

-- 34. Write a query to find the total sales for each product and order the result by the highest sales.
SELECT s.product_id AS pid,
	   p.product_name AS name,
	   s.total_amount AS Amount
FROM sales s 
INNER JOIN products p 
ON s.product_id = p.product_id 
ORDER BY Amount DESC;

-- 35. Write a query to find all customers who bought products within 7 days of their registration date.
select concat(c.first_name,' ',c.last_name) as name,
	   c.registration_date as reg_date,
	   s.sale_date sales_date
from customers c 
inner join sales s 
on c.customer_id = s.customer_id
WHERE s.sale_date BETWEEN c.registration_date 
AND c.registration_date + INTERVAL '7 days';

-- 36. Write a query to join the `Sales` table with the `Products` table and filter the results by products priced between 100 and 500.
select s.product_id as pid,
	   p.product_name Pdt_name,
	   p.price as Price
from sales s 
inner join products p 
on s.product_id = p.product_id 
where p.price between 100 and 500;

-- 37. Write a query to find the most frequent customer who made purchases from the `Sales` table.
SELECT concat(c.first_name,' ',c.last_name) AS name,
	   count(s.customer_id) AS frequency
FROM sales s 
INNER JOIN customers c 
ON s.customer_id = c.customer_id
GROUP BY c.first_name, c.last_name  
ORDER BY frequency DESC
LIMIT 1;

-- 38. Write a query to find the total quantity of products sold per customer.
SELECT 
    CONCAT(c.first_name,' ',c.last_name) AS customer_name,
    SUM(s.quantity_sold) AS total_quantity_sold
FROM sales s
INNER JOIN customers c
ON s.customer_id = c.customer_id
GROUP BY c.first_name, c.last_name;

-- 39. Write a query to find the products with the highest stock and lowest stock, and display them together in a single result set.
SELECT max(i.stock_quantity) AS Highest_stock,
	   min(i.stock_quantity) AS Lowest_stock
FROM inventory i;

-- 40. Write a query to find products whose names contain the word 'Phone' and their total sales.
SELECT p.product_name AS Pdt_names,
	   sum(p.price) AS total_sales
FROM products p 
WHERE p.product_name LIKE('%phone%')
GROUP BY p.product_name;

-- 41. Write a query to perform an `INNER JOIN` between `Customers` and `Sales`, then display the total sales amount and the product names for customers in the 'Gold' membership status.
SELECT p.product_name AS pdt_name,
	   s.total_amount AS total_sales_amount,
	   c.membership_status AS status
FROM customers c 
INNER JOIN sales s 
ON c.customer_id = s.customer_id 
INNER JOIN products p 
ON s.product_id = p.product_id 
WHERE c.membership_status = 'Gold'

-- 42. Write a query to find the total sales of products by category.
SELECT p.category,
       p.product_name,
       s.total_amount,
       SUM(s.total_amount) OVER (PARTITION BY p.category) AS total_sales_by_category
FROM sales s
INNER JOIN products p
ON s.product_id = p.product_id;

-- 43. Write a query to join the `Products` table with the `Sales` table, and calculate the total sales for each product, grouped by month and year.
SELECT p.product_name AS name,
	   extract (year from s.sale_date) AS sale_year,
	   extract (month from s.sale_date) AS sale_month,
	   SUM(s.total_amount) over (
	   	   PARTITION BY p.product_name, extract (YEAR FROM s.sale_date), extract (MONTH FROM s.sale_date)
	   ) AS total_sales
FROM products p 
INNER JOIN sales s 
ON p.product_id = s.customer_id;

-- 44. Write a query to join the `Sales` and `Inventory` tables and find products that have been sold but still have stock remaining.
SELECT  p.product_name,
        s.quantity_sold,
        i.stock_quantity
FROM sales s
INNER JOIN inventory i
ON s.product_id = i.product_id
INNER JOIN products p
ON p.product_id = s.product_id
WHERE i.stock_quantity > 0; 
	
-- 45. Write a query to find the top 5 customers who have made the highest purchases.
SELECT concat(c.first_name,' ',c.last_name) AS name,
	   sum(s.total_amount) AS Amount
FROM sales s 
INNER JOIN customers c 
ON s.customer_id = c.customer_id
GROUP BY "name" 
ORDER BY amount DESC 
LIMIT 5;

-- 46. Write a query to calculate the total number of unique products sold in 2023.
SELECT DISTINCT COUNT(s.product_id) AS Unique_pdts,
	   p.product_name AS pdt_name,
	   s.sale_date AS date
FROM sales s 
INNER JOIN products p 
ON s.product_id = p.product_id 
WHERE s.sale_date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY p.product_name, s.sale_date;

-- 47. Write a query to find the products that have not been sold in the last 6 months.
SELECT p.product_id,
       p.product_name
FROM products p
WHERE NOT EXISTS (
    SELECT 1
    FROM sales s
    WHERE s.product_id = p.product_id
    AND s.sale_date >= CURRENT_DATE - INTERVAL '6 months'
);

-- 48. Write a query to select the products with a price range between $200 and $800, and find the total quantity sold for each.
SELECT p.product_name,
       p.price,
       SUM(s.quantity_sold) AS total_quantity_sold
FROM products p
JOIN sales s
ON p.product_id = s.product_id
WHERE p.price BETWEEN 200 AND 800
GROUP BY p.product_name, p.price;

-- 49. Write a query to find the customers who spent the most money in the year 2023.
SELECT 
    CONCAT(c.first_name,' ',c.last_name) AS customer_name,
    SUM(s.total_amount) AS total_spent
FROM customers c
JOIN sales s
ON c.customer_id = s.customer_id
WHERE EXTRACT(YEAR FROM s.sale_date) = 2023
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 1;

-- 50. Write a query to select the products that have been sold more than 100 times and have a price greater than 200.
SELECT p.product_name,
       p.price,
       SUM(s.quantity_sold) AS total_sold
FROM products p
JOIN sales s
ON p.product_id = s.product_id
WHERE p.price > 200
GROUP BY p.product_name, p.price
HAVING SUM(s.quantity_sold) > 100;
