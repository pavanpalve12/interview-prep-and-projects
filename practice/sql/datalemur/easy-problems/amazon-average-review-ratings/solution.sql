SELECT 
    EXTRACT (MONTH FROM submit_date) AS month
  , product_id
  , ROUND (AVG (stars), 2) AS avg_stars
FROM reviews
GROUP BY 
    product_id
  , EXTRACT (MONTH FROM submit_date)
ORDER BY 
  month, product_id 
;