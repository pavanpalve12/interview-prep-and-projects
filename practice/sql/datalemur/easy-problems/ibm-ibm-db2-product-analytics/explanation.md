# Explanation

## 1. Pseudocode / Approach
- Step 1: Start with the full `employees` table to ensure **every employee** is included, even those with zero queries.
- Step 2: Left join the `queries` table on `employee_id`, but only keep queries where  
  `query_starttime` falls between **2023-07-01** and **2023-09-30**.
- Step 3: For each employee, count the **distinct queries** during this date range.  
  - Use `COALESCE()` to convert NULL to `0` for employees with no queries.
- Step 4: Store these results in a CTE (`queries_bucket_cte`).
- Step 5: In the outer query, group employees by their `unique_queries` count.
  - Count how many employees fall into each bucket.
- Step 6: Order by `unique_queries` for a clean histogram-like output.

## 2. Reasoning
This query builds a **frequency distribution of query activity** per employee.

The LEFT JOIN ensures:
- Employees with **0 queries** are still included.
- Employees with multiple queries get counted correctly.

Grouping again in the outer query provides:
- `unique_queries` → the query count bucket  
- `employee_count` → how many employees fall in that bucket

This final output behaves like a histogram of employee query activity for Q3 2023.

## 3. Edge Cases
- Employees with no queries between July–September 2023 are placed in bucket `0`.
- Multiple queries on the same day still count as distinct if the `query_id` differs.
- Queries outside the date range are excluded due to the join condition.
