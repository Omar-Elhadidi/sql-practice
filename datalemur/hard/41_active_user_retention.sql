-- Problem: Active User Retention (DataLemur - Hard)
-- URL: https://datalemur.com/questions/user-retention

WITH june AS (
  SELECT DISTINCT EXTRACT(MONTH FROM event_date) AS mth, user_id
  FROM user_actions
  WHERE event_date >= '2022-06-01' AND event_date < '2022-07-01'
), 
july AS (
  SELECT DISTINCT EXTRACT(MONTH FROM event_date) AS mth, user_id
  FROM user_actions
  WHERE event_date >= '2022-07-01' AND event_date < '2022-08-01'
)

SELECT july.mth AS month, COUNT(*) AS monthly_active_users
FROM july
JOIN june 
  ON july.user_id = june.user_id
GROUP BY july.mth;
