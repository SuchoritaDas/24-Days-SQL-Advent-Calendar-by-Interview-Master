-- SQL Advent Calendar - Day 17
-- Title: Evening Task Categories
-- Difficulty: medium
--
-- Question:
-- During a quiet evening of reflection, Cindy Lou wants to categorize her tasks based on how peaceful they are. Can you write a query that adds a new column classifying each task as 'Calm' if its noise_level is below 50, and 'Chaotic' otherwise?
--
-- During a quiet evening of reflection, Cindy Lou wants to categorize her tasks based on how peaceful they are. Can you write a query that adds a new column classifying each task as 'Calm' if its noise_level is below 50, and 'Chaotic' otherwise?
--

-- Table Schema:
-- Table: evening_tasks
--   task_id: INTEGER
--   task_name: VARCHAR
--   noise_level: INTEGER
--

-- My Solution:

select task_id, task_name, noise_level,
        case 
            when noise_level<50 then "Calm"
            else "Chaotic"
        end as task_classification
from evening_tasks;
