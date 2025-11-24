------------------------------------------------------------------------
title: Amazon Workers With The Highest Salaries
platform: datalemur
id: amazon-workers-with-the-highest-salaries
slug: amazon-workers-with-the-highest-salaries
difficulty: medium
time_taken_minutes: 4
attempts: 1
solved_date: 2025-11-24
author: pavanpalve12
------------------------------------------------------------------------
# Problem Statement

## 1. Objective
Identify the job title(s) of the employee(s) who earn the highest salary. If multiple employees share the top salary, return every job title associated with each of those employees.

## 2. Business Context
Management is evaluating compensation but wants to focus only on employees who have an official job title assigned. The task is to locate the employees with the maximum salary and extract their titles. This information may be used for salary benchmarking or HR review.

## 3. Dataset Description

### Table: `worker`
| Column Name   | Type    | Description |
|---------------|---------|-------------|
| worker_id     | bigint  | Unique identifier for an employee |
| first_name    | text    | Employee first name |
| last_name     | text    | Employee last name |
| salary        | bigint  | Employee salary |
| joining_date  | date    | Employment start date |
| department    | text    | Department name |

### Table: `title`
| Column Name     | Type    | Description |
|------------------|---------|-------------|
| worker_ref_id    | bigint  | Foreign key referencing `worker.worker_id` |
| worker_title     | text    | Official job title assigned to the employee |
| affected_from    | date    | Date from which the title is effective |

Only employees present in the `title` table should be considered, since management only wants results for employees with official job titles.

## 4. Requirements / Tasks
1. Join `worker` and `title` tables using `worker_id` and `worker_ref_id`.
2. Evaluate employee salaries and determine the highest salary in the dataset.
3. Include all employees who share this highest salary.
4. Return only their job titles (`worker_title`).
5. Ensure that only employees with at least one official title are considered.
6. Avoid hard-coding salary values; the solution must adapt dynamically to the dataset.

## 5. Expected Output
- A single-column or multi-row result containing:
  - `worker_title`
- Each row represents the title of a top-earning employee.
- Multiple rows should appear if multiple employees tie for highest salary.

## 6. Constraints & Edge Cases
- If several employees have the same highest salary, all must be included.
- Employees without a corresponding record in `title` must be excluded from analysis.
- If an employee has multiple titles (rare), return all of them unless business logic specifies otherwise.
- Null or missing salary values should not be considered.

## 7. Acceptance Criteria
- The query correctly identifies the maximum salary.
- All titles associated with the employees earning that salary are returned.
- The output contains no employees without a title.
- The logic must work consistently regardless of salary distribution or dataset size.

## 8. Additional Notes
- This problem focuses on proper ranking logic or equivalently matching the salary to the maximum salary.
- Solutions using window functions (`RANK`, `DENSE_RANK`) or subqueries with `MAX(salary)` are acceptable as long as they handle ties.
