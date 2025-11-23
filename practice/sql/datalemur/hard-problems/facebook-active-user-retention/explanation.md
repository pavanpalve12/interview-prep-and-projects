# Explanation

## 1. Approach Overview
The goal is to calculate July Monthly Active Users (MAU) **who were also active in June**, based on selected event types (`sign-in`, `like`, `comment`). We must detect users who appear in both months and count only their July activity. Two approaches are provided:  
1. Using a window function to identify users whose second unique active month is July.  
2. Checking whether each July user also appears in June.

## 2. Step-by-Step Breakdown (Solution 1)

### Step 1: Filter Relevant Months and Events  
The CTE `filter_users_cte` restricts data to:
- Months: **June (6)** and **July (7)**
- Event types: **sign-in**, **like**, **comment**  
This ensures only meaningful user activity is considered.

### Step 2: Extract Month  
`EXTRACT(MONTH FROM event_date)` identifies each activity's month so we can segment activity by month.

### Step 3: Rank Months Per User  
`DENSE_RANK()` partitions by user and orders months ascending.  
- If a user has activity in June and July:  
  - June → rank 1  
  - July → rank 2  
- If a user is active only in July:  
  - July → rank 1  

This ranking allows us to identify users who were active in June **and then** active again in July.

### Step 4: Select Only Users With Rank = 2 in July  
`WHERE rank = 2 AND month = 7` ensures:
- The user had activity in **June first**,  
- And their **second active month is July**,  
- So they qualify as “active in both months”.

### Step 5: Count Distinct Users in July  
Finally, group by month and count distinct user IDs to produce July MAU.

This gives us the count of users who:
- Had valid activity in June  
- AND had valid activity in July  
- AND were active in July using one of the selected event types

## 3. Pseudocode (Solution 1)
For each user:
Consider only events in June or July of allowed types
Assign ranks based on month of activity
Select users whose rank = 2 (means July after June)
Count distinct users for July


## 4. Final Query Explanation (Solution 1)
- `EXTRACT(MONTH...)` → identifies event month  
- `DENSE_RANK(...) OVER (PARTITION BY user_id ...)` → determines order of months per user  
- Filtering rank = 2 ensures second active month is July  
- Grouping by month yields the final July MAU count

## 5. Edge Cases Considered
- Users active only in July are excluded (correct behavior).  
- Users active in June multiple times still get rank 1 only once.  
- Users with no allowed event types are excluded.  
- Users active in months other than 6 or 7 are ignored entirely.

## 6. Validation
Manual reasoning confirms that:
- Rank logic correctly detects sequential month participation  
- Counting only July activity ensures correct MAU definition  
- The alternative approach (IN-subquery) yields equivalent results

## 7. Approach 2 Summary (IN-Subquery Method)
This version:
- Collects all June active users  
- Collects all July active users  
- Counts July users who also appear in the June user list

It is simpler but less elegant than the window function method.

## 8. Final Notes
Both solutions are correct:
- **Solution 1** is more scalable and SQL-idiomatic.  
- **Solution 2** is intuitive and easy to debug.  
Window functions are generally preferred for multi-month MAU patterns.

