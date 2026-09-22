-- Problem: Pharmacy Analytics (Part 2)
-- Platform: DataLemur (Easy)
-- URL: https://datalemur.com/questions/non-profitable-drugs

SELECT manufacturer, COUNT(product_id) AS drug_count, SUM(cogs - total_sales) AS total_loss
FROM pharmacy_sales 
WHERE cogs - total_sales > 0
GROUP BY manufacturer
ORDER BY total_loss DESC;
