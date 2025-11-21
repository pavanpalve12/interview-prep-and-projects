SELECT
    manufacturer
  , COUNT (drug) AS drug_count
  , SUM (total_loss) AS total_loss
FROM
(
  SELECT 
      manufacturer
    , drug
    , total_sales
    , cogs
    , ABS (total_sales - cogs) AS total_loss
  FROM 
    pharmacy_sales
  WHERE total_sales - cogs <= 0
  ORDER BY
    manufacturer, total_loss DESC
) loss
GROUP BY
  manufacturer
ORDER BY 
  total_loss DESC
;