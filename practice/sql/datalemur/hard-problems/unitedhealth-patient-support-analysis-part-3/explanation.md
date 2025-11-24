# Explanation

## 1. Approach Overview
The goal is to determine how many policy holders made at least two calls within a 7-day window. To do this, we calculate the time gap between each call and its immediately previous call for every policy holder. If the gap is 7 days or less, that policy holder is counted.

## 2. Step-by-Step Breakdown

### Step 1: Use a CTE to Organize Call History
The `call_history_cte` collects each policy holder’s calls, ordered by date, and computes the previous call date using the `LAG()` window function.

### Step 2: Identify the Previous Call for Each Record
`LAG(call_date)` assigns the prior call date for the same `policy_holder_id`.  
This is required to measure the time difference between consecutive calls.

### Step 3: Compute the Time Difference in Days
`EXTRACT(EPOCH FROM call_date - prev_call)` gives the difference in seconds.  
Dividing by `(60 * 60 * 24)` converts it to days.  
The value is rounded to 2 decimal places and stored as `time_diff_in_days`.

### Step 4: Filter for Calls Occurring Within 7 Days
In the final query, we filter rows from the CTE where `time_diff_in_days <= 7`.  
Any policy holder satisfying this condition has made two calls within the required time window.

### Step 5: Count Distinct Policy Holders
Using `COUNT(DISTINCT policy_holder_id)`, the query returns the total number of unique policy holders who had back-to-back calls within 7 days.

## 3. Logical Flow (Pseudocode)
- For each policy holder:  
  - Sort calls by date  
  - Calculate previous call date  
  - Compute difference in days  
- Keep only records where difference ≤ 7  
- Count unique policy holders

## 4. Final Query Breakdown
- `LAG()` → identifies previous call  
- `EXTRACT(EPOCH …)` → measures time difference  
- Division and rounding → convert seconds to days  
- `WHERE time_diff_in_days <= 7` → filter qualifying calls  
- `COUNT(DISTINCT policy_holder_id)` → final output

## 5. Edge Cases Considered
- First call of each policy holder will have `NULL` time difference (automatically excluded).
- Policy holders with only one call are never counted.
- Multiple qualifying call gaps still only count the policy holder once.
- Date differences spanning months or years work correctly because the calculation is timestamp-based.

## 6. Validation
- Ensured window function ordering by `call_date` produces correct consecutive pairs.
- Checked that filtering after the CTE prevents miscounting.
- Confirmed that duplicates or same-day calls are handled accurately by time difference.

## 7. Final Notes
This solution efficiently identifies frequent callers using window functions with minimal computation, scales well with large datasets, and avoids unnecessary joins or subqueries.
