
# Explanation

## 1. Approach Overview
The goal is to identify customers who have purchased at least one product in **every** product category available in the `products` table.  
To achieve this, we compute how many distinct product categories each customer has and compare this count to the total number of distinct categories in the entire catalog.

## 2. Step-by-Step Breakdown

### Step 1: Join `customer_contracts` with `products`
We join the two tables on `product_id` so we can determine the product category associated with each customer’s purchased products.

### Step 2: Count distinct product categories per customer
Using `COUNT(DISTINCT p.product_category)`, we compute the number of **unique categories** that each customer has contracts for.  
This is done inside a CTE (`contracts_products_cte`) and grouped by `customer_id`.

### Step 3: Compute total number of distinct categories in the catalog
A subquery counts all distinct product categories from the `products` table.  
This represents the full set of categories that exist.

### Step 4: Compare per-customer category count to total category count
Only customers whose `product_count` equals the total number of existing categories qualify.  
These are the customers who have contracts spanning **all product categories**.

### Step 5: Return qualifying customers
The final SELECT returns only the `customer_id` values that meet the criteria.

## 3. Logical Flow (Pseudocode)

1. For each customer:
   - Determine the number of unique product categories tied to their purchases.
2. Determine how many unique product categories exist.
3. Keep only the customers whose category count equals the total number of categories.

## 4. Query Explanation by Component

### CTE (`contracts_products_cte`)
- Groups data at the customer level.
- Counts distinct product categories linked to each customer.
- Produces two columns:
  - `customer_id`
  - `product_count` — number of categories purchased by that customer.

### Main Query
- Filters the CTE to only include customers where:
  - `product_count` = (SELECT DISTINCT category count from all products)
- Ensures the output includes only customers covering *every* category.

## 5. Edge Cases Considered
- A customer may purchase multiple products in the same category → `DISTINCT` avoids double counting.
- If a new category is added to `products`, the logic automatically adapts.
- If a customer has no contracts, they naturally won’t appear in the CTE.

## 6. Validation Steps
- Verify the CTE returns correct category counts per customer.
- Count total distinct categories in `products`.
- Manually check a few customers to ensure the comparison logic is correct.

## 7. Final Notes
- This pattern is a standard solution for “coverage” or “set completeness” problems.
- The approach scales well with large datasets due to aggregation and minimal joins.
