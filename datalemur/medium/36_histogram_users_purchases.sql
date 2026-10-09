-- Problem: Histogram of Users and Purchases (DataLemur - Medium)
-- URL: https://datalemur.com/questions/histogram-users-purchases

WITH cte AS (
  SELECT transaction_date, user_id, COUNT(product_id) AS purchase_count
  FROM user_transactions
  GROUP BY transaction_date, user_id 
),
date_ranking AS (
  SELECT *, ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY transaction_date DESC) AS rn
  FROM cte 
)

SELECT transaction_date, user_id, purchase_count
FROM date_ranking
WHERE rn = 1
ORDER BY transaction_date;
