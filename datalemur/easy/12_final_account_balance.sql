-- Problem: Final Account Balance
-- Platform: DataLemur (Easy)
-- URL: https://datalemur.com/questions/sql-final-account-balance

WITH total_deposited AS (
  SELECT account_id, SUM(amount) AS deposited_amnt
  FROM transactions
  WHERE transaction_type = 'Deposit'
  GROUP BY account_id
),
total_withdrawn AS (
  SELECT account_id, SUM(amount) AS withdrawn_amnt
  FROM transactions
  WHERE transaction_type = 'Withdrawal'
  GROUP BY account_id
)
SELECT 
  d.account_id, 
  (d.deposited_amnt - w.withdrawn_amnt) AS final_balance
FROM total_deposited d
FULL JOIN total_withdrawn w
  ON d.account_id = w.account_id;

-- Alternative single-pass approach:
-- Instead of scanning the table twice with two CTEs and a FULL JOIN,
-- we can do it in one pass by treating deposits as positive and withdrawals as negative:
--
-- SELECT 
--   account_id,
--   SUM(CASE 
--         WHEN transaction_type = 'Deposit' THEN amount 
--         ELSE -amount 
--       END) AS final_balance
-- FROM transactions
-- GROUP BY account_id;
