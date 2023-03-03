TRUNCATE TABLE posts RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO posts (title, content, user_id) VALUES ('Hello Worldd', 'Today I started my coding journey!', 1);
INSERT INTO posts (username, email) VALUES ('Trevors Travels', 'Stay tuned for updates on my trip to Kenya' 2);