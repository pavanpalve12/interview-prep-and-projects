------------------------------------------------------------------------
title: Facebook Advertiser Status
platform: datalemur
id: facebook-advertiser-status
slug: facebook-advertiser-status
difficulty: hard
time_taken_minutes: 40
attempts: 5
solved_date: 2025-11-24
author: pavanpalve12
------------------------------------------------------------------------
# Problem Statement

## 1. Objective
Update the payment status of Facebook advertisers by combining information from the `advertiser` table and the `daily_pay` table.  
The output must list each advertiser's `user_id` along with their updated payment status, sorted by the user ID.

## 2. Business Context
Advertisers may or may not make payments on any given day.  
The task is to determine each advertiser’s *updated* status based on:
- Their historical status (`advertiser` table)
- Whether they made a payment today (`daily_pay` table)

The `daily_pay` table contains only advertisers who *made a payment today*.

## 3. Dataset Description

### **Table: advertiser**
| Column Name | Type   | Description |
|-------------|--------|-------------|
| user_id     | string | Advertiser ID |
| status      | string | Current payment status (NEW, EXISTING, CHURN, RESURRECT) |

#### Example Input
| user_id | status   |
|---------|----------|
| bing    | NEW      |
| yahoo   | NEW      |
| alibaba | EXISTING |

---

### **Table: daily_pay**
| Column Name | Type   | Description |
|-------------|--------|-------------|
| user_id     | string | Advertiser ID that paid today |
| paid        | decimal| Payment amount |

#### Example Input
| user_id | paid   |
|---------|--------|
| yahoo   | 45.00  |
| alibaba | 100.00 |
| target  | 13.00  |

---

## 4. Requirements / Tasks
1. Combine records from both tables using a `FULL OUTER JOIN` on `user_id`.
2. Determine whether each advertiser made a payment today (`daily_pay.paid` is not null).
3. Apply payment status transition rules:
   - If the advertiser paid today:
     - Previous status = CHURN → Updated status = RESURRECT  
     - Previous status = NEW, EXISTING, or RESURRECT → Updated status = EXISTING  
     - No previous record in `advertiser` table → Updated status = NEW
   - If the advertiser did **not** pay today:
     - Updated status = CHURN (regardless of previous status)
4. Output two columns:
   - `user_id`
   - `new_status`
5. Sort the output by `user_id`.

## 5. Payment Status Transition Rules

| # | Current Status | Updated Status | Payment on Day T |
|---|----------------|----------------|------------------|
| 1 | NEW            | EXISTING       | Paid             |
| 2 | NEW            | CHURN          | Not paid         |
| 3 | EXISTING       | EXISTING       | Paid             |
| 4 | EXISTING       | CHURN          | Not paid         |
| 5 | CHURN          | RESURRECT      | Paid             |
| 6 | CHURN          | CHURN          | Not paid         |
| 7 | RESURRECT      | EXISTING       | Paid             |
| 8 | RESURRECT      | CHURN          | Not paid         |

### Summary of Rules
- **No payment today → CHURN**  
- **Payment today →**  
  - If previous status was CHURN → RESURRECT  
  - Else → EXISTING  
  - If no previous record → NEW  

## 6. Expected Output Format

### Example Output
| user_id | new_status |
|---------|------------|
| bing    | CHURN      |
| yahoo   | EXISTING   |
| alibaba | EXISTING   |

## 7. Constraints & Edge Cases
- Advertisers may appear **only** in `daily_pay` (brand-new users).
- Advertisers may appear **only** in `advertiser` (they did not pay today).
- NULL status or missing records must be handled using `COALESCE`.
- Sorting by `user_id` is mandatory.

## 8. Explanation of Example
- **bing**  
  Appears only in advertiser table and did not pay today → **CHURN**  
- **yahoo**  
  Previously NEW and paid today → **EXISTING**  
- **alibaba**  
  Previously EXISTING and paid today → **EXISTING**  

## 9. Acceptance Criteria
- The query must correctly classify every advertiser using the transition rules.
- Output must include all advertisers from both tables.
- Output must be deterministic and sorted by `user_id`.
