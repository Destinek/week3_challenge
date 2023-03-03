As a social network user,
So I can have my information registered,
I'd like to have a user account with my email address.

As a social network user,
So I can have my information registered,
I'd like to have a user account with my username.

As a social network user,
So I can write on my timeline,
I'd like to create posts associated with my user account.

As a social network user,
So I can write on my timeline,
I'd like each of my posts to have a title and a content.

As a social network user,
So I can know who reads my posts,
I'd like each of my posts to have a number of views.

nouns = user account, email address, username, posts, title, content, number of views 


user_accounts =  email addres, username
posts = title, content, number of views, user_id(foreign key)


CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username text,
  email text
);

-- Then the table with the foreign key first.
CREATE TABLE albums (
  id SERIAL PRIMARY KEY,
  title text,
  content text,
-- The foreign key name is always {other_table_singular}_id
   user_id int,
  constraint fk_artist foreign key(user_id)
    references users(id)
    on delete cascade
);