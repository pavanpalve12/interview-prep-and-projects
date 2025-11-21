# Explanation

## 1. Pseudocode / Approach
- Step 1: Select all columns of interest (`part`, `assembly_step`) from the `parts_assembly` table.
- Step 2: Filter rows where `finish_date` is **NULL**, which represents unfinished assembly steps.
- Step 3: Return the part name and the corresponding assembly step for all unfinished records.

## 2. Reasoning
A part is considered *unfinished* if it does **not** have a recorded `finish_date`.  
By filtering for `finish_date IS NULL`, we directly capture all assembly steps that are still in progress.  
This is the simplest and most effective solution since no grouping or joining is required.

## 3. Edge Cases
- Parts with multiple unfinished steps will appear multiple times (as they should).
- Parts with all steps completed will not appear in the output.
- If a part has only one record and `finish_date` is NULL, it will be included as an unfinished part.
