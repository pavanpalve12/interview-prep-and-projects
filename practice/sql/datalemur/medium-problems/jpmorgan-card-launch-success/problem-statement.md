------------------------------------------------------------------------
title: Jpmorgan Card Launch Success
platform: datalemur
id: jpmorgan-card-launch-success
slug: jpmorgan-card-launch-success
difficulty: medium
time_taken_minutes: 10
attempts: 2
solved_date: 2025-11-23
author: pavanpalve12
------------------------------------------------------------------------
# Problem Statement

## 1. Objective
Determine the number of credit cards issued in the **launch month** for each card.  
The launch month is defined as the earliest `(issue_year, issue_month)` combination for each credit card in the dataset.

## 2. Business Context
JPMorgan Chase is preparing to launch a new credit card.  
To estimate how many cards might be issued in the first month, the team wants to understand historical performance of previous card launches.  
This requires identifying how many cards were issued in the first ever recorded month for each product.

## 3. Dataset Description

### **Table: `monthly_cards_issued`**
| Column Name   | Type    | Description |
|---------------|---------|-------------|
| issue_month   | integer | Month when the card was issued |
| issue_year    | integer | Year when the card was issued |
| card_name     | string  | Name of the credit card |
| issued_amount | integer | Number of cards issued that month |

### Example Input
| issue_month | issue_year | card_name              | issued_amount |
|-------------|------------|------------------------|----------------|
| 1           | 2021       | Chase Sapphire Reserve | 170000         |
| 2           | 2021       | Chase Sapphire Reserve | 175000         |
| 3           | 2021       | Chase Sapphire Reserve | 180000         |
| 3           | 2021       | Chase Freedom Flex     | 65000          |
| 4           | 2021       | Chase Freedom Flex     | 70000          |

## 4. Requirements / Tasks
1. Identify the **earliest issuance month and year** for each credit card.
2. Extract the `issued_amount` associated with that earliest record.
3. Output:
   - `card_name`
   - `issued_amount` from the launch month
4. Order results by `issued_amount` in **descending** order.
5. Ensure all credit cards appear exactly once in the output based on their launch data.

## 5. Expected Output Format

### Example Output
| card_name              | issued_amount |
|------------------------|----------------|
| Chase Sapphire Reserve | 170000         |
| Chase Freedom Flex     | 65000          |

## 6. Constraints & Edge Cases
- A card may have more than one record in the same earliest month/year; choose the earliest row(s).
- The dataset may contain cards with only one record; that record is the launch month.
- Month and year together determine launch (do not sort by year alone).
- Ordering should strictly follow `issued_amount DESC`.

## 7. Acceptance Criteria
- Output includes exactly one row per card.
- The query correctly identifies the earliest `(issue_year, issue_month)` for each card.
- Output ordering from highest to lowest `issued_amount` is correct.

## 8. Additional Notes
- Example values are illustrative; actual dataset may differ.
