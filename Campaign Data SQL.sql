select * from dim_campaigns
select * from dim_products
select * from dim_stores
select * from fact_events

-- 1. Find the total number of events recorded.

SELECT COUNT(*) AS Total_Events
FROM fact_events;

-- 2. Find the total quantity sold before and after promotions.

SELECT 
    SUM([quantity_sold_before_promo]) AS Total_Quantity_Before,
    SUM([quantity_sold_after_promo]) AS Total_Quantity_After
FROM fact_events;

-- 3. Find the number of events for each promotion type.

SELECT 
    promo_type,
    COUNT(*) AS Total_Events
FROM fact_events
GROUP BY promo_type
ORDER BY Total_Events DESC;

-- 4. Find total quantity sold after promotion for each promotion type.

SELECT 
    promo_type,
    SUM([quantity_sold_after_promo]) AS Quantity_After_Promo
FROM fact_events
GROUP BY promo_type
ORDER BY Quantity_After_Promo DESC;

-- 5. Find total sales by city.

SELECT 
    s.city,
    SUM(
        f.base_price * f.[quantity_sold_before_promo]
        +
        (
            f.base_price -
            CASE
                WHEN f.promo_type = '500 Cashback' THEN 500
                WHEN f.promo_type = 'BOGOF' THEN f.base_price * 0.50
                WHEN f.promo_type = '25% OFF' THEN f.base_price * 0.25
                WHEN f.promo_type = '33% OFF' THEN f.base_price * 0.33
                WHEN f.promo_type = '50% OFF' THEN f.base_price * 0.50
                ELSE 0
            END
        ) * f.[quantity_sold_after_promo]
    ) AS Total_Sales
FROM fact_events f
JOIN dim_stores s
    ON f.store_id = s.store_id
GROUP BY s.city
ORDER BY Total_Sales DESC;

-- 6. Find total sales for each product category.

SELECT 
    p.category,
    SUM(
        f.base_price * f.[quantity_sold_before_promo]
        +
        (
            f.base_price -
            CASE
                WHEN f.promo_type = '500 Cashback' THEN 500
                WHEN f.promo_type = 'BOGOF' THEN f.base_price * 0.50
                WHEN f.promo_type = '25% OFF' THEN f.base_price * 0.25
                WHEN f.promo_type = '33% OFF' THEN f.base_price * 0.33
                WHEN f.promo_type = '50% OFF' THEN f.base_price * 0.50
                ELSE 0
            END
        ) * f.[quantity_sold_after_promo]
    ) AS Total_Sales
FROM fact_events f
JOIN dim_products p
    ON f.product_code = p.product_code
GROUP BY p.category
ORDER BY Total_Sales DESC;

-- 7. Find the top 10 products based on quantity sold after promotion.

SELECT TOP 10
    p.product_name,
    SUM(f.quantity_sold_after_promo) AS Quantity_Sold
FROM fact_events f
JOIN dim_products p
    ON f.product_code = p.product_code
GROUP BY p.product_name
ORDER BY Quantity_Sold DESC;

-- 8. Find the average base price for each promotion type.

SELECT 
    promo_type,
    AVG(base_price) AS Average_Base_Price
FROM fact_events
GROUP BY promo_type
ORDER BY Average_Base_Price DESC;

-- 9. Find promotion types where the total quantity sold after promotion is 
--    greater than 100,000.

SELECT 
    promo_type,
    SUM([quantity_sold_after_promo]) AS Quantity_After_Promo
FROM fact_events
GROUP BY promo_type
HAVING SUM([quantity_sold_after_promo]) > 100000
ORDER BY Quantity_After_Promo DESC;

-- 10. Find products that were sold in more than 5 different stores.

SELECT 
    p.product_name,
    COUNT(DISTINCT f.store_id) AS Number_of_Stores
FROM fact_events f
JOIN dim_products p
    ON f.product_code = p.product_code
GROUP BY p.product_name
HAVING COUNT(DISTINCT f.store_id) > 5
ORDER BY Number_of_Stores DESC;

-- 11. Calculate the percentage increase in quantity sold after promotion for 
--     each promotion type.

SELECT 
    promo_type,
    SUM([quantity_sold_before_promo]) AS Before_Promo,
    SUM([quantity_sold_after_promo]) AS After_Promo,
    ROUND(
        (
            (SUM(quantity_sold_after_promo) -
             SUM([quantity_sold_before_promo])) * 100.0
        )
        / NULLIF(SUM([quantity_sold_before_promo]), 0),
        2
    ) AS Increase_Percentage
FROM fact_events
GROUP BY promo_type
ORDER BY Increase_Percentage DESC;

-- 12. Find the top 5 products based on total sales.

SELECT TOP 5
    p.product_name,
    SUM(
        f.base_price * f.[quantity_sold_before_promo]
        +
        (
            f.base_price -
            CASE
                WHEN f.promo_type = '500 Cashback' THEN 500
                WHEN f.promo_type = 'BOGOF' THEN f.base_price * 0.50
                WHEN f.promo_type = '25% OFF' THEN f.base_price * 0.25
                WHEN f.promo_type = '33% OFF' THEN f.base_price * 0.33
                WHEN f.promo_type = '50% OFF' THEN f.base_price * 0.50
                ELSE 0
            END
        ) * f.[quantity_sold_after_promo]
    ) AS Total_Sales
FROM fact_events f
JOIN dim_products p
    ON f.product_code = p.product_code
GROUP BY p.product_name
ORDER BY Total_Sales DESC;

-- 13. Find the city with the highest quantity sold after promotion.

SELECT TOP 1
    s.city,
    SUM(f.[quantity_sold_after_promo]) AS Total_Quantity
FROM fact_events f
JOIN dim_stores s
    ON f.store_id = s.store_id
GROUP BY s.city
ORDER BY Total_Quantity DESC;

-- 14. Find the top-selling product in each city.

WITH ProductCitySales AS
(
    SELECT
        s.city,
        p.product_name,
        SUM(f.[quantity_sold_after_promo]) AS Total_Quantity,
        RANK() OVER
        (
            PARTITION BY s.city
            ORDER BY SUM(f.[quantity_sold_after_promo]) DESC
        ) AS Product_Rank
    FROM fact_events f
    JOIN dim_stores s
        ON f.store_id = s.store_id
    JOIN dim_products p
        ON f.product_code = p.product_code
    GROUP BY
        s.city,
        p.product_name
)
SELECT
    city,
    product_name,
    Total_Quantity
FROM ProductCitySales
WHERE Product_Rank = 1
ORDER BY city;

-- 15. Rank promotion types based on their quantity increase percentage.

WITH PromotionPerformance AS
(
    SELECT
        promo_type,
        SUM([quantity_sold_before_promo]) AS Before_Promo,
        SUM([quantity_sold_after_promo]) AS After_Promo,
        ROUND(
            (
                (SUM([quantity_sold_after_promo]) -
                 SUM([quantity_sold_before_promo])) * 100.0
            )
            / NULLIF(SUM([quantity_sold_before_promo]), 0),
            2
        ) AS Increase_Percentage
    FROM fact_events
    GROUP BY promo_type
)
SELECT
    promo_type,
    Before_Promo,
    After_Promo,
    Increase_Percentage,
    RANK() OVER
    (
        ORDER BY Increase_Percentage DESC
    ) AS Promotion_Rank
FROM PromotionPerformance
ORDER BY Promotion_Rank;