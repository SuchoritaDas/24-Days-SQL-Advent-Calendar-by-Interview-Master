-- SQL Advent Calendar - Day 6
-- Title: Ski Resort Snowfall Rankings
-- Difficulty: hard
--
-- Question:
-- Buddy is planning a winter getaway and wants to rank ski resorts by annual snowfall. Can you help him bucket these ski resorts into quartiles?
--
-- Buddy is planning a winter getaway and wants to rank ski resorts by annual snowfall. Can you help him bucket these ski resorts into quartiles?
--

-- Table Schema:
-- Table: resort_monthly_snowfall
--   resort_id: INT
--   resort_name: VARCHAR
--   snow_month: INT
--   snowfall_inches: DECIMAL
--

-- My Solution:

WITH annual AS (
  SELECT
    resort_id,
    resort_name,
    SUM(snowfall_inches) AS annual_snowfall
  FROM resort_monthly_snowfall
  GROUP BY resort_id, resort_name
)
SELECT
  resort_id,
  resort_name,
  annual_snowfall,
  NTILE(4) OVER (ORDER BY annual_snowfall DESC) AS quartile_num,    -- 1 = top 25%
  CASE NTILE(4) OVER (ORDER BY annual_snowfall DESC)
    WHEN 1 THEN 'Q1 - Top 25%'
    WHEN 2 THEN 'Q2'
    WHEN 3 THEN 'Q3'
    WHEN 4 THEN 'Q4 - Bottom 25%'
  END AS quartile_label
FROM annual
ORDER BY annual_snowfall DESC;
