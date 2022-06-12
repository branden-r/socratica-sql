-- Question 20: Create the user table.
--
-- This table should have the following columns:
--      user id, an integer which acts as the primary key
--      username
--      encrypted password
--      email
--      date joined, which should not include a time zone
--
-- Add a user with the following information:
--      username: firstuser
--      encrypted password: d63dc919e2dc30d2
--      email: fakemail@fakedomain.fake
--      date joined: 2019-02-25
--
-- Add a second user with the following information:
--      username: seconduser
--      encrypted password: 9a834yva9fn3493yn
--
-- Display the user table.
-- Your query should work for the initial run, as well as subsequent runs.

DROP TABLE IF EXISTS users;

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username CHARACTER VARYING,
    encrypted_password CHARACTER VARYING,
    email CHARACTER VARYING,
    date_joined TIMESTAMP WITHOUT TIME ZONE
);

INSERT INTO users (username, encrypted_password, email, date_joined)
VALUES ('firstuser', 'd63dc919e2dc30d2', 'fakemail@fakedomain.fake', '2019-02-25');

INSERT INTO users (username, encrypted_password)
VALUES ('seconduser', '9a834yva9fn3493yn');

SELECT * FROM users;