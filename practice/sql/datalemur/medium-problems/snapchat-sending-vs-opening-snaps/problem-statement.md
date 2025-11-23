------------------------------------------------------------------------
title: Snapchat Sending Vs Opening Snaps
platform: datalemur
id: snapchat-sending-vs-opening-snaps
slug: snapchat-sending-vs-opening-snaps
difficulty: medium
time_taken_minutes: 12
attempts: 1
solved_date: 2025-11-23
author: pavanpalve12
------------------------------------------------------------------------
# Problem Statement

## 1. Objective
Calculate, for each age group, the percentage of total time Snapchat users spend **sending** snaps vs. **opening** snaps. The results must be rounded to 2 decimal places.

## 2. Business Context
Snapchat wants to understand user engagement patterns across different age groups.  
The focus is specifically on the time spent **sending** and **opening** snaps — excluding other activity types such as `chat`.  
The analysis will help determine how different age groups interact with core features of the app.

## 3. Dataset Description

### Table: `activities`
Contains detailed logs of user activity on Snapchat.

| Column Name     | Type     | Description |
|-----------------|----------|-------------|
| activity_id     | integer  | Unique activity event ID |
| user_id         | integer  | ID of the user who performed the action |
| activity_type   | string   | One of: 'send', 'open', 'chat' |
| time_spent      | float    | Time spent performing the activity |
| activity_date   | datetime | When the activity occurred |

#### Example Input

| activity_id | user_id | activity_type | time_spent | activity_date          |
|-------------|---------|----------------|------------|-------------------------|
| 7274        | 123     | open           | 4.50       | 06/22/2022 12:00:00     |
| 2425        | 123     | send           | 3.50       | 06/22/2022 12:00:00     |
| 1413        | 456     | send           | 5.67       | 06/23/2022 12:00:00     |
| 1414        | 789     | chat           | 11.00      | 06/25/2022 12:00:00     |
| 2536        | 456     | open           | 3.00       | 06/25/2022 12:00:00     |

---

### Table: `age_breakdown`
Maps each user to their age bucket.

| Column Name | Type     | Description |
|-------------|----------|-------------|
| user_id     | integer  | User identifier |
| age_bucket  | string   | Age group category (e.g., '21-25', '26-30', '31-35') |

#### Example Input

| user_id | age_bucket |
|---------|------------|
| 123     | 31-35      |
| 456     | 26-30      |
| 789     | 21-25      |

---

## 4. Requirements / Tasks

1. Join `activities` with `age_breakdown` using `user_id`.
2. Filter only `activity_type IN ('send', 'open')`.
3. For each age bucket, compute:
   - Total time spent sending snaps  
   - Total time spent opening snaps
4. Calculate the following percentages:
   - `time_spent_sending / (time_spent_sending + time_spent_opening)`
   - `time_spent_opening / (time_spent_sending + time_spent_opening)`
5. Multiply by **100.0** (float) — not **100** (integer).
6. Round both percentages to **2 decimal places**.
7. Output one row per `age_bucket` with:
   - `age_bucket`
   - `send_perc`
   - `open_perc`

---

## 5. Expected Output Format

### Example Output

| age_bucket | send_perc | open_perc |
|------------|-----------|-----------|
| 26-30      | 65.40     | 34.60     |
| 31-35      | 43.75     | 56.25     |

---

## 6. Constraints & Edge Cases

- Ignore activity types other than `send` and `open`.
- Some users may have only one type of activity (only send or only open).
- Percentages must sum to 100 for a given age bucket (barring rounding).
- Missing activity for an age bucket results in that bucket not appearing in the output.
- Updated and optimised logic must reflect changes effective **April 15th, 2023**.

---

## 7. Acceptance Criteria

- Query must correctly compute totals and percentages by age bucket.
- Must handle division using floating-point arithmetic (`100.0`).
- Must output values rounded to 2 decimal places.
- Final output must match format and logic demonstrated in the example.

---

## 8. Additional Notes

- Example data is illustrative; real input datasets may vary.
- Ensure window functions or CTEs (if used) do not distort grouping logic.
