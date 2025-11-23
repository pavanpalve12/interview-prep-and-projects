------------------------------------------------------------------------
title: Faang Second Highest Salary
platform: datalemur
id: faang-second-highest-salary
slug: faang-second-highest-salary
difficulty: medium
time_taken_minutes: 2
attempts: 5
solved_date: 2025-11-23
author: pavanpalve12
------------------------------------------------------------------------
# Problem Statement

## Objective
As an **HR Analyst** at a tech company, you’re analyzing employee compensation patterns.  
Your manager wants to understand salary distribution and has asked you to determine the **second highest salary** among all employees.

If multiple employees share the same second-highest salary, display that salary **only once**.

---

## Table: `employee`

| Column Name   | Type     | Description |
|----------------|----------|--------------|
| employee_id    | integer  | Unique ID of the employee. |
| name           | string   | Name of the employee. |
| salary         | integer  | Salary of the employee. |
| department_id  | integer  | Department ID where the employee works. |
| manager_id     | integer  | Manager ID of the employee. |

---

## Example Input

| employee_id | name             | salary | department_id | manager_id |
|--------------|------------------|---------|----------------|-------------|
| 1            | Emma Thompson    | 3800    | 1              | 6           |
| 2            | Daniel Rodriguez | 2230    | 1              | 7           |
| 3            | Olivia Smith     |
