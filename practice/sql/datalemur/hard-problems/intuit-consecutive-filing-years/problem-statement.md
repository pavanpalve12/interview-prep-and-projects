------------------------------------------------------------------------
title: Intuit Consecutive Filing Years
platform: datalemur
id: intuit-consecutive-filing-years
slug: intuit-consecutive-filing-years
difficulty: hard
time_taken_minutes: 40
attempts: 5
solved_date: 2025-11-24
author: pavanpalve12
------------------------------------------------------------------------
# Problem Statement

## 1. Objective
Identify users who filed their taxes using **any version of TurboTax** for **three or more consecutive years**, and return their user IDs in ascending order.

## 2. Business Context
Intuit provides multiple product lines, including TurboTax and QuickBooks, each with several versions.  
For customer behavior analysis, it is important to detect users who remain consistently engaged with TurboTax across consecutive years.  
Each user files taxes **once per year** using a single product version.

## 3. Dataset Description

### Table: `filed_taxes`
| Column Name  | Type     | Description |
|--------------|----------|-------------|
| filing_id    | integer  | Unique identifier for each filing |
| user_id      | varchar  | Unique user ID |
| filing_date  | datetime | Date when the tax filing occurred |
| product      | varchar  | Product version used (e.g., TurboTax Desktop, TurboTax Deluxe, QuickBooks Online) |

### Example Input
| filing_id | user_id | filing_date | product                 |
|-----------|---------|-------------|--------------------------|
| 1         | 1       | 4/14/2019   | TurboTax Desktop 2019    |
| 2         | 1       | 4/15/2020   | TurboTax Deluxe          |
| 3         | 1       | 4/15/2021   | TurboTax Online          |
| 4         | 2       | 4/07/2020   | TurboTax Online          |
| 5         | 2       | 4/10/2021   | TurboTax Online          |
| 6         | 3       | 4/07/2020   | TurboTax Online          |
| 7         | 3       | 4/15/2021   | TurboTax Online          |
| 8         | 3       | 3/11/2022   | QuickBooks Desktop Pro   |
| 9         | 4       | 4/15/2022   | QuickBooks Online        |

## 4. Requirements / Tasks
1. Consider only filings in which the product name **begins with "TurboTax"**.
2. Extract the filing year from `filing_date`.
3. Sort each user's TurboTax filings by year.
4. Detect consecutive-year streaks using window functions.
5. Select only users who have **a streak of at least 3 consecutive TurboTax filing years**.
6. Display only the `user_id` column.
7. Output must be sorted in **ascending order**.

## 5. Expected Output Format

### Example Output
| user_id |
|---------|
| 1       |

## 6. Constraints & Edge Cases
- A user files at most once per year.
- Product changes break the TurboTax streak.
- Missing a year breaks the consecutive-year streak.
- Users switching to QuickBooks before completing a 3-year TurboTax streak are excluded.

## 7. Acceptance Criteria
- The SQL query must correctly identify streaks using year-based ordering.
- Only TurboTax filings count toward streaks.
- Output must contain only users with ≥3 consecutive TurboTax years.
- Must match the example logic regardless of dataset size.

## 8. Additional Notes
User 1 qualifies in the example because they used TurboTax in 2019, 2020, and 2021 consecutively.  
Users 2 and 3 are excluded due to missing years or switching products.
