------------------------------------------------------------------------
title: Spotify Spotify Streaming History
platform: datalemur
id: spotify-spotify-streaming-history
slug: spotify-spotify-streaming-history
difficulty: medium
time_taken_minutes: 28
attempts: 1
solved_date: 2025-11-23
author: pavanpalve12
------------------------------------------------------------------------
# Problem Statement

## 1. Objective
Write a query that returns the cumulative number of times each user has played each song **up to August 4th, 2022**, combining historical data and weekly streaming data.  
The output must include:
- `user_id`
- `song_id`
- `song_plays` (cumulative total)
Sorted in **descending order** of play count.

## 2. Business Context
Streaming platforms maintain a historical table of total song plays up to the previous month and a weekly table that contains raw listening events for the current week.  
The goal is to merge both sources and compute cumulative plays only up to a specific cutoff date (August 4th, 2022).  
This helps track user engagement and identify trending songs during the first week of August.

## 3. Dataset Description

### **Table: songs_history**  
Contains cumulative play counts up to **July 31st, 2022**.

| Column Name | Type    | Description |
|-------------|---------|-------------|
| history_id  | integer | Unique history record ID |
| user_id     | integer | User identifier |
| song_id     | integer | Song identifier |
| song_plays  | integer | Total plays before August 1st, 2022 |

#### Example Input
| history_id | user_id | song_id | song_plays |
|------------|---------|---------|------------|
| 10011      | 777     | 1238    | 11         |
| 12452      | 695     | 4520    | 1          |

---

### **Table: songs_weekly**  
Contains raw listening events from **August 1st to August 7th, 2022**.

| Column Name | Type      | Description |
|-------------|-----------|-------------|
| user_id     | integer   | User identifier |
| song_id     | integer   | Song identifier |
| listen_time | datetime  | Timestamp of song play |

#### Example Input
| user_id | song_id | listen_time        |
|---------|---------|--------------------|
| 777     | 1238    | 08/01/2022 12:00:00 |
| 695     | 4520    | 08/04/2022 08:00:00 |
| 125     | 9630    | 08/04/2022 16:00:00 |
| 695     | 9852    | 08/07/2022 12:00:00 |

---

## 4. Requirements / Tasks
1. Include historical play counts from **songs_history**.
2. Include weekly listening data only **up to and including August 4th, 2022**.
3. For weekly table rows, each row represents **one play**, so count each row as 1.
4. Include new users or new songs that appear only in the weekly table.
5. Combine the datasets and compute cumulative play counts:
   - `historical_plays + weekly_plays_up_to_4_august`
6. Group results by:
   - `user_id`
   - `song_id`
7. Output columns:
   - `user_id`
   - `song_id`
   - `song_plays` (cumulative)
8. Sort results by `song_plays` in descending order.
9. Exclude any weekly records with listen_time **after August 4th, 2022**.

---

## 5. Expected Output Format

### Example Output
| user_id | song_id | song_plays |
|---------|---------|------------|
| 777     | 1238    | 12         |
| 695     | 4520    | 2          |
| 125     | 9630    | 1          |

---

## 6. Constraints & Edge Cases
- Users or songs may exist in songs_weekly but not in songs_history (first-time listeners).
- Rows after **August 4th** must be excluded.
- songs_history contains cumulative values; songs_weekly contains 1 row per play.
- songs with only weekly plays should still appear in the final output.
- Weekly plays must be strictly filtered by the timestamp, not by table definition alone.

---

## 7. Acceptance Criteria
- The query must correctly merge both tables.
- The output must reflect accurate cumulative plays up to the cutoff date.
- Results must be sorted in descending order.
- New users/songs must appear in the output when applicable.
- No rows with listen_time after August 4th may contribute to totals.

---

## 8. Additional Notes
- songs_weekly includes dates from August 1–7, but the cutoff date restricts usable data to August 1–4.  
- Example output is illustrative; actual results depend on the input dataset.
