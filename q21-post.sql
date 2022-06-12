-- Question 21: Create the post table.
--
-- This table should have the following columns:
--      post id, an integer which acts as the primary key
--      user id, a foreign key pointing to the user that made the post
--      post text
--      posted on, which should not include a timezone
--
-- The user firstuser made two posts:
--      Hello World!
--      Hello Solar System!
--
-- Display the post table.
-- Your query should work for its initial run, as well as subsequent runs.

DROP TABLE IF EXISTS posts;

CREATE TABLE posts (
    post_id SERIAL PRIMARY KEY,
    user_id INTEGER,
    post_text CHARACTER VARYING,
    posted_on TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO posts (user_id, post_text)
VALUES
    (1, 'Hello World!'),
    (1, 'Hello Solar System!');

SELECT * FROM posts;