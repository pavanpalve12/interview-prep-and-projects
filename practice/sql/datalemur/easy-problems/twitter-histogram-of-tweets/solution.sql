WITH tweet_buckets_cte AS
(
  SELECT 
      user_id
    , EXTRACT(YEAR FROM tweet_date) as tweet_year
    , COUNT (msg) as tweet_bucket
  FROM 
    tweets
  WHERE EXTRACT(YEAR FROM tweet_date) = '2022'
  GROUP BY user_id, EXTRACT(YEAR FROM tweet_date)
)
SELECT 
    tweet_bucket
  , COUNT (user_id) AS users_num 
FROM 
  tweet_buckets_cte
GROUP BY tweet_bucket
;