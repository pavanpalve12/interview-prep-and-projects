WITH sal_ranked_cte AS
(
  SELECT 
      *
    , DENSE_RANK()
      OVER 
      (
        ORDER BY salary DESC
      ) AS sal_rak
  FROM 
    employee
)
SELECT 
  DISTINCT salary
FROM 
  sal_ranked_cte
WHERE
  sal_rak = 2
;