-- Problem: Well Paid Employees
-- Platform: DataLemur (Easy)
-- URL: https://datalemur.com/questions/well-paid-employees

SELECT 
  emp.employee_id, 
  emp.name AS employee_name
FROM employee emp
INNER JOIN employee mgr 
  ON emp.manager_id = mgr.employee_id
WHERE emp.salary > mgr.salary;
