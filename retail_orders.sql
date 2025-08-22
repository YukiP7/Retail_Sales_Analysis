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





-- for each category which month had highest sales 




-- which sub category had highest growth by profit in 2023 compare to 2022



	

