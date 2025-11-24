WITH login_cte AS
(
  SELECT 
      *
    , EXTRACT (MONTH FROM login_date) as mth
    , LAG (EXTRACT (MONTH FROM login_date), 1)
      OVER 
      (
        PARTITION BY user_id
        ORDER BY login_date
      ) AS prev_login_mth
  FROM 
    user_logins
  ORDER BY 
    login_date
)
SELECT 
    mth
  , COUNT (DISTINCT user_id) AS reactivated_users
FROM 
  login_cte
WHERE
      mth - prev_login_mth > 1 
  OR prev_login_mth IS NULL
GROUP BY mth
;