-- Problem: Highest-Grossing Items
-- Platform: DataLemur (Medium)
-- URL: https://datalemur.com/questions/sql-highest-grossing

WITH cte AS (
  SELECT category, product, SUM(spend) AS total_spend
  FROM product_spend
  WHERE transaction_date >= '2022-01-01' AND transaction_date < '2023-01-01'
  GROUP BY category, product
), 
ranked_products AS (
  SELECT *, DENSE_RANK() OVER (PARTITION BY category ORDER BY total_spend DESC) AS ranking
  FROM cte
)
SELECT category, product, total_spend
FROM ranked_products
WHERE ranking <= 2;
