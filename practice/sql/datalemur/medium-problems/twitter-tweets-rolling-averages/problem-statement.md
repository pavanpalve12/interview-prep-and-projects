------------------------------------------------------------------------
title: Twitter Tweets Rolling Averages
platform: datalemur
id: twitter-tweets-rolling-averages
slug: twitter-tweets-rolling-averages
difficulty: medium
time_taken_minutes: 12
attempts: 3
solved_date: 2025-11-23
author: pavanpalve12
------------------------------------------------------------------------
# Problem Statement

## 1. Objective
Compute the 3-day rolling average of tweets for each user from a time-series dataset.  
The output must include `user_id`, `tweet_date`, and the 3-day rolling average rounded to 2 decimal places.

## 2. Business Context
A rolling average (moving average) is used to analyze short-term trends in time-series data by smoothing fluctuations.  
In this problem, the goal is to understand how each user's tweet activity changes over time by examining the average number of tweets over a 3-day window.

This helps identify patterns such as increasing or decreasing engagement.

## 3. Dataset Description

### **Table: `tweets`**
| Column Name | Type      | Description |
|-------------|-----------|-------------|
| user_id     | integer   | Unique identifier for each user |
| tweet_date  | timestamp | Date and time when the tweet count is recorded |
| tweet_count | integer   | Number of tweets made by the user on that date |

### Example Input
| user_id | tweet_date             | tweet_count |
|---------|-------------------------|-------------|
| 111     | 06/01/2022 00:00:00     | 2           |
| 111     | 06/02/2022 00:00:00     | 1           |
| 111     | 06/03/2022 00:00:00     | 3           |
| 111     | 06/04/2022 00:00:00     | 4           |
| 111     | 06/05/2022 00:00:00     | 5           |

## 4. Requirements / Tasks
1. Partition the data by `user_id` so that each user's tweet history is processed independently.
2. Order each user's rows by `tweet_date` in chronological order.
3. For every row, calculate a 3-day rolling average using:
   - Current day
   - Previous 1 day
   - Previous 2 days
4. Round the rolling average to 2 decimal places.
5. Output the following columns:
   - `user_id`
   - `tweet_date`
   - `rolling_avg_3d`

## 5. Expected Output Format

### Example Output
| user_id | tweet_date             | rolling_avg_3d |
|---------|-------------------------|----------------|
| 111     | 06/01/2022 00:00:00     | 2.00           |
| 111     | 06/02/2022 00:00:00     | 1.50           |
| 111     | 06/03/2022 00:00:00     | 2.00           |
| 111     | 06/04/2022 00:00:00     | 2.67           |
| 111     | 06/05/2022 00:00:00     | 4.00           |

## 6. Constraints & Edge Cases
- If a user has fewer than 3 days of data, the rolling window automatically adjusts based on available rows.
- Missing dates do not break the logic, since the window is based on row count, not calendar intervals.
- Multiple entries on the same date (if present in real datasets) should be treated as separate rows unless otherwise specified.

## 7. Acceptance Criteria
- Query must correctly compute 3-day rolling averages using a window function.
- Output must be rounded to two decimal places.
- Results must match example behavior even if date ranges or tweet volumes change.

## 8. Additional Notes
- Problem statement, solution, and hints were revised effective **April 7th, 2023**.
- Example data is illustrative; real datasets may differ.
