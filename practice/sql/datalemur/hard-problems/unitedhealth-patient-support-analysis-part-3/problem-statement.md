------------------------------------------------------------------------
title: Unitedhealth Patient Support Analysis Part 3
platform: datalemur
id: unitedhealth-patient-support-analysis-part-3
slug: unitedhealth-patient-support-analysis-part-3
difficulty: hard
time_taken_minutes: 40
attempts: 5
solved_date: 2025-11-24
author: pavanpalve12
------------------------------------------------------------------------
# Problem Statement

## 1. Objective
Determine how many unique policy holders made consecutive calls within a 7-day interval.  
Even if a policy holder made multiple calls inside the 7-day window, they should be counted **only once**.

## 2. Business Context
UnitedHealth Group’s Advocate4Me program allows members to call advocates for support with:
- claims and benefits,
- drug coverage,
- provider networks,
- authorizations,
- medical records,
- emergency assistance,
- member portal services.

Call frequency analysis helps understand member engagement levels and operational workload.  
Identifying callers who reach out multiple times within a short period (≤7 days) gives insight into:
- unresolved issues,
- complex cases,
- potential service gaps,
- member behavior patterns.

## 3. Dataset Description

### **Table: `callers`**
| Column Name          | Type       | Description |
|----------------------|------------|-------------|
| policy_holder_id     | integer    | Unique identifier for the member |
| case_id              | varchar    | Unique ID for each call case |
| call_category        | varchar    | Type of support requested |
| call_date            | timestamp  | Timestamp of the call |
| call_duration_secs   | integer    | Duration of call in seconds |

### Example Input
| policy_holder_id | case_id                                 | call_category       | call_date              | call_duration_secs |
|------------------|------------------------------------------|---------------------|-------------------------|----------------------|
| 13               | 894a08c6-82c6-49ed-84a0-b627752cdca7     | benefits            | 01/11/2023 02:09:23     | 794                  |
| 13               | 7ee4e5f0-4924-47f7-8809-172bb59c6ef0     | provider network    | 02/01/2023 18:41:03     | 659                  |
| 14               | 0b68aafa-6907-43c3-9dbd-a6c171cf5006     | claims assistance   | 02/17/2023 10:03:27     | 757                  |
| 14               | c4660294-9443-4aba-b6d4-f39a9d5e5f00     | benefits            | 02/21/2023 13:57:31     | 36                   |
| 15               | 06545ac5-18f5-4ae8-9b1e-087c7dc8deca     | member portal       | 01/08/2023 03:19:24     | 973                  |
| 15               | 9580a1ad-842a-482f-a05c-7e1c09b926b3     | provider network    | 01/09/2023 01:33:06     | 729                  |

## 4. Requirements / Tasks
1. Use window functions to compare each call with the caller’s previous call.
2. Calculate the number of days between consecutive calls.
3. Identify cases where the time difference is **7 days or less**.
4. Count each qualifying policy holder **exactly once**, even if multiple qualifying intervals exist.
5. Return a single column:  
   - `policy_holder_count` (the total unique callers)

## 5. Expected Output Format

### Example Output
| policy_holder_count |
|---------------------|
| 2                   |

## 6. Constraints & Edge Cases
- First call for any policy holder has no previous call → should be excluded.
- If a caller has multiple calls within a 7-day span, count them once.
- Time comparisons must account for full timestamps, not just dates.
- Dataset can include calls many months apart; only consecutive pairs matter.

## 7. Acceptance Criteria
- Query correctly computes day-level differences using timestamp arithmetic.
- Only consecutive call pairs within 7 days contribute to the final count.
- Distinct policy holders are counted accurately.
- Output must match the schema: a single-row, single-column result.

## 8. Additional Notes
Example results are illustrative; real outputs depend on actual caller data.  
For deeper analysis, see: *Patient Support Analysis (Part 4)*.
