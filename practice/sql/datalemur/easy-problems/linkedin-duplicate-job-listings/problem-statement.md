------------------------------------------------------------------------
title: Linkedin Duplicate Job Listings
platform: datalemur
id: linkedin-duplicate-job-listings
slug: linkedin-duplicate-job-listings
difficulty: easy
time_taken_minutes: 9
attempts: 1
solved_date: 2025-11-21
author: pavanpalve12
------------------------------------------------------------------------
# Problem Statement

## Objective
You are given a table of job postings from different companies on the LinkedIn platform.  
Write a SQL query to determine **how many companies have posted duplicate job listings**.

A duplicate job listing is defined as **two or more job posts within the same company that have the exact same title and description**.

Your output should contain a single column:

- `duplicate_companies`

---

## Definition
A **duplicate job listing** occurs when:
- The **same company** posts
- **Two or more** job listings
- With the **same title**
- And the **same description**

---

## Table: `job_listings`

| Column Name | Type     |
|-------------|----------|
| job_id      | integer  |
| company_id  | integer  |
| title       | string   |
| description | string   |

### Example Input

| job_id | company_id | title            | description |
|--------|------------|------------------|-------------|
| 248    | 827        | Business Analyst | Business analyst evaluates past and current business data with the primary goal of improving decision-making processes within organizations. |
| 149    | 845        | Business Analyst | Business analyst evaluates past and current business data with the primary goal of improving decision-making processes within organizations. |
| 945    | 345        | Data Analyst     | Data analyst reviews data to identify key insights into a business's customers and ways the data can be used to solve problems. |
| 164    | 345        | Data Analyst
