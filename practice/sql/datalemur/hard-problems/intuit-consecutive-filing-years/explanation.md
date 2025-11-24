# Explanation

## 1. Approach Overview
The goal of this query is to identify users who have filed taxes consistently for at least 3 years in a streak **with the same product category** (TurboTax or QuickBooks). The logic groups users by a computed streak marker so we can detect uninterrupted yearly filing sequences.

## 2. Step-by-Step Breakdown

### Step 1 — Clean and Annotate Data (`data_cleanup_cte`)
This CTE prepares the dataset for streak detection:

- `ROW_NUMBER() OVER (ORDER BY user_id, filing_date)`  
  Assigns an incremental row number ordered first by user, then by filing date. This creates a sequential index of filings across all users.

- `EXTRACT(YEAR FROM filing_date)`  
  Pulls out the year component from the date.

- `EXTRACT(YEAR FROM filing_date) - ROW_NUMBER() ... AS streak_year`  
  This is the key trick for streak detection.  
  When the difference between the filing year and the row number remains constant, it indicates **consecutive yearly filings**.  
  Example:  
  - Years: 2018, 2019, 2020  
  - Row numbers: 1, 2, 3  
  - Differences: 2017, 2017, 2017 → identical → part of the same streak.

- Product categorization:  
  - Records starting with "TurboTax" → `TurboTax`  
  - Starting with "QuickBooks" → `QuickBooks`  
  - Everything else → `missed_something`  
  This ensures streaks are checked **per product family**.

### Step 2 — Group to Identify Streaks
After annotating each row, the outer query:

```sql
GROUP BY streak_year, product_name, user_id
This groups:

Each user

Within each product

Within each consecutive-year streak (same streak_year)

This isolates every continuous run of filings.

Step 3 — Select Only Streaks of 3+ Years
The HAVING COUNT(*) >= 3 clause filters groups where the streak contains 3 or more filings — i.e., 3 consecutive years.

Only users with such streaks are returned.

Step 4 — Order the Output
ORDER BY user_id ensures results appear in user sequence.

3. Logical Flow (Pseudocode)
For each tax filing:

Sort filings by user and date.

Generate row number.

Compute streak_year = filing_year - row_number.

Categorize product.

Group records by:

user

product

streak marker

Count streak length.

Keep only groups with length ≥ 3.

Return user IDs.

4. Explanation of Final Query Components
Window functions
Used to order filings and detect streak boundaries.

Streak logic
year - row_number trick creates a constant identifier across consecutive years.

Product filtering
Ensures the streak is not mixed across different product families.

Having clause
Enforces the minimum streak length.

5. Edge Cases Considered
Users filing in non-consecutive years → will not satisfy streak grouping.

Users switching products → streak breaks.

Users with fewer than 3 filings → automatically excluded.

Irregular filing dates within same year → streak holds only by year, not exact date.

6. Validation
This pattern is a well-known SQL streak-detection technique.
The grouping gives streak segments, and the HAVING filter correctly isolates sequences of length 3 or more.

7. Final Notes
This solution scales well since window functions operate efficiently on sorted partitions.

The streak detection logic assumes no duplicate filings per user per year — if duplicates exist, additional deduplication may be required.