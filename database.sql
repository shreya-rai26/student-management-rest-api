-- Student Management REST API
-- MySQL database setup

CREATE DATABASE IF NOT EXISTS student_management;

USE student_management;

CREATE TABLE IF NOT EXISTS students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    department VARCHAR(100) NOT NULL,
    semester INT NOT NULL,
    cgpa DECIMAL(3,2) NOT NULL,
    CONSTRAINT chk_semester CHECK (semester > 0),
    CONSTRAINT chk_cgpa CHECK (cgpa >= 0 AND cgpa <= 10)
);

-- Sample data
INSERT INTO students
(student_id, name, email, department, semester, cgpa)
VALUES
(101, 'Aarav Sharma', 'aarav@example.com', 'CSE', 5, 8.50),
(102, 'Ananya Patil', 'ananya@example.com', 'ECE', 5, 9.10),
(103, 'Rohan Verma', 'rohan@example.com', 'CSE', 3, 7.80)
ON DUPLICATE KEY UPDATE student_id = student_id;