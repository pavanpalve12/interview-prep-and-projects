# Explanation

## 1. Pseudocode / Approach
- **Step 1:** Create a CTE `sal_ranked_cte` that ranks all employee salaries using `DENSE_RANK()` in **descending** order.  
  - This assigns rank 1 to the **highest salary**, rank 2 to the **second-highest salary**, and so on.  
- **Step 2:** Filter rows where the rank (`sal_rak`) equals **2** — representing the **second-highest salary**.  
- **Step 3:** Select the distinct salary value(s) from those rows.

---

## 2. Reasoning
This query determines the **second-highest unique salary** from the `employee` table.

- `DENSE_RANK()` ensures that **duplicate salary values** get the same rank.  
  For example, if two employees earn the same top salary, both get `sal_rak = 1`, and the next distinct salary gets `sal_rak = 2`.

Thus, the query is robust even when multiple employees share the same salary bracket.

---

## 3. Edge Cases
- If all employees have the same salary → no row will have `sal_rak = 2`, so the result will be **empty**.  
- If only one unique salary exists → output is empty as well.  
- Works correctly even if there are multiple employees with the same second-highest salary.

---

## 4. Key SQL Concept
- **`DENSE_RANK()`** is preferred over `ROW_NUMBER()` here because:
  - `ROW_NUMBER()` would skip ranks when duplicates occur.
  - `DENSE_RANK()` assigns consecutive ranks only to **distinct** salary values.
  
---

## 5. Example Walkthrough

| employee_id | name | salary | sal_rak |
|----------
