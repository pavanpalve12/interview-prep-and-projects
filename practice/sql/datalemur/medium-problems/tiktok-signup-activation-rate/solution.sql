-- time 17 mins

WITH email_texts_cte AS
(
  SELECT 
      e.*
    , t.*
  FROM 
    emails e
  LEFT JOIN 
    texts t
  ON 
    e.email_id = t.email_id
  ORDER BY 
    e.email_id
)
SELECT
  ROUND 
  (
    SUM 
    (
      CASE
        WHEN LOWER (signup_action) = 'confirmed' THEN 1.0
        ELSE 0.0
      END
    ) 
    / 
    COUNT (DISTINCT user_id)
  , 2
  )
  AS confirm_rate
FROM 
  email_texts_cte
;