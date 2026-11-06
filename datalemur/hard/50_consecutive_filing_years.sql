-- Problem: Consecutive Filing Years (DataLemur - Hard)
-- URL: https://datalemur.com/questions/consecutive-filing-years
-- Pattern: Consecutive Sequence Identification using symmetric LEAD and LAG offsets around the middle year.

WITH cte AS (
  SELECT DISTINCT
    user_id, 
    EXTRACT(YEAR FROM filing_date) AS filing_year 
  FROM filed_taxes
  WHERE product LIKE 'TurboTax%'
),
years AS (
  SELECT 
    user_id, 
    filing_year, 
    LEAD(filing_year) OVER (PARTITION BY user_id ORDER BY filing_year) AS following_year, 
    LAG(filing_year) OVER (PARTITION BY user_id ORDER BY filing_year) AS previous_year
  FROM cte
)
SELECT DISTINCT user_id
FROM years
WHERE filing_year + 1 = following_year 
  AND filing_year - 1 = previous_year
ORDER BY user_id;
