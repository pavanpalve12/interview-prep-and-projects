-- LOGIC
-- Window () - card, issue year & MONTH
-- Rank 
-- select rank 1

WITH card_issue_ranked_cte AS
(
  SELECT 
      *
    , RANK ()
        OVER 
        (
          PARTITION BY card_name
          ORDER BY issue_year, issue_month
        ) AS issue_rank
  FROM 
    monthly_cards_issued
)
SELECT 
    card_name
  , issued_amount
FROM 
  card_issue_ranked_cte
WHERE issue_rank = 1
ORDER BY 
  issued_amount DESC

;