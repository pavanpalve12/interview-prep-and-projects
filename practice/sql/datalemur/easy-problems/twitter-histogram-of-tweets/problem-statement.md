------------------------------------------------------------------------
title: Twitter Histogram Of Tweets
platform: datalemur
id: twitter-histogram-of-tweets
slug: twitter-histogram-of-tweets
difficulty: easy
time_taken_minutes: 5
attempts: 1
solved_date: 2025-11-21
author: pavanpalve12
------------------------------------------------------------------------
# Problem Statement

## Objective
Given a table of Twitter tweet data, write a SQL query that produces a **histogram of tweets per user in 2022**.

You must:
- Count how many tweets each user posted in 2022.
- Group users by their tweet count.
- For each tweet-count bucket, output how many users fall into that bucket.

---

## Table: `tweets`

| Column Name | Type      |
|-------------|-----------|
| tweet_id    | integer   |
| user_id     | integer   |
| msg         | string    |
| tweet_date  | timestamp |

---

## Example Input

| tweet_id | user_id | msg                                                               | tweet_date            |
|----------|---------|-------------------------------------------------------------------|------------------------|
| 214252   | 111     | Am considering taking Tesla private at $420. Funding secured.     | 12/30/2021 00:00:00   |
| 739252   | 111     | Despite the constant negative press covfefe                        | 01/01/2022 00:00:00   |
| 846402   | 111     | Following @NickSinghTech on Twitter changed my life!              | 02/14/2022 00:00:00   |
| 241425   | 254     | If the salary is so competitive why won’t you tell me what it is? | 03/01/2022 00:00:00   |
| 231574   | 148     | I no longer have a manager. I can't be managed                    | 03/23/2022 00:00:00   |

---

## Example Output

| tweet_bucket | users_num |
|--------------|-----------|
| 1            | 2         |
| 2            | 1         |

---

## Explanation
- Two users posted exactly **1 tweet** in 2022.  
- One user posted exactly **2 tweets** in 2022.  
- The query groups users by their tweet count and outputs the number of users in each group.
