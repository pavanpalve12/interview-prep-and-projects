-- time 12, attempts 3
SELECT 
    user_id
  , tweet_date
  , ROUND 
    (
      AVG (tweet_count)
      OVER 
      (
        PARTITION BY user_id
        ORDER BY CAST (tweet_date AS DATE)
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
      )
      , 2
    ) AS rolling_avg_3d
FROM 
  tweets
;