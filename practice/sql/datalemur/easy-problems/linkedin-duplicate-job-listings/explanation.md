# Explanation

## 1. Pseudocode / Approach
- Step 1: Group the `job_listings` table by `company_id`, `title`, and `description`.
  - Each group represents a unique job posting definition.
- Step 2: Count how many job postings (`job_id`) exist per group.
- Step 3: Identify groups where the same company posted the **exact same job** more than once  
  (`HAVING COUNT(job_id) > 1`).
- Step 4: Wrap this grouped result in an outer query to count **how many companies** have duplicated postings.
- Step 5: Return that final count as `duplicate_companies`.

## 2. Reasoning
This query checks for **duplicate job listings**, defined as:
- same company  
- same title  
- same description  

If any such combination appears more than once, it's considered duplicated.

The inner query isolates these duplicates; the outer query simply counts them.

## 3. Edge Cases
- If no duplicates exist, the result will be `0`.
- If a company duplicates multiple different job postings, each duplicated group is counted separately.
- Differences in spacing or case in `title` or `description` will prevent grouping and therefore not be flagged as duplicates.
