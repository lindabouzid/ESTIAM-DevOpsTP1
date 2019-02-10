CREATE USER 'linda'@'localhost' IDENTIFIED BY 'passwd';
CREATE DATABASE devops;
GRANT ALL PRIVILEGES ON devops.* TO 'linda'@'localhost';
USE devops;
CREATE TABLE Etudiant(id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
name VARCHAR(20));












