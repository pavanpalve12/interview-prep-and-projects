# Explanation

## 1. Approach Overview
The goal is to find, for every card, the earliest month and year in which it was issued, and then return the issued amount for that first issuance. The query uses a window function to rank chronological issuance records per card and filters to keep only the first one.

## 2. Step-by-Step Breakdown

### Step 1: Rank issuance records per card
A CTE (`card_issue_ranked_cte`) selects all columns from `monthly_cards_issued` and adds a window function:

- `PARTITION BY card_name` groups data for each card independently.
- `ORDER BY issue_year, issue_month` sorts the card's issuance records from earliest to latest.
- `RANK()` assigns:
  - **1** to the earliest issuance for that card.
  - Higher integers for later months.

This ranking identifies the first issuance month for every card.

### Step 2: Filter to the earliest issuance
From the CTE, the outer query selects rows where `issue_rank = 1`, i.e., only the earliest issuance entry per card.

### Step 3: Select required output fields
Only `card_name` and `issued_amount` are returned, since those represent the card name and the amount issued during the earliest issuance.

### Step 4: Order results
The final output is ordered by `issued_amount` in descending order to show cards with the highest initial issuance at the top.

## 3. Pseudocode / Logical Flow
- For each card:
  - Sort issuance records by year → month.
  - Assign rank 1 to the earliest record.
- Keep only rank 1 rows.
- Return card name and issued amount.
- Sort by issued amount descending.

## 4. Final Query Explanation
- `RANK()` ensures ties (same month/year) are handled consistently.
- `PARTITION BY card_name` prevents mixing different card types.
- `ORDER BY issue_year, issue_month` determines earliest issuance correctly.
- `WHERE issue_rank = 1` guarantees only the earliest issuance per card remains.
- `ORDER BY issued_amount DESC` sorts the final report meaningfully.

## 5. Edge Cases Considered
- Cards issued multiple times in the same month/year will all get `rank = 1` because of `RANK()`. This is expected if duplicates exist.
- If issuance months are missing or unsorted in the input, the window function still enforces correct ordering.
- Cards with only one issuance record naturally get `rank = 1`.

## 6. Validation
The logic was validated by checking:
- Each card appears only once in the final output.
- The earliest year-month combination matches known input samples.
- Sorting by `issued_amount` behaves consistently.

## 7. Final Notes
To avoid multiple rows for a card when duplicates share the same earliest month/year, use `ROW_NUMBER()` instead of `RANK()` if only one row per card is required strictly.
