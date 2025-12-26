-- SQL Advent Calendar - Day 16
-- Title: Cozy Snow Day Tasks
-- Difficulty: easy
--
-- Question:
-- It's a snow day, and Buddy is deciding which tasks he can do from under a blanket. Can you find all tasks that are either marked as 'Work From Home' or 'Low Priority' so he can stay cozy and productive?
--
-- It's a snow day, and Buddy is deciding which tasks he can do from under a blanket. Can you find all tasks that are either marked as 'Work From Home' or 'Low Priority' so he can stay cozy and productive?
--

-- Table Schema:
-- Table: daily_tasks
--   task_id: INTEGER
--   task_name: VARCHAR
--   task_type: VARCHAR
--   priority: VARCHAR
--

-- My Solution:

select task_id, task_name, task_type, priority
from daily_tasks
where task_type="Work From Home" or priority="Low";
