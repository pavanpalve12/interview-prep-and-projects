WITH post_2021_cte AS
(
  SELECT 
      user_id
    , EXTRACT(YEAR FROM post_date) AS post_year
    , COUNT (post_id) AS num_posts
    , MIN (CAST(post_date AS DATE)) AS first_post_date
    , MAX (CAST(post_date AS DATE)) AS last_post_date
  FROM 
    posts
  WHERE 
    EXTRACT(YEAR FROM post_date) = '2021'
  GROUP BY 
      EXTRACT(YEAR FROM post_date)
    , user_id
  HAVING 
    COUNT (post_id) > 2
)
SELECT 
    user_id
  , last_post_date - first_post_date as days_between
FROM 
  post_2021_cte
;