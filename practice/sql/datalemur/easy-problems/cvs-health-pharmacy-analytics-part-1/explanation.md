# Explanation

## 1. Pseudocode / Approach
- Step 1: Read each row from the `pharmacy_sales` table.
- Step 2: For each drug, compute **total profit** using:  
  `total_profit = total_sales - cogs`
- Step 3: Order all drugs by `total_profit` in **descending** order.
- Step 4: Return the **top 3** most profitable drugs by limiting the output to 3 rows.

## 2. Reasoning
The problem requires identifying the **highest-profit drugs**.  
Profit is calculated directly from the given columns:
- `total_sales` → revenue generated  
- `cogs` (cost of goods sold) → expense  

Subtracting COGS from total sales gives the net profit for each drug.

Sorting by this profit metric and applying `LIMIT 3` isolates the top three most profitable items.

## 3. Edge Cases
- If multiple drugs have the same profit, ordering between them is not guaranteed unless ties are handled explicitly.
- Drugs with negative profit will appear lower in the list and are naturally excluded by the `LIMIT 3`.
- No grouping is required since the table already presents aggregated totals per drug.
