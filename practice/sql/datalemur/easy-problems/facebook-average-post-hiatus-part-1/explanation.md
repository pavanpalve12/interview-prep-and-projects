# Explanation

## 1. Pseudocode / Approach
- Step 1: Filter the `posts` table to include only posts made in **2021**.
- Step 2: For each `user_id`, calculate:
  - The total number of posts (`COUNT(post_id)`).
  - The earliest post date (`MIN(post_date)`).
  - The latest post date (`MAX(post_date)`).
- Step 3: Keep only users who posted **more than 2 times** in 2021.
- Step 4: In the outer query, calculate the number of days between the user's first and last post.
- Step 5: Return the `user_id` and the computed `days_between`.

## 2. Reasoning
The CTE (`post_2021_cte`) aggregates posting behavior per user for the year 2021.  
Filtering inside the CTE ensures only meaningful users (those with >2 posts) are evaluated.  
The final SELECT computes `last_post_date - first_post_date` to determine how active the user was across the year.

## 3. Edge Cases
- Users with 2 or fewer posts in 2021 are excluded.
- Users with only one day of activity will show `0` days between.
- If `post_date` contains timestamps, casting to DATE ensures correct day-level calculation.

