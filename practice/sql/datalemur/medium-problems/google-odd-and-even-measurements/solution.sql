WITH measurement_count AS 
(
  SELECT 
      CAST(measurement_time AS date) AS measurement_day
    , measurement_value
    , ROW_NUMBER() 
      OVER 
      (
        PARTITION BY CAST(measurement_time AS date)
        ORDER BY measurement_time
      ) AS measurement_num
  FROM
    measurements
)

SELECT 
    measurement_day 
  , SUM
    (
      CASE 
        WHEN measurement_num%2 != 0 THEN measurement_value 
        ELSE 0 
      END
    ) AS add_sum
  , SUM
    (
      CASE 
        WHEN measurement_num%2 = 0 THEN measurement_value 
        ELSE 0 
      END
    ) AS even_sum
FROM 
  measurement_count 
GROUP BY 
  measurement_day
;