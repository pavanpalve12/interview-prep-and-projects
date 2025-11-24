------------------------------------------------------------------------
title: Linkedin Salaries Differences
platform: stratascratch
id: linkedin-salaries-differences
slug: linkedin-salaries-differences
difficulty: easy
time_taken_minutes: 5
attempts: 2
solved_date: 2025-11-24
author: pavanpalve12
------------------------------------------------------------------------
# Problem Statement

## 1. Objective
Calculate the absolute difference between the highest salary in the Marketing department and the highest salary in the Engineering department.

## 2. Business Context
A company wants to compare compensation levels across departments. Specifically, leadership needs to know how far apart the top salaries of the Marketing and Engineering teams are. The goal is to compute this gap as a single numeric value.

## 3. Dataset Description

### Table: `db_employee`
| Column Name     | Type     | Description                     |
|-----------------|----------|---------------------------------|
| id              | integer  | Unique employee ID              |
| name            | text     | Employee name                   |
| salary          | numeric  | Employee salary                 |
| department_id   | integer  | Foreign key referencing `db_dept.id` |

### Table: `db_dept`
| Column Name | Type     | Description                |
|-------------|----------|----------------------------|
| id          | integer  | Unique department ID       |
| department  | text     | Name of the department     |

## 4. Requirements / Tasks
1. Join employees with department details using `department_id`.
2. Filter data to only two departments:
   - `marketing`
   - `engineering`
3. Identify the highest salary within each of these two departments.
4. Calculate the difference between these maximum salaries.
5. Return the **absolute value** of this difference.
6. Output must be a **single numeric column**.

## 5. Expected Output Format
The query should return one row containing one value:
absolute_difference

sql
Copy code

Example (illustrative):
| absolute_difference |
|---------------------|
| 12000               |

## 6. Constraints & Edge Cases
- If one department has no employees, treat its max salary as `0`.
- Multiple employees with the same salary do not affect logic.
- Output must always be non-negative.
- No additional columns or breakdowns should appear in the result.

## 7. Acceptance Criteria
- Query returns exactly **one numeric value**.
- Value correctly represents:
  **ABS(max_salary_marketing - max_salary_engineering)**.
- Only Marketing and Engineering departments influence the result.

## 8. Additional Notes
- Ensure the filter uses department names from `db_dept.department`.
- Avoid subqueries if possible; conditional aggregation is acceptable and efficient.