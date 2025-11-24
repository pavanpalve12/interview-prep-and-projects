# Explanation

## 1. Approach Overview
The goal is to compute the median number of searches from a frequency table where each row represents how many users performed a specific number of searches. Since the dataset is in a frequency format (searches + num_users), we cannot directly calculate the median. Instead, we must expand the cumulative distribution and identify the point where the cumulative count crosses the 50th percentile. This approach uses window functions to compute cumulative user counts and then finds the row(s) where the median lies.

## 2. Step-by-Step Breakdown

### Step 1: Build cumulative bounds for each search count
The CTE (`bounds_cte`) calculates three key values using window functions:
- `low_bound`: cumulative users up to the previous row  
- `high_bound`: cumulative users including the current row  
- `mid`: half of the total user count (the median position)

These bounds help determine whether the median lies within the current row.

### Step 2: Identify the row where the median falls
The median position (`mid`) will fall between `low_bound` and `high_bound` for the row(s) that represent the median search value. This logic works for both:
- Odd total count (single middle user)
- Even total count (median may fall between two values or exactly in a range)

### Step 3: Compute the median using valid rows
Once the correct row(s) are filtered using:
WHERE mid BETWEEN low_bound AND high_bound

cpp
Copy code
we compute the median using:
ROUND(1.0 * SUM(searches) / COUNT(*), 1)

pgsql
Copy code
This ensures proper averaging if multiple rows satisfy the condition (even-sized distributions) while preserving decimal precision.

## 3. Logical Flow (Pseudocode)
- For each row, compute cumulative users up to the current search count.
- Determine the midpoint of total users.
- Select the row(s) whose cumulative interval contains the midpoint.
- Average the associated search values to produce the median.

## 4. Final Query Explanation

### CTE Section
WITH bounds_cte AS (
SELECT
*
, 1.0 * SUM(num_users) OVER (ORDER BY searches) - num_users AS low_bound
, SUM(num_users) OVER () / 2 AS mid
, 1.0 * SUM(num_users) OVER (ORDER BY searches) AS high_bound
FROM search_frequency
ORDER BY searches
)

pgsql
Copy code

- `SUM(num_users) OVER (ORDER BY searches)` produces the running total.
- `low_bound` is cumulative up to the previous row.
- `high_bound` is cumulative including the current row.
- `mid` is the median position in the population.

### Final Selection
SELECT
ROUND(1.0 * SUM(searches) / COUNT(*), 1) AS median
FROM bounds_cte
WHERE mid BETWEEN low_bound AND high_bound;

pgsql
Copy code
- Filters rows where the median lies.
- Averages `searches` if two rows are valid.

## 5. Edge Cases Considered
- When total users is odd, only one row matches.
- When total users is even, two adjacent ranges may match — the averaging logic handles this correctly.
- Works for skewed, sparse, or irregular frequency distributions.
- Does not depend on expanding the dataset, making it efficient.

## 6. Validation
- Validate that cumulative counts cross the midpoint at the correct row.
- Check correctness by manually expanding small datasets to verify the median.
- Ensure ordering of `searches` is strictly ascending to maintain proper cumulative boundaries.

## 7. Final Notes
This solution avoids dataset expansion, handles any distribution shape, and relies on strong window-function logic to compute accurate medians from frequency tables.