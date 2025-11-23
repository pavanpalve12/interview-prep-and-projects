------------------------------------------------------------------------
title: Facebook Active User Retention
platform: datalemur
id: facebook-active-user-retention
slug: facebook-active-user-retention
difficulty: hard
time_taken_minutes: 45
attempts: 1
solved_date: 2025-11-23
author: pavanpalve12
------------------------------------------------------------------------
# Problem Statement

## 1. Objective
Determine the number of Monthly Active Users (MAUs) for **July 2022** from the Facebook `user_actions` table.  
A Monthly Active User is defined as a user who performs at least one valid action in **both July 2022 and June 2022**.

## 2. Business Context
Facebook uses MAU (Monthly Active Users) to measure platform engagement.  
A user is considered “active” only if they have meaningful interactions in consecutive months.  
For this task, user actions are limited to:
- `sign-in`
- `like`
- `comment`

The metric helps identify returning and engaged users month-over-month.

## 3. Dataset Description

### Table: `user_actions`
| Column Name | Type     | Description |
|-------------|----------|-------------|
| user_id     | integer  | Unique identifier for each user |
| event_id    | integer  | Unique identifier for the event |
| event_type  | string   | One of: `"sign-in"`, `"like"`, `"comment"` |
| event_date  | datetime | Date and time the event occurred |

### Example Input
| user_id | event_id | event_type | event_date            |
|---------|----------|------------|------------------------|
| 445     | 7765     | sign-in    | 05/31/2022 12:00:00    |
| 742     | 6458     | sign-in    | 06/03/2022 12:00:00    |
| 445     | 3634     | like       | 06/05/2022 12:00:00    |
| 742     | 1374     | comment    | 06/05/2022 12:00:00    |
| 648     | 3124     | like       | 06/18/2022 12:00:00    |

## 4. Requirements / Tasks
1. Extract the **month number** from `event_date` using numerical format `1–12`.
2. Filter actions to allowed event types:  
   - `sign-in`, `like`, `comment`.
3. Identify users active in both:
   - **June 2022**
   - **July 2022**
4. Count distinct such users for **July 2022**.
5. Present the output with:
   - `month` (e.g., 7)
   - `monthly_active_users`
6. Ensure the solution works even when data contains only partial months (as in the example where June is available but July is not).

## 5. Expected Output Format (Example for June 2022)
| month | monthly_active_users |
|--------|-----------------------|
| 6      | 1                     |

### Explanation of Example
In June 2022, only **user 445** performed valid actions in both May and June.  
Therefore, the MAU count for June is **1**.

## 6. Constraints & Edge Cases
- A user performing multiple actions within the same month must be counted only once.  
- Only valid event types qualify.
- If the dataset lacks data for a specific month (e.g., July), the MAU count should adjust accordingly.
- Month extraction must always return numerical format (e.g. `6`, `7`).

## 7. Acceptance Criteria
- The SQL query correctly identifies users active in both consecutive months.  
- The month number in the output is numerical.  
- The result must contain **one row for July 2022**, or whichever month is computed.

## 8. Additional Notes
- The provided example shows only June data; adapt the logic for July when full data is available.
- Comparing month-to-month activity is a standard retention metric used in MAU calculations.
