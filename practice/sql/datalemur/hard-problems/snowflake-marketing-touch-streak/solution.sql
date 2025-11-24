----------------------- Approach 1: ------------------------
-- Indentify Streak by subtracting rownum from week
-- Count number of touch points in the streak for eah user
-- Return email where streak cnt >= 3 and one of the touch point is trial_request

WITH data_cleanup_cte AS
(
  SELECT 
      mt.*
    , cc.email
    , EXTRACT (WEEK FROM mt.event_date) AS week
    , ROW_NUMBER() OVER (ORDER BY mt.contact_id, mt.event_date) AS row_num
    , EXTRACT (WEEK FROM mt.event_date) - ROW_NUMBER() OVER (ORDER BY mt.contact_id, mt.event_date) :: int AS streak_id
  FROM marketing_touches mt
  INNER JOIN 
    crm_contacts cc
  ON 
    mt.contact_id = cc.contact_id
)
,
streaks_identification_cte AS
(
  select 
    * 
    , COUNT (*) OVER (PARTITION BY contact_id, streak_id) AS streak_cnt
  from 
    data_cleanup_cte
)
SELECT
  email
FROM
  streaks_identification_cte
WHERE 
      event_type = 'trial_request'
  AND streak_cnt >= 3
;

/*
----------------------- Approach 2: ------------------------
-- Indentify Streak by subtracting rownum from week
-- create 3 touch point columns using lead function
-- Count number of touch points in the streak for eah user
-- Check if user has trial_request touch point and has 3 touch points (columns are non null)
-- Return email where streak cnt >= 3 and one of the touch point is trial_request

,
streaks_identification_cte AS
(
  SELECT 
      contact_id
    , event_type
    , email
    , streak_id
    , week
    , event_type AS first_touch_point
    , LEAD (event_type, 1) OVER (PARTITION BY contact_id, streak_id ORDER BY week) AS second_touch_point 
    , LEAD (event_type, 2) OVER (PARTITION BY contact_id, streak_id ORDER BY week) AS third_touch_point  
    
  FROM 
    data_cleanup_cte
)
,
streaks_validation_cte AS
(
  SELECT 
      *
    , CASE 
        WHEN (first_touch_point IS NOT NULL AND second_touch_point IS NOT NULL AND third_touch_point IS NOT NULL) AND first_touch_point = 'trial_request' THEN '1'
        WHEN (first_touch_point IS NOT NULL AND second_touch_point IS NOT NULL AND third_touch_point IS NOT NULL) AND second_touch_point = 'trial_request' THEN '1'
        WHEN (first_touch_point IS NOT NULL AND second_touch_point IS NOT NULL AND third_touch_point IS NOT NULL) AND third_touch_point = 'trial_request' THEN '1'
        ELSE 0
      END AS tr_flag
  FROM 
    streaks_identification_cte 
)
SELECT 
  email
FROM
  streaks_validation_cte
WHERE 
  tr_flag = 1
;
*/