# 🕵️ SQL Murder Mystery – Data Sleuthing with SQL

**Author:** Mark C. Emenyonu  
**Source:** [SQL Murder Mystery](https://mystery.knightlab.com/) by Knight Lab

---

## 🔍 Overview

This project documents my process of solving the **SQL Murder Mystery**, a gamified SQL challenge designed by Knight Lab to test data exploration and reasoning skills. Using only SQL queries, I investigated a fictional crime scene, identified witnesses, followed clues through various data tables, and ultimately uncovered both the killer and the mysterious figure behind the crime.

---

## 📌 Objectives

- Practice complex SQL querying (JOINs, filters, nested SELECTs, pattern matching).
- Demonstrate analytical problem-solving in a portfolio-worthy format.
- Present a clear, reproducible path to solving the case via SQL.

---

## 🗂️ Dataset Schema Overview

The database consists of multiple interrelated tables:

- `crime_scene_report`
- `person`
- `interview`
- `drivers_license`
- `get_fit_now_member` & `get_fit_now_check_in`
- `facebook_event_checkin`
- `income`

Each table reveals a piece of the story. I used a series of JOINs, subqueries, and filters to move from clue to clue.

---

## 🚶‍♂️ Step-by-Step Approach

### 🗣️ 1. Identify the Crime and Initial Witnesses
- Queried the `crime_scene_report` table for a murder that occurred on **January 15, 2018** in **SQL City**.
- Narrowed down two witnesses based on street addresses and names.
- Referenced `interview` table using `person_id` to get more clues.

### 🧩 2. Analyze the Clues
- From interview transcripts, uncovered behavioral and timestamp patterns.
- Investigated a gym log and license plate information to find a suspicious gym-goer.

### 🎯 3. Pinpoint the Killer
- Queried `get_fit_now_check_in` and filtered based on membership ID, check-in date, and membership status.
- Matched plate number with `drivers_license` and joined with `person` data to confirm identity.

### 🕵️ 4. Find the Mastermind
- A final interview hinted at a mysterious red-haired woman with a Tesla who attended the **SQL Symphony Concert** three times in December.
- I used nested queries to filter for red-haired females, cross-referenced `facebook_event_checkin`, and confirmed the individual.

---

## ✅ Final Outcome

**Murderer:** Jeremy Bowers 
**Contractor (Mastermind):** Miranda Priestly  
**Motive:** As mentioned in the interview transcripts, it was a paid hit. But why Miranda ordered the hit is unknown. There's not enough data to tell why Miranda ordered the hit.

---

## 📁 Files Included in this repo

- `sql_murder_mystery.sql`: Full query history with comments explaining each step.
- `README.md`: Project summary and structure.
- `schema.png`: Visual diagram of database relationships.

---

## 🧠 Lessons Learned

- Practical exposure to JOINs, nested subqueries, and text pattern searches.
- The value of sequential querying—solving one part of the puzzle at a time.
- How to turn a coding challenge into a compelling narrative for portfolios and blogs.

---

## 🔗 Try It Yourself

You can solve the mystery too:  
👉 [https://mystery.knightlab.com/](https://mystery.knightlab.com/)

---

## 📫 Connect with Me

If you enjoyed this walkthrough or have feedback, feel free to connect:  
[LinkedIn](https://www.linkedin.com/in/chibuikem-mark-emenyonu/) | [Medium](https://medium.com/@markemenyonu)

---
