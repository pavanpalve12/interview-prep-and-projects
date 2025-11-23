-- time takem: 45 mins

WITH total_sqft_batch_cte AS
(
  SELECT 
      item_type
    , COUNT (DISTINCT item_category) as item_count_by_type
    , SUM (square_footage) AS sqft_by_type
  FROM 
    inventory
  GROUP BY 
    item_type
)
,
prime_sqft_cte AS 
(
  SELECT 
      *
    , FLOOR (500000 / sqft_by_type) AS items_in_batch_count
    , FLOOR(sqft_by_type * FLOOR (500000 / sqft_by_type)) AS total_sqft_reqd
  FROM 
    total_sqft_batch_cte
  WHERE 
    item_type = 'prime_eligible'
)
SELECT 
    item_type
  , CASE
      WHEN item_type = 'prime_eligible' THEN FLOOR ((SELECT items_in_batch_count FROM prime_sqft_cte) * item_count_by_type)
      ELSE FLOOR ((500000 - (SELECT FLOOR(500000/sqft_by_type) * sqft_by_type FROM prime_sqft_cte)) / sqft_by_type) * item_count_by_type
    END AS item_count
FROM 
  total_sqft_batch_cte
ORDER BY 
  item_count DESC
;