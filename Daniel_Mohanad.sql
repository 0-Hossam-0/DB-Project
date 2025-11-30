use Daniel_Mohanad;
SHOW Tables;


# Modify the structure of one table.

Alter Table Projects
Rename To Tasks;

Alter Table Experiance
Add End_Date datetime;
#################################

# Apply constraints to maintain data integrity.
Alter Table Experiance
modify End_Date datetime,
Add constraint check_end_date check(End_Date is NUll or End_date > Start_Date);

############################################

# Add, update, and delete data records.

INSERT INTO Users () VALUES
(),(),(),(),(),(),(),(),(),(),
(),(),(),(),();

INSERT INTO Experiance (user_id, Title, Descripition, Address, Start_Date, End_Date) VALUES
(1, 'Software Engineer', 'Developed backend APIs and integrations.', 'New York, USA', '2020-01-10', '2021-06-18'),
(2, 'Frontend Developer', 'Built responsive UI using React.', 'Berlin, Germany', '2019-03-25', '2020-12-01'),
(3, 'Data Analyst', 'Analyzed business and performance data.', 'Paris, France', '2021-01-10', '2022-02-22'),
(4, 'Android Developer', 'Created several Android mobile apps.', 'Cairo, Egypt', '2018-11-01', '2020-02-10'),
(5, 'Network Engineer', 'Maintained and designed network topologies.', 'Dubai, UAE', '2017-06-15', '2019-01-20'),
(6, 'DevOps Engineer', 'Built CI/CD automation pipelines.', 'Toronto, Canada', '2020-02-01', '2021-11-11'),
(7, 'AI Engineer', 'Worked with ML models and NLP.', 'Tokyo, Japan', '2021-05-10', '2023-01-15'),
(8, 'Database Administrator', 'Managed SQL and NoSQL systems.', 'Sydney, Australia', '2016-07-08', '2018-12-14'),
(9, 'Cloud Architect', 'Designed cloud-based scalable systems.', 'San Francisco, USA', '2022-04-01', '2023-07-30'),
(10, 'QA Engineer', 'Tested applications manually and automatically.', 'London, UK', '2019-11-20', '2021-08-19'),
(11, 'Business Analyst', 'Analyzed requirements and workflows.', 'Rome, Italy', '2018-03-14', '2020-03-01'),
(12, 'Cybersecurity Analyst', 'Monitored and protected systems.', 'Moscow, Russia', '2020-08-01', '2022-04-17'),
(13, 'IT Support Technician', 'Provided hardware and software support.', 'Madrid, Spain', '2017-10-10', '2019-01-01'),
(14, 'Project Manager', 'Led technical development teams.', 'Amsterdam, Netherlands', '2019-04-01', '2021-10-10'),
(15, 'Game Developer', 'Developed 2D and 3D game systems.', 'Seoul, South Korea', '2021-12-01', '2023-06-20');


INSERT INTO Tasks (user_id, Name, Descripition, Created_At) VALUES
(1, 'API Platform', 'Designed backend microservices platform.', '2022-01-12'),
(2, 'UI Dashboard', 'Created dynamic dashboards for analytics.', '2021-06-02'),
(3, 'Report Automation', 'Automated daily sales reports.', '2022-08-10'),
(4, 'Shopping App', 'Developed full mobile shopping application.', '2020-10-01'),
(5, 'Network Monitor', 'Built a live network monitoring system.', '2019-02-22'),
(6, 'CI/CD Pipeline', 'Automated build and deployment pipeline.', '2021-03-14'),
(7, 'AI Chatbot', 'Implemented customer-support NLP chatbot.', '2022-05-15'),
(8, 'DB Migration Tool', 'Automated migration between database engines.', '2018-11-02'),
(9, 'Cloud Migration', 'Moved internal systems to AWS cloud.', '2023-01-03'),
(10, 'Automation Suite', 'Developed test automation scripts.', '2020-09-10'),
(11, 'Workflow Mapper', 'Built tool to optimize workflows.', '2019-07-15'),
(12, 'Security Scanner', 'Automated vulnerability and port scanning.', '2021-10-20'),
(13, 'Support Portal', 'Created internal IT helpdesk portal.', '2018-03-10'),
(14, 'Agile Manager', 'Built agile project management tools.', '2020-11-01'),
(15, 'Game Engine Demo', 'Developed 3D engine prototype.', '2022-12-01');

Update Tasks
Set Name = 'To do List'
WHERE Created_At = '2021-03-14';

Delete From Tasks
Where Name = 'Cloud Migration';

####################################################

# Remove at least one table or column when needed.

Alter Table Experiance
Drop Column address;

############################################

# Retrieve specific information using different types of queries.

select Name From Tasks Where Name LIKE '%Agile%';
select user_id From Experiance Where Start_Date Like '%2019%';

#############################################

select * from Users;
select * from Experiance;
select * from Tasks;

