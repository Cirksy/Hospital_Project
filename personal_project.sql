SELECT * FROM hospital_apparel.personal_project;

-- Percentage of Ladies' versus Men's jackets
SELECT category, (COUNT(category) * 100 / (SELECT COUNT(*) FROM hospital_apparel.personal_project)) AS gender_split_percent, COUNT(category) AS total
FROM hospital_apparel.personal_project
GROUP BY category;

/*Item quantities*/

-- Quantity of items ordered this year by product
SELECT product_name, product_id, SUM(qty)
FROM hospital_apparel.personal_project
GROUP BY product_id
ORDER BY SUM(qty) DESC;

-- Quantity of each color ordered by product
SELECT product_id, COUNT(color), color
FROM hospital_apparel.personal_project
GROUP BY product_id, color
ORDER BY product_id, color;

-- Lowest quantity of item color ordered
SELECT product_id, COUNT(color), color
FROM hospital_apparel.personal_project
GROUP BY product_id, color
HAVING COUNT(color) < 10;

/*Sales*/

-- Sales by month
SELECT month_submitted AS month, SUM(price) AS sales
FROM hospital_apparel.personal_project
GROUP BY month;

-- Highest sales months
SELECT month_submitted AS month, SUM(price) AS sales
FROM hospital_apparel.personal_project
GROUP BY month
ORDER BY sales DESC;

-- Sales by item
SELECT product_name AS Product, product_id AS ProductID, SUM(price) AS Total_Sales
FROM hospital_apparel.personal_project
GROUP BY product_id
ORDER BY Total_Sales DESC;

/* Understanding departments */

-- number and quantity by department
SELECT COUNT(DISTINCT department)
FROM hospital_apparel.personal_project;

-- Checking how many orders were ordered under each department
SELECT COUNT(department), department
FROM hospital_apparel.personal_project
GROUP BY department
ORDER BY COUNT(department) DESC;

-- Months that Group Orders were submitted
SELECT month_submitted AS Month, department AS Department
FROM hospital_apparel.personal_project
GROUP BY department;

-- Finding the average number of items per order
SELECT order_id, SUM(qty)
FROM hospital_apparel.personal_project
GROUP BY order_id;

-- Average number of items per order
SELECT SUM(qty) / COUNT(DISTINCT order_id) AS "Average"
FROM hospital_apparel.personal_project;