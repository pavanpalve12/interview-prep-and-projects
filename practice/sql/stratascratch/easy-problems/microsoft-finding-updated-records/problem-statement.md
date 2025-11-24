------------------------------------------------------------------------
title: Microsoft Finding Updated Records
platform: datalemur
id: microsoft-finding-updated-records
slug: microsoft-finding-updated-records
difficulty: medium
time_taken_minutes: 5
attempts: 2
solved_date: 2025-11-24
author: pavanpalve12
------------------------------------------------------------------------
# Problem Statement

## 1. Objective
Identify the current (latest) salary for each employee from the `ms_employee_salary` table, where older salary records also exist. Return one record per employee containing their latest salary.

## 2. Business Context
Employees may have multiple salary entries over time. Each new salary is higher than the previous because salaries increase every year.  
However, the dataset still contains outdated salary records.  
We must determine the *current* salary by selecting the highest salary for each employee.

## 3. Dataset Description

### **Table: `ms_employee_salary`**
| Column Name   | Type   | Description |
|---------------|--------|-------------|
| id            | bigint | Employee ID |
| first_name    | text   | Employee first name |
| last_name     | text   | Employee last name |
| department_id | bigint | Department identifier |
| salary        | bigint | Salary record (older entries contain lower values) |

The table may contain multiple salary rows for the same employee.

## 4. Requirements / Tasks
1. Group salary records by employee ID.
2. Identify the highest salary for each employee (current salary).
3. In case multiple records share the same highest salary, select the one with the smallest `department_id`.
4. Return the following columns:
   - id  
   - first_name  
   - last_name  
   - department_id  
   - salary (current)
5. Order the output by `id` in ascending order.

## 5. Expected Output
A table with one row per employee showing their most recent salary details.

### Expected Columns
- **id**
- **first_name**
- **last_name**
- **department_id**
- **salary**

## 6. Constraints & Edge Cases
- Salaries always increase over time, so the latest salary will always be the highest.
- Some employees may have only one salary entry.
- Multiple salary rows may share the same salary value; apply tiebreaker on `department_id`.

## 7. Acceptance Criteria
- Only one row per employee.
- The salary returned must be the highest salary for that employee.
- Output must be correctly ordered by employee ID.

## 8. Additional Notes
This problem must be solved using analytic/window functions (e.g., `RANK()` or `ROW_NUMBER()`), not subqueries with `MAX()`.
