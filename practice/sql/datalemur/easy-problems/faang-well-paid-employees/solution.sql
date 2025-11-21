SELECT 
    emp.employee_id
  , emp.name as employee_name
FROM employee mgr
LEFT JOIN
  employee emp
ON 
  mgr.employee_id = emp.manager_id
WHERE 
  emp.salary > mgr.salary
ORDER BY mgr.employee_id
;