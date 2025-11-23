------------------------------------------------------------------------
title: Microsoft Supercloud Customer
platform: datalemur
id: microsoft-supercloud-customer
slug: microsoft-supercloud-customer
difficulty: medium
time_taken_minutes: 10
attempts: 1
solved_date: 2025-11-23
author: pavanpalve12
------------------------------------------------------------------------
# Problem Statement

## 1. Objective
Identify customers who have purchased at least one product from **every** product category available in the product catalog.

## 2. Business Context
A company offers multiple product categories.  
Customers purchase products through contracts recorded in the `customer_contracts` table.  
Management wants to know which customers have coverage across **all** product categories — meaning they have contracts that collectively span every category present in the `products` table.

This helps identify:
- High-value or fully-engaged customers  
- Cross-sell or upsell opportunities  
- Customers who have adopted the complete product suite  

## 3. Dataset Description

### Table: `customer_contracts`
| Column Name    | Type     | Description |
|----------------|----------|-------------|
| customer_id    | integer  | Unique identifier for a customer |
| product_id     | integer  | Product purchased by the customer |

### Table: `products`
| Column Name       | Type     | Description |
|-------------------|----------|-------------|
| product_id        | integer  | Unique identifier for a product |
| product_category  | text     | Category to which the product belongs |

## 4. Requirements / Tasks
1. For each customer, determine the number of **distinct product categories** they have purchased.
2. Determine the **total number of distinct product categories** available across the entire product catalog.
3. Identify customers whose distinct product category count equals the total category count.
4. Output the list of such customers.

## 5. Expected Output Format
| customer_id |
|-------------|
| (only customers covering all categories) |

Each row represents a customer who has purchased products from **every** product category.

## 6. Constraints & Edge Cases
- A customer may purchase multiple products from the same category → count must remain distinct.
- New product categories may be added to the catalog → the logic must automatically adapt.
- Customers with no contracts must not appear in the output.
- If only one product category exists, any customer with at least one purchase qualifies.

## 7. Acceptance Criteria
- The solution must correctly classify customers based on full category coverage.
- Distinct category counting must be correct and not inflated by duplicates.
- The output must include only customers whose purchase portfolio spans **all** categories.

## 8. Additional Notes
- This is a common completeness-check pattern in SQL involving comparison of grouped distinct counts against global distinct counts.
- Efficient use of joins and aggregations is required due to potentially large data volumes.
