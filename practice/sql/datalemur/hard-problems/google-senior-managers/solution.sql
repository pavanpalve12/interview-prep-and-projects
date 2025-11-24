SELECT 
    mgr.manager_name
  , COUNT(DISTINCT mgr.emp_id) AS direct_reportees
FROM 
  employees emp
INNER JOIN 
  employees mgr
ON
  emp.manager_id = mgr.emp_id
INNER JOIN 
  employees as smgr
ON
  mgr.manager_id = smgr.emp_id
GROUP BY
  mgr.manager_name
ORDER BY 
  direct_reportees DESC
;