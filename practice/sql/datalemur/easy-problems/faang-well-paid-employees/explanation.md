# Explanation

## 1. Pseudocode / Approach
- Step 1: Treat the `employee` table as two logical roles:
  - `mgr` → the manager
  - `emp` → the employee reporting to that manager
- Step 2: Perform a **LEFT JOIN** where each manager (`mgr.employee_id`) is matched with their employees (`emp.manager_id`).
- Step 3: Compare salaries:
  - Keep only rows where the **employee’s salary is greater than the manager’s salary**.
- Step 4: Select the `employee_id` and employee name.
- Step 5: Sort by `mgr.employee_id` to group employees under each manager.

## 2. Reasoning
This query identifies employees who earn **more than their managers**.  
By joining the same table to itself and applying a salary comparison, we isolate cases where a subordinate has a higher salary than their direct manager.

`LEFT JOIN` is used, but the `WHERE emp.salary > mgr.salary` condition effectively converts it into an inner match for salary comparisons.

## 3. Edge Cases
- Employees with no manager (i.e., `manager_id IS NULL`) are excluded automatically because they cannot satisfy the join condition.
- If two employees share the same manager and both earn more, both will appear.
- Managers with equal salary to an employee do **not** appear (strict > comparison).
