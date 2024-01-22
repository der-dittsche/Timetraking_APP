CREATE DATABASE IF NOT EXISTS timetracking;

GRANT USAGE ON *.* TO 'testuser_abc'@'localhost' IDENTIFIED BY 'Testpassw0rd_abc';
GRANT ALL PRIVILEGES ON timetracking.* TO 'testuser_abc'@'localhost';

FLUSH PRIVILEGES;

CREATE TABLE IF NOT EXISTS Users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(255) NOT NULL,
  firstname VARCHAR(50) NOT NULL,
  lastname VARCHAR(50) NOT NULL,
  userpw VARCHAR(255) NOT NULL,
  is_admin TINYINT NOT NULL DEFAULT 0,
  createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS Timetracking (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  tracking_start TIMESTAMP NOT NULL,
  tracking_stop TIMESTAMP,
  createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES Users(id)
);