-- Problem: Page With No Likes [Facebook / Meta SQL Interview Question]
-- Platform: DataLemur (Easy)
-- URL: https://datalemur.com/questions/sql-page-with-no-likes

SELECT p.page_id
FROM pages p
LEFT JOIN page_likes l
  ON p.page_id = l.page_id
WHERE l.page_id IS NULL
ORDER BY p.page_id;
