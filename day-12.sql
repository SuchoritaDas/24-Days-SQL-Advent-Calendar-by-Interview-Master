-- SQL Advent Calendar - Day 12
-- Title: North Pole Network Most Active Users
-- Difficulty: hard
--
-- Question:
-- The North Pole Network wants to see who's the most active in the holiday chat each day. Write a query to count how many messages each user sent, then find the most active user(s) each day. If multiple users tie for first place, return all of them.
--
-- The North Pole Network wants to see who's the most active in the holiday chat each day. Write a query to count how many messages each user sent, then find the most active user(s) each day. If multiple users tie for first place, return all of them.
--

-- Table Schema:
-- Table: npn_users
--   user_id: INT
--   user_name: VARCHAR
--
-- Table: npn_messages
--   message_id: INT
--   sender_id: INT
--   sent_at: TIMESTAMP
--

-- My Solution:

WITH daily_counts AS (
  SELECT
    DATE(sent_at) AS day,
    sender_id,
    COUNT(*) AS messages_sent
  FROM npn_messages
  GROUP BY DATE(sent_at), sender_id
),
ranked AS (
  SELECT
    d.day,
    d.sender_id,
    d.messages_sent,
    RANK() OVER (PARTITION BY d.day ORDER BY d.messages_sent DESC) AS rnk
  FROM daily_counts d
)
SELECT
  r.day,
  u.user_name,
  r.messages_sent
FROM ranked r
JOIN npn_users u
  ON r.sender_id = u.user_id
WHERE r.rnk = 1
ORDER BY r.day;
