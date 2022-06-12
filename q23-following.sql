-- Question 23: Who is following who?
-- From left to right, you query should: 
--      show the id, username, and email of the followee (user being followed).
--      show the id, username, and email of the follower (user doing the following).

-- the first three attributes belong to the followee
-- the last three attributes belong to the follower
-- we don't want duplicate column names, so use an alias for the last two attributes
-- since they belong to the follower rather than the followee, say so!!
SELECT s.user_id, s.username, s.email, s.follower_id, u.username AS follower_username, u.email AS follower_email
FROM 
    -- use an inner join to find the username and email of the user followed
    -- this is the first join
    (SELECT f.user_id, u.username, u.email, f.follower_id
     FROM follower AS f -- f for follower
     INNER JOIN users AS u -- u for users
     ON f.user_id = u.user_id) AS s -- s for subquery
-- use an inner join to find the username and email of the user following
-- this is the second join
INNER JOIN users as u -- u for users
ON s.follower_id = u.user_id;