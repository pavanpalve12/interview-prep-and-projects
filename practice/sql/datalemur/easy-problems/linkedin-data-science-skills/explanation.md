# Explanation

## 1. Pseudocode / Approach
- Step 1: Filter the `candidates` table to include rows where the skill is one of  
  **Python**, **Tableau**, or **PostgreSQL**.
- Step 2: Group the filtered rows by `candidate_id` so each candidate is evaluated as a unit.
- Step 3: Count how many of the required skills each candidate has.
- Step 4: Keep only those candidates whose count equals **3**, meaning they have **all three skills**.
- Step 5: Sort the final list by `candidate_id`.

## 2. Reasoning
The query groups each candidate's skills and checks whether they possess  
**all three required skills**.  
A candidate must appear in all three skill rows — one for Python, one for Tableau, and one for PostgreSQL — to pass the `HAVING COUNT(skill) = 3` condition.

## 3. Edge Cases
- Candidates who have only 1 or 2 of the required skills are excluded.
- Candidates may have additional skills, but they must still have all three required ones.
- Duplicate skill entries for the same candidate do not affect correctness as long as there are exactly three matching rows.

