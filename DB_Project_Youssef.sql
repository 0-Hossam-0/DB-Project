DROP DATABASE IF EXISTS Youssef;
CREATE DATABASE Youssef;
USE Youssef;

CREATE TABLE Users (
   user_id int AUTO_INCREMENT primary key
);
select * from Users;

create table User_Post(
post_id int AUTO_INCREMENT primary key,
body varchar(3000) not null,
created_at DATETIME not null default now(), # datetime bdl date 34n betstore time kman
user_id int not null, 
FOREIGN  KEY (user_id) REFERENCES Users(user_id)
);

INSERT INTO Users  VALUES ();
INSERT INTO Users  VALUES ();
INSERT INTO Users  VALUES ();
INSERT INTO Users  VALUES ();
INSERT INTO Users  VALUES ();
INSERT INTO Users  VALUES ();
INSERT INTO Users  VALUES ();
INSERT INTO Users  VALUES ();
INSERT INTO Users  VALUES ();
INSERT INTO Users  VALUES ();
INSERT INTO Users  VALUES ();
INSERT INTO Users  VALUES ();
INSERT INTO Users VALUES ();
INSERT INTO Users  VALUES ();

INSERT INTO User_Post (body, created_at, user_id)
VALUES ('Hello world!', NOW(), 2);

INSERT INTO User_Post (body, created_at, user_id)
VALUES ('Just finished my project!', '2025-01-19 14:32:00', 3);

INSERT INTO User_Post (body, created_at, user_id)
VALUES ('Good morning everyone!', '2025-01-18 08:10:00', 4);

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
