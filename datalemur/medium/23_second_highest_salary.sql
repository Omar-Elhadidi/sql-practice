-- Problem: Second Highest Salary
-- Platform: DataLemur (Medium)
-- URL: https://datalemur.com/questions/sql-second-highest-salary

WITH cte AS (
  SELECT salary, DENSE_RANK() OVER(ORDER BY salary DESC) AS salary_rank
  FROM employee
)
SELECT DISTINCT salary AS second_highest_salary
FROM cte
WHERE salary_rank = 2;
