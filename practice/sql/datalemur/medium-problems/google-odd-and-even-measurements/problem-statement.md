------------------------------------------------------------------------
title: Google Odd And Even Measurements
platform: datalemur
id: google-odd-and-even-measurements
slug: google-odd-and-even-measurements
difficulty: medium
time_taken_minutes: 10
attempts: 1
solved_date: 2025-11-23
author: pavanpalve12
------------------------------------------------------------------------
# Problem Statement

## 1. Objective
Calculate the total of odd-numbered and even-numbered sensor measurements for each day from a table containing multiple readings per day.

## 2. Business Context
A Google sensor records multiple measurements throughout the day.  
For analysis, each day’s measurements must be grouped by their order of occurrence (1st, 2nd, 3rd, etc.).  
The goal is to separate odd-ordered readings (1st, 3rd, 5th…) and even-ordered readings (2nd, 4th, 6th…) and compute their sums.

## 3. Dataset Description

### **Table: `measurements`**
| Column Name       | Type      | Description |
|-------------------|-----------|-------------|
| measurement_id    | integer   | Unique reading ID |
| measurement_value | decimal   | Sensor reading value |
| measurement_time  | datetime  | Timestamp of the measurement |

### Example Input
| measurement_id | measurement_value | measurement_time        |
|----------------|-------------------|--------------------------|
| 131233         | 1109.51           | 07/10/2022 09:00:00     |
| 135211         | 1662.74           | 07/10/2022 11:00:00     |
| 523542         | 1246.24           | 07/10/2022 13:15:00     |
| 143562         | 1124.50           | 07/11/2022 15:00:00     |
| 346462         | 1234.14           | 07/11/2022 16:45:00     |

## 4. Requirements / Tasks
1. Partition measurements by day (`measurement_time` cast to date).
2. Order readings within each day based on the timestamp.
3. Assign measurement numbers:  
   - 1st, 3rd, 5th... → **odd-numbered**  
   - 2nd, 4th, 6th... → **even-numbered**
4. Sum odd-numbered measurements for each day.
5. Sum even-numbered measurements for each day.
6. Display the results with the following columns:
   - `measurement_day`
   - `odd_sum`
   - `even_sum`
7. Ensure the query works on datasets with any number of records per day.

## 5. Expected Output Format

### Example Output
| measurement_day       | odd_sum | even_sum |
|------------------------|---------|----------|
| 07/10/2022 00:00:00    | 2355.75 | 1662.74  |
| 07/11/2022 00:00:00    | 1124.50 | 1234.14  |

## 6. Constraints & Edge Cases
- More or fewer readings may be present for any day.
- Measurements must be ordered strictly by `measurement_time`.
- Odd/even classification is based purely on the order of occurrence, not measurement ID.
- Days with only one measurement should show:
  - `odd_sum` = that value  
  - `even_sum` = 0

## 7. Acceptance Criteria
- The query must correctly generate an odd/even sequence per day using window function
