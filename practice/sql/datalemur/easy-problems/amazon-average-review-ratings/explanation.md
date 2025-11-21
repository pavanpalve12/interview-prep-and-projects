# Explanation

## 1. Pseudocode / Approach
- Step 1: Extract the **month** from each review’s `submit_date`.
- Step 2: Group reviews by:
  - `product_id`
  - the extracted month
- Step 3: For each product-month combination, calculate the **average star rating**.
- Step 4: Round the average to **2 decimal places** using `ROUND()`.
- Step 5: Order results by month, then by product ID for readability.

## 2. Reasoning
The problem requires computing **monthly average ratings per product**.  
Using `EXTRACT(MONTH FROM submit_date)` creates the month bucket.  
Grouping by both product and month ensures averages are computed independently for each product each month.

`ROUND(AVG(stars), 2)` produces a clean, report-friendly numeric result.

## 3. Edge Cases
- Products with no reviews in a given month simply do not appear in the result.
- If a product receives multiple reviews in the same month, all contribute to the average.
- Reviews with NULL `stars` values are ignored by `AVG()` automatically.
