------------------------------------------------------------------------
title: Wayfair Y On Y Growth Rate
platform: datalemur
id: wayfair-y-on-y-growth-rate
slug: wayfair-y-on-y-growth-rate
difficulty: hard
time_taken_minutes: 30
attempts: 4
solved_date: 2025-11-23
author: pavanpalve12
------------------------------------------------------------------------
# Problem Statement

## 1. Objective
Calculate the year-on-year (YoY) growth rate for total spend across different products, using transaction data from the Wayfair user transactions table. The results must be grouped by product ID and sorted by year in ascending order.

## 2. Business Context
Wayfair tracks product-level spend across various users and years. To understand financial performance, it is necessary to analyze how spending changes from one year to the next. YoY growth helps identify whether a product’s revenue is increasing, decreasing, or stagnating.

## 3. Dataset Description

### Table: `user_transactions`
| Column Name      | Type      | Description |
|------------------|-----------|-------------|
| transaction_id   | integer   | Unique ID for each transaction |
| product_id       | integer   | Product associated with the transaction |
| spend            | decimal   | Amount spent in the transaction |
| transaction_date | datetime  | Timestamp of the transaction |

### Example Input
| transaction_id | product_id | spend   | transaction_date        |
|----------------|------------|---------|--------------------------|
| 1341           | 123424     | 1500.60 | 12/31/2019 12:00:00     |
| 1423           | 123424     | 1000.20 | 12/31/2020 12:00:00     |
| 1623           | 123424     | 1246.44 | 12/31/2021 12:00:00     |
| 1322           | 123424     | 2145.32 | 12/31/2022 12:00:00     |

## 4. Requirements / Tasks
1. Extract the year from `transaction_date`.
2. Calculate the total spend per product per year (aggregation required if multiple rows exist).
3. Use a window function (`LAG`) to retrieve the previous year's spend for each product.
4. Compute the YoY growth rate using:  
   **100 × (current_year_spend − previous_year_spend) / previous_year_spend**
5. Round YoY growth to two decimal places.
6. Display the following fields:
   - `year`
   - `product_id`
   - `curr_year_spend`
   - `prev_year_spend`
   - `yoy_rate`
7. Order results by product ID and year (ascending).

## 5. Expected Output Format

### Example Output
| year | product_id | curr_year_spend | prev_year_spend | yoy_rate |
|------|-------------|------------------|------------------|----------|
| 2019 | 123424      | 1500.60          | NULL             | NULL     |
| 2020 | 123424      | 1000.20          | 1500.60          | -33.35   |
| 2021 | 123424      | 1246.44          | 1000.20          | 24.62    |
| 2022 | 123424      | 2145.32          | 1246.44          | 72.12    |

## 6. Constraints & Edge Cases
- For the first available year of a product, YoY rate will be `NULL` due to missing prior-year data.
- If multiple transactions exist for the same product in a given year, the query must sum the spend before computing YoY.
- Division by zero should be avoided if `prev_year_spend = 0`.
- All results must be sorted by `year ASC`.

## 7. Acceptance Criteria
- Output contains one row per product per year.
- YoY growth rate is correct and rounded to two decimal places.
- Previous year’s spend is accurately retrieved using window functions.
- Sorting is strictly `ORDER BY product_id, year`.

## 8. Additional Notes
- Example values are for demonstration only; actual dataset may vary.
- This problem evaluates window function usage (`LAG`), ordering, aggregation, and growth calculations.

