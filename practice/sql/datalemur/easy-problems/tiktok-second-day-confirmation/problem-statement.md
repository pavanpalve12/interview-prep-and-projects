------------------------------------------------------------------------
title: Tiktok Second Day Confirmation
platform: datalemur
id: tiktok-second-day-confirmation
slug: tiktok-second-day-confirmation
difficulty: easy
time_taken_minutes: 8
attempts: 1
solved_date: 2025-11-21
author: pavanpalve12
------------------------------------------------------------------------
# Problem Statement

## Objective
Assume you have tables with TikTok sign-up and text-confirmation data. New users sign up with an email; upon signup they receive a text message to confirm their account.

Write a SQL query to **return the user IDs of users who did not confirm on the first day (signup date) but did confirm on the second day** (i.e., `action_date` = `signup_date + 1 day`).

---

## Definition
- `action_date` is the date the user confirmed via text.
- "Did not confirm on the first day" means there is no confirmation (or the confirmation is not marked as confirmed) on the same date as `signup_date`.
- "Confirmed on the second day" means there is a text row with `signup_action = 'Confirmed'` and `action_date` equals the calendar day after `signup_date`.

---

## Table: `emails`

| Column Name | Type     |
|-------------|----------|
| email_id    | integer  |
| user_id     | integer  |
| signup_date | datetime |

### Example Input (`emails`)

| email_id | user_id | signup_date         |
|----------|---------|----------------------|
| 125      | 7771    | 06/14/2022 00:00:00  |
| 433      | 1052    | 07/09/2022 00:00:00  |

---

## Table: `texts`

| Column Name   | Type     |
|---------------|----------|
| text_id       | integer  |
| email_id      | integer  |
| signup_action | string   |
| action_date   | datetime |

### Example Input (`texts`)

| text_id | email_id | signup_action  | action_date         |
|---------|----------|----------------|----------------------|
| 6878    | 125      | Confirmed      | 06/14/2022 00:00:00  |
| 6997    | 433      | Not Confirmed  | 07/09/2022 00:00:00  |
| 7000    | 433      | Confirmed      | 07/10/2022 00:00:00  |

---

## Example Output

| user_id |
|---------|
| 1052    |

---

## Explanation
User `1052` did not confirm on the signup day (07/09/2022) but has a confirmation text on the **next day** (07/10/2022). User `7771` confirmed on the same day as signup, so they are excluded.
