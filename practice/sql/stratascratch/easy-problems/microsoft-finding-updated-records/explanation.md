# Explanation

## 1. Approach Overview
The goal is to return the highest‐salary record for each employee from the `ms_employee_salary` table. If multiple rows have the same salary, the record with the smaller `department_id` should be selected. The query uses a window function to rank rows per employee and then filters to keep only the top-ranked row.

## 2. Step-by-Step Breakdown

### Step 1: Generate Ranked Records Per Employee
A subquery is used to compute a `RANK()` value for each row:
- `PARTITION BY id` ensures ranking restarts for every employee.
- `ORDER BY salary DESC` assigns rank 1 to the highest salary.
- `department_id ASC` acts as a tiebreaker — if two salaries are identical, the row from the department with the smaller department ID gets higher priority.

This produces a result set where each row has an additional column `rank`.

### Step 2: Filter Only Top Ranked Rows
The outer query selects only rows where `rank = 1`.  
This ensures that for each employee:
- The row with the highest salary is returned.
- If multiple rows share the highest salary, the one with the smallest `department_id` is returned.

### Step 3: Select Only Required Columns
Only the main employee detail columns are selected:
- id
- first_name
- last_name
- department_id
- salary

This removes the window function column (`rank`), keeping output clean.

### Step 4: Order Final Results
`ORDER BY id` sorts the results by employee ID for readability.

## 3. Logical Flow (Pseudocode)
1. For each employee:
   - Sort their salary records by salary descending.
   - If salary ties exist, sort by department ascending.
   - Assign rank values based on this order.
2. Keep only those rows where rank = 1.
3. Return cleaned-up fields.
4. Sort all employees by ID.

## 4. Final Notes
- `RANK()` is used intentionally instead of `ROW_NUMBER()` to allow visibility of ties if needed, but since the query filters for rank = 1, the behavior matches the requirement.
- Using window functions avoids subqueries like `MAX(salary)` per employee, making the logic more maintainable and scalable for large tables.
