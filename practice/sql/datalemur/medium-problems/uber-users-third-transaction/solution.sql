-- time: 4 mins

WITH uber_trans_ranked_cte AS
(
  SELECT
      *
    , RANK ()
      OVER 
      (
        PARTITION BY user_id
        ORDER BY transaction_date
      ) AS trans_rank
  FROM 
    transactions
)
SELECT 
    user_id
  , spend
  , transaction_date
FROM 
  uber_trans_ranked_cte
WHERE 
  trans_rank = 3
;