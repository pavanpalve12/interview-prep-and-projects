SELECT
    card_name
  , max_issued_amount - min_issued_amount AS difference
FROM
(
  SELECT 
      card_name
    , MAX (issued_amount) AS max_issued_amount
    , MIN (issued_amount) AS min_issued_amount
  FROM 
    monthly_cards_issued
  GROUP BY
      card_name
) grp_cards
ORDER BY 
  difference desc
;