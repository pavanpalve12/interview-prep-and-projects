------------------------------------------------------------------------
title: Bloomberg Faang Stock Min Max Part
platform: datalemur
id: bloomberg-faang-stock-min-max-part
slug: bloomberg-faang-stock-min-max-part
difficulty: medium
time_taken_minutes: 48
attempts: 5
solved_date: 2025-11-23
author: pavanpalve12
------------------------------------------------------------------------
# Problem Statement

## Objective
The Bloomberg Terminal is a leading platform for financial professionals, providing access to extensive datasets and analytical tools.  
As a **Data Analyst at Bloomberg**, you are analyzing **historical stock data** for the FAANG companies (Facebook, Apple, Amazon, Netflix, Google).

Your task is to identify, for each FAANG stock:
- The **month and year** (`'Mon-YYYY'`) when it had its **highest opening price**, and  
- The **month and year** (`'Mon-YYYY'`) when it had its **lowest opening price**.

Return the **ticker symbol**, **highest month**, **highest open**, **lowest month**, and **lowest open**, sorted by ticker symbol.

---

## Table: `stock_prices`

| Column Name | Type | Description |
|--------------|-------|-------------|
| date | datetime | The date of the stock record (mm/dd/yyyy). |
| ticker | varchar | The stock ticker symbol (e.g., AAPL, AMZN, META). |
| open | decimal | Opening price of the stock for that trading day. |
| high | decimal | Highest price reached during the day. |
| low | decimal | Lowest price reached during the day. |
| close | decimal | Closing price at the end of the trading day. |

---

## Example Input

| date | ticker | open | high | low | close |
|------|---------|------|------|-----|-------|
| 01/31/2023 00:00:00 | AAPL | 142.28 | 142.70 | 144.34 | 144.29 |
| 02/28/2023 00:00:00 | AAPL | 146.83 | 147.05 | 149.08 | 147.41 |
| 03/31/2023 00:00:00 | AAPL | 161.91 | 162.44 | 165.00 | 164.90 |
| 04/30/2023 00:00:00 | AAPL | 167.88 | 168.49 | 169.85 | 169.68 |
| 05/31/2023 00:00:00 | AAPL | 176.76 | 177.33 | 179.35 | 177.25 |

---

## Example Output

| ticker | highest_mth | highest_open | lowest_mth | lowest_open |
|---------|--------------|---------------|--------------|--------------|
| AAPL | May-2023 | 176.76 | Jan-2023 | 142.28 |

---

## Explanation
- The **highest open** for AAPL occurred in **May 2023** at **$176.76**.  
- The **lowest open** occurred in **January 2023** at **$142.28**.

Therefore, the output shows both the highest and lowest opening months and values per stock ticker.

> *Apple Inc. (AAPL) achieved its highest opening price of $176.76 in May 2023 and its lowest opening price of $142.28 in January 2023.*
