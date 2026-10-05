-- Problem: Best-Selling Products
-- Platform: DataLemur (Amazon)
-- URL: https://datalemur.com/questions/best-selling-products

WITH ranked_products AS (
  SELECT 
    p.category_name,
    p.product_name,
    DENSE_RANK() OVER (
      PARTITION BY p.category_name 
      ORDER BY s.sales_quantity DESC, s.rating DESC
    ) AS ranking
  FROM products p
  JOIN product_sales s
    ON p.product_id = s.product_id
)
SELECT 
  category_name, 
  product_name
FROM ranked_products
WHERE ranking = 1;
