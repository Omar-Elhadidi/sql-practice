-- Problem: Pharmacy Analytics (Part 1)
-- Platform: DataLemur (Easy)
-- URL: https://datalemur.com/questions/top-drugs-profit

SELECT drug, total_sales - cogs AS total_profit
FROM pharmacy_sales
ORDER BY total_profit DESC
LIMIT 3;
