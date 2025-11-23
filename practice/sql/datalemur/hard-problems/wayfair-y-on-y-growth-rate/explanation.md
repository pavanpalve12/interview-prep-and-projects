# Explanation

## 1. Approach Overview
The goal is to calculate the year-on-year (YoY) growth rate in total spend for each product. The result must be grouped by product ID, ordered by year, and the YoY percentage must be rounded to two decimals. To achieve this, the logic relies on a window function (`LAG`) to retrieve the previous year's spend for the same product. Once current-year and previous-year values are available, the YoY percentage is computed using the standard formula:  
**100 × (current_year_spend − previous_year_spend) / previous_year_spend**.

## 2. Step-by-Step Breakdown

### Step 1 — Extract Product, Spend, and Year
For each transaction, extract:
- `product_id`
- `spend`
- `year` using `EXTRACT(YEAR FROM transaction_date)`

This organizes the data at the right granularity (per product per year).

### Step 2 — Retrieve Previous Year’s Spend Using a Window Function
Use the `LAG()` window function:
- Partition by `product_id` so each product is evaluated independently.
- Order by year so the previous row corresponds to the prior year’s spend.
- The output becomes `prev_year_spend`, which is required for YoY calculation.

This gives each row both its current-year spend and the previous year’s spend.

### Step 3 — Calculate YoY Growth Rate
Once both values are available:
- `curr_year_spend = spend`
- `prev_year_spend` from `LAG`
- Apply YoY formula:
  
  `ROUND(100 * (spend - prev_year_spend) / prev_year_spend, 2)`

This yields the YoY percentage change rounded to two decimals.

### Step 4 — Order the Final Output
The query ends by sorting results by:
1. `product_id` (so products stay grouped)
2. `year` (ascending chronological order)

This ensures clean, analytical reporting.

## 3. Logical Flow (Pseudocode)
1. For each transaction, derive the `year`.
2. For each product, sort rows by year.
3. Use `LAG` to fetch previous year's spend.
4. Compute YoY% only when a valid previous year exists.
5. Return product → year → YoY rate in ascending order.

## 4. Query Explanation (Clause-by-Clause)

### WITH CTE
`total_purchases_yearly_cte` prepares all required columns:
- Extracted year  
- Current year spend  
- Previous year spend using `LAG`

This isolates the core logic and cleans up the final SELECT.

### Final SELECT
Outputs:
- `year`
- `product_id`
- `curr_year_spend`
- `prev_year_spend`
- `yoy_rate` computed using percentage formula

### ORDER BY
Ensures correct grouping and chronological sorting:
`ORDER BY product_id, year`.

## 5. Edge Cases Considered
- For the earliest year of each product, `prev_year_spend` is NULL — YoY rate will be NULL, which is expected.
- If a product skips a year, YoY compares only the nearest previous row (not a true year-gap calculation).
- Division by zero is avoided by assuming no zero-spend previous years; if present, using a NULL or CASE wrapper would be required.

## 6. Validation
The output was validated by checking a few test cases manually:
- A year with no previous reference correctly returns NULL.
- Differences between consecutive years yield correct YoY percentages.
- Ordering is correctly grouped by product and sorted by year.

## 7. Notes
- If the dataset contains multiple transactions per product per year, an aggregation step (`SUM(spend)`) would be required before applying the window function.
- The logic reflects the cleanest YoY calculation pattern using ANSI SQL window functions.
