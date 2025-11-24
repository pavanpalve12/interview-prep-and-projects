WITH call_history_cte AS
(
  SELECT 
      policy_holder_id
    , call_date
    , LAG (call_date)
      OVER 
      (
        PARTITION BY policy_holder_id
        ORDER BY call_date
      ) AS prev_call
    , ROUND 
      (
        EXTRACT 
        (
          EPOCH FROM call_date - 
          LAG (call_date) 
          OVER 
          (
            PARTITION BY policy_holder_id ORDER BY call_date
          )
        ) / (60 * 60 * 24) 
       , 2
      ) AS time_diff_in_days
  FROM callers
  ORDER BY 
    policy_holder_id, call_date
)  
SELECT 
  COUNT (DISTINCT policy_holder_id) AS policy_holder_count
FROM 
  call_history_cte
WHERE 
  time_diff_in_days <= 7
;
;