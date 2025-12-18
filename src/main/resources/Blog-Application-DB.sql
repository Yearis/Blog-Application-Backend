USE `mydatabase`;

-- 1. Drop tables in reverse order (Child first, then Parent)
DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS users;

-- Our USERS Table
CREATE TABLE IF NOT EXISTS users (
	id BIGINT  AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(20) NOT NULL UNIQUE,
	email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

-- Our POSTS Table
CREATE TABLE IF NOT EXISTS posts (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    content TEXT NOT NULL,
    created_date DATETIME(6), -- as we use LocalDateTime
    edited BIT(1) DEFAULT 0,
    likes INT DEFAULT 1,
    user_id BIGINT, -- foreign key for user_id
	
    --  Relationship: Many post -> 1 user
    FOREIGN KEY(user_id)
    REFERENCES users(id)
    ON DELETE SET NULL -- so that when user is deleted, its posts shouldn't be deleted
);

-- Our Comments Table
CREATE TABLE IF NOT EXISTS comments (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
	body TEXT NOT NULL,	
    created_date DATETIME(6),
    edited BIT(1) DEFAULT 0,
    likes INT DEFAULT 1,
    user_id BIGINT, -- foreign key 1 for user_id
    post_id BIGINT NOT NULL, -- foreign key 2 for post_id
    parent_id BIGINT, -- foreign key 3 for parent_id
    
    -- Relationship: Many comment -> 1 user
    FOREIGN KEY(user_id)
    REFERENCES users(id)
    ON DELETE SET NULL, -- so that when user is deleted, its comments shouldn't be deleted
    
    --  Relationship: Many comment -> 1 post
    FOREIGN KEY(post_id)
    REFERENCES posts(id)
    ON DELETE CASCADE, -- so that when the post is deleted, its comments are also deleted
    
    -- Relationship: Many comments/replies -> 1 parent comment
    FOREIGN KEY(parent_id)
    REFERENCES comments(id)
    ON DELETE CASCADE -- so that when the parent comment is deleted, its replies are also deleted
);