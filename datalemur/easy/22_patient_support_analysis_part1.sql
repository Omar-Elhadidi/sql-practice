-- Problem: Patient Support Analysis (Part 1)
-- Platform: DataLemur (Easy)
-- URL: https://datalemur.com/questions/frequent-callers

WITH cte AS (
  SELECT policy_holder_id
  FROM callers
  GROUP BY policy_holder_id
  HAVING COUNT(case_id) > 2
)
SELECT COUNT(policy_holder_id) AS policy_holder_count
FROM cte;
