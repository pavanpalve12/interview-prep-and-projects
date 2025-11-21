------------------------------------------------------------------------
title: Jpmorgan Cards Issued Difference
platform: datalemur
id: jpmorgan-cards-issued-difference
slug: jpmorgan-cards-issued-difference
difficulty: easy
time_taken_minutes: 8
attempts: 2
solved_date: 2025-11-21
author: pavanpalve12
------------------------------------------------------------------------
# Problem Statement

## Objective
Your team at JPMorgan Chase is preparing to launch a new credit card and is analyzing how many cards were issued each month.  
Write a SQL query that returns:

- the **card_name**
- the **difference** between:
  - the **highest** monthly `issued_amount`
  - and the **lowest** monthly `issued_amount`

Sort the results by the largest difference first.

---

## Table: `monthly_cards_issued`

| Column Name    | Type     |
|----------------|----------|
| card_name      | string   |
| issued_amount  | integer  |
| issue_month    | integer  |
| issue_year     | integer  |

### Example Input

| card_name             | issued_amount | issue_month | issue_year |
|----------------------|----------------|-------------|-------------|
| Chase Freedom Flex    | 55000          | 1           | 2021        |
| Chase Freedom Flex    | 60000          | 2           | 2021        |
| Chase Freedom Flex    | 65000          | 3           | 2021        |
| Chase Freedom Flex    | 70000          | 4           | 2021        |
| Chase Sapphire Reserve| 170000         | 1           | 2021        |
| Chase Sapphire Reserve| 175000         | 2           | 2021        |
| Chase Sapphire Reserve| 180000         | 3           | 2021        |

---

## Example Output

| card_name              | difference |
|------------------------|------------|
| Chase Freedom Flex     | 15000      |
| Chase Sapphire Reserve | 10000      |

---

## Explanation
- **Chase Freedom Flex**  
  - Max issued: 70,000  
  - Min issued: 55,000  
  - Difference: **15,000**

- **Chase Sapphire Reserve**  
  - Max issued: 180,000  
  - Min issued: 170,000  
  - Difference: **10,000**
