------------------------------------------------------------------------
title: Facebook App Click Through Rate Ctr
platform: datalemur
id: facebook-app-click-through-rate-ctr
slug: facebook-app-click-through-rate-ctr
difficulty: easy
time_taken_minutes: 7
attempts: 1
solved_date: 2025-11-21
author: pavanpalve12
------------------------------------------------------------------------
# Problem Statement

## Objective
Assume you are working with Facebook app analytics and have access to an `events` table.  
Write a SQL query to calculate the **click-through rate (CTR)** for each app in **2022**, rounded to **2 decimal places**.

CTR is defined as:
CTR (%) = 100.0 * (number of clicks / number of impressions)


Use **100.0** (not 100) to avoid integer division.

Your output should include:
- `app_id`
- `ctr` (percentage value rounded to two decimals)

---

## Table: `events`

| Column Name | Type      |
|-------------|-----------|
| app_id      | integer   |
| event_type  | string    |
| timestamp   | datetime  |

### Example Input

| app_id | event_type | timestamp              |
|--------|-------------|------------------------|
| 123    | impression  | 07/18/2022 11:36:12    |
| 123    | impression  | 07/18/2022 11:37:12    |
| 123    | click       | 07/18/2022 11:37:42    |
| 234    | impression  | 07/18/2022 14:15:12    |
| 234    | click       | 07/18/2022 14:16:12    |

---

## Example Output

| app_id | ctr    |
|--------|---------|
| 123    | 50.00   |
| 234    | 100.00  |

---

## Explanation
- App **123** has 2 impressions and 1 click  
  CTR = (1 / 2) × 100.0 = **50.00%**

- App **234** has 1 impression and 1 click  
  CTR = (1 / 1) × 100.0 = **100.00%**

