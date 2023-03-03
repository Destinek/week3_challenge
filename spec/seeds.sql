
TRUNCATE users, posts RESTART IDENTITY ;
-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO users (username, email) VALUES ('BobbyBob', 'bob.smith@makers.com');
INSERT INTO users (username, email) VALUES ('Trev0r', 'travelling_trevor@makers.com');

 
INSERT INTO posts (title, content, user_id) VALUES ('Hello Worldd', 'Today I started my coding journey!', 1);
INSERT INTO posts (title, content, user_id) VALUES ('Trevors Travels', 'Stay tuned for updates on my trip to Kenya', 2);