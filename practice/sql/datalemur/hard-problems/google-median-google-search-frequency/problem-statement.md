------------------------------------------------------------------------
title: Google Median Google Search Frequency
platform: datalemur
id: google-median-google-search-frequency
slug: google-median-google-search-frequency
difficulty: hard
time_taken_minutes: 45
attempts: 5
solved_date: 2025-11-24
author: pavanpalve12
------------------------------------------------------------------------
# Problem Statement

## 1. Objective
Determine the median number of searches made by a Google user in the past year using a summary frequency table. The median must be calculated without expanding the dataset due to extremely large data volume at Google scale.

## 2. Business Context
Google is preparing a Superbowl commercial and needs a simple statistic to highlight user engagement:  
**“What is the median number of searches a person made last year?”**

Querying the raw dataset of ~2 trillion searches is computationally expensive. Instead, the analysis must be performed using a summarized frequency table (`search_frequency`) that aggregates users by search count.

## 3. Dataset Description

### **Table: `search_frequency`**
| Column Name | Type    | Description |
|-------------|---------|-------------|
| searches    | integer | Number of searches performed by a user last year |
| num_users   | integer | Number of users who performed that many searches |

### Example Input
| searches | num_users |
|----------|-----------|
| 1        | 2         |
| 2        | 2         |
| 3        | 3         |
| 4        | 1         |

This represents the expanded list:  
`[1, 1, 2, 2, 3, 3, 3, 4]`

## 4. Requirements / Tasks
1. Calculate the median search count using only the summarized frequency data.
2. Use window functions to compute cumulative user counts.
3. Identify the point where the cumulative distribution crosses the 50th percentile.
4. Correctly handle both:
   - Odd total user counts  
   - Even total user counts (median is average of two middle values)
5. Round the final median to **one decimal place**.
6. Output a single column:
   - `median`

## 5. Expected Output Format

### Example Output
| median |
|--------|
| 2.5    |

Explanation: The expanded list `[1, 1, 2, 2, 3, 3, 3, 4]` has a median of **2.5**.

## 6. Constraints & Edge Cases
- The table may contain any number of search buckets.
- Median logic must be based solely on cumulative counts, not dataset expansion.
- Even-sized populations must correctly average the two central values.
- The result must be rounded to one decimal place.

## 7. Acceptance Criteria
- Query correctly computes the 50th percentile using cumulative distribution.
- Works for both skewed and uniform search distributions.
- Output format matches the required schema.
- Median is precise and properly rounded.

## 8. Additional Notes
This problem is designed for SQL environments where window functions are available. The approach must be scalable and efficient for extremely large user populations.
