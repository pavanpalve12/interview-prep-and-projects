# Explanation

## 1. Pseudocode / Approach
- Step 1: Extract the year from `tweet_date` and filter records only for the year **2022**.
- Step 2: Use a CTE to count how many tweets each user posted in 2022 (this becomes the "tweet bucket").
- Step 3: Group by the tweet bucket and count how many users fall into each bucket.

## 2. Reasoning
The problem requires a histogram-style output:
- First compute **tweets per user**.
- Then compute **users per tweet-count bucket**.
Using two levels of grouping (CTE + outer group) is the cleanest method.

## 3. Edge Cases
- Users who tweeted only in 2021 → should be excluded.
- Users with 0 tweets in 2022 → not included in the histogram.
- Users with multiple tweets on the same day → counted correctly.
