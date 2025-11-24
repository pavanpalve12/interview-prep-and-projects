WITH data_cleanup_cte AS
(
  SELECT 
      filing_id
    , user_id
    , filing_date
    , ROW_NUMBER () 
      OVER 
      (
        ORDER BY user_id, filing_date
      ) AS row_num
    , EXTRACT (YEAR FROM filing_date) - ROW_NUMBER () OVER (ORDER BY user_id, filing_date) AS streak_year
    , CASE 
        WHEN product LIKE 'TurboTax%' THEN 'TurboTax'
        WHEN product LIKE 'QuickBooks%' THEN 'QuickBooks'
        ELSE 'missed_something'
      END AS product_name
  FROM 
    filed_taxes
)
SELECT 
  user_id
FROM 
  data_cleanup_cte
GROUP BY
    streak_year
  , product_name
  , user_id
HAVING 
  COUNT (*) >= 3
ORDER BY 
  user_id
;