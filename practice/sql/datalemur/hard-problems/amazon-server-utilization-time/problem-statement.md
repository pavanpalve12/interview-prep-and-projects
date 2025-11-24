------------------------------------------------------------------------
title: Amazon Server Utilization Time
platform: datalemur
id: amazon-server-utilization-time
slug: amazon-server-utilization-time
difficulty: hard
time_taken_minutes: 40
attempts: 5
solved_date: 2025-11-24
author: pavanpalve12
------------------------------------------------------------------------
# Problem Statement

## 1. Objective
Calculate the total uptime of all servers in the fleet by summing each server’s individual running intervals and return the final result in **full days**.

## 2. Business Context
AWS manages large fleets of servers that frequently start and stop based on demand.  
Senior management wants a data-driven understanding of how long the fleet has been active in total.  
This helps with:
- Capacity planning  
- Cost optimization  
- Infrastructure scaling decisions  

## 3. Dataset Description

### **Table: `server_utilization`**
| Column Name    | Type      | Description |
|----------------|-----------|-------------|
| server_id      | integer   | Unique ID of the server |
| status_time    | timestamp | Timestamp of the event |
| session_status | string    | Either `'start'` or `'stop'` |

### Example Input
| server_id | status_time           | session_status |
|-----------|------------------------|----------------|
| 1         | 08/02/2022 10:00:00    | start          |
| 1         | 08/04/2022 10:00:00    | stop           |
| 2         | 08/17/2022 10:00:00    | start          |
| 2         | 08/24/2022 10:00:00    | stop           |

## 4. Requirements / Tasks
1. For each server, identify all start–stop intervals.
2. Use timestamps to calculate uptime for each interval:
   - uptime = `stop_time - start_time`
3. Sum all valid uptimes across **all servers**.
4. Convert total uptime to **full days**.
5. Return the result as:
   - `total_uptime_days`
6. Ignore any start events with no following stop event.

## 5. Expected Output Format

### Example Output
| total_uptime_days |
|-------------------|
| 21                |

## 6. Constraints & Edge Cases
- Servers may have multiple start/stop cycles.
- A server might end with a `start` event and no subsequent `stop` → that interval should be skipped.
- Timestamps must be ordered correctly within each server.
- Output must represent **whole days**, not fractional days.

## 7. Acceptance Criteria
- Query must correctly pair start–stop events using window functions (`LEAD()` or equivalent).
- All uptime intervals must be summed.
- Final output must be expressed in days.
- The logic must work on any dataset, not just the example.

## 8. Additional Notes
The example output reflects the combined uptime of all servers:  
Server 1 uptime = 2 days  
Server 2 uptime = 19 days  
Total = **21 full days**
