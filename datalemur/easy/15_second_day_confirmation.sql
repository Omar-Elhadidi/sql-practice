-- Problem: Second Day Confirmation
-- Platform: DataLemur (Easy)
-- URL: https://datalemur.com/questions/second-day-confirmation

SELECT e.user_id
FROM emails e
INNER JOIN texts t
  ON e.email_id = t.email_id
WHERE DATE(e.signup_date) + 1 = DATE(t.action_date) 
  AND t.signup_action = 'Confirmed';
