WITH contracts_products_cte AS
(
  SELECT
      c.customer_id
    , COUNT (DISTINCT p.product_category) AS product_count
  FROM 
    customer_contracts c
  INNER JOIN
    products p
  ON
    c.product_id = p.product_id
  GROUP BY c.customer_id
)
SELECT 
    customer_id
FROM 
  contracts_products_cte
WHERE 
  product_count = 
    (
      SELECT 
        COUNT (DISTINCT product_category)
      FROM 
        products
    )
;