------------------------------------------------------------------------
title: Verizon International Call Percentage
platform: datalemur
id: verizon-international-call-percentage
slug: verizon-international-call-percentage
difficulty: medium
time_taken_minutes: 8
attempts: 1
solved_date: 2025-11-23
author: pavanpalve12
------------------------------------------------------------------------
# Problem Statement

## 1. Objective
Calculate the percentage of phone calls that are international, where an international call is defined as a call where the caller and receiver are located in different countries. The final percentage must be rounded to one decimal place.

## 2. Business Context
Telecom providers frequently analyze call data to understand international usage patterns. Identifying what percentage of calls cross country borders helps in pricing, capacity planning, fraud detection, and customer behavior insights.

## 3. Dataset Description

### Table: `phone_calls`
| Column Name | Type      | Description |
|-------------|-----------|-------------|
| caller_id   | integer   | ID of the person making the call |
| receiver_id | integer   | ID of the person receiving the call |
| call_time   | timestamp | Timestamp of when the call occurred |

#### Example Input
| caller_id | receiver_id | call_time           |
|-----------|-------------|----------------------|
| 1         | 2           | 2022-07-04 10:13:49 |
| 1         | 5           | 2022-08-21 23:54:56 |
| 5         | 1           | 2022-05-13 17:24:06 |
| 5         | 6           | 2022-03-18 12:11:49 |

---

### Table: `phone_info`
| Column Name  | Type     | Description |
|--------------|----------|-------------|
| caller_id    | integer  | Person ID (applies to both caller and receiver) |
| country_id   | integer  | Country code of the user |
| network      | integer  | Network carrier |
| phone_number | string   | Phone number |

#### Example Input
| caller_id | country_id | network | phone_number        |
|-----------|------------|---------|----------------------|
| 1         | US         | Verizon | +1-212-897-1964     |
| 2         | US         | Verizon | +1-703-346-9529     |
| 3         | US         | Verizon | +1-650-828-4774     |
| 4         | US         | Verizon | +1-415-224-6663     |
| 5         | IN         | Vodafone| +91 7503-907302     |
| 6         | IN         | Vodafone| +91 2287-664895     |

---

## 4. Requirements / Tasks
1. Join `phone_calls` with `phone_info` to get the caller's country.  
2. Join `phone_calls` again with `phone_info` to get the receiver's country.  
3. Determine whether each call is international:  
   - A call is international if `caller.country_id <> receiver.country_id`.  
4. Count how many calls are international.  
5. Count the total number of calls.  
6. Compute percentage:  
(international_calls / total_calls) * 100

7. Round the result to **1 decimal place**.  
8. Output a single column named `international_calls_pct`.

---

## 5. Expected Output Format

### Example Output
| international_calls_pct |
|--------------------------|
| 50.0                    |

---

## 6. Constraints & Edge Cases
- `phone_info` is joined using `caller_id` for both caller and receiver.  
- Missing phone_info entries should not break the logic.  
- All calls must be included in the denominator.  
- Case-sensitive country comparison should not matter (assume clean data).  

---

## 7. Acceptance Criteria
- Correctly identifies international calls based on country_id comparison.  
- Uses appropriate joins to map countries for caller and receiver.  
- Returns a single numeric value rounded to one decimal.  
- Matches expected output format and sample logic.

---

## 8. Additional Notes
- The example demonstrates a dataset with 4 calls, 2 of which are international → 50.0%.  
- Real datasets may contain more entries, but logic remains the same.
