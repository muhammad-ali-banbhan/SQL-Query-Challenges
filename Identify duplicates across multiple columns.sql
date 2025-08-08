

-- Identify duplicates across multiple columns and return only the latest entry per group


SELECT * FROM users;

SELECT * FROM logins;

WITH rnkentries AS (
SELECT *, 
		ROW_NUMBER() OVER(PARTITION BY USER_ID, SESSION_ID, SESSION_SCORE ORDER BY LOGIN_TIMESTAMP DESC) AS RNK
         FROM logins)
         SELECT * FROM rnkentries
         WHERE rnk =1;
         
         
INSERT INTO logins (USER_ID, CREATED_AT) 
VALUES (1, '2025-07-20');

WITH RankedLogins AS (
  SELECT *,
         ROW_NUMBER() OVER (
           PARTITION BY user_id
           ORDER BY login_timestamp DESC
         ) AS rn
  FROM logins
)

SELECT 
    u.user_id,
    u.user_name,
    u.user_status,
    rl.login_timestamp,
    rl.session_id,
    rl.session_score
FROM RankedLogins rl
JOIN users u ON u.user_id = rl.user_id
WHERE rl.rn = 1;



WITH DedupedUsers AS (
  SELECT u.*,
         l.login_timestamp,
         l.session_id,
         l.session_score,
         ROW_NUMBER() OVER (
           PARTITION BY u.user_name, u.user_status
           ORDER BY l.login_timestamp DESC
         ) AS rn
  FROM users u
  JOIN logins l ON u.user_id = l.user_id
)

SELECT *
FROM DedupedUsers
WHERE rn = 1;

DESCRIBE logins;


SELECT login_timestamp, 
       STR_TO_DATE(login_timestamp, '%Y-%m-%d %H:%i:%s') AS parsed_ts
FROM logins;



SELECT user_id, login_timestamp
FROM logins
ORDER BY login_timestamp DESC;



SELECT login_timestamp, LENGTH(login_timestamp)
FROM logins;

SELECT 
  user_id,
  login_timestamp,
  CAST(login_timestamp AS DATETIME) AS login_time_fixed
FROM logins
ORDER BY login_time_fixed DESC;
