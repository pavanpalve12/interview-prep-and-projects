# Explanation

## 1. Pseudocode / Approach
- Step 1: Filter `pharmacy_sales` to include only **unprofitable drugs**, i.e., rows where  
  `total_sales - cogs <= 0`.
- Step 2: For each such drug:
  - Extract `manufacturer`
  - Extract `drug`
  - Compute the **total loss** as the absolute value of the negative profit:  
    `ABS(total_sales - cogs)`
- Step 3: Use this filtered dataset (a subquery) and **group by manufacturer**.
- Step 4: For each manufacturer, compute:
  - `drug_count` → number of unprofitable drugs they produced.
  - `total_loss` → sum of losses across all their unprofitable drugs.
- Step 5: Sort the results by `total_loss` descending to see which manufacturer lost the most.

## 2. Reasoning
This query identifies manufacturers whose products generated **financial losses**, and quantifies:
- how many loss-making drugs they produced  
- the combined financial loss across those drugs  

Using a subquery simplifies the flow:
- First isolate loss-making rows  
- Then aggregate at the manufacturer level  

The use of `ABS()` produces a positive loss value for easier interpretation.

## 3. Edge Cases
- Manufacturers with **all profitable drugs** will not appear in the results.
- If a manufacturer has multiple loss-making drugs, all losses are summed.
- A drug with exactly breakeven profit (`total_sales - cogs = 0`) is counted as a loss of 0 and included in `drug_count` but does not increase `total_loss`.
- Sorting by `total_loss DESC` ensures the biggest loss-makers appear at the top.
