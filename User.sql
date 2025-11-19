CREATE TABLE User (
    user_id INT PRIMARY KEY,
    title VARCHAR(50),
    username VARCHAR(50) NOT NULL UNIQUE,
    email_address VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    profile_image VARCHAR(255),
    cover_image VARCHAR(255),
    about_me VARCHAR(500),
    role ENUM('recruiter', 'user') DEFAULT 'user',
    skills JSON,
    languages JSON,
    location VARCHAR(100),
    verification_status ENUM('unverified', 'verified') DEFAULT 'unverified',
    last_active_date DATETIME,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE Connections (
    connection_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    connected_user_id INT NOT NULL,
    connection_status ENUM('pending', 'accepted') DEFAULT 'pending',
    requested_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_user1 FOREIGN KEY (user_id) REFERENCES User (user_id),
    CONSTRAINT fk_user2 FOREIGN KEY (connected_user_id) REFERENCES User (user_id),
    CONSTRAINT no_self_connection CHECK (user_id <> connected_user_id),
    UNIQUE (user_id, connected_user_id)
);