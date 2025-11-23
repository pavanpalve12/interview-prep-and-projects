--time : 12 mins
WITH age_bucket_time AS
(
  SELECT 
      age.age_bucket
    , SUM 
      (
        CASE 
          WHEN activity_type = 'open' THEN time_spent
          ELSE 0
        END
      ) AS total_time_spent_open
    , SUM 
      (
        CASE 
          WHEN activity_type = 'send' THEN time_spent
          ELSE 0
        END
      ) AS total_time_spent_send
  FROM 
    activities act
  INNER JOIN 
    age_breakdown age
  ON
        act.user_id = age.user_id
    AND act.activity_type IN ('open', 'send')
  GROUP BY age.age_bucket
)
SELECT 
    age_bucket
  , ROUND (100.0 * total_time_spent_send / (total_time_spent_send + total_time_spent_open), 2) AS send_perc
  , ROUND (100.0 * total_time_spent_open / (total_time_spent_send + total_time_spent_open), 2) AS open_perc
FROM 
  age_bucket_time
;