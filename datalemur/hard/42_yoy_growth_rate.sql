-- Problem: Y-on-Y Growth Rate (DataLemur - Hard)
-- URL: https://datalemur.com/questions/yoy-growth-rate

WITH cte AS (
  SELECT 
    EXTRACT(YEAR FROM transaction_date) AS year, 
    product_id, 
    SUM(spend) AS curr_year_spend,
    LAG(SUM(spend)) OVER (
      PARTITION BY product_id 
      ORDER BY EXTRACT(YEAR FROM transaction_date)
    ) AS prev_year_spend
  FROM user_transactions
  GROUP BY EXTRACT(YEAR FROM transaction_date), product_id
)

SELECT 
  year,
  product_id,
  curr_year_spend,
  prev_year_spend,
  ROUND((curr_year_spend - prev_year_spend) * 100.0 / prev_year_spend, 2) AS yoy_rate
FROM cte;
