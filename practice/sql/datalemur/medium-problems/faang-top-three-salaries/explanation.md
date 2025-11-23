# Explanation

## 1) Metadata
- **Time:** 11 minutes  
- **Attempts:** 2  

---

## 2) Pseudocode / Approach
- Join `employee` → `department` to get each employee’s department name.
- For each **department**, assign a **DENSE_RANK** over salaries (highest first).
- Keep only rows where the rank is **1, 2, or 3** (top-3 salary bands per department).
- Output `department_name, name, salary`, ordered by department then salary desc, then name.

---

## 3) Why this works
- `PARTITION BY d.department_name` restarts the ranking **per department**.
- `ORDER BY … e.salary DESC` ranks employees from **highest** to lowest salary **within a department**.
- Using **DENSE_RANK** means **ties share the same rank**.  
  - If two employees tie for top salary, both get rank 1; the next distinct salary gets rank 2, etc.
- Filtering `IN (1,2,3)` returns all employees whose salaries fall within the **top three distinct salary tiers** of their department.

---

## 4) Notes & Edge Cases
- **Ties → more than 3 rows**: Because of `DENSE_RANK`, if many employees share the 3rd-highest salary, **all** are included.
- If you need **exactly 3 employees per department**, switch to `ROW_NUMBER()` and add a deterministic tiebreaker (e.g., name asc, employee_id asc):
  ```sql
  ROW_NUMBER() OVER (
    PARTITION BY d.department_name
    ORDER BY e.salary DESC, e.name ASC
  ) AS rn
