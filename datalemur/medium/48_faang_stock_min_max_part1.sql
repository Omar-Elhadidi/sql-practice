-- Problem: FAANG Stock Min-Max (Part 1) (DataLemur - Medium)
-- URL: https://datalemur.com/questions/sql-bloomberg-stock-min-max-1
-- Note: Composite join on BOTH (ticker, open) is mandatory to prevent cross-ticker price collisions.

WITH cte AS (
  SELECT 
    ticker, 
    MAX(open) AS highest_open, 
    MIN(open) AS lowest_open
  FROM stock_prices
  GROUP BY ticker
)

SELECT 
  cte.ticker, 
  TO_CHAR(t1.date, 'Mon-YYYY') AS highest_mth, 
  cte.highest_open, 
  TO_CHAR(t2.date, 'Mon-YYYY') AS lowest_mth, 
  cte.lowest_open
FROM cte
JOIN stock_prices t1
  ON cte.ticker = t1.ticker
  AND cte.highest_open = t1.open
JOIN stock_prices t2
  ON cte.ticker = t2.ticker
  AND cte.lowest_open = t2.open
ORDER BY cte.ticker;
