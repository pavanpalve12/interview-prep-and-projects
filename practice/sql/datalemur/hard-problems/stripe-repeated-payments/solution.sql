WITH repeated_payments_cte AS 
(
  SELECT 
    * 
    , LAG (transaction_timestamp, 1)
      OVER 
      (
        PARTITION BY merchant_id, credit_card_id, amount
        ORDER BY transaction_timestamp
      ) AS prev_payment
    , EXTRACT 
      (
        EPOCH FROM transaction_timestamp - 
        LAG (transaction_timestamp, 1)
        OVER 
        (
          PARTITION BY merchant_id, credit_card_id, amount
          ORDER BY transaction_timestamp
        )
      ) / 60 AS prev_payment_diff
  FROM 
    transactions
  ORDER BY 
    transaction_timestamp
)
SELECT 
  COUNT (merchant_id) AS payment_count
FROM repeated_payments_cte 
WHERE 
  prev_payment_diff <= 10 
;