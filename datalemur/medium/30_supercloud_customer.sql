-- Problem: Supercloud Customer
-- Platform: DataLemur (Medium)
-- URL: https://datalemur.com/questions/supercloud-customer

WITH customer_categories AS (
  SELECT c.customer_id, p.product_category, ROW_NUMBER() OVER(PARTITION BY c.customer_id) AS categories_bought 
  FROM customer_contracts c 
  JOIN products p
    ON c.product_id = p.product_id
  GROUP BY c.customer_id, p.product_category
)
SELECT customer_id
FROM customer_categories
WHERE categories_bought = (SELECT COUNT(DISTINCT product_category) FROM products);
