WITH ctr_base_cte AS
(
  SELECT 
      app_id
    , SUM 
      (
        CASE
          WHEN LOWER (event_type) = 'impression' THEN 1
          ELSE 0
        END
      ) AS impressions
    , SUM 
      (
        CASE
          WHEN LOWER (event_type) = 'click' THEN 1
          ELSE 0
        END
      ) AS clicks
  FROM 
    events
  WHERE 
    EXTRACT (YEAR FROM timestamp) = '2022'
  GROUP BY
    app_id
)
SELECT
    app_id
  , ROUND (100.0 * clicks / impressions, 2) AS ctr
FROM
  ctr_base_cte 
;