# Explanation

## 1. Approach Overview
The task calculates month-over-month growth in the count of **long calls** (calls lasting more than 300 seconds).  
To do this, we must aggregate counts per month, retrieve the previous month’s count, and compute the percentage growth.  
A window function (`LAG`) is used to access the previous month’s count without self-joins.

## 2. Step-by-Step Breakdown

### Step 1: Filter only long calls  
The query selects only rows where `call_duration_secs > 300`.  
This ensures the monthly count reflects only long-duration calls, ignoring short ones.

### Step 2: Extract year and month from the call date  
`EXTRACT(YEAR …)` and `EXTRACT(MONTH …)` derive the period in which the call happened.  
These two fields define the grouping for monthly-level metrics.

### Step 3: Aggregate call counts per year–month  
`COUNT(case_id)` gives the number of long calls in each month.  
Grouping by year and month ensures one row per period.

### Step 4: Get previous month’s call count using `LAG`  
`LAG(COUNT(case_id)) OVER (ORDER BY year, month)` retrieves the count from the immediately preceding month.  
This avoids self-joins and keeps data in chronological order.  
If a month has no previous month (first row), `LAG` returns NULL.

### Step 5: Compute month-over-month growth percentage  
The outer query calculates growth as:

100 * (curr_month_call_cnt - prev_month_call_cnt) / prev_month_call_cnt

sql
Copy code

Rounded to one decimal place.  
If the previous month is NULL, the growth becomes NULL—this is expected for the first available month.

### Step 6: Final ordering  
Sorting by year and month ensures output is shown chronologically.

## 3. Pseudocode / Logical Flow
1. Filter calls to only those with duration > 300 seconds.  
2. Convert timestamp into (year, month).  
3. Count long calls for each (year, month).  
4. Use window function ordered by (year, month) to fetch previous month’s count.  
5. Compute growth percentage using:  
   - `(current - previous) / previous * 100`  
6. Return results in chronological order.

## 4. Final Query Breakdown

### CTE (`long_calls_cte`)
- `yr`, `mth`: extracted date components.  
- `curr_month_call_cnt`: monthly aggregated count.  
- `prev_month_call_cnt`: previous month’s count using `LAG`.

### Outer Query
- Selects year and month.  
- Computes percentage growth using arithmetic and `ROUND`.  
- Orders output to align with the monthly timeline.

## 5. Edge Cases Considered
- **First month** has no previous month → produces NULL growth.  
- **Months with zero previous count** naturally produce NULL or division by zero depending on the engine — this dataset assumes nonzero prior months.  
- **Irregular data** (missing months) still works: LAG compares to last available month, not calendar month.

## 6. Validation
- Check that counts per month match raw data.  
- Confirm LAG returns expected prior-month values.  
- Recalculate manually for a sample month to confirm % growth accuracy.

## 7. Final Notes
- Using `LAG` simplifies logic compared to joining month datasets manually.  
- To avoid division-by-zero errors, a `NULLIF(prev_month_call_cnt, 0)` wrapper can be added if needed.  
- This approach generalizes well for any time-based month-over-month metric.