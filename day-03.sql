-- SQL Advent Calendar - Day 3
-- Title: The Grinch's Best Pranks Per Target
-- Difficulty: hard
--
-- Question:
-- The Grinch has brainstormed a ton of pranks for Whoville, but he only wants to keep the top prank per target, with the highest evilness score. Return the most evil prank for each target. If two pranks have the same evilness, the more recently brainstormed wins.
--
-- The Grinch has brainstormed a ton of pranks for Whoville, but he only wants to keep the top prank per target, with the highest evilness score. Return the most evil prank for each target. If two pranks have the same evilness, the more recently brainstormed wins.
--

-- Table Schema:
-- Table: grinch_prank_ideas
--   prank_id: INTEGER
--   target_name: VARCHAR
--   prank_description: VARCHAR
--   evilness_score: INTEGER
--   created_at: TIMESTAMP
--

-- My Solution:

WITH ranked AS(
    SELECT prank_id,target_name,prank_description,evilness_score,created_at,
            DENSE_RANK()OVER(PARTITION BY target_name ORDER BY evilness_score DESC,created_at DESC )
  AS rn
      FROM grinch_prank_ideas
)   
  
SELECT prank_id, target_name, prank_description, evilness_score, created_at
FROM ranked
WHERE rn=1;
