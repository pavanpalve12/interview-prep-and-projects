WITH bounds_cte AS
(
  SELECT 
      *
    , 1.0 * SUM (num_users) OVER (ORDER BY searches) - num_users AS low_bound
    , SUM (num_users) OVER () / 2 AS mid
    , 1.0 * SUM (num_users) OVER (ORDER BY searches) AS high_bound
  FROM 
    search_frequency
  ORDER BY 
    searches
)
SELECT
  ROUND (1.0 * SUM (searches) / COUNT (*), 1) AS median
-- COUNT (*) since rwe need to divide by number of rows satisfying where cond
FROM 
  bounds_cte
WHERE 
  mid BETWEEN low_bound AND high_bound
;