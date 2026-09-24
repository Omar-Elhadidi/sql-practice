-- Problem: Top Three Salaries
-- Platform: DataLemur (Medium)
-- URL: https://datalemur.com/questions/sql-top-three-salaries

WITH salary_ranking AS (
  SELECT d.department_name, e.name, e.salary, DENSE_RANK() OVER(PARTITION BY d.department_name ORDER BY e.salary DESC) AS ranking
  FROM employee e 
  JOIN department d
    ON e.department_id = d.department_id
)
SELECT department_name, name, salary
FROM salary_ranking
WHERE ranking <= 3
ORDER BY department_name, salary DESC, name;
