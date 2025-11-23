-- time 48 mins attempts 5

WITH high_stock_open_cte AS
(
  SELECT 
      *
    , RANK ()
      OVER 
      (
        PARTITION BY ticker
        ORDER BY open DESC
      ) AS high_rank
  FROM 
    stock_prices
)
,
low_stock_open_cte AS
(
  SELECT 
      *
    , RANK ()
      OVER 
      (
        PARTITION BY ticker
        ORDER BY open 
      ) AS low_rank
  FROM 
    stock_prices
)
,
high_low_joined_cte AS
(
  SELECT 
      h.ticker
    , TO_CHAR (h.date, 'Mon-YYYY') AS highest_mth
    , h.open AS highest_open
    , TO_CHAR (l.date, 'Mon-YYYY') AS lowest_mth
    , l.open AS lowest_open
  FROM 
    high_stock_open_cte h
  INNER JOIN
    low_stock_open_cte l
  ON
        h.ticker = l.ticker
    AND h.high_rank = 1
    AND l.low_rank = 1
)
SELECT 
  *
FROM 
  high_low_joined_cte
;