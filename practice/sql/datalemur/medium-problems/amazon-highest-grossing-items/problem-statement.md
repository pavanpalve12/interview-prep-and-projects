------------------------------------------------------------------------
title: Amazon Highest Grossing Items
platform: datalemur
id: amazon-highest-grossing-items
slug: amazon-highest-grossing-items
difficulty: medium
time_taken_minutes: 15
attempts: 2
solved_date: 2025-11-23
author: pavanpalve12
------------------------------------------------------------------------
# Problem Statement

## Objective
Assume you're given a table containing data on Amazon customers and their spending on products across different categories.  
Write a SQL query to **identify the top two highest-grossing products within each category** for the **year 2022**.

The output should include:
- `category`
- `product`
- `total_spend` (sum of spend for that product in 2022)

---

## Table: `product_spend`

| Column Name      | Type      |
|------------------|-----------|
| category         | string    |
| product          | string    |
| user_id          | integer   |
| spend            | decimal   |
| transaction_date | timestamp |

### Example Input

| category     | product          | user_id | spend   | transaction_date       |
|--------------|------------------|---------|---------|------------------------|
| appliance    | refrigerator     | 165     | 246.00  | 12/26/2021 12:00:00    |
| appliance    | refrigerator     | 123     | 299.99  | 03/02/2022 12:00:00    |
| appliance    | washing machine  | 123     | 219.80  | 03/02/2022 12:00:00    |
| electronics  | vacuum           | 178     | 152.00  | 04/05/2022 12:00:00    |
| electronics  | wireless headset | 156     | 249.90  | 07/08/2022 12:00:00    |
| electronics  | vacuum           | 145     | 189.00  | 07/15/2022 12:00:00    |

---

## Example Output

| category    | product          | total_spend |
|--------------|-----------------|--------------|
| appliance    | refrigerator     | 299.99       |
| appliance    | washing machine  | 219.80       |
| electronics  | vacuum           | 341.00       |
| electronics  | wireless headset | 249.90       |

---

## Explanation
- In the **appliance** category:
  - The top two products by total spend are **refrigerator** (299.99) and **washing machine** (219.80).

- In the **electronics** category:
  - The top two products by total spend are **vacuum** (341.00) and **wireless headset** (249.90).

The query should:
- Filter data for the **year 2022**.
- Aggregate total spend per product per category.
- Use a ranking function (like `DENSE_RANK()`) to select the **top t**_
