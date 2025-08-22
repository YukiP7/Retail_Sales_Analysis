# 🛒 Retail Sales Analysis (Kaggle API + Python + SQL)

## 📌 Project Overview  
Retail businesses generate large volumes of order and sales data. However, raw data is often messy and unstructured.
The objective of this project was to analyze two years of retail transaction data (2022 & 2023) to identify sales trends, profit growth, and business insights that can help management make data-driven decisions.
The goal was to simulate a real-world analytics pipeline:

1. **Data Ingestion** – Downloaded raw dataset from Kaggle API.  
2. **Data Cleaning & EDA** – Performed using Python (Pandas, NumPy, Matplotlib).  
3. **Database Integration** – Loaded cleaned data into MySQL.  
4. **SQL Analytics** – Solved key business questions using advanced SQL queries.    

---

## 📂 Dataset  
- **Source**: [Kaggle - Retail Orders Dataset](https://www.kaggle.com/datasets/ankitbansal06/retail-orders)  
- **Description**: Contains order-level details like product, category, region, sales, and profit.  
- **Key Columns**:  
  - `order_id` – Unique identifier for each order  
  - `order_date` – Date of the order  
  - `region`, `city`, `state` , `postal_code` – Geographic information  
  - `category`, `sub_category`, `product_id`, `ship_mode`, `segment` – Product details  
  - `cost_price`, `list_price`, `quantity`, `discount_percent` – Financial & sales metrics  

- **Derived Columns**: 
    - `sale_price`, `profit`, `discount` - Financial & sales metrics 

---

## 🔑 Business Questions Answered  

    1. Top 10 highest revenue-generating products  
    2. Top 5 highest selling products in each region
    3. Month-over-Month Sales Growth(2022 vs 2023)
    4. For each category, which month had highest sales?
    5. Which sub-category had highest profit growth(2023 vs 2022)?

##  🛠️ Tech Stack

    1. Kaggle API – Data extraction
    2. Python – Data cleaning, preprocessing, EDA
    3. MySQL – Data storage & SQL queries
    4. GitHub – Version control & documentation

##  📈 Key Insights

    1. Certain products dominate sales revenue across regions.
    2. Sales seasonality exists: peak months vary by category.
    3. Some sub-categories show high year over year profit growth → strong candidates for expansion.
    4. Regional product preferences highlight localized demand patterns.
