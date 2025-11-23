-- time 15 mins attempts 2

WITH prod_cat_tot_spen_cte AS
(
  SELECT 
      category
    , product
    , SUM (spend) AS total_spend
    , DENSE_RANK()
      OVER
      (
        PARTITION BY category
        ORDER BY SUM (spend) DESC
      ) AS prod_rank
  FROM 
    product_spend
  WHERE 
    EXTRACT (YEAR FROM transaction_date) = '2022'
  GROUP BY 
      category
    , product
)
SELECT 
    category
  , product
  , total_spend
FROM 
  prod_cat_tot_spen_cte
WHERE 
  prod_rank IN (1, 2)
;