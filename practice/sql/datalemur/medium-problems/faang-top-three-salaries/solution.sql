-- time : 11 attempts 2

WITH emp_dept_sal_cte AS
(
  SELECT 
      d.department_name
    , e.name
    , e.salary
    , DENSE_RANK ()
      OVER
      (
        PARTITION BY d.department_name
        ORDER BY d.department_name, e.salary DESC
      ) AS dept_sal_rank
  FROM 
    employee e
  INNER JOIN 
    department d
  ON
    e.department_id = d.department_id
)
SELECT 
    department_name
  , name
  , salary
FROM 
  emp_dept_sal_cte
WHERE 
  dept_sal_rank IN (1, 2, 3)
ORDER BY
    department_name
  , salary DESC
  , name
;