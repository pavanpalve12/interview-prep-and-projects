# Explanation

## 1. Pseudocode / Approach
- Step 1: Select all `page_id` values from the `pages` table — this represents **every page**.
- Step 2: Select all `page_id` values from the `page_likes` table — these are **only the pages that received at least one like**.
- Step 3: Use the `EXCEPT` operator to return the pages present in `pages` but **not** present in `page_likes`.
- Step 4: Order the final list by `page_id` for readability.

## 2. Reasoning
`EXCEPT` removes any `page_id` that appears in both tables.  
So the result is the set of **pages with zero likes**.

This is cleaner than using a LEFT JOIN + `WHERE page_likes.page_id IS NULL`, and avoids grouping or counting. It's a direct, set-based approach.

## 3. Edge Cases
- Pages that have **zero** likes will appear in the result.
- Pages that have **at least one like** will be excluded automatically.
- If `page_likes` has duplicates for the same page, `EXCEPT` still removes that page correctly.
- If `page_likes` is empty, all pages will be returned.

