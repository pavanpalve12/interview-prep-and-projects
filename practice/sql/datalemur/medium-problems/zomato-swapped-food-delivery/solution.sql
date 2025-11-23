WITH corrected_orders_cte AS
(
  SELECT 
      *
    , CASE
        WHEN order_id % 2 = 0 THEN order_id - 1
        ELSE order_id + 1
      END AS corrected_order_id
  FROM orders 
)
SELECT 
    co.order_id
  , CASE
      WHEN o.item IS NULL THEN co.item
      ELSE o.item
    END as item
  --, co.*
  --, o.*
FROM 
  corrected_orders_cte co
LEFT JOIN 
  orders o
ON
  co.corrected_order_id = o.order_id
ORDER BY 
  co.order_id
;