-- Problem: Swapped Food Delivery
-- Platform: DataLemur (Medium - Zomato)
-- URL: https://datalemur.com/questions/sql-swapped-food-delivery

SELECT
  order_id AS corrected_order_id,
  CASE 
    WHEN order_id % 2 != 0 THEN COALESCE(LEAD(item) OVER (ORDER BY order_id), item)
    ELSE LAG(item) OVER (ORDER BY order_id)
  END AS item
FROM orders
ORDER BY corrected_order_id;
