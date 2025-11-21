------------------------------------------------------------------------
title: Facebook Average Post Hiatus Part 1
platform: datalemur
id: facebook-average-post-hiatus-part-1
slug: facebook-average-post-hiatus-part-1
difficulty: easy
time_taken_minutes: 9
attempts: 1
solved_date: 2025-11-21
author: pavanpalve12
------------------------------------------------------------------------
# Problem Statement

## Objective
Given a table of Facebook posts, write a SQL query that, **for each user who posted at least twice in 2021**, returns the number of days between that user's **first post of 2021** and **last post of 2021**.

Output two columns:
- `user_id`
- `days_between`  — number of days between the first and last post in 2021 (integer)

Sort order is not required but returning results ordered by `user_id` is fine.

---

## Table: `posts`

| Column Name   | Type      |
|---------------|-----------|
| user_id       | integer   |
| post_id       | integer   |
| post_content  | text      |
| post_date     | timestamp |

---

## Example Input

| user_id | post_id | post_content                                                                 | post_date             |
|---------|---------|-------------------------------------------------------------------------------|------------------------|
| 151652  | 599415  | Need a hug                                                                    | 07/10/2021 12:00:00    |
| 661093  | 624356  | Bed. Class 8-12. Work 12-3. Gym 3-5 or 6. Then class 6-10...                  | 07/29/2021 13:00:00    |
| 004239  | 784254  | Happy 4th of July!                                                            | 07/04/2021 11:00:00    |
| 661093  | 442560  | Just going to cry myself to sleep after watching Marley and Me.               | 07/08/2021 14:00:00    |
| 151652  | 111766  | I'm so done with covid - need travelling ASAP!                                | 07/12/2021 19:00:00    |

---

## Example Output

| user_id | days_between |
|---------|--------------|
| 151652  | 2            |
| 661093  | 21           |

---

## Explanation
- Only users with **at least two posts in 2021** are considered.
- For each such user, compute: `days_between = last_post_date_2021 - first_post_date_2021` (cast/difference at date granularity).
- In the example, user `151652` posted on 07/10/2021 and 07/12/2021 → `2` days between.  
  User `661093` posted on 07/08/2021 and 07/29/2021 → `21` days between.