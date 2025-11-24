------------------------------------------------------------------------
title: Snowflake Marketing Touch Streak
platform: datalemur
id: snowflake-marketing-touch-streak
slug: snowflake-marketing-touch-streak
difficulty: hard
time_taken_minutes:
attempts:
solved_date: 2025-11-24
author: pavanpalve12
------------------------------------------------------------------------
# Problem Statement

## 1. Objective
Identify CRM contacts who:
1. Had marketing touchpoints for **three or more consecutive weeks**, and  
2. Had **at least one** touchpoint with `event_type = 'trial_request'`.

Return the list of **email addresses** that satisfy both conditions.

## 2. Business Context
Snowflake’s Marketing Analytics team tracks customer engagement through marketing touchpoints.  
These touchpoints represent interactions such as webinars, conference registrations, hands-on labs, and trial requests.  

Understanding which contacts show persistent weekly engagement—especially those requesting a trial—is valuable for prioritizing qualified leads, evaluating nurture effectiveness, and improving marketing ROI.

This task requires using CRM and marketing activity data to detect consecutive weekly engagement patterns.

## 3. Dataset Description

### **Table: `marketing_touches`**
| Column Name | Type | Description |
|-------------|------|-------------|
| event_id    | integer | Unique event identifier |
| contact_id  | integer | CRM contact ID |
| event_type  | string | Type of marketing touch (`webinar`, `conference_registration`, `trial_request`, etc.) |
| event_date  | date | Date of the touchpoint |

### Example Input – `marketing_touches`
| event_id | contact_id | event_type              | event_date   |
|----------|------------|-------------------------|--------------|
| 1        | 1          | webinar                 | 4/17/2022    |
| 2        | 1          | trial_request           | 4/23/2022    |
| 3        | 1          | whitepaper_download     | 4/30/2022    |
| 4        | 2          | handson_lab             | 4/19/2022    |
| 5        | 2          | trial_request           | 4/23/2022    |
| 6        | 2          | conference_registration | 4/24/2022    |
| 7        | 3          | whitepaper_download     | 4/30/2022    |
| 8        | 4          | trial_request           | 4/30/2022    |
| 9        | 4          | webinar                 | 5/14/2022    |

---

### **Table: `crm_contacts`**
| Column Name | Type | Description |
|-------------|------|-------------|
| contact_id  | integer | CRM contact ID |
| email       | string | Email address |

### Example Input – `crm_contacts`
| contact_id | email                       |
|------------|------------------------------|
| 1          | andy.markus@att.net          |
| 2          | rajan.bhatt@capitalone.com   |
| 3          | lissa_rogers@jetblue.com     |
| 4          | kevinliu@square.com          |

---

## 4. Requirements / Tasks
To solve this problem:

1. Assign calendar week numbers based on `event_date`.
2. Order events by `contact_id` and date.
3. Identify consecutive weekly touchpoints using a streak logic:
   - Consecutive weeks must be **3 or more**.
4. Check if the contact had **at least one** event with `event_type = 'trial_request'`.
5. Only return contacts who satisfy **both** conditions.
6. Output the final list of matching email addresses.

---

## 5. Expected Output Format

### Example Output
| email                |
|----------------------|
| andy.markus@att.net  |

---

## 6. Explanation of Example
- **Contact ID 1**  
  - Had touches on 4/17, 4/23, and 4/30 → three **consecutive weeks**.  
  - One of these touches was a **trial_request**.  
  - Therefore, this contact meets both conditions.

- **Contact ID 2**  
  - Has a `trial_request`, but all touches happened within the **same week**.  
  - The “three consecutive weeks” requirement is **not** satisfied.

- Other contacts lack either consecutive weekly streaks or a trial request event.  
  Thus, they are excluded.

---

## 7. Acceptance Criteria
A correct solution must:
- Correctly classify weekly streaks using event ordering.
- Correctly check for presence of a `trial_request`.
- Return only email addresses of qualifying contacts.
- Handle any dataset size and any number of touchpoints per contact.

---

## 8. Additional Notes
- Week extraction (e.g., using `EXTRACT(WEEK FROM event_date)`) is crucial.
- Consecutive-week streak logic typically requires window functions.
- Input data may contain more contacts or touchpoints than shown in the example; only logic matters.
