# Explanation

## 1. Pseudocode / Approach

- **Step 1 – Normalize daily transactions:**  
  Create a CTE `trans_grp_cte` that extracts unique `(user_id, transaction_date)` pairs.  
  This removes duplicates and ensures each user-date combination is counted only once.

- **Step 2 – Assign row numbers to ordered transactions:**  
  In `streaks_cte`, assign:
  - `ROW_NUMBER()` partitioned by `user_id`, ordered by `transaction_date`.  
  - Compute a **streak grouping key** as:
    ```
    transaction_date - ROW_NUMBER()
    ```
    The subtraction groups consecutive dates into the same streak cluster because
    when dates are consecutive, this difference remains constant.

- **Step 3 – Count the length of each streak:**  
  In `users_streaks_cte`, group by `user_id` and `streak_id` (the grouping key), and count how many consecutive days appear in each streak.  
  This gives you `streak_days` per streak.

- **Step 4 – Filter users with 3+ consecutive days:**  
  Finally, select users who have any streak with `streak_days >= 3`.  
  Sort by `user_id`.

---

## 2. Reasoning

This query identifies users who have made **transactions for 3 or more consecutive days**.

The key insight is that consecutive dates can be grouped by subtracting a sequence index (`ROW_NUMBER()`) from the actual date.  
When users’ transactions are consecutive, this difference remains **constant**, forming a unique `streak_id`.

By counting the days within each streak group, we can easily detect streaks of any length.

---

## 3. Key SQL Concepts Used

- **CTEs (Common Table Expressions):** for readability and logical separation.  
- **ROW_NUMBER():** assigns a sequential rank per user’s ordered transaction dates.  
- **Date arithmetic:** used to detect gaps between transaction dates.  
- **Grouping by a derived key (`streak_id`):** to cluster consecutive days.  
- **Filtering streaks:** simple condition `streak_days >= 3`.

---

## 4. Edge Cases

- Users with **less than 3 days** of consecutive transactions are excluded.  
- Multiple streaks per user → only the qualifying streaks are considered.  
- Duplicate transactions on the same date do not inflate streaks since the first CTE groups them out.  
- Non-consecutive dates automatically break streaks.

---

## 5. Example Walkthrough

| user_id | transaction_date | row_num | streak_id (date - row_num) |
|----------|------------------|---------|-----------------------------|
| 101      | 2023-01-01       | 1       | 2023-01-00 → Group A        |
| 101      | 2023-01-02       | 2       | 2023-01-00 → Group A        |
| 101      | 2023-01-03       | 3       | 2023-01-00 → Group A        |
| 101      | 2023-01-05       | 4       | 2023-01-01 → Group B        |

→ `Group A` = 3 consecutive days → qualifies.

---

## 6. Key Learning

This problem demonstrates the **“date difference minus row_number” technique** — a classic pattern for detecting consecutive-day streaks efficiently in SQL.
