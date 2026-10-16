-- Problem: Patient Support Analysis (Part 2) (DataLemur - Medium)
-- URL: https://datalemur.com/questions/uncategorized-calls-percentage

WITH cte AS (
  SELECT  
    CASE 
      WHEN call_category IS NULL OR call_category = 'n/a' THEN 1 
      ELSE 0
    END AS uncategorised_calls 
  FROM callers
)

SELECT ROUND((SUM(uncategorised_calls) * 1.0 / COUNT(uncategorised_calls)) * 100, 1) AS uncategorised_call_pct
FROM cte;
