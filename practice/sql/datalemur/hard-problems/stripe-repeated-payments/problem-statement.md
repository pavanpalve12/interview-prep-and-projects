------------------------------------------------------------------------
title: Stripe Repeated Payments
platform: datalemur
id: stripe-repeated-payments
slug: stripe-repeated-payments
difficulty: hard
time_taken_minutes: 40
attempts: 5
solved_date: 2025-11-24
author: pavanpalve12
------------------------------------------------------------------------
# Problem Statement

## 1. Objective
Identify and count repeated payment transactions — cases where a payment is accidentally duplicated at the same merchant using the same credit card for the same amount within a 10-minute window.

## 2. Business Context
Duplicate or repeated payments often occur due to user mistakes, API retry logic, or system failures. Detecting such events is essential for fraud monitoring, error correction, and refund workflows.  
A “repeated payment” is defined strictly as a second (or subsequent) transaction occurring within 10 minutes of a previous identical payment.

## 3. Dataset Description

### Table: `transactions`
| Column Name            | Type      | Description |
|------------------------|-----------|-------------|
| transaction_id         | integer   | Unique identifier for each transaction |
| merchant_id            | integer   | Merchant receiving the payment |
| credit_card_id         | integer   | Credit card used |
| amount                 | integer   | Payment amount |
| transaction_timestamp  | datetime  | Timestamp of the transaction |

### Example Input
| transaction_id | merchant_id | credit_card_id | amount | transaction_timestamp     |
|----------------|-------------|----------------|--------|----------------------------|
| 1              | 101         | 1              | 100    | 09/25/2022 12:00:00        |
| 2              | 101         | 1              | 100    | 09/25/2022 12:08:00        |
| 3              | 101         | 1              | 100    | 09/25/2022 12:28:00        |
| 4              | 102         | 2              | 300    | 09/25/2022 12:00:00        |
| 6              | 102         | 2              | 400    | 09/25/2022 14:00:00        |

## 4. Requirements / Tasks
1. Group transactions by:
   - `merchant_id`
   - `credit_card_id`
   - `amount`
2. Sort each group's transactions by `transaction_timestamp`.
3. Compare each transaction to the immediately previous one using a window function.
4. Calculate the time difference (in minutes) between consecutive transactions.
5. Identify transactions where the difference is **≤ 10 minutes**.
6. Count all such repeated transactions.
7. Do **not** count the first transaction — only the subsequent repeated one(s).

## 5. Expected Output Format

### Example Output
| payment_count |
|---------------|
| 1             |

## 6. Constraints & Edge Cases
- Only transactions with identical merchant, card, and amount qualify.
- The earliest transaction in each group is never counted.
- Exact timestamp match (0 minutes difference) counts as a repeated payment.
- Transactions with different amounts must be treated independently.
- A cluster of transactions (e.g., 3 or 4 within 10 minutes) counts repeated payments as:
  - 1st → ignored  
  - 2nd → counted  
  - 3rd → counted  
  - etc.

## 7. Acceptance Criteria
- Query must correctly identify repeated payments using `LAG`.
- Only subsequent qualifying transactions should be counted.
- Must work for large datasets and any number of transaction groups.

## 8. Additional Notes
- Input and output may differ in real datasets; sample shows only the logic expected.
- Used commonly in fraud detection and billing reconciliation systems.
