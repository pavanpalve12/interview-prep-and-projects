------------------------------------------------------------------------
title: Amazon Maximize Prime Item Inventory
platform: datalemur
id: amazon-maximize-prime-item-inventory
slug: amazon-maximize-prime-item-inventory
difficulty: hard
time_taken_minutes: 45
attempts: 3
solved_date: 2025-11-23
author: pavanpalve12
------------------------------------------------------------------------
# Problem Statement

## 1. Objective
Determine the maximum number of **prime batches** and **non-prime batches** that can fit into a 500,000 square-foot Amazon warehouse.  
Prime batches must be prioritized, and both prime and non-prime items must be stocked only as full batch sets.

## 2. Business Context
Amazon stores inventory in fixed **batch sets**. A batch is defined by the combination of item categories belonging to the same `item_type`.

For example, if the prime batch contains:
- 1 laptop  
- 1 side table  

Then this entire set represents **one batch**.  
You cannot add extra laptops without adding the side table — batches must remain intact.

The warehouse has **500,000 square feet**, and Amazon wants to maximize capacity by:
1. Filling as many **prime batches** as possible.
2. Using remaining space for **non-prime batches**, also stored as inseparable sets.

Prime inventory always gets priority.

## 3. Dataset Description

### **Table: `inventory`**
| Column Name     | Type    | Description |
|-----------------|---------|-------------|
| item_id         | integer | Unique identifier for the item |
| item_type       | string  | Type of the item (prime_eligible / not_prime) |
| item_category   | string  | Category within the item type, used to form batch sets |
| square_footage  | decimal | Square footage required by one item |

### Example Input
| item_id | item_type       | item_category      | square_footage |
|---------|------------------|---------------------|----------------|
| 1374    | prime_eligible   | mini refrigerator   | 68.00          |
| 4245    | not_prime        | standing lamp       | 26.40          |
| 2452    | prime_eligible   | television          | 85.00          |
| 3255    | not_prime        | side table          | 22.60          |
| 1672    | prime_eligible   | laptop              | 8.50           |

## 4. Requirements / Tasks
1. Treat each distinct `item_category` within an `item_type` as part of a **batch set**.  
   - Prime items form the **prime batch**.  
   - Non-prime items form the **non-prime batch**.
2. Compute the **total square footage required for one batch** for both item types.
3. Using 500,000 sq ft:
   - Calculate how many **whole prime batches** can fit.
   - Subtract prime square footage from total space.
   - Calculate how many **whole non-prime batches** can fit in the remaining space.
4. Output:
   - `item_type`
   - `item_count` (number of full batches)
5. Output order must always be:
   1. `prime_eligible`
   2. `not_prime`

## 5. Constraints & Edge Cases
- **Batches cannot be split.** No fractional batches allowed.
- **Non-prime batch count must not be zero**, even after prioritizing prime batches.
- If the remaining sq ft after prime allocation cannot fit at least one non-prime batch, **reduce prime batch count** to allow minimum 1 non-prime batch.
- All calculations must use whole numbers.
- Total space is always capped at **500,000 sq ft**.

## 6. Expected Output Format

### Example Output
| item_type       | item_count |
|-----------------|------------|
| prime_eligible  | 9285       |
| not_prime       | 6          |

## 7. Acceptance Criteria
- Prime batches must always be maximized first, but **not at the expense of eliminating non-prime batches**.
- Batch square footage = sum of all item categories belonging to that type.
- Item counts must be calculated using integer division (`FLOOR`).
- Output must contain exactly **two rows**, one for each item type.
- Output order must strictly follow the requirement: prime first, then non-prime.

## 8. Additional Notes
- The example input and output are illustrative; the solution must work for any dataset following the batch-set rules.
- The logic must be implemented using SQL windowing, aggregation, and integer math.  
