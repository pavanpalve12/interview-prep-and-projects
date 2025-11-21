------------------------------------------------------------------------
title: Cvs Health Pharmacy Analytics Part 1
platform: datalemur
id: cvs-health-pharmacy-analytics-part-1
slug: cvs-health-pharmacy-analytics-part-1
difficulty: easy
time_taken_minutes: 4
attempts: 1
solved_date: 2025-11-21
author: pavanpalve12
------------------------------------------------------------------------
# Problem Statement

## Objective
CVS Health wants to better understand its pharmacy sales and determine which drugs generate the most profit.  
Each drug is produced by a single manufacturer.

Write a SQL query to find the **top 3 most profitable drugs**, where:

Total Profit = Total Sales - Cost of Goods Sold (cogs)


Return:
- `drug`
- `total_profit`

Sort the results from **highest to lowest** profit.  
Assume there are **no ties** in profit.

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

| product_id | units_sold | total_sales | cogs        | manufacturer | drug            |
|------------|------------|-------------|-------------|--------------|------------------|
| 9          | 37410      | 293452.54   | 208876.01   | Eli Lilly    | Zyprexa          |
| 34         | 94698      | 600997.19   | 521182.16   | AstraZeneca  | Surmontil        |
| 61         | 77023      | 500101.61   | 419174.97   | Biogen       | Varicose Relief  |
| 136        | 144814     | 1084258     | 1006447.73  | Biogen       | Burkhart         |

---

## Example Output

| drug            | total_profit |
|-----------------|---------------|
| Zyprexa         | 84576.53      |
| Varicose Relief | 80926.64      |
| Surmontil       | 79815.03      |

---

## Explanation
- **Zyprexa** generated the highest profit:  
  293,452.54 − 208,876.01 = **84,576.53**
- **Varicose Relief** generated:  
  500,101.61 − 419,174.97 = **80,926.64**
- **Surmontil** generated:  
  600,997.19 − 521,182.16 = **79,815.03**

These three are the top-earning drugs, ranked from highest to lowest total profit.
