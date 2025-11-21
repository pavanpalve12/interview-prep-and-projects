------------------------------------------------------------------------
title: Faang Well Paid Employees
platform: datalemur
id: faang-well-paid-employees
slug: faang-well-paid-employees
difficulty: easy
time_taken_minutes:
attempts:
solved_date: 2025-11-21
author: pavanpalve12
------------------------------------------------------------------------
# Problem Statement

## Objective
Companies often analyze salary structures to ensure fair and equitable compensation.  
As an HR Analyst, you are asked to **identify all employees who earn more than their direct managers**.

Write a SQL query to return:
- `employee_id`
- `employee_name`

These should represent employees whose salary is **strictly greater** than the salary of their immediate manager.

---

## Table: `employee`

| Column Name   | Type     | Description                            |
|----------------|----------|----------------------------------------|
| employee_id    | integer  | Unique ID of the employee              |
| name           | string   | Name of the employee                   |
| salary         | integer  | Salary of the employee                 |
| department_id  | integer  | Department ID                          |
| manager_id     | integer  | ID of the employee's direct manager    |

### Example Input

| employee_id | name            | salary | department_id | manager_id |
|-------------|-----------------|--------|----------------|------------|
| 1           | Emma Thompson   | 3800   | 1              | 6          |
| 2           | Daniel Rodriguez| 2230   | 1              | 7          |
| 3           | Olivia Smith    | 7000   | 1              | 8          |
| 4           | Noah Johnson    | 6800   | 2              | 9          |
| 5           | Sophia Martinez | 1750   | 1              | 11         |
| 6           | Liam Brown      | 13000  | 3              | NULL       |
| 7           | Ava Garcia      | 12500  | 3              | NULL       |
| 8           | William Davis   | 6800   | 2              | NULL       |

---

## Example Output

| employee_id | employee_name |
|-------------|----------------|
| 3           | Olivia Smith   |

---

## Explanation
Olivia Smith earns **$7,000**, while her manager, **William Davis**, earns **$6,800**.  
Since her salary is higher than her manager’s, she appears in the output.

