WITH trans_grp_cte AS
(
  SELECT 
      user_id
    , CAST (transaction_date AS DATE) AS transaction_date
  FROM 
    transactions
  GROUP BY 
      user_id
    , CAST (transaction_date AS DATE)
)
,
streaks_cte AS
(
  SELECT 
      user_id
    , transaction_date
    , ROW_NUMBER() 
      OVER
      (
        PARTITION BY user_id
        ORDER BY transaction_date
      ) AS row_num
    , transaction_date - ROW_NUMBER()
      OVER
      (
        PARTITION BY user_id
        ORDER BY transaction_date
      )::int AS streak_id
  FROM trans_grp_cte
)
,
users_streaks_cte AS
(
  SELECT 
      user_id
    , streak_id
    , COUNT (*) as streak_days
  FROM 
    streaks_cte
  GROUP BY 
      user_id
    , streak_id
)
SELECT 
  user_id
FROM 
  users_streaks_cte
WHERE 
  streak_days >= 3
ORDER BY 
  user_id
;