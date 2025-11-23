------------------------------------------------------------------------
title: Tiktok Signup Activation Rate
platform: datalemur
id: tiktok-signup-activation-rate
slug: tiktok-signup-activation-rate
difficulty: medium
time_taken_minutes: 17
attempts: 1
solved_date: 2025-11-23
author: pavanpalve12
------------------------------------------------------------------------
# Problem Statement

## 1. Objective
Calculate the activation rate of users listed in the `emails` table by checking how many of them confirmed their signup through text message responses.

## 2. Business Context
TikTok requires new users to confirm their accounts by replying to a text message.  
A senior analyst wants to know what percentage of the users in the **emails** table have successfully activated their accounts.  
Some users may receive multiple text messages until they confirm.

## 3. Dataset Description

### Table: `emails`
Contains signup information for users.
| Column Name | Type      |
|-------------|-----------|
| email_id    | integer   |
| user_id     | integer   |
| signup_date | datetime  |

**Example Input**
| email_id | user_id | signup_date           |
|----------|---------|------------------------|
| 125      | 7771    | 06/14/2022 00:00:00    |
| 236      | 6950    | 07/01/2022 00:00:00    |
| 433      | 1052    | 07/09/2022 00:00:00    |

---

### Table: `texts`
Contains activation information for users.
| Column Name     | Type     |
|-----------------|----------|
| text_id         | integer  |
| email_id        | integer  |
| signup_action   | varchar  |

**Example Input**
| text_id | email_id | signup_action  |
|---------|-----------|----------------|
| 6878    | 125       | Confirmed      |
| 6920    | 236       | Not Confirmed  |
| 6994    | 236       | Confirmed      |

**Definition:**  
`Confirmed` in `signup_action` means the user has activated their account.

---

## 4. Requirements / Tasks
1. Consider only the users present in the `emails` table.
2. Join `emails` to `texts` using `email_id`.
3. A user is considered activated if **any** of their text messages contain `'Confirmed'`.
4. Compute the activation rate as:
    number_of_activated_users / total_users_in_emails

5. Round the final activation rate to **2 decimal places**.
6. Output a single column named `confirm_rate`.

---

## 5. Expected Output Format

### Example Output
| confirm_rate |
|--------------|
| 0.67         |

## 6. Constraints & Edge Cases
- Users may appear multiple times in the `texts` table.
- Users may exist in `emails` but have **no records** in `texts`.  
- These users should be treated as **not confirmed**.
- Only users in `emails` count toward the denominator.
- `Confirmed` check should be case-insensitive.
- Multiple text rows for the same user:  
- If ANY one is “Confirmed” → user is activated.

---

## 7. Acceptance Criteria
- The query must correctly detect confirmed users based on any occurrence of `'Confirmed'`.
- The activation rate must be rounded to two decimal places.
- Users missing from the `texts` table must be included in the denominator and treated as not confirmed.
- Output must match the structure shown in the example.

---

## 8. Additional Notes
- As of **April 4th, 2023**, an assumption was added clarifying that the analysis is restricted to users in the emails table only.
- Real datasets may output different activation rates; the sample is only illustrative.
