------------------------------------------------------------------------
title: Amazon Average Review Ratings
platform: datalemur
id: amazon-average-review-ratings
slug: amazon-average-review-ratings
difficulty: easy
time_taken_minutes: 4
attempts: 1
solved_date: 2025-11-21
author: pavanpalve12
------------------------------------------------------------------------
# Problem Statement

## Objective
Given the `reviews` table, write a query to retrieve the **average star rating for each product grouped by month**.

Your output must include:
- the **month** as a numeric value,
- the **product ID**, and
- the **average star rating**, rounded to **two decimal places**.

Sort the results by **month first**, then **product ID**.

---

## Table: `reviews`

| Column Name | Type            |
|-------------|-----------------|
| review_id   | integer         |
| user_id     | integer         |
| submit_date | datetime        |
| product_id  | integer         |
| stars       | integer (1–5)   |

### Example Input

| review_id | user_id | submit_date          | product_id | stars |
|-----------|---------|-----------------------|------------|--------|
| 6171      | 123     | 06/08/2022 00:00:00   | 50001      | 4      |
| 7802      | 265     | 06/10/2022 00:00:00   | 69852      | 4      |
| 5293      | 362     | 06/18/2022 00:00:00   | 50001      | 3      |
| 6352      | 192     | 07/26/2022 00:00:00   | 69852      | 3      |
| 4517      | 981     | 07/05/2022 00:00:00   | 69852      | 2      |

---

## Example Output

| mth | product | avg_stars |
|-----|---------|-----------|
| 6   | 50001   | 3.50      |
| 6   | 69852   | 4.00      |
| 7   | 69852   | 2.50      |

---

## Explanation
- Product **50001** received ratings **4** and **3** in June → average = **3.50**  
- Product **69852** received one rating of 4 in June → average = **4.00**  
- Product **69852** received ratings **3** and **2** in July → average = **2.50**

