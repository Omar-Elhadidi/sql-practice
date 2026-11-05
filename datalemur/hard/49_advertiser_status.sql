-- Problem: Advertiser Status (DataLemur - Hard)
-- URL: https://datalemur.com/questions/updated-status
-- Pattern: Cumulative State-Transition Dimension (FULL OUTER JOIN yesterday's state with today's events + COALESCE natural key).

SELECT 
  COALESCE(adv.user_id, pay.user_id) AS user_id,
  CASE 
    WHEN pay.paid IS NULL THEN 'CHURN'
    WHEN adv.status = 'CHURN' AND pay.paid IS NOT NULL THEN 'RESURRECT'
    WHEN adv.status IS NULL AND pay.paid IS NOT NULL THEN 'NEW'
    ELSE 'EXISTING'
  END AS new_status
FROM advertiser adv
FULL OUTER JOIN daily_pay pay
  ON adv.user_id = pay.user_id
ORDER BY user_id;
