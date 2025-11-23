# Explanation

## 1. Approach Overview
The goal is to determine how many items of each item type can fit into a 500,000 sq ft processing batch. The solution uses two main stages:  
1. Aggregate square footage and distinct item categories by item type.  
2. Compute how many “prime_eligible” items fit first, then compute how many non-prime items fit in the remaining space.

This ensures prime-eligible items get priority within the 500,000 sq ft constraint.

## 2. Step-by-Step Breakdown

### Step 1: Aggregate Inventory by Item Type  
The CTE `total_sqft_batch_cte` groups data by `item_type` and computes:
- **item_count_by_type**: number of distinct item categories within that type  
- **sqft_by_type**: total square footage contributed by that item type  

This creates foundational metrics needed to estimate the number of items that can fit in a batch.

### Step 2: Compute Prime-Eligible Batch Capacity  
The CTE `prime_sqft_cte` isolates only the `prime_eligible` item type.  
It computes:
- **items_in_batch_count** = floor(500000 / sqft_by_type)  
  → How many batches of this type fit in 500k sq ft.
- **total_sqft_reqd** = sqft_by_type × items_in_batch_count  
  → How much square footage is consumed by prime-eligible items.

This locks in the prime allocation before evaluating other item types.

### Step 3: Final Calculation of Item Counts  
For each item type in `total_sqft_batch_cte`, the final SELECT determines item counts:

- **Prime Eligible Case**  
FLOOR ((SELECT items_in_batch_count FROM prime_sqft_cte) * item_count_by_type)

Total number of prime items = number of prime batches × number of categories in prime items.

- **Non-Prime Case**  


FLOOR ((500000 - (SELECT FLOOR(500000/sqft_by_type) * sqft_by_type FROM prime_sqft_cte)) / sqft_by_type) * item_count_by_type

Remaining sq ft = 500k – prime sq ft  
Remaining batches = floor(remaining sq ft / sqft_by_type)  
Total items = remaining batches × number of categories for that type.

### Step 4: Order Output  
The final output is sorted by item_count in descending order, ensuring the highest-volume item types appear at the top.

## 3. Pseudocode / Logical Flow



For each item_type:

Count distinct item categories.

Sum total square footage.

For prime_eligible:

Determine how many whole batches fit into 500k sq ft.

Compute total sq ft consumed by prime-eligible.

For all item types:

If prime_eligible:
total_items = batch_count * category_count

Else:
remaining_sqft = 500k - prime_sqft
batch_count = floor(remaining_sqft / sqft_by_type)
total_items = batch_count * category_count

Sort by total_items descending.


## 4. Final Query Explanation by Clause

### `total_sqft_batch_cte`
Builds the per-item-type aggregate:
- `COUNT(DISTINCT item_category)` → ensures category-level granularity  
- `SUM(square_footage)` → total footprint per type  

### `prime_sqft_cte`
Isolates prime items and computes:
- `FLOOR(500000 / sqft_by_type)` → number of valid prime batches  
- Multiplying back gives sq ft consumed  

### Final SELECT
- Uses conditional logic to handle prime first, then non-prime items using remaining space  
- `CASE` ensures exactly the required prioritization and logic flow  

## 5. Edge Cases Considered
- Prime-eligible having large sq ft may reduce or eliminate available space for other types  
- Floor operations enforce whole-batch allocations only  
- Distinct item categories ensure accurate scaling  
- Remaining sq ft may be zero or too small to fit non-prime items  

## 6. Validation Steps
- Verified that prime sq ft consumption never exceeds 500k  
- Checked that floor calculations prevent fractional items/batches  
- Verified sample scenarios where:
  - prime takes all space  
  - prime takes partial space  
  - prime has minimal sq ft and leaves significant room for others  

## 7. Final Notes
The logic enforces strict prioritization of prime-eligible items and uses floor division everywhere to maintain batch integrity. The solution is deterministic and scales correctly as long as the inventory contains valid square footage data.
