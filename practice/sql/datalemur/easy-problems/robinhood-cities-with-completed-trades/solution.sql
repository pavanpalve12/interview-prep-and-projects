SELECT 
    city
  , COUNT (order_id) AS total_orders
FROM 
  trades t
INNER JOIN
  users u
ON 
  t.user_id = u.user_id
WHERE LOWER(status) = 'completed'
GROUP BY
  city
ORDER BY 
  total_orders DESC
LIMIT 3
;