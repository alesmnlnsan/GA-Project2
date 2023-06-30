CREATE DATABASE blog_app;

-- TABLES
CREATE TABLE posts (
    post_id SERIAL PRIMARY KEY,
    title VARCHAR(200),
    content TEXT, 
    author_id INTEGER,
    publication_date TIMESTAMP,
    updated_date TIMESTAMP,
    image_url TEXT,
    FOREIGN KEY (author_id) REFERENCES users(user_id)
);

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username TEXT,
    email TEXT,
    password_digest TEXT,
    pronouns TEXT
);

CREATE TABLE todos (
    task_id SERIAL PRIMARY KEY,
    task VARCHAR(300) NOT NULL,
    complete BOOLEAN DEFAULT FALSE
);

CREATE TABLE comments(
    comment_id SERIAL PRIMARY KEY,
    post_id INTEGER,
    username VARCHAR(100),
    user_id INTEGER,
    comment_date TIMESTAMP,
    comment_text VARCHAR(300)
);

-- USERS DATA
INSERT INTO users (user_id, username, email, password_digest, pronouns)
VALUES (1, 'JaneDoe', 'janedoe@example.com', 'password', 'she/her');

-- POSTS DATA
INSERT INTO posts (title, content, author_id, publication_date, updated_date)
VALUES ('Introduction to My Blog', 'Welcome to my blog! This is the first post where I introduce myself and share my thoughts.', 1, NOW(), NOW());


INSERT INTO posts (title, content, author_id, publication_date, updated_date, image_url)
VALUES ('Another Random Blog Post', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 6, NOW(), NOW(), 'https://images.pexels.com/photos/7130504/pexels-photo-7130504.jpeg?cs=srgb&dl=pexels-codioful-%28formerly-gradienta%29-7130504.jpg&fm=jpg');
