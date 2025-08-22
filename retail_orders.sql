CREATE DATABASE retaildb;
USE retaildb;

CREATE TABLE retail_orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    ship_mode VARCHAR(50),
    segment VARCHAR(50),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(20),
    region VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_id VARCHAR(255),
    quantity INT,
    discount DECIMAL(7,2),
    sale_price INT , 
    profit DECIMAL(7,2)
);
SELECT * FROM retail_orders LIMIT 5 ;

-- find top 10 highest reveue generating products 
SELECT product_id , SUM(sale_price) as sales_revenue 
FROM retail_orders
GROUP BY product_id
ORDER BY sales_revenue DESC 
LIMIT 10; 



-- find top 5 highest selling products in each region
WITH ranked_products AS (
    SELECT  
        region, 
        product_id, 
        SUM(sale_price) AS sales,
        ROW_NUMBER() OVER(PARTITION BY region ORDER BY SUM(sale_price) DESC ) AS rn 
    FROM retail_orders
    GROUP BY region, product_id
)

SELECT region , product_id , sales FROM ranked_products WHERE rn <= 5 ;


-- find month over month growth comparison for 2022 and 2023 sales eg : jan 2022 vs jan 2023
WITH sales_2022 AS (
	SELECT MONTH(order_date) as month , SUM(sale_price) as sales  
	FROM retail_orders
	WHERE YEAR(order_date) = 2022 
    GROUP BY MONTH(order_date)
),
sales_2023 AS (
	SELECT MONTH(order_date) as month, SUM(sale_price) as sales  
	FROM retail_orders
	WHERE YEAR(order_date) = 2023 
    GROUP BY MONTH(order_date)
)

SELECT a.month , a.sales as sales_2022 , b.sales as sales_2023 , ABS(b.sales - a.sales) AS diff
FROM sales_2022 a 
JOIN sales_2023 b ON b.month = a.month
ORDER BY month ;

-- for each category which month had highest sales 
WITH monthly_sales AS( 
	SELECT category , DATE_FORMAT(order_date, '%Y-%m') as order_year_month , SUM(sale_price) as sales
	FROM retail_orders
	GROUP BY category , DATE_FORMAT(order_date, '%Y-%m')
) , 
ranked_sales AS (
	SELECT * , RANK() OVER(PARTITION BY category ORDER BY sales DESC) AS rn 
    FROM monthly_sales
)
SELECT category , order_year_month , sales
FROM ranked_sales 
WHERE rn = 1 ;

-- which sub category had highest growth by profit in 2023 compare to 2022
WITH profit_2022 AS (
	SELECT sub_category , SUM(profit) as growth_by_profit 
	FROM retail_orders 
    WHERE YEAR(order_date) = 2022 
	GROUP BY sub_category
),
profit_2023 AS (
	SELECT sub_category , SUM(profit) as growth_by_profit
	FROM retail_orders 
    WHERE YEAR(order_date) = 2023 
	GROUP BY sub_category
),
growth AS (
	SELECT a.sub_category , a.growth_by_profit AS profit_2022 , b.growth_by_profit AS profit_2023,
    (b.growth_by_profit  - a.growth_by_profit ) AS growth_diff
    FROM profit_2022 a
    JOIN profit_2023 b ON a.sub_category = b.sub_category
)

SELECT * FROM growth ORDER BY growth_diff DESC  LIMIT 1;
	

