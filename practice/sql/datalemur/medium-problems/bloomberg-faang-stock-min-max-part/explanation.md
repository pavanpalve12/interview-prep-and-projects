# Explanation

## 1. Metadata
- **Time taken:** 48 minutes  
- **Attempts:** 5  

---

## 2. Pseudocode / Approach
- Build `high_stock_open_cte`:
  - For each `ticker`, rank rows by `open` **descending** → `high_rank`.
  - Keep all columns + `high_rank`.
- Build `low_stock_open_cte`:
  - For each `ticker`, rank rows by `open` **ascending** → `low_rank`.
  - Keep all columns + `low_rank`.
- Build `high_low_joined_cte`:
  - Join highs and lows on `ticker`, restricting to `high_rank = 1` and `low_rank = 1`.
  - Project:
    - `ticker`
    - `highest_mth` = `TO_CHAR(h.date, 'Mon-YYYY')`
    - `highest_open` = `h.open`
    - `lowest_mth`  = `TO_CHAR(l.date, 'Mon-YYYY')`
    - `lowest_open` = `l.open`
- Final `SELECT *` from `high_low_joined_cte`.

---

## 3. Reasoning
- We need, per ticker, the **row(s)** with the **maximum** opening price and the **row(s)** with the **minimum** opening price.
- `RANK()` over (`PARTITION BY ticker ORDER BY open DESC/ASC`) labels those extremes as rank `1`.
- Joining the two rank-1 sets yields, for each ticker, the month and value of its highest and lowest **open**.

---

## 4. Edge Cases & Notes
- **Ties at extremes:**  
  - If multiple rows share the exact same max open (or min open), `RANK()` returns **multiple** rows with rank `1`.  
  - The final join will produce a **cartesian** pair between all max rows and all min rows for that ticker (e.g., 2×3 = 6 rows).  
  - If you want **exactly one** row per ticker, use `ROW_NUMBER()` instead of `RANK()` and add a deterministic tiebreaker (e.g., earliest/latest `date`, secondary sort by `date`, `volume`, or `close`).
    ```sql
    ROW_NUMBER() OVER (PARTITION BY ticker ORDER BY open DESC, date ASC) AS high_rn
    ROW_NUMBER() OVER (PARTITION BY ticker ORDER BY open ASC,  date ASC) AS low_rn
    -- then filter high_rn = 1 and low_rn = 1
    ```
- **Date formatting:** `TO_CHAR(date, 'Mon-YYYY')` is PostgreSQL/Oracle-style. Adjust for your SQL dialect if needed.
- **Performance:** Two window scans over `stock_prices` (one asc, one desc) are typical and fine unless the table is huge; appropriate indexing on `(ticker, open, date)` may help.

---
