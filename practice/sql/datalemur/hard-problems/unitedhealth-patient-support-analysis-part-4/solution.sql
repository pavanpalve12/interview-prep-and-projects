WITH long_calls_cte AS
(
  SELECT 
      EXTRACT (YEAR FROM call_date) AS yr
    , EXTRACT (MONTH FROM call_date) AS mth 
    , COUNT (case_id) AS curr_month_call_cnt
    , LAG (COUNT (case_id))
      OVER 
      (
        ORDER BY EXTRACT (YEAR FROM call_date), EXTRACT (MONTH FROM call_date)
      ) AS prev_month_call_cnt
  FROM 
    callers
  WHERE
    call_duration_secs > 300
  GROUP BY 
      EXTRACT (YEAR FROM call_date)
    , EXTRACT (MONTH FROM call_date)
  ORDER BY 
    yr, mth
)
SELECT 
    yr
  , mth
  , ROUND 
    (
        100.0 * (curr_month_call_cnt - prev_month_call_cnt) / prev_month_call_cnt
      , 1
    ) AS long_calls_growth_pct
FROM 
  long_calls_cte
ORDER BY 
  yr, mth
;