------------------------------------------------------------------------
title: Alibaba Compressed Mean
platform: datalemur
id: alibaba-compressed-mean
slug: alibaba-compressed-mean
difficulty: easy
time_taken_minutes: 7
attempts: 2
solved_date: 2025-11-21
author: pavanpalve12
------------------------------------------------------------------------
# Problem Statement

## Objective
Calculate the **mean number of items per order** (rounded to **1 decimal place**) using a table that lists how many orders had a given number of items.

You must:
- Compute the total number of items across all orders.
- Compute the total number of orders.
- Divide total items by total orders and round the result to **1 decimal**.
- Return a single column named `mean`.

---

## Table: `items_per_order`

| Column Name       | Type     |
|-------------------|----------|
| item_count        | integer  |
| order_occurrences | integer  |

### Example Input

| item_count | order_occurrences |
|------------|-------------------|
| 1          | 500               |
| 2          | 1000              |
| 3          | 800               |
| 4          | 1000              |

(Meaning: 500 orders had 1 item each, 1000 had 2 items each, etc.)

---

## Example Output

| mean |
|------|
| 2.7  |

---

## Explanation
- Total items = (1×500) + (2×1000) + (3×800) + (4×1000) = **8900**  
- Total orders = 500 + 1000 + 800 + 1000 = **3300**  
- Mean = 8900 ÷ 3300 = **2.6969…**, rounded to **2.7**
