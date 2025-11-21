# Explanation

## 1. Pseudocode / Approach
- Step 1: Group the `monthly_cards_issued` table by `card_name`.
- Step 2: For each card:
  - Compute the **maximum** `issued_amount` across all months.
  - Compute the **minimum** `issued_amount` across all months.
- Step 3: In the outer query, subtract `min_issued_amount` from `max_issued_amount` to get the **difference**.
- Step 4: Sort the result by `difference` in descending order so cards with the largest month-to-month disparity appear first.

## 2. Reasoning
To find issuance variation for each card, you only need the highest and lowest monthly counts.  
The inner grouped subquery (or CTE) efficiently computes these values.  
The outer query performs the subtraction and sorts by the resulting difference.

This avoids scanning the table multiple times and provides a clean, minimal solution.

## 3. Edge Cases
- Cards that only have **one month** of data will show a difference of **0**.
- Negative results cannot occur because `MAX` ≥ `MIN`.
- If two cards have identical differences, their relative order is not guaranteed unless further sorted.
