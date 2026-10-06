-- Problem: Amazon Shopping Spree (DataLemur - Medium)
-- URL: https://datalemur.com/questions/amazon-shopping-spree

WITH user_dates AS (
  SELECT DISTINCT 
    user_id, 
    DATE(transaction_date) AS txn_date
  FROM transactions
),
tracked_dates AS (
  SELECT 
    user_id,
    txn_date,
    LEAD(txn_date, 1) OVER (PARTITION BY user_id ORDER BY txn_date) AS next_day,
    LEAD(txn_date, 2) OVER (PARTITION BY user_id ORDER BY txn_date) AS day_after
  FROM user_dates
)
SELECT DISTINCT user_id
FROM tracked_dates
WHERE next_day = txn_date + 1 
  AND day_after = txn_date + 2
ORDER BY user_id;
