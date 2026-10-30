-- Problem: Repeat Purchases on Multiple Days (DataLemur - Medium)
-- URL: https://datalemur.com/questions/sql-repeat-purchases
-- Pattern: Multi-attribute grouping (user + product) with distinct date truncation.

WITH cte AS (  
  SELECT 
    user_id, 
    product_id, 
    COUNT(DISTINCT purchase_date::DATE) AS purchase_days
  FROM purchases
  GROUP BY user_id, product_id
  HAVING COUNT(DISTINCT purchase_date::DATE) > 1
)

-- Using COUNT(DISTINCT user_id) protects against edge cases where a user
-- qualifies as a repeat buyer across multiple different products.
SELECT COUNT(DISTINCT user_id) AS repeat_purchasers
FROM cte;
