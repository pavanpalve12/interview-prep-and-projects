------------------------------------------------------------------------
title: Tesla Unfinished Parts
platform: datalemur
id: tesla-unfinished-parts
slug: tesla-unfinished-parts
difficulty: easy
time_taken_minutes: 2
attempts: 1
solved_date: 2025-11-21
author: pavanpalve12
------------------------------------------------------------------------
# Problem Statement

## Objective
Tesla is investigating production bottlenecks and wants to identify parts that have **begun the assembly process but are not yet finished**.

Write a SQL query to return all parts and their corresponding assembly steps where the part **has no `finish_date`** recorded.

---

## Assumptions
- The `parts_assembly` table contains all parts currently in production across all assembly stages.
- An unfinished part is defined as any record where **`finish_date` IS NULL`**.
- A part may appear multiple times, each representing a different assembly step.

---

## Table: `parts_assembly`

| Column Name   | Type      |
|----------------|-----------|
| part           | string    |
| finish_date    | datetime  |
| assembly_step  | integer   |

### Example Input

| part    | finish_date           | assembly_step |
|---------|------------------------|----------------|
| battery | 01/22/2022 00:00:00    | 1              |
| battery | 02/22/2022 00:00:00    | 2              |
| battery | 03/22/2022 00:00:00    | 3              |
| bumper  | 01/22/2022 00:00:00    | 1              |
| bumper  | 02/22/2022 00:00:00    | 2              |
| bumper  |                        | 3              |
| bumper  |                        | 4              |

---

## Example Output

| part    | assembly_step |
|---------|----------------|
| bumper  | 3              |
| bumper  | 4              |

---

## Explanation
The **bumper** part has two assembly steps (3 and 4) with **no `finish_date`**, indicating these steps are **not yet completed**.  
All battery assembly steps are finished and therefore excluded.