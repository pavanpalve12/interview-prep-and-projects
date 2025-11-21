# Explanation

## 1. Pseudocode / Approach
- Step 1: Scan each transaction in the `transactions` table.
- Step 2: For each row:
  - If `transaction_type` is **'withdrawal'** (case-insensitive), convert the amount to a **negative value** by multiplying by `-1`.
  - Otherwise, treat the amount as a **positive value** (for deposits or any other valid credit type).
- Step 3: Sum all adjusted amounts **per `account_id`** to compute the final balance.
- Step 4: Group by `account_id` to produce one row per account.

## 2. Reasoning
Deposits increase the account balance; withdrawals reduce it.  
Using a `CASE` inside `SUM()` allows us to convert withdrawals into negative amounts and then compute the **net balance** in a single pass.

`LOWER(transaction_type)` ensures the logic is case-insensitive and robust to values like `"Withdrawal"` or `"WITHDRAWAL"`.

## 3. Edge Cases
- If an account has only deposits, the balance is simply the sum of deposits.
- If an account has only withdrawals, the result is negative.
- If there are no transactions for an account, it will not appear in the output.
- Unexpected transaction types default to positive values unless explicitly handled.
