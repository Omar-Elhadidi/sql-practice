-- Problem: User's Third Transaction
-- Platform: DataLemur (Medium)
-- URL: https://datalemur.com/questions/sql-third-transaction

WITH ranked_transactions AS (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY transaction_date) AS row_num
  FROM transactions
)
SELECT user_id, spend, transaction_date
FROM ranked_transactions
WHERE row_num = 3;
