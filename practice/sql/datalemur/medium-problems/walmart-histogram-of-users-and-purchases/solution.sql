-- ASK: users with num products on recent purcahe date
-- Constraints: check if same user has purchases on multiple dates
-- Order: transaction date

-- LOGIC:
-- window based on tran date and user id
-- rank transaction date
-- count prod_id for purchases
-- return tran date rank = 1 for each user with num products

WITH recent_purchases_cte AS
(
  SELECT
      * 
    , RANK()
        OVER 
        (
          PARTITION BY user_id
          ORDER BY transaction_date DESC
        ) as purchase_rank
  FROM
    user_transactions
)
SELECT
    transaction_date
  , user_id
  , COUNT(product_id) AS purchase_count
FROM
  recent_purchases_cte
WHERE
  purchase_rank = 1
GROUP BY
  transaction_date, user_id
ORDER BY 
  transaction_date
;