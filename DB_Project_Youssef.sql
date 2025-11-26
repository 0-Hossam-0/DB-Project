DROP DATABASE IF EXISTS Youssef;
CREATE DATABASE Youssef;
USE Youssef;

CREATE TABLE Users (
    user_id INT PRIMARY KEY
);
select * from Users;

create table User_Post(
post_id int AUTO_INCREMENT primary key,
body varchar(3000) not null check(body >= 50),
created_at DATETIME not null default now(), # datetime bdl date 34n betstore time kman
modified_at DATETIME default now(),
modified_status boolean default false,
deletion_status boolean default false,
user_id int not null, 
FOREIGN  KEY (user_id) REFERENCES Users(user_id)
);

create table Comments(
comment_id int AUTO_INCREMENT primary key,
body varchar(3000) not null check(body > 0),
created_at DATETIME not null default now(),
modified_at DATETIME default now(), 
modified_status boolean default false,
deletion_status boolean default false,
user_id int not null,
post_id int not null,
FOREIGN  KEY (user_id) REFERENCES Users(user_id), # kda hn3rf anhy user 3ml anhy comment
FOREIGN  KEY (post_id) REFERENCES User_Post(post_id)
);

create table Reaction(
reaction_id int AUTO_INCREMENT primary key,
reaction_type ENUM('like', 'love', 'insightful', 'funny'), # 34n est5dmt ENUM me4 m7tag CHECK eno ya da ya da ya da
deletion_status boolean default false,
created_at DATETIME default now(),
modified_at DATETIME default now(), 
user_id int not null,
post_id int not null,
FOREIGN  KEY (user_id) REFERENCES Users(user_id),
FOREIGN  KEY (post_id) REFERENCES User_Post(post_id),
UNIQUE KEY unique_user_post (user_id, post_id) # 34n el user my3rf4 y3ml 8yr reaction wa7ed bs 3la le post el wa7ed
);


create table Post_Files(
file_id int AUTO_INCREMENT primary key,
attachment varchar(500) not null,
post_id int not null,
FOREIGN  KEY (post_id) REFERENCES User_Post(post_id)
);

INSERT INTO Users (user_id) VALUES (1);

INSERT INTO User_Post (body, created_at, modified_at, modified_status, deletion_status, user_id)
VALUES ('Hello world!', NOW(), NOW(), FALSE, FALSE, 1);
select * from User_post;

INSERT INTO Comments (body, created_at, modified_at, modified_status, deletion_status, user_id, post_id)
VALUES ('Nice post!', NOW(), NOW(), FALSE, FALSE, 1, 1);
select * from Comments;

INSERT INTO Reaction (reaction_type, deletion_status, created_at, modified_at, user_id, post_id)
VALUES ('like', FALSE, NOW(), NOW(), 1, 1);
select * from Reaction;

INSERT INTO Post_Files (attachment, post_id)
VALUES ('uploads/file1.pdf', 1);
select * from Post_Files;

delete from User_Post where post_id = 1;
select * from User_Post;

UPDATE User_Post
SET body = 'This is the updated post content'
WHERE post_id = 1;
select * from User_Post;

ALTER TABLE Post_Files
modify column attachment varchar(500),
ADD COLUMN size VARCHAR(255);
select * from Post_Files;

ALTER TABLE Post_Files
DROP COLUMN size; # 3mlt drop fe alter gdyda 34n me4 byrda y3mlo fe nfs el alter statment add o drop
select * from Post_Files;

SELECT * FROM User_Post # bygyb kol postat user be id = 1
WHERE user_id = 1;

SELECT * FROM Reactions # bygyb kol el reactions be 'love'
WHERE reaction_type = 'love';

SELECT u.user_id, p.post_id, p.body # bygyb kol el postat be myn el n4rhom
FROM User_Post p
JOIN Users u ON p.user_id = u.user_id;

SELECT * FROM User_Post # bygyb kol el postat el fyha klmet "hello"
WHERE body LIKE '%hello%';