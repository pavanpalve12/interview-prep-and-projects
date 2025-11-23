# Explanation

## 1. Approach Overview
The goal is to calculate the percentage of calls that are uncategorised. A call is considered uncategorised if the `call_category` field is either NULL, an empty string, a blank space, or the literal value `'n/a'`. The solution uses conditional counting within an aggregate query to compute the ratio of uncategorised calls to total calls, then multiplies by 100 and rounds the result to one decimal place.

## 2. Step-by-Step Breakdown

### Step 1: Identify uncategorised call conditions
A call falls into the uncategorised bucket if:
- `call_category` = 'n/a'
- `call_category` = '' (empty string)
- `call_category` = ' ' (single blank space)
- `call_category` IS NULL

These values must be captured in a CASE expression that returns `1` for uncategorised calls and NULL otherwise, ensuring COUNT works correctly.

### Step 2: Count uncategorised calls
`COUNT(CASE WHEN ... THEN 1 ELSE NULL END)` counts only rows where the condition is true. Any NULL returned by the CASE does not contribute to the count.

### Step 3: Count all calls
`COUNT(*)` provides the total number of call records in the `callers` table.

### Step 4: Compute the percentage
The uncategorised call count is divided by total calls, multiplied by 100.0 to ensure the expression uses floating-point arithmetic.

### Step 5: Round the result
`ROUND(..., 1)` rounds the final percentage to one decimal place, matching the expected output precision.

## 3. Logical Flow (Pseudocode)
total_calls = count all rows
uncategorised_calls = count rows where category is null OR empty OR blank OR 'n/a'
percentage = (uncategorised_calls / total_calls) * 100
round percentage to 1 decimal place
return percentage


## 4. Final Query Explanation
- `CASE WHEN call_category IN ('n/a', '', ' ') OR call_category IS NULL THEN 1`  
  Marks a row as uncategorised.
- `COUNT(CASE ... END)`  
  Counts only flagged rows.
- `COUNT(*)`  
  Counts all rows.
- Multiplying by `100.0` ensures numeric precision in the percentage calculation.
- `ROUND(..., 1)`  
  Outputs one decimal place for readability.

## 5. Edge Cases Considered
- NULL category fields.
- Categories that appear visually empty ('', ' ').
- String values typed as `'n/a'`.
- Tables with zero or extremely small row counts (avoids integer division issues due to floating-point multiplier).

## 6. Validation
The logic was verified by checking:
- Conditional counting behaviour.
- NULL-handling within COUNT.
- Percentage correctness using sample scenarios.
- Rounding accuracy.

## 7. Final Notes
The query is efficient, uses a single pass over the table, and works on any dataset size. No joins or window functions are needed for this calculation. It scales cleanly and handles inconsistent category data without additional preprocessing.
