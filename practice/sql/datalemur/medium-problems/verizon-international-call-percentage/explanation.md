

  # Explanation

## 1. Approach Overview
The goal is to calculate the percentage of phone calls where the caller and receiver belong to different countries. The approach uses conditional aggregation to count international calls and compares that count against the total number of calls.

## 2. Step-by-Step Breakdown

### Step 1: Identify caller and receiver countries
We join `phone_calls` to `phone_info` twice:
- First join: match the caller (`calls.caller_id = caller.caller_id`)
- Second join: match the receiver (`calls.receiver_id = receiver.caller_id`)
This gives us access to both countries for each call.

### Step 2: Determine whether a call is international
A call is international if:
`caller.country_id <> receiver.country_id`
Using a CASE expression:
- Return `1` for an international call
- Return `NULL` for a domestic call  
This allows `SUM()` to count only international calls because NULLs are ignored.

### Step 3: Compute total calls
`COUNT(*)` counts all calls from the `phone_calls` table, regardless of join results.

### Step 4: Calculate percentage
We divide:
SUM(international_calls) / COUNT(total_calls)

Multiply by `100.0` (float ensures decimal math), then round to 1 decimal place using `ROUND(..., 1)`.

### Step 5: Alias the result
The final output column is named `international_call_pct`.

## 3. Pseudocode / Logical Flow
- Join calls table with caller info
- Join calls table with receiver info
- For each call:  
  - If countries differ → mark as international  
  - Else → mark as domestic  
- Count all international calls  
- Count all calls  
- Compute percentage = (international / total) * 100  
- Round to one decimal place  
- Return the result as a single value

## 4. Final Query Breakdown
- `LEFT JOIN phone_info AS caller` links caller metadata  
- `LEFT JOIN phone_info AS receiver` links receiver metadata  
- `CASE WHEN caller.country_id <> receiver.country_id THEN 1` identifies international calls  
- `SUM(...)` totals them  
- `COUNT(*)` is the total number of calls  
- `ROUND(100.0 * SUM(...) / COUNT(*), 1)` generates the final percentage

## 5. Edge Cases Considered
- Missing phone_info rows handled with LEFT JOIN  
- Calls where caller or receiver country is NULL will not count as international  
- Division uses floating point to avoid integer truncation  
- SUM ignores NULL values properly

## 6. Validation
- Checked that international calls increment the SUM correctly  
- Verified COUNT(*) returns accurate total calls  
- Confirmed rounding rules (1 decimal place) match requirement  

## 7. Final Notes
The query returns exactly one row containing the international call percentage and is optimized for correctness without unnecessary complexity.
