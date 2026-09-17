
-- Create the database
CREATE DATABASE school_management;

-- Select the database
USE school_management;

-- Create Students table
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender VARCHAR(10),
    date_of_birth DATE,
    email VARCHAR(100),
    phone VARCHAR(20)
);

-- Create Teachers table
CREATE TABLE teachers (
    teacher_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20),
    subject VARCHAR(100)
);

-- Create Courses table
CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    course_code VARCHAR(20) NOT NULL UNIQUE,
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id)
);

-- Create Enrollments table
CREATE TABLE enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Insert sample students
INSERT INTO students
(first_name, last_name, gender, date_of_birth, email, phone)
VALUES
('Hassan', 'Ali', 'Male', '2002-05-10', 'hassan@example.com', '0712345678'),
('Amina', 'Mohamed', 'Female', '2003-08-15', 'amina@example.com', '0723456789'),
('Abdi', 'Omar', 'Male', '2001-11-20', 'abdi@example.com', '0734567890');

-- Insert sample teachers
INSERT INTO teachers
(first_name, last_name, email, phone, subject)
VALUES
('Ahmed', 'Hassan', 'ahmed@example.com', '0745678901', 'Computer Science'),
('Mary', 'Wanjiku', 'mary@example.com', '0756789012', 'Mathematics');

-- Insert sample courses
INSERT INTO courses
(course_name, course_code, teacher_id)
VALUES
('Introduction to Programming', 'CS101', 1),
('Database Systems', 'CS102', 1),
('Mathematics', 'MAT101', 2);

-- Insert sample enrollments
INSERT INTO enrollments
(student_id, course_id, enrollment_date)
VALUES
(1, 1, '2026-09-01'),
(1, 2, '2026-09-01'),
(2, 3, '2026-09-02'),
(3, 1, '2026-09-03');
