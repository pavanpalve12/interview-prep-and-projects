------------------------------------------------------------------------
title: Facebook Page With No Likes
platform: datalemur
id: facebook-page-with-no-likes
slug: facebook-page-with-no-likes
difficulty: easy
time_taken_minutes:
attempts:
solved_date: 2025-11-21
author: pavanpalve12
------------------------------------------------------------------------
# Problem Statement

## Objective
You are given two tables containing information about Facebook Pages and the likes they have received.  
Write a SQL query to return the **IDs of all Facebook pages that have zero likes**.

The final output should be sorted in **ascending order** by `page_id`.

---

## Table: `pages`

| Column Name | Type     |
|-------------|----------|
| page_id     | integer  |
| page_name   | varchar  |

### Example Input

| page_id | page_name               |
|---------|--------------------------|
| 20001   | SQL Solutions           |
| 20045   | Brain Exercises         |
| 20701   | Tips for Data Analysts  |

---

## Table: `page_likes`

| Column Name | Type      |
|-------------|-----------|
| user_id     | integer   |
| page_id     | integer   |
| liked_date  | datetime  |

### Example Input

| user_id | page_id | liked_date            |
|---------|---------|------------------------|
| 111     | 20001   | 04/08/2022 00:00:00    |
| 121     | 20045   | 03/12/2022 00:00:00    |
| 156     | 20001   | 07/25/2022 00:00:00    |

---

## Example Output

| page_id |
|---------|
| 20701   |

---