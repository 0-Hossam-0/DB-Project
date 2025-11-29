CREATE DATABASE IF NOT EXISTS linked;
USE linked;

-- 1. Create Users Table
CREATE TABLE IF NOT EXISTS Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Create Company Table
CREATE TABLE IF NOT EXISTS Company (
    company_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL UNIQUE, -- Increased length from 15 to 50
    image TEXT,
    -- Fixed logic: checking length, not comparing string to integer
    CHECK (LENGTH(title) > 0) 
);

-- 3. Create Company_Post Table
CREATE TABLE IF NOT EXISTS Company_Post (
    post_id INT PRIMARY KEY AUTO_INCREMENT,
    company_id INT NOT NULL, -- Column must be defined before adding FK constraint
    body VARCHAR(250) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (company_id) 
        REFERENCES Company(company_id) 
        ON DELETE CASCADE,
        
    CHECK (LENGTH(body) > 0)
);

-- 4. Create Job Table
CREATE TABLE IF NOT EXISTS Job (
    job_id INT PRIMARY KEY AUTO_INCREMENT,
    company_id INT NOT NULL, -- Column must be defined before adding FK constraint
    title VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (company_id) 
        REFERENCES Company(company_id) 
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Follower(
    FOREIGN KEY (company_id) 
        REFERENCES Company(company_id) 
        ON DELETE CASCADE,
	FOREIGN KEY (user_id) 
        REFERENCES Users(user_id) 
        ON DELETE CASCADE,
	followed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
 );