------------------------------------------------------------------------
title: Microsoft Teams Power Users
platform: datalemur
id: microsoft-teams-power-users
slug: microsoft-teams-power-users
difficulty: easy
time_taken_minutes: 6
attempts: 1
solved_date: 2025-11-21
author: pavanpalve12
------------------------------------------------------------------------
# Problem Statement

## Objective
Write a SQL query to identify the **top 2 Power Users** who sent the highest number of messages on Microsoft Teams in **August 2022**.

You must:
- Count how many messages each user sent in August 2022.
- Return the **top 2 users** based on message count.
- Output:
  - `sender_id`
  - `message_count`
- Sort results in **descending order** of message count.

---

## Assumption
- No two users have the same message count in August 2022.

---

## Table: `messages`

| Column Name | Type      |
|-------------|-----------|
| message_id  | integer   |
| sender_id   | integer   |
| receiver_id | integer   |
| content     | varchar   |
| sent_date   | datetime  |

### Example Input

| message_id | sender_id | receiver_id | content                | sent_date             |
|------------|-----------|-------------|-------------------------|------------------------|
| 901        | 3601      | 4500        | You up?                | 08/03/2022 00:00:00    |
| 902        | 4500      | 3601        | Only if you're buying  | 08/03/2022 00:00:00    |
| 743        | 3601      | 8752        | Let's take this offline| 06/14/2022 00:00:00    |
| 922        | 3601      | 4500        | Get on the call        | 08/10/2022 00:00:00    |

---

## Example Output

| sender_id | message_count |
|-----------|----------------|
| 3601      | 2              |
| 4500      | 1              |

