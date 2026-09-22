-- Problem: Pharmacy Analytics (Part 3)
-- Platform: DataLemur (Easy)
-- URL: https://datalemur.com/questions/total-drugs-sales

SELECT manufacturer, CONCAT('$', ROUND(SUM(total_sales) / 1000000), ' million') AS sale 
FROM pharmacy_sales
GROUP BY manufacturer
ORDER BY SUM(total_sales) DESC, manufacturer;
