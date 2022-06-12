-- Question 22: Create the follower table.
--
-- This table should have the following columns:
--      user id, a foreign key pointing to the followee (user being followed)
--      follower id, a foreign key pointing to the follower (user doing the following)
--
-- Firstuser and seconduser are mutuals.
--
-- Display the follower table.
-- Your query should work for its initial run, as well as subsequent runs.

DROP TABLE IF EXISTS followers;

CREATE TABLE followers (
    user_id INTEGER,
    follower_id INTEGER,
    PRIMARY KEY (user_id, follower_id),
    CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINT fk_follower_id FOREIGN KEY (follower_id) REFERENCES users(user_id)
);

INSERT INTO followers (user_id, follower_id)
VALUES
    (1, 2),
    (2, 1);

SELECT * from followers;