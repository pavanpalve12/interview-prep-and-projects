------------------------------------------------------------------------
title: Uber Users Third Transaction
platform: datalemur
id: uber-users-third-transaction
slug: uber-users-third-transaction
difficulty: medium
time_taken_minutes: 4
attempts: 1
solved_date: 2025-11-23
author: pavanpalve12
------------------------------------------------------------------------
# Problem Statement

## 1. Objective
Retrieve the **third transaction** made by every user based on chronological order.

## 2. Business Context
Understanding user transaction patterns helps identify spending frequency, user retention, and behavior.  
By extracting the third transaction, analysts can study early engagement trends and correlate them with churn or long-term value.

## 3. Dataset Description

### **Table: `transactions`**
| Column Name       | Type      | Description |
|-------------------|-----------|-------------|
| user_id           | integer   | Unique identifier for the user |
| spend             | decimal   | Amount spent in the transaction |
| transaction_date  | timestamp | Timestamp when the transaction occurred |

### Example Input
| user_id | spend  | transaction_date        |
|---------|--------|--------------------------|
| 111     | 100.50 | 01/08/2022 12:00:00      |
| 111     | 55.00  | 01/10/2022 12:00:00      |
| 121     | 36.00  | 01/18/2022 12:00:00      |
| 145     | 24.99  | 01/26/2022 12:00:00      |
| 111     | 89.60  | 02/05/2022 12:00:00      |

## 4. Requirements / Tasks
1. Sort each user's transactions in ascending order of `transaction_date`.
2. Assign order numbers to each transaction (1st, 2nd, 3rd, etc.).
3. Filter for transactions where the order is **3**.
4. Output the following fields:
   - `user_id`
   - `spend`
   - `transaction_date`
5. Ensure users with fewer than 3 transactions are excluded.

## 5. Expected Output Format

### Example Output
| user_id | spend  | transaction_date        |
|---------|--------|--------------------------|
| 111     | 89.60 | 02/05/2022 12:00:00       |

## 6. Constraints & Edge Cases
- If two transactions have the same timestamp, ordering should follow consistent database behavior.
- Users with fewer than three transactions must not appear in the results.
- `transaction_date` must be properly sorted to determine the correct order.
- Ties may produce multiple “third” transactions if using `RANK()`; `ROW_NUMBER()` ensures exactly one third transaction.

## 7. Acceptance Criteria
- Query must correctly identify the 3rd chronological transaction per user.
- Output must match the example format: one row per qualifying user.
- Logic must scale to large datasets.

## 8. Additional Notes
- The example only shows one qualifying user (user 111).
- Real datasets may have more users and more transaction activity.
