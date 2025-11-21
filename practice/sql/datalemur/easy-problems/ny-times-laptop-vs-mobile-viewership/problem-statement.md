------------------------------------------------------------------------
title: Ny Times Laptop Vs Mobile Viewership
platform: datalemur
id: ny-times-laptop-vs-mobile-viewership
slug: ny-times-laptop-vs-mobile-viewership
difficulty: easy
time_taken_minutes: 5
attempts: 1
solved_date: 2025-11-21
author: pavanpalve12
------------------------------------------------------------------------
# Problem Statement

## Objective
You are given a table that tracks user viewership by device type. Devices fall into three categories:

- **laptop**
- **tablet**
- **phone**

Write a SQL query to calculate:
- the total number of **laptop** views, and  
- the total number of **mobile** views, where mobile is defined as **tablet + phone**.

Output two columns:

- `laptop_views`  
- `mobile_views`

---

## Table: `viewership`

| Column Name | Type                              |
|-------------|-----------------------------------|
| user_id     | integer                           |
| device_type | string ('laptop', 'tablet', 'phone') |
| view_time   | timestamp                         |

### Example Input

| user_id | device_type | view_time              |
|---------|--------------|------------------------|
| 123     | tablet       | 01/02/2022 00:00:00    |
| 125     | laptop       | 01/07/2022 00:00:00    |
| 128     | laptop       | 02/09/2022 00:00:00    |
| 129     | phone        | 02/09/2022 00:00:00    |
| 145     | tablet       | 02/24/2022 00:00:00    |

---

## Example Output

| laptop_views | mobile_views |
|--------------|--------------|
| 2            | 3            |

---

## Explanation
From the example dataset:
- There are **2 laptop views**.
- Mobile views = tablet (2 views) + phone (1 view) = **3 mobile views**.
