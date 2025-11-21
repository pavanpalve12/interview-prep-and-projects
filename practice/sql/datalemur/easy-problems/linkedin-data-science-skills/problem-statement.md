------------------------------------------------------------------------
title: Linkedin Data Science Skills
platform: datalemur
id: linkedin-data-science-skills
slug: linkedin-data-science-skills
difficulty: easy
time_taken_minutes: 4
attempts: 1
solved_date: 2025-11-21
author: pavanpalve12
------------------------------------------------------------------------

# Problem Statement

## Objective
You are given a table of candidates and their skills.  
Your task is to find candidates who possess **all three required skills** for a Data Science job:

- Python  
- Tableau  
- PostgreSQL  

Write a SQL query to list the **candidate IDs** of those who have **all required skills**, sorted in ascending order.

---

## Table: `candidates`

| Column Name   | Type     |
|---------------|----------|
| candidate_id  | integer  |
| skill         | varchar  |

### Example Input

| candidate_id | skill       |
|--------------|-------------|
| 123          | Python      |
| 123          | Tableau     |
| 123          | PostgreSQL  |
| 234          | R           |
| 234          | PowerBI     |
| 234          | SQL Server  |
| 345          | Python      |
| 345          | Tableau     |

---

## Example Output

| candidate_id |
|--------------|
| 123          |

---

## Explanation
Candidate **123** has **all three** required skills: Python, Tableau, and PostgreSQL.  
Candidate **345** is missing **PostgreSQL**, so they are not included in the result.
