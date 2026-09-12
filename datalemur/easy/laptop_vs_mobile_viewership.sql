-- Problem: Laptop vs. Mobile Viewership [New York Times SQL Interview Question]
-- Platform: DataLemur (Easy)
-- URL: https://datalemur.com/questions/laptop-mobile-viewership

-- Approach 1: Subquery + Aggregation
SELECT 
  (SELECT COUNT(device_type) FROM viewership WHERE device_type = 'laptop') AS laptop_views, 
  COUNT(device_type) AS mobile_views
FROM viewership 
WHERE device_type IN ('tablet', 'phone');

-- Approach 2 (Optimal / Single-Pass Scan in Interviews):
-- SELECT 
--   SUM(CASE WHEN device_type = 'laptop' THEN 1 ELSE 0 END) AS laptop_views,
--   SUM(CASE WHEN device_type IN ('tablet', 'phone') THEN 1 ELSE 0 END) AS mobile_views
-- FROM viewership;
