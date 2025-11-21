------------------------------------------------------------------------
title: Paypal Final Account Balance
platform: datalemur
id: paypal-final-account-balance
slug: paypal-final-account-balance
difficulty: easy
time_taken_minutes: 4
attempts: 3
solved_date: 2025-11-21
author: pavanpalve12
------------------------------------------------------------------------
# Problem Statement

## Objective
Given a table containing information about deposits and withdrawals made using PayPal, write a SQL query to retrieve the **final account balance for each account**.  
Assume all transactions are recorded correctly with **no missing entries**.

A deposit **adds** to the balance.  
A withdrawal **subtracts** from the balance.

Your output must include:
- `account_id`
- `final_balance`

---

## Table: `transactions`

| Column Name      | Type     |
|------------------|----------|
| transaction_id   | integer  |
| account_id       | integer  |
| amount           | decimal  |
| transaction_type | varchar  |

### Example Input

| transaction_id | account_id | amount | transaction_type |
|----------------|------------|--------|------------------|
| 123            | 101        | 10.00  | Deposit          |
| 124            | 101        | 20.00  | Deposit          |
| 125            | 101        | 5.00   | Withdrawal       |
| 126            | 201        | 20.00  | Deposit          |
| 128            | 201        | 10.00  | Withdrawal       |

---

## Example Output

| account_id | final_balance |
|------------|----------------|
| 101        | 25.00          |
| 201        | 10.00          |

---

## Explanation
For **account 101**:
- Total deposits = 10.00 + 20.00 = **30.00**  
- Total withdrawals = 5.00  
- Final balance = 30.00 − 5.00 = **25.00**

For **account 201**:
- Total deposits = 20.00  
- Total withdrawals = 10.00  
- Final balance = **10.00**
