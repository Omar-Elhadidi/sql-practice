-- Problem: 3-Day Rolling Earnings (DataLemur - Hard)
-- URL: https://datalemur.com/questions/3d-rolling-earnings
-- Key Concept: Using RANGE BETWEEN INTERVAL '2 DAYS' PRECEDING instead of ROWS to correctly handle date gaps.

WITH cte AS (
  SELECT 
    user_id, 
    transaction_date, 
    SUM(amount) AS amount
  FROM user_transactions 
  GROUP BY user_id, transaction_date
)

SELECT 
  user_id, 
  transaction_date, 
  SUM(amount) OVER (
    PARTITION BY user_id 
    ORDER BY transaction_date 
    RANGE BETWEEN INTERVAL '2 DAYS' PRECEDING AND CURRENT ROW
  ) AS rolling_earnings_3d
FROM cte;
