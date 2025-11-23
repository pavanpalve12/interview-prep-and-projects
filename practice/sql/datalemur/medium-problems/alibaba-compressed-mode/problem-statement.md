------------------------------------------------------------------------
title: Alibaba Compressed Mode
platform: datalemur
id: alibaba-compressed-mode
slug: alibaba-compressed-mode
difficulty: medium
time_taken_minutes: 5
attempts: 2
solved_date: 2025-11-23
author: pavanpalve12
------------------------------------------------------------------------

**Effective June 14th, 2023:**  
The problem statement has been revised with additional clarifications for better understanding.

---

## Table: `items_per_order`

| Column Name       | Type     |
|-------------------|----------|
| item_count        | integer  |
| order_occurrences | integer  |

### Example Input

| item_count | order_occurrences |
|-------------|------------------|
| 1           | 500              |
| 2           | 1000             |
| 3           | 800              |

---

## Example Output

| mode |
|------|
| 2    |

---

## Explanation
Among all item counts, the **highest frequency** (`order_occurrences`) is **1000**, which corresponds to `item_count = 2`.  
Hence, the **mode** of the order occurrences is **2**.

If there had been multiple item counts with the same `order_occurrences` value (i.e., tied modes), all would be listed in ascending order.
