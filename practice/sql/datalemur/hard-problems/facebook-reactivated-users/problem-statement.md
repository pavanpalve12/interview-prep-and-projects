------------------------------------------------------------------------
title: Facebook Reactivated Users
platform: datalemur
id: facebook-reactivated-users
slug: facebook-reactivated-users
difficulty: hard
time_taken_minutes: 40 
attempts: 5
solved_date: 2025-11-24
author: pavanpalve12
------------------------------------------------------------------------
# Problem Statement

## 1. Objective
Determine the number of **reactivated users** per month for the year 2022.  
A user is considered *reactivated* in a given month if they logged in during that month **after being inactive in the previous month**.

## 2. Business Context
Facebook login activity is tracked daily, but the focus here is identifying users who return after a period of inactivity.  
This helps measure user churn, comeback behavior, and platform stickiness.  
The task is based only on 2022 data, but logic must correctly account for users whose previous login occurred before 2022.

## 3. Dataset Description

### **Table: `user_logins`**
| Column Name | Type      | Description |
|-------------|-----------|-------------|
| user_id     | integer   | Unique identifier for each user |
| login_date  | datetime  | Timestamp of the user’s login |

### Example Input
| user_id | login_date             |
|---------|-------------------------|
| 123     | 02/22/2022 12:00:00    |
| 112     | 03/15/2022 12:00:00    |
| 245     | 03/28/2022 12:00:00    |
| 123     | 05/01/2022 12:00:00    |
| 725     | 05/25/2022 12:00:00    |

## 4. Requirements / Tasks
1. Extract the month (`mth`) from `login_date`.
2. Identify the previous login month per user using a window function.
3. Classify a login as a **reactivation** if:
   - The user had **no login in the previous month**, or
   - The login in the current month occurs after a gap (e.g., last login in March → next login in May).
4. Treat first logins in 2022 as reactivations because the user is assumed to have logged in during 2021.
5. Output:
   - `mth` (numeric month)
   - `reactivated_users` (count of distinct reactivated users per month)
6. Support multiple logins per month but count each user once per month.

## 5. Expected Output Format

### Example Output
| mth | reactivated_users |
|-----|--------------------|
| 2   | 1                  |
| 3   | 2                  |
| 5   | 2                  |

## 6. Constraints & Edge Cases
- The table contains **only 2022 data**, but users may have logged in during 2021.
- Missing previous-year login data must be interpreted as **previously active**, i.e., first login of any user in 2022 counts as reactivation.
- A user may reactivate multiple times (e.g., active in Feb → inactive in March → active in May).
- Multiple logins within the same month should **not** inflate counts.
- Assume no missing dates within 2022.

## 7. Acceptance Criteria
- Each month’s result must show only **distinct reactivated users**.
- Query must correctly handle:
  - First logins in the dataset
  - Month-to-month activity gaps
  - Multiple logins per user per month
- Output must be grouped by month and sorted in ascending order.

## 8. Additional Notes
- As of **Aug 4th, 2023**, both the question and solution logic were updated after reviewing user feedback.
- Real datasets may produce different month counts; example values are illustrative.
