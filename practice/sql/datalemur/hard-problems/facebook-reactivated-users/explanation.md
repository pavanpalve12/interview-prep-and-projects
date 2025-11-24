
## 4. Query Explanation by Segment

### `WITH login_cte AS (...)`
Creates a preparatory dataset that adds:
- `mth` → month of login
- `prev_login_mth` → last login month for same user
This simplifies downstream logic.

### `LAG(EXTRACT(MONTH FROM login_date)) OVER (PARTITION BY user_id ORDER BY login_date)`
- Looks at each user individually.
- Ensures logins are compared chronologically.
- Identifies inactivity gaps.

### `WHERE mth - prev_login_mth > 1 OR prev_login_mth IS NULL`
- Captures first-time logins and true reactivations.
- Filters out regular or frequent logins.

### `COUNT(DISTINCT user_id)`
Ensures each user is only counted once per month, regardless of how many times they logged in.

## 5. Edge Cases Considered
- Users with only one login ever → treated as reactivated.
- Multiple logins by the same user in the same month → counted once.
- Logins spanning end-of-year transitions (e.g., December to February) behave correctly since month numbers differ by more than 1.
- Users with consecutive-month logins (e.g., April → May) are not counted.

## 6. Validation
- Check that `prev_login_mth` aligns correctly with chronological order.
- Verify that distinct user counts match manual calculations for sample data.
- Confirm that each month includes only qualified reactivated users.

## 7. Final Notes
This method is efficient and scalable because it relies on window functions instead of subqueries or self-joins. It accurately captures reactivation behavior purely by comparing month transitions per user.
