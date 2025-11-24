------------------------------------------------------------------------
title: Google Senior Managers
platform: datalemur
id: google-senior-managers
slug: google-senior-managers
difficulty: hard
time_taken_minutes: 40
attempts: 5
solved_date: 2025-11-24
author: pavanpalve12
------------------------------------------------------------------------
# Problem Statement

## 1. Objective
Identify all **senior managers** in the Google employees hierarchy and count how many direct reports each senior manager has. The final output must list the senior manager’s name and the number of their direct reportees, ordered from highest to lowest count.

## 2. Business Context
A company hierarchy contains employees, managers, and senior managers.  
This task focuses on understanding and extracting **hierarchical relationships** from a self-referencing employees table.

A **manager** is defined as an employee who has at least one direct report.  
A **senior manager** is defined as:
- Someone who manages at least one manager.
- None of their direct reports are senior managers themselves.
- An employee may report to **two senior managers**.

This makes the identification non-trivial and requires careful handling of multi-level reporting chains.

## 3. Dataset Description

### **Table: `employees`**
| Column Name | Type    | Description |
|-------------|---------|-------------|
| emp_id      | integer | Unique employee ID |
| manager_id  | integer | ID of the employee's direct manager |
| manager_name| string  | Name of the employee’s manager |

### Example Input
| emp_id | manager_id | manager_name |
|--------|------------|--------------|
| 1      | 101        | Duyen        |
| 101    | 1001       | Rick         |
| 103    | 1001       | Rick         |
| 1001   | 1008       | John         |

## 4. Requirements / Tasks
1. Identify employees who are **managers** (i.e., they have at least one direct report).
2. Identify **senior managers**, defined as:
   - They directly manage at least one manager.
   - None of their direct reports are themselves senior managers.
3. An employee may report to more than one senior manager (assumption).
4. For every senior manager:
   - Count how many **direct reports** they have.
   - Output only senior managers.
5. Display final results ordered by:
   - Highest number of direct reportees first.

## 5. Expected Output Format

### Example Output
| manager_name | direct_reportees |
|--------------|------------------|
| Rick         | 1                |

### Explanation
Rick is a senior manager because:
- He manages employee 101, who is a manager.
- None of Rick’s direct reports manage another manager.

Rick has **1** direct reportee who qualifies under the rules (employee 101).

## 6. Constraints & Edge Cases
- An employee can report to two senior managers, so joins must support duplicates or multi-mapping.
- Top-level executives with no manager above them may or may not qualify depending on whether they manage managers.
- Hierarchical loops must not be assumed — typical org chart is acyclic.
- Some employees may not have a manager entry.

## 7. Acceptance Criteria
- Senior managers are correctly identified based on the strict definition.
- Only direct reports of senior managers are counted.
- Output must list senior manager names with accurate counts.
- Sorting must place highest count first.

## 8. Additional Notes
- The example input/output is illustrative; real datasets may produce different values.
- The logic must treat the table as a self-join hierarchy.
