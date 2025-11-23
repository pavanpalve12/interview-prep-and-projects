------------------------------------------------------------------------
title: Walmart Histogram Of Users And Purchases
platform: datalemur
id: walmart-histogram-of-users-and-purchases
slug: walmart-histogram-of-users-and-purchases
difficulty: medium
time_taken_minutes: 10
attempts: 1
solved_date: 2025-11-23
author: pavanpalve12
------------------------------------------------------------------------
# Problem Statement

## 1. Objective
Identify each Walmart user's most recent transaction date and determine how many products they purchased on that day. The output should list the latest transaction date for each user, their user ID, and the total number of products bought, ordered chronologically by transaction date.

## 2. Business Context
Walmart customers often make multiple purchases across different dates. For analytics and user-behavior insights, it is important to know what each customer purchased on their most recent visit. Since a single transaction date may include multiple product purchases, the analysis must group products correctly.

## 3. Dataset Description

### **Table: `user_transactions`**
| Column Name       | Type      | Description |
|-------------------|-----------|-------------|
| product_id        | integer   | Product identifier purchased in the transaction |
| user_id           | integer   | Unique identifier for the customer |
| spend             | decimal   | Amount spent on the product |
| transaction_date  | timestamp | Date and time of the purchase |

### Example Input
| product_id | user_id | spend | transaction_date        |
|------------|---------|-------|--------------------------|
| 3673       | 123     | 68.90 | 07/08/2022 12:00:00     |
| 9623       | 123     | 274.10| 07/08/2022 12:00:00     |
| 1467       | 115     | 19.90 | 07/08/2022 12:00:00     |
| 2513       | 159     | 25.00 | 07/08/2022 12:00:00     |
| 1452       | 159     | 74.50 | 07/10/2022 12:00:00     |

## 4. Requirements / Tasks
1. Determine each user's most recent `transaction_date`.
2. Include all purchases made by that user on that date — multiple rows may exist.
3. Count the number of products (`product_id`) the user bought on that most recent date.
4. Output the following columns:
   - `transaction_date`
   - `user_id`
   - `purchase_count`
5. Sort the final results chronologically by `transaction_date`.
6. Ensure correctness even when:
   - A user has multiple purchases on the same recent date.
   - A user has transactions on multiple different dates.

## 5. Expected Output Format

### Example Output
| transaction_date       | user_id | purchase_count |
|------------------------|---------|----------------|
| 07/08/2022 12:00:00    | 115     | 1              |
| 07/08/2022 12:00:00    | 123     | 2              |
| 07/10/2022 12:00:00    | 159     | 1              |

## 6. Constraints & Edge Cases
- Users may have multiple purchase dates; only the latest should be selected.
- Multiple products may be purchased on a single date.
- If multiple transactions occur at the same timestamp, they must all be counted.
- Each user must appear exactly once in the final output.

## 7. Acceptance Criteria
- Window function (RANK/DENSE_RANK) logic must correctly identify each user’s most recent transaction date.
- Product counts must be accurate for the selected date.
- Output sorted correctly by `transaction_date`.
- Query works on datasets with arbitrary size and varying timestamps.

## 8. Additional Notes
- This problem focuses on understanding window functions, ranking, grouping, and aggregation based on most recent user activity.
