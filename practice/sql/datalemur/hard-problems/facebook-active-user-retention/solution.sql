-- time 45 mins 

--Solution 1:

WITH filter_users_cte AS
(
  SELECT
      *
    , EXTRACT (MONTH FROM event_date) AS month
    , DENSE_RANK ()
      OVER 
      (
        PARTITION BY user_id
        ORDER BY EXTRACT (MONTH FROM event_date)
      ) AS rank
  FROM 
    user_actions
  WHERE 
        EXTRACT (MONTH FROM event_date) IN (6, 7)
    AND event_type IN ('sign-in', 'like', 'comment')
)
SELECT 
    month
  , COUNT (DISTINCT user_id) AS monthly_active_users
FROM 
  filter_users_cte
WHERE 
  rank = 2 AND month = 7 
GROUP BY 
  month
;



/*

Approach 2: Checking if user_ids in JUly are present in June
SELECT 
    EXTRACT (MONTH FROM event_date) as month
  , COUNT (DISTINCT user_id) AS monthly_active_users
FROM 
  user_actions
WHERE 
      event_type IN ('sign-in', 'like', 'comment')
  AND EXTRACT (MONTH FROM event_date) = 7
  AND user_id IN 
              (
                SELECT 
                    user_id
                FROM 
                  user_actions
                WHERE 
                      EXTRACT (MONTH FROM event_date) = 6
                  AND event_type IN ('sign-in', 'like', 'comment')
              ) 
GROUP BY 
  EXTRACT (MONTH FROM event_date)
;
*/


