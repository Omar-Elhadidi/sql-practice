-- Problem: Sending vs. Opening Snaps
-- Platform: DataLemur (Medium)
-- URL: https://datalemur.com/questions/time-spent-snaps

WITH cte AS (
  SELECT 
    age_bucket,
    SUM(CASE WHEN activity_type = 'open' THEN time_spent END) AS time_opened, 
    SUM(CASE WHEN activity_type = 'send' THEN time_spent END) AS time_send
  FROM activities act
  JOIN age_breakdown age
    ON act.user_id = age.user_id
  GROUP BY age_bucket
)
SELECT 
  age_bucket, 
  ROUND(time_send / (time_opened + time_send) * 100.0, 2) AS send_perc,
  ROUND(time_opened / (time_opened + time_send) * 100.0, 2) AS open_perc
FROM cte;
