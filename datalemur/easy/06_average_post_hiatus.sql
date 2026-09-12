-- Problem: Average Post Hiatus (Part 1) [Facebook / Meta SQL Interview Question]
-- Platform: DataLemur (Easy)
-- URL: https://datalemur.com/questions/sql-average-post-hiatus-1

-- Omar's Solution (Accepted on DataLemur):
SELECT 
  user_id, 
  EXTRACT(DAY FROM MAX(post_date) - MIN(post_date)) AS days_between
FROM posts
WHERE EXTRACT(YEAR FROM post_date) = 2021
GROUP BY user_id
HAVING EXTRACT(DAY FROM MAX(post_date) - MIN(post_date)) != 0;

-- Interview Best Practice (handles users posting twice on same day):
-- SELECT 
--   user_id, 
--   MAX(post_date::DATE) - MIN(post_date::DATE) AS days_between
-- FROM posts
-- WHERE EXTRACT(YEAR FROM post_date) = 2021
-- GROUP BY user_id
-- HAVING COUNT(post_id) >= 2;
