# Explanation

## 1. Pseudocode / Approach
- Step 1: Join the `trades` table with the `users` table using `user_id` to access each user's city.
- Step 2: Filter the joined rows to include only trades where `status` is `'completed'`  
  (converted to lowercase for safety using `LOWER(status)`).
- Step 3: Group the filtered results by `city`.
- Step 4: Count how many completed orders occurred in each city.
- Step 5: Sort the results by `total_orders` in descending order.
- Step 6: Return the **top 3 cities** with the highest number of completed orders.

## 2. Reasoning
This query identifies the cities with the highest volume of completed trades.  
- Joining with `users` provides the `city` information.  
- Grouping by city and counting completed trades reveals hotspots of trading activity.  
- Ordering by count and limiting to 3 gives the top-performing cities.

## 3. Edge Cases
- Cities with no completed trades will not appear in the results.
- Status values with mixed case (e.g., `"Completed"`, `"COMPLETED"`) are handled safely due to `LOWER(status)`.
- If fewer than three cities have completed orders, the query returns all available cities.
