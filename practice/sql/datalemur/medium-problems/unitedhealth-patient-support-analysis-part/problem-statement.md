------------------------------------------------------------------------
title: Unitedhealth Patient Support Analysis Part
platform: datalemur
id: unitedhealth-patient-support-analysis-part
slug: unitedhealth-patient-support-analysis-part
difficulty: medium
time_taken_minutes: 5
attempts: 3
solved_date: 2025-11-23
author: pavanpalve12
------------------------------------------------------------------------
# Problem Statement

## 1. Objective
Calculate the percentage of call-centre interactions that cannot be categorised. An uncategorised call is defined as any call where the `call_category` field is `'n/a'`, an empty string, a blank space, or NULL. The final result must be rounded to 1 decimal place.

## 2. Business Context
UnitedHealth Group (UHG) operates a support program called **Advocate4Me**, where members can contact advocates for help with claims, benefits, drug coverage, authorisations, medical records, emergency help, and portal access.

Each call is tagged by an agent under a specific category. However, some calls remain uncategorised due to missing or incomplete entries. Understanding what percentage of calls fall into this uncategorised bucket is important for operational quality, reporting accuracy, and identifying training or process gaps.

## 3. Dataset Description

### **Table: `callers`**
| Column Name         | Type      | Description |
|---------------------|-----------|-------------|
| policy_holder_id    | integer   | Unique member ID |
| case_id             | varchar   | Unique case identifier |
| call_category       | varchar   | Category assigned by agent |
| call_date           | timestamp | Timestamp of the call |
| call_duration_secs  | integer   | Duration of the call in seconds |

### Example Input
| policy_holder_id | case_id                                  | call_category          | call_date                | call_duration_secs |
|------------------|-------------------------------------------|-------------------------|---------------------------|---------------------|
| 1                | f1d012f9-9d02-4966-a968-bf6c5bc9a9fe       | emergency assistance    | 2023-04-13T19:16:53Z      | 144                 |
| 1                | 41ce8fb6-1ddd-4f50-ac31-07bfcce6aaab       | authorisation           | 2023-05-25T09:09:30Z      | 815                 |
| 2                | 9b1af84b-eedb-4c21-9730-6f099cc2cc5e       | n/a                     | 2023-01-26T01:21:27Z      | 992                 |
| 2                | 8471a3d4-6fc7-4bb2-9fc7-4583e3638a9e       | emergency assistance    | 2023-03-09T10:58:54Z      | 128                 |
| 2                | 38208fae-bad0-49bf-99aa-7842ba2e37bc       | benefits                | 2023-06-05T07:35:43Z      | 619                 |

## 4. Requirements / Tasks
1. Identify uncategorised calls where `call_category` is:
   - `'n/a'`
   - `''` (empty string)
   - `' '` (blank space)
   - `NULL`
2. Count the total number of calls.
3. Count the number of uncategorised calls.
4. Calculate the percentage:  
   `(uncategorised_calls / total_calls) * 100`
5. Round the result to **1 decimal place**.
6. Output a single column named `uncategorised_call_pct`.

## 5. Expected Output Format

### Example Output
| uncategorised_call_pct |
|-------------------------|
| 20.0                   |

## 6. Constraints & Edge Cases
- Input may contain inconsistent agent-entered values such as `'n/a'`, blank strings, or whitespace.
- The dataset may contain many rows; the solution must use efficient aggregate logic.
- Must avoid integer division by ensuring multiplication with floating-point numeric types.

## 7. Acceptance Criteria
- Correctly identifies all uncategorised call conditions.
- Returns a single floating-point number rounded to 1 decimal.
- Matches the example logic where 1 uncategorised call out of 5 equals **20.0%**.

## 8. Additional Notes
This problem tests conditional aggregation, data cleansing logic within SQL, and precise numeric formatting.
