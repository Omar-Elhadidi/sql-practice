-- Problem: IBM Db2 Product Analytics
-- Platform: DataLemur (Easy)
-- URL: https://datalemur.com/questions/ibm-db2-product-analytics

WITH queries_filtered AS (
  SELECT * 
  FROM queries  
  WHERE query_starttime >= '2023-07-01' AND query_starttime < '2023-10-01'
), 
queries_count AS (  
  SELECT e.employee_id, COUNT(q.query_id) AS unique_queries
  FROM employees e
  LEFT JOIN queries_filtered q
    ON e.employee_id = q.employee_id
  GROUP BY e.employee_id
)
SELECT unique_queries, COUNT(employee_id) AS employee_count
FROM queries_count
GROUP BY unique_queries
ORDER BY unique_queries;
