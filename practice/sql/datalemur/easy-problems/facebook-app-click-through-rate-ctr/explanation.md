# Explanation

## 1. Pseudocode / Approach
- Step 1: Filter events to only include those from the year **2022**.
- Step 2: For each `app_id`, count:
  - **impressions** → number of rows where `event_type = 'impression'`
  - **clicks** → number of rows where `event_type = 'click'`
- Step 3: Use a CTE (`ctr_base_cte`) to store impressions and clicks per app.
- Step 4: In the final SELECT:
  - Compute CTR as:  
    `100 * clicks / impressions`
  - Round the result to **2 decimal places**.

## 2. Reasoning
CTR (Click-Through Rate) is defined as:

