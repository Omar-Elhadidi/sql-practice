-- Problem: Laptop vs. Mobile Viewership [The New York Times SQL Interview Question]
-- Platform: DataLemur (Easy)
-- URL: https://datalemur.com/questions/laptop-mobile-viewership

-- Method 1: Conditional Aggregation (Single Scan - Recommended for Interviews)
SELECT 
  SUM(CASE WHEN device_type = 'laptop' THEN 1 ELSE 0 END) AS laptop_views,
  SUM(CASE WHEN device_type IN ('tablet', 'phone') THEN 1 ELSE 0 END) AS mobile_views
FROM viewership;

-- Method 2: Scalar Subquery (Omar's Solution)
-- SELECT 
--   (SELECT COUNT(device_type) FROM viewership WHERE device_type = 'laptop') AS laptop_views,
--   COUNT(device_type) AS mobile_views
-- FROM viewership 
-- WHERE device_type IN ('tablet', 'phone');
