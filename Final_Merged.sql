DROP DATABASE IF EXISTS CareerIn;
CREATE DATABASE CareerIn;
USE CareerIn;

-- Hossam -- (Users)

CREATE TABLE Users ( -- 4elt kam hga zyda 3n el shcema
    user_id INT PRIMARY KEY auto_increment,
    title VARCHAR(50) NOT NULL, -- added " NOT NULL"
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email_address VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL, -- leh "hash" ? : 34n keyword
    city VARCHAR(50),
    country VARCHAR(50)
);

CREATE TABLE Skills ( -- "skills" bdl "skill"
    skill_id INT PRIMARY KEY AUTO_INCREMENT,
    skill_name VARCHAR(50) NOT NULL, -- from "name" to "skill name" 34n name keyword
    user_id INT NOT NULL,
    CONSTRAINT fk_skill_user FOREIGN KEY (user_id) REFERENCES Users (user_id) 
    ON DELETE CASCADE
    -- added " ON DELETE CASCADE" 34n lw mfy4 users 3yz el skills yet4al
);

INSERT INTO Users (title, first_name, last_name, email_address, password_hash, city, country)
VALUES
('Mr', 'Youssef', 'Kamal', 'youssef.kamal1@example.com', 'hash123', 'Cairo', 'Egypt'),
('Ms', 'Mona', 'Adel', 'mona.adel2@example.com', 'hash124', 'Giza', 'Egypt'),
('Mr', 'Omar', 'Hassan', 'omar.hassan3@example.com', 'hash125', 'Alexandria', 'Egypt'),
('Mrs', 'Sara', 'Nabil', 'sara.nabil4@example.com', 'hash126', 'Cairo', 'Egypt'),
('Mr', 'Ali', 'Fathy', 'ali.fathy5@example.com', 'hash127', 'Dubai', 'UAE'),
('Ms', 'Reem', 'Saeed', 'reem.saeed6@example.com', 'hash128', 'Doha', 'Qatar'),
('Mr', 'Khaled', 'Mostafa', 'khaled.mostafa7@example.com', 'hash129', 'Riyadh', 'Saudi Arabia'),
('Ms', 'Dina', 'Mahmoud', 'dina.mahmoud8@example.com', 'hash130', 'Cairo', 'Egypt'),
('Mr', 'Hadi', 'Samir', 'hadi.samir9@example.com', 'hash131', 'Beirut', 'Lebanon'),
('Mrs', 'Laila', 'Fouad', 'laila.fouad10@example.com', 'hash132', 'Cairo', 'Egypt'),
('Mr', 'Karim', 'Lotfy', 'karim.lotfy11@example.com', 'hash133', 'Giza', 'Egypt'),
('Ms', 'Nour', 'Ashraf', 'nour.ashraf12@example.com', 'hash134', 'Alexandria', 'Egypt'),
('Mr', 'Tarek', 'Gamal', 'tarek.gamal13@example.com', 'hash135', 'Cairo', 'Egypt'),
('Ms', 'Hana', 'Sabry', 'hana.sabry14@example.com', 'hash136', 'Dubai', 'UAE'),
('Mr', 'Mahmoud', 'Ibrahim', 'mahmoud.ibrahim15@example.com', 'hash137', 'Cairo', 'Egypt');


DESCRIBE Users;
SELECT * FROM Users;

DELETE FROM Users
WHERE user_id = 4;
SELECT * FROM Users;

UPDATE Users
SET city = 'UpdatedCity'
WHERE user_id = 5;
SELECT * FROM Users;

ALTER TABLE Users
MODIFY COLUMN country VARCHAR(200),
ADD COLUMN age INT;
SELECT * FROM Users;

ALTER TABLE Users
DROP COLUMN age;
SELECT * FROM Users;

SELECT * FROM Users
WHERE user_id = 2;

SELECT * FROM Users
WHERE first_name LIKE '%Ali%';

-- karim -- (Company, Job, Followers)

CREATE TABLE IF NOT EXISTS Company (
    company_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL UNIQUE,
    image TEXT,
    CHECK (LENGTH(title) > 0) 
);

CREATE TABLE IF NOT EXISTS Job (
	job_number INT NOT NULL, -- el partial key
    company_id INT NOT NULL, -- Column must be defined before adding FK constraint
    title VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (company_id, job_number), -- 34n n3rf el weak entity bn3ml el partial + el forgien bt3 el owner
    FOREIGN KEY (company_id) 
        REFERENCES Company(company_id) 
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Followers( -- "followers" added an 's'
  follower_id INT PRIMARY KEY AUTO_INCREMENT, -- added "follower_id" 34n da me4 weak entity
  user_id INT NOT NULL,
  company_id INT NOT NULL,
    FOREIGN KEY (company_id) 
        REFERENCES Company(company_id) 
        ON DELETE CASCADE,
	FOREIGN KEY (user_id) 
        REFERENCES Users(user_id) 
        ON DELETE CASCADE,
	followed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
 );
 
 INSERT INTO Company (title, image) VALUES
('Google', 'https://example.com/google.png'),
('Apple', 'https://example.com/apple.png'),
('Microsoft', 'https://example.com/microsoft.png'),
('Amazon', 'https://example.com/amazon.png'),
('Facebook', 'https://example.com/facebook.png'),
('Tesla', 'https://example.com/tesla.png'),
('Netflix', 'https://example.com/netflix.png'),
('Airbnb', 'https://example.com/airbnb.png'),
('Uber', 'https://example.com/uber.png'),
('Spotify', 'https://example.com/spotify.png'),
('Twitter', 'https://example.com/twitter.png'),
('Snapchat', 'https://example.com/snapchat.png'),
('LinkedIn', 'https://example.com/linkedin.png'),
('Slack', 'https://example.com/slack.png'),
('Adobe', 'https://example.com/adobe.png');

SELECT * FROM Company;

DELETE FROM Company WHERE company_id = 4;
SELECT * FROM Company;

UPDATE Company
SET title = 'UpdatedCompany'
WHERE company_id = 5;
SELECT * FROM Company;

ALTER TABLE Company
MODIFY COLUMN title VARCHAR(100),
ADD COLUMN website VARCHAR(255);
SELECT * FROM Company;

ALTER TABLE Company
DROP COLUMN website;
SELECT * FROM Company;

SELECT * FROM Company
WHERE company_id = 2;

SELECT * FROM Company
WHERE title LIKE '%Net%';



INSERT INTO Job (company_id, job_number, title) VALUES
(1, 1, 'Software Engineer'),
(1, 2, 'Product Manager'),
(2, 1, 'iOS Developer'),
(2, 2, 'UI/UX Designer'),
(3, 1, 'Cloud Engineer'),
(3, 2, 'Data Analyst'),
(5, 1, 'Social Media Specialist'),
(5, 2, 'Marketing Manager'),
(6, 1, 'Battery Engineer'),
(6, 2, 'Mechanical Designer'),
(7, 1, 'Content Creator'),
(7, 2, 'Streaming Engineer'),
(8, 1, 'Host Relations Manager');

SELECT * FROM Job;

DELETE FROM Job
WHERE company_id = 1 AND job_number = 2;
SELECT * FROM Job;

UPDATE Job
SET title = 'Updated Job Title'
WHERE company_id = 2 AND job_number = 1;
SELECT * FROM Job;

ALTER TABLE Job
MODIFY COLUMN title VARCHAR(100),
ADD COLUMN salary VARCHAR(50);
SELECT * FROM Job;

ALTER TABLE Job
DROP COLUMN salary;
SELECT * FROM Job;

SELECT * FROM Job
WHERE company_id = 3;

SELECT * FROM Job
WHERE title LIKE '%Engineer%';

INSERT INTO Followers (company_id, user_id) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 5),
(3, 6),
(3, 7),
(5, 8),
(5, 9),
(6, 10),
(6, 11),
(7, 12),
(7, 13),
(8, 14),
(8, 15),
(9, 1);

SELECT * FROM Followers;

DELETE FROM Followers
WHERE follower_id = 3;
SELECT * FROM Followers;

UPDATE Followers
SET followed_at = CURRENT_TIMESTAMP
WHERE follower_id = 5;
SELECT * FROM Followers;

ALTER TABLE Followers
ADD COLUMN note VARCHAR(255);
SELECT * FROM Followers;

ALTER TABLE Followers
DROP COLUMN note;
SELECT * FROM Followers;

SELECT * FROM Followers
WHERE company_id = 2;

SELECT * FROM Followers
WHERE user_id = 1;

-- Daniel/Mohaned -- (Projects, Excperience)

# Modify the structure of one table. -- hwa fyn el table asln ?!

CREATE TABLE IF NOT EXISTS 	Projects (
    user_id INT NOT NULL, 
	project_number INT NOT NULL, 
    project_name VARCHAR(50) NOT NULL,
    description_ VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   PRIMARY KEY (user_id, project_number),
    FOREIGN KEY (user_id) 
        REFERENCES Users(user_id) 
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS 	Experience (
 user_id INT NOT NULL,
 experience_number INT NOT NULL, 
 title VARCHAR(50) NOT NULL,
 description_ VARCHAR(50) NOT NULL,
 address VARCHAR(100),
 start_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (user_id, experience_number), 
    FOREIGN KEY (user_id) 
        REFERENCES Users(user_id) 
        ON DELETE CASCADE
);

INSERT INTO Projects (user_id, project_number, project_name, description_) VALUES
(1, 1, 'Portfolio Website', 'A personal portfolio'),
(1, 2, 'Task Manager', 'A todo management app'),
(2, 1, 'E-Commerce App', 'Online shopping platform'),
(2, 2, 'Chat App', 'Messaging web app'),
(3, 1, 'Weather App', 'Forecasting application'),
(3, 2, 'Notes App', 'Simple notes system'),
(5, 1, 'Quiz System', 'MCQ quiz app'),
(6, 1, 'Blog CMS', 'Content management system'),
(7, 1, 'Game Engine', 'Simple 2D engine'),
(8, 1, 'Fitness Tracker', 'Workout tracking app'),
(9, 1, 'Budget Planner', 'Personal finance planner'),
(10, 1, 'AI Assistant', 'Chatbot project'),
(11, 1, 'Image Editor', 'Basic photo editor'),
(12, 1, 'Calendar App', 'Event scheduling');

select * from Users;

INSERT INTO Experience (user_id, experience_number, title, description_, address) VALUES
(1, 1, 'Intern', 'Assisted in development', 'Cairo'),
(2, 1, 'Sales Rep', 'Customer communication', 'Giza'),
(3, 1, 'Support Agent', 'Tech support tasks', 'Alexandria'),
(5, 1, 'Backend Dev', 'API creation', 'Mansoura'),
(6, 1, 'Marketing Intern', 'Content creation', 'Cairo'),
(7, 1, 'Designer', 'Created graphics', 'Tanta'),
(8, 1, 'Teacher', 'Tutored students', 'Cairo'),
(9, 1, 'Freelancer', 'Various projects', 'Online'),
(10, 1, 'Researcher', 'Collected data', 'Cairo'),
(11, 1, 'Editor', 'Edited documents', 'Alexandria'),
(12, 1, 'Manager', 'Team management', 'Cairo'),
(13, 1, 'Barista', 'Prepared drinks', 'Giza'),
(14, 1, 'Driver', 'Delivery tasks', 'Cairo'),
(15, 1, 'Assistant', 'Office help', 'Cairo');

select * from Experience;

Alter Table Projects
Rename To Tasks;
select * from Tasks;

Alter Table Experience
Add End_Date datetime;

Alter Table Experience
modify End_Date datetime,
Add constraint check_end_date check(end_date is NUll or end_date > start_date);

Delete From Tasks
Where project_name = 'Portfolio Website';
select * from Tasks;

Alter Table Experience
ADD COLUMN age VARCHAR(2);
select * from Experience;

Alter Table Experience
Drop Column age;
select * from Experience;


select Project_name From Tasks Where Project_name LIKE '%App%';

select user_id From Experience Where start_date Like '%2025%';

-- Youssef -- (User_Post)

create table User_Post(
post_id int AUTO_INCREMENT primary key,
body varchar(3000) not null,
created_at DATETIME not null default now(), # datetime bdl date 34n betstore time kman
user_id int not null, 
FOREIGN  KEY (user_id) REFERENCES Users(user_id)
);

INSERT INTO User_Post (body, created_at, user_id)
VALUES ('Hey there!', NOW(), 1);

INSERT INTO User_Post (body, created_at, user_id)
VALUES ('Hello world!', NOW(), 2);

INSERT INTO User_Post (body, created_at, user_id)
VALUES ('Just finished my project!', '2025-01-19 14:32:00', 3);

INSERT INTO User_Post (body, created_at, user_id)
VALUES ('Studying SQL today.', '2025-01-17 11:00:00', 5);

INSERT INTO User_Post (body, created_at, user_id)
VALUES ('Modified my project again.', '2025-01-16 16:20:00', 6);

INSERT INTO User_Post (body, created_at, user_id)
VALUES ('This post was deleted earlier.', '2025-01-15 09:00:00', 7);

INSERT INTO User_Post (body, created_at, user_id)
VALUES ('First post of the day!', '2025-01-14 07:30:00', 8);

INSERT INTO User_Post (body, created_at, user_id)
VALUES ('Learning MySQL Workbench.', '2025-01-13 18:00:00', 9);

INSERT INTO User_Post (body, created_at, user_id)
VALUES ('Anyone online?', '2025-01-12 22:40:00', 10);

INSERT INTO User_Post (body, created_at, user_id)
VALUES ('Had a great day today!', '2025-01-11 20:00:00', 11);

INSERT INTO User_Post (body, created_at, user_id)
VALUES ('Working on a new app.', '2025-01-10 15:30:00', 12);

INSERT INTO User_Post (body, created_at, user_id)
VALUES ('Trying new features.', '2025-01-09 10:00:00', 13);

INSERT INTO User_Post (body, created_at, user_id)
VALUES ('Does anyone know joins?', '2025-01-08 13:45:00', 14);

INSERT INTO User_Post (body, created_at, user_id)
VALUES ('I love databases!', '2025-01-07 09:20:00', 15);

select * from User_post;

delete from User_Post where post_id = 4;
select * from User_Post;

UPDATE User_Post
SET body = 'This is the updated post content'
WHERE post_id = 5;
select * from User_Post;

ALTER TABLE User_Post
modify column body varchar(3000),
ADD COLUMN size VARCHAR(255);
select * from User_Post;

ALTER TABLE User_Post
DROP COLUMN size; # 3mlt drop fe alter gdyda 34n me4 byrda y3mlo fe nfs el alter statment add o drop
select * from User_Post;

SELECT * FROM User_Post # bygyb kol postat user be id = 1
WHERE user_id = 2;

SELECT * FROM User_Post # bygyb kol el postat el fyha klmet "hello"
WHERE body LIKE '%hello%';

-- Joins --

-- INNER JOIN --

-- 1. Users with their skills
SELECT u.user_id, u.first_name, u.last_name, s.skill_name
FROM Users u
INNER JOIN Skills s ON u.user_id = s.user_id;

-- 2. Jobs with company names
SELECT j.job_number, j.title AS job_title, c.title AS company_name
FROM Job j
INNER JOIN Company c ON j.company_id = c.company_id;

-- 3. Users and their posts
SELECT u.user_id, u.first_name, u.last_name, p.body AS post_body
FROM Users u
INNER JOIN User_Post p ON u.user_id = p.user_id;

-- LEFT JOIN --

-- 1. All users with skills (even if no skill)
SELECT u.user_id, u.first_name, u.last_name, s.skill_name
FROM Users u
LEFT JOIN Skills s ON u.user_id = s.user_id;

-- 2. All companies and their followers (even if no followers)
SELECT c.company_id, c.title AS company_name, f.user_id AS follower_id
FROM Company c
LEFT JOIN Followers f ON c.company_id = f.company_id;

-- 3. All users and their experiences (even if no experience)
SELECT u.user_id, u.first_name, u.last_name, e.title AS experience_title
FROM Users u
LEFT JOIN Experience e ON u.user_id = e.user_id;

-- RIGHT JOIN --

-- 1. All skills and their users (even if user is missing) -- mostly for demo
SELECT s.skill_name, u.first_name, u.last_name
FROM Skills s
RIGHT JOIN Users u ON s.user_id = u.user_id;

-- 2. All jobs and companies (even if company is missing) -- mostly for demo
SELECT j.title AS job_title, c.title AS company_name
FROM Job j
RIGHT JOIN Company c ON j.company_id = c.company_id;

-- UNION --

-- 1. List all names from Users and Company titles in one column
SELECT first_name AS name FROM Users
UNION
SELECT title AS name FROM Company;

-- 2. List all posts and tasks in one column (description/title)
SELECT body AS content FROM User_Post
UNION
SELECT description_ AS content FROM Tasks;

-- 3. All followers user_ids and users who have posted (combined)
SELECT user_id FROM Followers
UNION
SELECT DISTINCT user_id FROM User_Post;
