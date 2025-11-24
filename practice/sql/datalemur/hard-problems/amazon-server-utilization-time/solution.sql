WITH server_start_stop_cte AS
(
  SELECT 
      * 
    , status_time AS start_time
    , LEAD (status_time, 1)
      OVER 
      (
        PARTITION BY server_id
        ORDER BY status_time
      ) AS stop_time
  FROM 
    server_utilization 
  ORDER BY 
    server_id, status_time
)
SELECT 
  EXTRACT 
  (
    DAY FROM 
    JUSTIFY_HOURS 
    (
      SUM (stop_time - start_time)
    )
  ) AS total_uptime_days
FROM 
  server_start_stop_cte
WHERE
      session_status = 'start'
  AND stop_time IS NOT NULL
;