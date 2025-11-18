create database superstore_db;

USE superstore_db;

SELECT * FROM superstore_db.`sample - superstore`;

DESCRIBE superstore_db.`sample - superstore`;

SHOW TABLES FROM superstore_db;

-- WHERE – filter rows

SELECT *
FROM superstore_db.`sample - superstore`
WHERE State = 'California';

-- ORDER BY – sorting
SELECT 
`Order ID`,
`Sales`
FROM 
    superstore_db.`sample - superstore`
ORDER BY `Sales` DESC
LIMIT 1000;

-- GROUP BY – aggregate functions

SELECT Category, SUM(Sales) AS Total_Sales
FROM superstore_db.`sample - superstore`
GROUP BY Category
ORDER BY Total_Sales DESC;

SELECT `Region`, SUM(`Sales`) AS Total_Sales
FROM superstore_db.`sample - superstore`
GROUP BY `Region`
ORDER BY Total_Sales DESC;

SELECT `Profit`, SUM(`Sales`) AS Total_Sales
FROM superstore_db.`sample - superstore`
GROUP BY `Profit`
ORDER BY Total_Sales DESC;

-- COUNT – number of orders
SELECT COUNT(*) AS Total_Orders
FROM superstore_db.`sample - superstore`;

-- INNER JOIN – Combine tables
  
SELECT 
    O.`Order ID`,
    C.`Customer Name`,
    O.`Sales`
FROM 
    superstore_db.`sample - superstore` O
INNER JOIN 
    superstore_db.`sample - superstore` C
ON 
    O.`Customer ID` = C.`Customer ID`;

-- Join Orders with Products table
SELECT 
    O.`Order ID`,
    P.`Product Name`,
    O.`Quantity`,
    O.`Sales`
FROM 
    superstore_db.`sample - superstore` O
INNER JOIN 
    superstore_db.`sample - superstore` P
ON 
    O.`Product ID` = P.`Product ID`;
    
    -- LIMIT restrict number of rows
    
    SELECT *

FROM  superstore_db.`sample - superstore`
LIMIT 500;

-- AS – rename columns

SELECT `Order ID` AS ID, Sales AS `Total_Sales`
FROM superstore_db.`sample - superstore`;

-- Date Functions
-- Your SQL engine might use MONTH() or STRFTIME() depending on MySQL, SQL Server, or SQLite.

SELECT 
    MONTH(`Order Date`) AS Month_No,
    SUM(`Sales`) AS Total_Sales
FROM superstore_db.`sample - superstore`
GROUP BY MONTH(`Order Date`)
ORDER BY Month_No;

SELECT 
    `Order ID`,
    DATEDIFF(`Ship Date`, `Order Date`) AS `Shipping_Days`
FROM superstore_db.`sample - superstore`;
-- Top 5 customers by total sales:

SELECT `Customer ID`, SUM(Sales) AS Total_Sales
FROM superstore_db.`sample - superstore`
GROUP BY `Customer ID`
ORDER BY Total_Sales DESC
LIMIT 5;

-- Profit by Region:
SELECT `Region`, SUM(Profit) AS Total_Profit
FROM superstore_db.`sample - superstore`
GROUP BY `Region`
ORDER BY Total_Profit DESC;
-- Most sold product (by quantity):

SELECT `Product ID`, SUM(Quantity) AS Total_Quantity
FROM superstore_db.`sample - superstore`
GROUP BY `Product ID`
ORDER BY Total_Quantity DESC
LIMIT 5;
-- Discount impact on sales:
SELECT 
    AVG(`Discount`) AS Avg_Discount,
    SUM(`Sales`) AS Total_Sales
FROM superstore_db.`sample - superstore`;

SELECT `Sales`
FROM superstore_db.`sample - superstore`
ORDER BY `Sales` DESC
LIMIT 1 OFFSET 1;
-- LEFT JOIN
SELECT *
FROM superstore_db.`sample - superstore` O
LEFT JOIN superstore_db.`sample - superstore` C
    ON C.`Customer ID` = O.`Customer ID`;
    
-- use LEFT JOIN?
SELECT 
    C.`Customer ID`, 
    C.`Customer Name`
FROM 
    superstore_db.`sample - superstore` C
LEFT JOIN 
    superstore_db.`sample - superstore` O
ON 
    C.`Customer ID` = O.`Customer ID`
WHERE 
    O.`Order ID` IS NULL;
