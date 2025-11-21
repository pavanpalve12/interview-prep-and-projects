WITH queries_bucket_cte AS
(
  SELECT 
      e.employee_id
    , COALESCE (COUNT (DISTINCT query_id), 0) AS unique_queries
  FROM employees e 
  LEFT JOIN 
    queries q
  ON 
        e.employee_id = q.employee_id
    AND DATE (q.query_starttime) BETWEEN '07/01/2023' AND '09/30/2023'
  GROUP BY
    e.employee_id
)
SELECT 
    unique_queries
  , COUNT (employee_id) AS employee_count
FROM 
  queries_bucket_cte
GROUP BY
  unique_queries
ORDER BY
  unique_queries
;