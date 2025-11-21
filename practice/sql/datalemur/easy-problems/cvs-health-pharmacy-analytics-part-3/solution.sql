SELECT 
    manufacturer
  , '$' || ROUND (SUM (total_sales) / 1000000) || ' million' AS sales_mil
FROM 
  pharmacy_sales
GROUP BY  
  manufacturer
ORDER BY
  SUM (total_sales) / 1000000 DESC, manufacturer ASC
;