------------------------------------------------------------------------
title: Cvs Health Pharmacy Analytics Part 2
platform: datalemur
id: cvs-health-pharmacy-analytics-part-2
slug: cvs-health-pharmacy-analytics-part-2
difficulty: easy
time_taken_minutes: 8
attempts: 1
solved_date: 2025-11-21
author: pavanpalve12
------------------------------------------------------------------------
# Problem Statement

## Objective
CVS Health is analyzing its pharmacy sales performance to understand which products are generating losses.  
Each drug is produced by exactly one manufacturer.

Write a SQL query to:
- Identify **manufacturers** whose drugs resulted in **financial losses**.
- Count how many loss-making drugs each manufacturer produced.
- Calculate the **total losses** (in absolute value) for each manufacturer.

Output the following columns:
- `manufacturer`
- `drug_count` — number of drugs with losses
- `total_loss` — sum of losses (absolute values)

Sort the results in **descending order of total_loss**, showing the highest losses first.

---

## Definition
A drug results in a **loss** when:

total_sales - cogs <= 0


Loss amount = `ABS(total_sales - cogs)`

---

## Table: `pharmacy_sales`

| Column Name  | Type     |
|--------------|----------|
| product_id   | integer  |
| units_sold   | integer  |
| total_sales  | decimal  |
| cogs         | decimal  |
| manufacturer | varchar  |
| drug         | varchar  |

### Example Input

| product_id | units_sold | total_sales | cogs        | manufacturer | drug                          |
|------------|------------|-------------|-------------|--------------|-------------------------------|
| 156        | 89514      | 3130097.00  | 3427421.73  | Biogen       | Acyclovir                     |
| 25         | 222331     | 2753546.00  | 2974975.36  | AbbVie       | Lamivudine and Zidovudine    |
| 50         | 90484      | 2521023.73  | 2742445.90  | Eli Lilly    | Dermasorb TA Complete Kit     |
| 98         | 110746     | 813188.82   | 140422.87   | Biogen       | Medi-Chord                    |

---

## Example Output

| manufacturer | drug_count | total_loss  |
|--------------|------------|-------------|
| Biogen       | 1          | 297324.73   |
| AbbVie       | 1          | 221429.36   |
| Eli Lilly    | 1          | 221422.17   |

---

## Explanation
- **Acyclovir (Biogen)** → Loss = 3427421.73 − 3130097.00 = **297,324.73**  
- **Lamivudine and Zidovudine (AbbVie)** → Loss = **221,429.36**  
- **Dermasorb TA Complete Kit (Eli Lilly)** → Loss = **221,422.17**  

The drug **Medi-Chord (Biogen)** generated a profit, so it is excluded.

Biogen incurred the highest loss, followed by AbbVie and Eli Lilly.
