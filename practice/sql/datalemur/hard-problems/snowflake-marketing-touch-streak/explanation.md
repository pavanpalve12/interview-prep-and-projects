# Explanation

## 1. Approach Overview
The objective is to identify users who have a consecutive streak of at least three weekly marketing touchpoints, where at least one of the touchpoints within that streak is of type `trial_request`. Two SQL approaches are presented: Approach 1 uses window functions with streak grouping via row-number subtraction, while Approach 2 uses a lead-based method to explicitly inspect consecutive touchpoints. Both accurately detect 3-week streaks and filter users who engaged with a trial request during that streak.

## 2. Step-by-Step Breakdown

### ----------------------- Approach 1 -----------------------
### Step 1: Data Cleanup and Feature Extraction
- Join `marketing_touches` with `crm_contacts` to obtain user emails.
- Extract the week number from `event_date` using `EXTRACT(WEEK FROM ...)`.
- Assign a row number ordered by `contact_id` and `event_date`.
- Compute a `streak_id` by subtracting `row_num` from `week`. When weeks are consecutive, `week - row_num` remains constant, enabling streak grouping.

### Step 2: Streak Identification
- Using a window function, count how many events belong to each streak (`COUNT(*) OVER (PARTITION BY contact_id, streak_id)`).
- This gives `streak_cnt`, representing how many consecutive weekly touchpoints the user had.

### Step 3: Filter Valid Streaks
- Select users where:
  - The streak contains at least 3 touchpoints (`streak_cnt >= 3`).
  - One of those touchpoints has event_type = 'trial_request'.
- Return only the corresponding user emails.

## 3. Pseudocode / Logical Flow
1. Join touches with contacts.
2. For each user, order touches by date.
3. Compute week number and row number.
4. Group by `week - row_num` to form streak clusters.
5. Count touchpoints inside each streak.
6. Filter streaks with >= 3 entries.
7. Check if any entry in that streak is a trial request.
8. Output the user email.

## 4. Final Query Explanation (Approach 1)
- `ROW_NUMBER()` orders events chronologically per user.
- `week - row_num` produces identical values for consecutive weeks, enabling streak grouping.
- The second CTE counts streak lengths.
- Final filter enforces:
  - streak length ≥ 3  
  - at least one event is `trial_request`.
- Ensures only qualifying users are returned.

---

### ----------------------- Approach 2 -----------------------
### Step 1: Data Cleanup (Same as Approach 1)
- Calculate week number, row number, and streak_id the same way.

### Step 2: Identify Touchpoints Within the Streak
- Use `LEAD(event_type, n)` to look forward within each streak:
  - `first_touch_point` → current row’s event
  - `second_touch_point` → next touchpoint
  - `third_touch_point` → third consecutive touchpoint

### Step 3: Validate Streak Conditions
- Check that all three positions (first, second, third) are NOT NULL.
- Check if any of the three touchpoints is `trial_request`.
- Flag such streaks using `tr_flag`.

### Step 4: Output
- Select only users whose `tr_flag = 1`, ensuring the user has a 3-week streak and at least one `trial_request`.

## 5. Edge Cases Considered
- Users with fewer than 3 touches: automatically excluded.
- Non-consecutive weeks: `week - row_num` generates different streak groups.
- Multiple streaks per user: each streak evaluated independently.
- Trial request may happen in any of the three positions.
- Handles unordered input safely due to window ordering.

## 6. Validation
- Verified that streak calculation relies strictly on chronological order.
- Ensured `EXTRACT(WEEK)` works as grouping mechanism.
- Confirmed both approaches produce the same final set of qualifying emails.
- Approach 1 is more efficient; Approach 2 is more explicit and readable.

## 7. Final Notes
- Approach 1 is typically preferred for performance and simplicity.
- Approach 2 is useful when individual streak positions must be inspected or extended to longer streak definitions.
- Both methods scale well and avoid subqueries or loops by leveraging window functions.
