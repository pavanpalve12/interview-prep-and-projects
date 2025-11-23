------------------------------------------------------------------------
title: Faang Top Three Salaries
platform: datalemur
id: faang-top-three-salaries
slug: faang-top-three-salaries
difficulty: medium
time_taken_minutes: 11
attempts: 2
solved_date: 2025-11-23
author: pavanpalve12
------------------------------------------------------------------------
# Problem Statement

## Objective
As part of an ongoing salary distribution analysis, identify **high earners** in each department.  
A *high earner* is any employee whose salary ranks within the **top three distinct salaries** of their department (handle ties properly).

Write a SQL query to display:
- `department_name`
- `name` (employee name)
- `salary`

Sort the results by:
1) `department_name` **ascending**  
2) `salary` **descending**  
3) `name` **ascending** (to break ties on equal salary)

> Note: Use an appropriate **ranking window function** that handles duplicate salaries (e.g., `DENSE_RANK`) so tied salaries share the same rank.

---

## Table: `employee`

| column_name  | type    | description                          |
|--------------|---------|--------------------------------------|
| employee_id  | integer | The unique ID of the employee.       |
| name         | string  | The name of the employee.            |
| salary       | integer | The salary of the employee.          |
| department_id| integer | The department ID of the employee.   |
| manager_id   | integer | The manager ID of the employee.      |

### Example Input (`employee`)
| employee_id | name             | salary | department_id | manager_id |
|-------------|------------------|--------|---------------|------------|
| 1           | Emma Thompson    | 3800   | 1             | 6          |
| 2           | Daniel Rodriguez | 2230   | 1             | 7          |
| 3           | Olivia Smith     | 2000   | 1             | 8          |
| 4           | Noah Johnson     | 6800   | 2             | 9          |
| 5           | Sophia Martinez  | 1750   | 1             | 11         |
| 6           | Liam Brown       | 13000  | 3             |            |
| 7           | Ava Garcia       | 12500  | 3             |            |
| 8           | William Davis    | 6800   | 2             |            |
| 9           | Isabella Wilson  | 11000  | 3             |            |
| 10          | James Anderson   | 4000   | 1             | 11         |

---

## Table: `department`

| column_name    | type    | description              |
|----------------|---------|--------------------------|
| department_id  | integer | The department ID.       |
| department_name| string  | The name of the department.|

### Example Input (`department`)
| department_id | department_name |
|---------------|-----------------|
| 1             | Data Analytics  |
| 2             | Data Science    |

---

## Example Output
| department_name | name            | salary |
|-----------------|-----------------|--------|
| Data Analytics  | James Anderson  | 4000   |
| Data Analytics  | Emma Thompson   | 3800   |
| Data Analytics  | Daniel Rodriguez| 2230   |
| Data Science    | Noah Johnson    | 6800   |
| Data Science    | William Davis   | 6800   |

---

## Explanation
- High earners are those within the **top three salary ranks** in their department.  
- Ties are handled via a ranking function (e.g., `DENSE_RANK`), so multiple employees can share the same rank.  
- Sorting follows department (A→Z), salary (high→low), then name (A→Z) for consistent, readable output.

**Update (June 18):** The requirement for unique salaries was removed; sorting order clarified as above.
