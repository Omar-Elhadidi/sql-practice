-- Problem: International Call Percentage (DataLemur - Medium)
-- URL: https://datalemur.com/questions/international-call-percentage

WITH cte AS (
  SELECT 
    c.caller_id,
    c.receiver_id, 
    i1.phone_number AS caller_phone_number, 
    i2.phone_number AS receiver_phone_number,
    CASE 
      WHEN i1.country_id = i2.country_id THEN 0 
      ELSE 1
    END AS international_calls
  FROM phone_calls c
  JOIN phone_info i1
    ON c.caller_id = i1.caller_id
  JOIN phone_info i2
    ON c.receiver_id = i2.caller_id
)

SELECT ROUND(SUM(international_calls) * 1.0 / COUNT(international_calls) * 100, 1) AS international_calls_pct
FROM cte;
