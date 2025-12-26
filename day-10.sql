-- SQL Advent Calendar - Day 10
-- Title: Cookie Factory Oven Efficiency
-- Difficulty: easy
--
-- Question:
-- In the holiday cookie factory, workers are measuring how efficient each oven is. Can you find the average baking time per oven rounded to one decimal place?
--
-- In the holiday cookie factory, workers are measuring how efficient each oven is. Can you find the average baking time per oven rounded to one decimal place?
--

-- Table Schema:
-- Table: cookie_batches
--   batch_id: INT
--   oven_id: INT
--   baking_time_minutes: DECIMAL
--

-- My Solution:

SELECT oven_id, ROUND(AVG(baking_time_minutes),1) AS average_baking_time
FROM cookie_batches
GROUP BY oven_id
ORDER  BY average_baking_time DESC;
