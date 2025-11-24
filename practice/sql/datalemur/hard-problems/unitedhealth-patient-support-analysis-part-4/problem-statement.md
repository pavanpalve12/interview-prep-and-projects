------------------------------------------------------------------------
title: Unitedhealth Patient Support Analysis Part 4
platform: datalemur
id: unitedhealth-patient-support-analysis-part-4
slug: unitedhealth-patient-support-analysis-part-4
difficulty: hard
time_taken_minutes: 40
attempts: 5
solved_date: 2025-11-24
author: pavanpalve12
------------------------------------------------------------------------
# Problem Statement

## 1. Objective
Analyze the performance of the Advocate4Me program by calculating the **month-over-month growth rate** in long calls.  
A **long call** is defined as any call lasting more than **300 seconds (5 minutes)**.

The output must include:
- Year (numeric)
- Month (numeric)
- Month-over-month growth percentage (rounded to 1 decimal place)
- Results in chronological order

## 2. Business Context
UnitedHealth Group (UHG) operates the Advocate4Me program, enabling policy holders to receive support for:
- Claims and benefits
- Drug coverage
- Authorisations
- Medical records
- Emergency assistance
- Member portal services

Understanding how long calls trend over time is essential for:
- Staffing needs  
- Operational efficiency  
- Call-center performance  
- Identifying periods of increased member support requirements  

Month-over-month growth helps identify patterns in long-duration calls, which typically require more advocate effort.

## 3. Dataset Description

### **Table: `callers`**

| Column Name          | Type      | Description |
|----------------------|-----------|-------------|
| policy_holder_id     | integer   | Unique ID for policy holder |
| case_id              | varchar   | Unique case identifier |
| call_category        | varchar   | Type of call (benefits, emergency assistance, etc.) |
| call_date            | timestamp | When the call occurred |
| call_duration_secs   | integer   | Duration of call in seconds |

### Example Input

| policy_holder_id | case_id                                | call_category         | call_date              | call_duration_secs |
|------------------|-----------------------------------------|------------------------|------------------------|--------------------|
| 1                | f1d012f9-9d02-4966-a968-bf6c5bc9a9fe    | emergency assistance   | 04/13/2023 19:16:53    | 144                |
| 1                | 41ce8fb6-1ddd-4f50-ac31-07bfcce6aaab    | authorisation          | 05/25/2023 09:09:30    | 815                |
| 2                | 8471a3d4-6fc7-4bb2-9fc7-4583e3638a9e    | emergency assistance   | 03/09/2023 10:58:54    | 128                |
| 2                | 38208fae-bad0-49bf-99aa-7842ba2e37bc    | benefits               | 06/05/2023 07:35:43    | 619                |
| 3                | f0e7a8e3-df93-40f3-9b5e-fadff9ebe072    | provider network       | 01/12/2023 04:53:41    | 483                |
| 3                | b72f91e6-c3f8-4358-a1f2-c9507e8dcba4    | member portal          | 04/04/2023 20:03:22    | 275                |
| 3                | 3acbe22d-22b3-4144-954d-74c127bc49ea    | benefits               | 04/12/2023 00:05:29    | 329                |
| 3                | e32b61c2-a90d-4371-a5ee-6bc44fa49bbd    | benefits               | 05/25/2023 06:07:41    | 512                |
| 3                | 6099f469-b5d6-4447-9acf-d936355eae7c    | emergency assistance   | 06/11/2023 12:04:21    | 33                 |

## 4. Requirements / Tasks
1. Identify all calls where `call_duration_secs > 300` (long calls).  
2. Extract the numeric year and month from `call_date`.  
3. Count long calls per (year, month).  
4. Use a window function to retrieve the previous month’s count.  
5. Compute month-over-month growth using:  
   - `(current - previous) / previous * 100`  
6. Round growth percentage to **1 decimal place**.  
7. Sort results chronologically by year and month.  
8. For the first available month, growth must be **NULL**.  
9. Months with **zero previous-month calls** should compute:  
   - 0 → 0.0%  
   - Increase from 0 → 100%  
   - Decrease from non-zero to 0 → -100%

## 5. Expected Output Format

### Example Output

| yr   | mth | long_calls_growth_pct |
|------|-----|------------------------|
| 2023 | 1   | NULL                   |
| 2023 | 2   | 0.0                    |
| 2023 | 3   | 100.0                  |
| 2023 | 4   | 200.0                  |
| 2023 | 5   | -33.3                  |
| 2023 | 6   | 0.0                    |

## 6. Constraints & Edge Cases
- Months with zero long calls must still appear if present in raw data.  
- Division-by-zero scenarios need correct handling based on business logic.  
- Window function ordering must strictly follow `(year, month)` to avoid incorrect growth calculations.  
- Dataset may include multiple call categories but only duration matters for this task.  

## 7. Acceptance Criteria
- Output must exactly follow numeric year and month format.  
- Growth percentage must be rounded to **one decimal place**.  
- Query must correctly identify long calls (>300 seconds).  
- Results must match example logic:  
  - First month → NULL  
  - 0 → 0.0  
  - 0 → positive → 100.0  
  - Decrease → negative growth  

## 8. Additional Notes
- Example values illustrate expected logic; actual outputs depend on underlying data.  
- Leap years, timezone adjustments, and call categories do not affect this problem.  
- This is a classic **time-series window function** question used in analytics and DE interviews.
