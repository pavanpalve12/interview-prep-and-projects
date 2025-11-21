SELECT 
  ROUND 
  (
      SUM (total_items) / SUM (order_occurrences)
    , 1
  ) AS mean
FROM
(
  SELECT 
      *
    , CAST (item_count AS DECIMAL) * order_occurrences AS total_items
  FROM 
    items_per_order
  ORDER BY
    item_count
) occ
;