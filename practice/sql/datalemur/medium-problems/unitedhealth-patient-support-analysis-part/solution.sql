-- time 5 mins and attempts 3

SELECT 
  ROUND
  (
    100.0 *
    COUNT 
    (
      CASE
        WHEN call_category IN ('n/a', '', ' ') OR call_category IS NULL THEN 1
        ELSE NULL
      END
    ) /
    COUNT (*)
    , 1
  ) AS uncategorised_call_pct
FROM 
  callers
;