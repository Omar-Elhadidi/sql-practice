-- Problem: Laptop vs. Mobile Viewership [New York Times SQL Interview Question]
-- Platform: DataLemur (Easy)
-- URL: https://datalemur.com/questions/laptop-mobile-viewership

SELECT 
  (SELECT COUNT(device_type) FROM viewership WHERE device_type = 'laptop') AS laptop_views, 
  COUNT(device_type) AS mobile_views
FROM viewership 
WHERE device_type IN ('tablet', 'phone');
