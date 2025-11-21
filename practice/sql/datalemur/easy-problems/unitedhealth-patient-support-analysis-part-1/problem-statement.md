------------------------------------------------------------------------
title: Unitedhealth Patient Support Analysis Part 1
platform: datalemur
id: unitedhealth-patient-support-analysis-part-1
slug: unitedhealth-patient-support-analysis-part-1
difficulty: easy
time_taken_minutes: 5
attempts: 1
solved_date: 2025-11-21
author: pavanpalve12
------------------------------------------------------------------------
# Problem Statement

## Objective
UnitedHealth Group (UHG) runs the Advocate4Me program, where policy holders can call advocates for support related to claims, benefits, drug coverage, authorizations, medical records, emergency assistance, and more.

You are asked to determine **how many policy holders made three or more calls**.  
Each call is uniquely identified by the `case_id` column.

Your query must output a single column:

- `policy_holder_count` — the number of policy holders who placed **at least 3 calls**.

---

## Table: `callers`

| Column Name         | Type      |
|---------------------|-----------|
| policy_holder_id    | integer   |
| case_id             | varchar   |
| call_category       | varchar   |
| call_date           | timestamp |
| call_duration_secs  | integer   |

### Example Input

| policy_holder_id | case_id                                   | call_category          | call_date                | call_duration_secs |
|------------------|--------------------------------------------|-------------------------|---------------------------|---------------------|
| 1                | f1d012f9-9d02-4966-a968-bf6c5bc9a9fe       | emergency assistance     | 2023-04-13T19:16:53Z      | 144                 |
| 1                | 41ce8fb6-1ddd-4f50-ac31-07bfcce6aaab       | authorisation            | 2023-05-25T09:09:30Z      | 815                 |
| 2                | 9b1af84b-eedb-4c21-9730-6f099cc2cc5e       | claims assistance        | 2023-01-26T01:21:27Z      | 992                 |
| 2                | 8471a3d4-6fc7-4bb2-9fc7-4583e3638a9e       | emergency assistance     | 2023-03-09T10:58:54Z      | 128                 |
| 2                | 38208fae-bad0-49bf-99aa-7842ba2e37bc       | benefits                 | 2023-06-05T07:35:43Z      | 619                 |

---

## Example Output

| policy_holder_count |
|---------------------|
| 1                   |

---

## Explanation
Policy holder **ID 2** made three calls (identified by distinct `case_id` values).  
Policy holder **ID 1** made only two calls.  
Therefore, only **one** policy holder qualifies for the “three or more calls” requirement.
