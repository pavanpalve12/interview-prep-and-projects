------------------------------------------------------------------------
title: Ibm Ibm Db2 Product Analytics
platform: datalemur
id: ibm-ibm-db2-product-analytics
slug: ibm-ibm-db2-product-analytics
difficulty: easy
time_taken_minutes: 18
attempts: 3
solved_date: 2025-11-21
author: pavanpalve12
------------------------------------------------------------------------
# Problem Statement

## Objective
IBM is analyzing employee usage of the Db2 database.  
Write a SQL query to produce a histogram of the **number of unique queries** executed by employees during **Q3 2023 (July 1, 2023 — September 30, 2023)**. The histogram should show:

- `unique_queries` — number of distinct `query_id`s an employee ran in the period, and  
- `employee_count` — how many employees executed that many unique queries.

Include employees who ran **zero** queries in the period.

---

## Details / Requirements
- Consider only queries with `query_starttime` between `2023-07-01` and `2023-09-30` (inclusive).
- Count **distinct** `query_id` per `employee_id` in that date range.
- Employees with no matching rows in `queries` for the date range must appear with `unique_queries = 0`.
- Output two columns:
  - `unique_queries` (integer)
  - `employee_count` (integer)
- Order the result by `unique_queries` ascending.

---

## Table: `queries`

| Column Name     | Type      | Description                                 |
|-----------------|-----------|---------------------------------------------|
| employee_id     | integer   | ID of the employee who executed the query   |
| query_id        | integer   | Unique identifier for each query            |
| query_starttime | datetime  | Timestamp when the query started            |
| execution_time  | integer   | Duration of the query in seconds            |

### Example Input (partial)

| employee_id | query_id | query_starttime     | execution_time |
|-------------|----------|----------------------|----------------|
| 226         | 856987   | 07/01/2023 01:04:43  | 2698           |
| 132         | 286115   | 07/01/2023 03:25:12  | 2705           |
| 221         | 33683    | 07/01/2023 04:34:38  | 91             |
| 240         | 17745    | 07/01/2023 14:33:47  | 2093           |
| 110         | 413477   | 07/02/2023 10:55:14  | 470            |

---

## Table: `employees`

| Column Name | Type    | Description                      |
|-------------|---------|----------------------------------|
| employee_id | integer | Unique ID for each employee      |
| full_name   | string  | Employee full name               |
| gender      | string  | Employee gender                  |

### Example Input (partial)

| employee_id | full_name        | gender |
|-------------|------------------|--------|
| 1           | Judas Beardon    | Male   |
| 2           | Lainey Franciotti| Female |
| 3           | Ashbey Strahan   | Male   |

---

## Example Output

| unique_queries | employee_count |
|----------------|----------------|
| 0              | 191            |
| 1              | 46             |
| 2              | 12             |
| 3              | 1              |

---

## Explanation
- For each employee, count distinct `query_id` executed between `2023-07-01` and `2023-09-30`.
- Employees with no queries in the period are counted under `unique_queries = 0`.
- The final result groups employees by their `unique_queries` count and reports how many employees fall into each bucket.
