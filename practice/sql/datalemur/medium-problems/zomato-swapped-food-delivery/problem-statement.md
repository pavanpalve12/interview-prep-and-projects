------------------------------------------------------------------------
title: Zomato Swapped Food Delivery
platform: datalemur
id: zomato-swapped-food-delivery
slug: zomato-swapped-food-delivery
difficulty: medium
time_taken_minutes: 10
attempts: 1
solved_date: 2025-11-23
author: pavanpalve12
------------------------------------------------------------------------
# Problem Statement

## 1. Objective
Fix the item–order pairing error in the `orders` table caused by an accidental swap of each row’s item with the next row’s item. The goal is to return the correct mapping between `order_id` and `item`.

## 2. Business Context
Zomato relies on accurate delivery instructions to ensure customers receive the correct food items.  
A system error swapped each item with the one belonging to the next order, leading to incorrect deliveries.  
Your job as a data analyst is to reverse the swap and restore the accurate order–item relationships.

## 3. Dataset Description

### **Table: `orders`**
| column_name | type    | description                          |
|-------------|---------|--------------------------------------|
| order_id    | integer | Unique identifier for each order     |
| item        | string  | Food item associated with the order  |

### Example Input (Incorrect Data)
| order_id | item             |
|----------|------------------|
| 1        | Chow Mein        |
| 2        | Pizza            |
| 3        | Pad Thai         |
| 4        | Butter Chicken   |
| 5        | Eggrolls         |
| 6        | Burger           |
| 7        | Tandoori Chicken |

## 4. Requirements / Tasks
1. Reverse the incorrect swapping of items between adjacent rows.
2. Pair each `order_id` with the correct `item`:
   - Order 1 ↔ Order 2  
   - Order 3 ↔ Order 4  
   - Order 5 ↔ Order 6  
3. Keep the last row unchanged **if the last order_id is odd**.
4. Output the corrected dataset with:
   - `corrected_order_id`
   - `item`
5. Ensure the output matches the corrected mapping for all rows.

## 5. Expected Output Format

### Example Output (Corrected Data)
| corrected_order_id | item             |
|--------------------|------------------|
| 1                  | Pizza            |
| 2                  | Chow Mein        |
| 3                  | Butter Chicken   |
| 4                  | Pad Thai         |
| 5                  | Burger           |
| 6                  | Eggrolls         |
| 7                  | Tandoori Chicken |

### Explanation
- Order ID **1** is now paired with **Pizza**, which originally belonged to Order 2.
- Order ID **2** is paired with **Chow Mein**, originally Order 1's item.
- This pattern continues for all even–odd adjacent pairs.
- Order ID **7** (odd and last) remains unchanged.

## 6. Constraints & Edge Cases
- The table may contain any number of rows.
- Only adjacent odd–even pairs should be swapped.
- The last row must remain unchanged **only** if:
  - It has an odd order_id **and**
  - It does not have a subsequent row to swap with.

## 7. Acceptance Criteria
- All swapped items must be restored to their correct order ID.
- Output must contain the corrected order ID and its correct item.
- Logic must handle any table size reliably.
- The last odd order ID must remain intact.

## 8. Additional Notes
- This is purely a data correction problem; no business logic changes to Zomato's workflow are required.
- Input data shown is an example; actual data may vary.
