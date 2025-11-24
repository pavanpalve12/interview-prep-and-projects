------------------------------------------------------------------------
title: Mckinsey 3 Topping Pizzas
platform: datalemur
id: mckinsey-3-topping-pizzas
slug: mckinsey-3-topping-pizzas
difficulty: hard
time_taken_minutes: 40
attempts: 5
solved_date: 2025-11-24
author: pavanpalve12
------------------------------------------------------------------------
# Problem Statement

## 1. Objective
Generate all possible unique 3-topping pizza combinations from a list of toppings and compute the total ingredient cost for each pizza. The results must be sorted by total cost (highest first), and ties must be broken alphabetically based on the ordered list of toppings.

## 2. Business Context
A pizza shop wants to analyze all possible 3-topping pizza combinations to understand which combinations cost the most to produce. Each topping has a fixed ingredient cost. For consistency in menu generation and cost analysis, ingredients must always be listed in alphabetical order.

## 3. Dataset Description

### **Table: `pizza_toppings`**
| Column Name     | Type           | Description                     |
|------------------|----------------|---------------------------------|
| topping_name     | varchar(255)   | Name of the pizza topping       |
| ingredient_cost  | decimal(10,2)  | Cost of the topping             |

### Example Input
| topping_name  | ingredient_cost |
|---------------|-----------------|
| Pepperoni     | 0.50            |
| Sausage       | 0.70            |
| Chicken       | 0.55            |
| Extra Cheese  | 0.40            |

## 4. Requirements / Tasks
1. Generate all 3-topping combinations from the `pizza_toppings` table.
2. Do **not** allow repeated ingredients within the same pizza (e.g., `Pepperoni,Pepperoni,Onion` is invalid).
3. Ensure toppings in each pizza combination are sorted alphabetically.
4. Compute the total cost of the three toppings.
5. Sort final results:
   - Primary: `total_cost` in **descending** order.
   - Secondary (tie-breaker): alphabetical order of the three toppings.
6. Output should contain the following columns:
   - `pizza` (comma-separated list of ingredients with no extra spaces)
   - `total_cost`

## 5. Expected Output Format

### Example Output
| pizza                         | total_cost |
|-------------------------------|------------|
| Chicken,Pepperoni,Sausage     | 1.75       |
| Chicken,Extra Cheese,Sausage  | 1.65       |
| Extra Cheese,Pepperoni,Sausage| 1.60       |
| Chicken,Extra Cheese,Pepperoni| 1.45       |

## 6. Constraints & Edge Cases
- Toppings list may contain many ingredients; solution must scale.
- Alphabetical order must be strictly enforced for each pizza.
- No spaces allowed around commas in the final `pizza` string.
- Combination ordering must follow dictionary rules (topping1 < topping2 < topping3).

## 7. Acceptance Criteria
- All unique 3-topping alphabetical combinations are displayed.
- No duplicates or repeated toppings appear.
- `total_cost` accuracy must match ingredient prices.
- Sorting must follow cost-descending and alphabetical tie-breaking rules.

## 8. Additional Notes
- Example output is illustrative; your dataset may produce different combinations or costs.
- This problem focuses on correct combination logic, string formatting, and stable ordering guarantees.

