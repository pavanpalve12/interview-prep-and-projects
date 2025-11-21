WITH calls_cte AS
(
  SELECT 
      policy_holder_id
    , COUNT (case_id) AS call_count
  FROM 
    callers
  GROUP BY 
    policy_holder_id
  HAVING
    COUNT (case_id) > 2
) 
SELECT 
  COUNT (policy_holder_id) AS policy_holder_count
FROM 
  calls_cte
;