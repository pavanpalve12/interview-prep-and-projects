-- ASK: year on year growth rate for total spend
-- Constraint: group results by product id, percentage rounded 2 decimals
-- Order: year ascending

-- LOGIC:
-- window funtion, partition by product id
-- calculate sum of spend if needed
-- yoy percentage = 100 * (curr_year - prev_year) / prev_year

WITH total_purchases_yearly_cte AS
(
  SELECT 
      product_id
    , spend
    , EXTRACT (YEAR FROM transaction_date) AS year
    , LAG (spend, 1)
      OVER
      (
        PARTITION BY product_id
        ORDER BY product_id, EXTRACT (YEAR FROM transaction_date)
      ) AS prev_year_spend
  FROM
    user_transactions
)
SELECT 
    year
  , product_id
  , spend as curr_year_spend
  , prev_year_spend
  , ROUND (100 * (spend - prev_year_spend) / prev_year_spend, 2) AS yoy_rate
FROM 
  total_purchases_yearly_cte
ORDER BY product_id, year
;

