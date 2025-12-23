
CREATE SCHEMA IF NOT EXISTS lms;

SET search_path TO lms;


DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email TEXT NOT NULL,
    full_name TEXT NOT NULL,
    role TEXT NOT NULL CHECK (role IN ('student', 'instructor', 'admin')),
    registered_at TIMESTAMP NOT NULL,
    country TEXT NOT NULL
);


INSERT INTO users (email, full_name, role, registered_at, country) VALUES
('alex.smith@gmail.com', 'Alex Smith', 'student', '2024-01-10 09:12:00', 'USA'),
('maria.ivanova@mail.ru', 'Maria Ivanova', 'student', '2024-01-12 14:45:00', 'Russia'),
('john.doe@gmail.com', 'John Doe', 'student', '2024-01-15 18:20:00', 'USA'),
('emma.wilson@gmail.com', 'Emma Wilson', 'student', '2024-01-20 11:05:00', 'UK'),
('li.wei@gmail.com', 'Li Wei', 'student', '2024-01-22 08:40:00', 'China'),
('anna.kowalska@gmail.com', 'Anna Kowalska', 'student', '2024-01-25 16:10:00', 'Poland'),
('sergey.petrov@mail.ru', 'Sergey Petrov', 'student', '2024-01-28 13:30:00', 'Russia'),
('lucas.martin@gmail.com', 'Lucas Martin', 'student', '2024-02-01 10:00:00', 'France'),
('sofia.rossi@gmail.com', 'Sofia Rossi', 'student', '2024-02-03 19:25:00', 'Italy'),
('david.brown@gmail.com', 'David Brown', 'student', '2024-02-05 07:55:00', 'USA'),

('olga.smiknova@mail.ru', 'Olga Smirnova', 'student', '2024-02-07 12:15:00', 'Russia'),
('pavel.ivanov@mail.ru', 'Pavel Ivanov', 'student', '2024-02-10 15:45:00', 'Russia'),
('nina.schmidt@gmail.com', 'Nina Schmidt', 'student', '2024-02-12 09:30:00', 'Germany'),
('mark.johnson@gmail.com', 'Mark Johnson', 'student', '2024-02-15 17:20:00', 'USA'),
('yuki.tanaka@gmail.com', 'Yuki Tanaka', 'student', '2024-02-18 06:50:00', 'Japan'),
('carlos.garcia@gmail.com', 'Carlos Garcia', 'student', '2024-02-20 20:10:00', 'Spain'),
('fatima.hassan@gmail.com', 'Fatima Hassan', 'student', '2024-02-22 14:00:00', 'UAE'),
('amir.rahimi@gmail.com', 'Amir Rahimi', 'student', '2024-02-25 11:40:00', 'Iran'),
('julie.morel@gmail.com', 'Julie Morel', 'student', '2024-02-27 16:35:00', 'France'),
('tom.wilson@gmail.com', 'Tom Wilson', 'student', '2024-03-01 08:25:00', 'UK'),

-- instructors
('ivan.teacher@gmail.com', 'Ivan Kuznetsov', 'instructor', '2023-11-10 10:00:00', 'Russia'),
('anna.teacher@gmail.com', 'Anna Petrova', 'instructor', '2023-11-12 12:30:00', 'Russia'),
('john.teacher@gmail.com', 'John Anderson', 'instructor', '2023-11-15 09:45:00', 'USA'),
('emma.teacher@gmail.com', 'Emma Thompson', 'instructor', '2023-11-18 14:20:00', 'UK'),
('li.teacher@gmail.com', 'Li Zhang', 'instructor', '2023-11-20 08:10:00', 'China'),
('pierre.teacher@gmail.com', 'Pierre Dubois', 'instructor', '2023-11-22 16:50:00', 'France'),
('sofia.teacher@gmail.com', 'Sofia Bianchi', 'instructor', '2023-11-25 11:35:00', 'Italy'),
('alex.teacher@gmail.com', 'Alex Novak', 'instructor', '2023-11-27 13:15:00', 'Czech Republic'),
('michael.teacher@gmail.com', 'Michael Scott', 'instructor', '2023-11-29 17:00:00', 'USA'),
('yuri.teacher@gmail.com', 'Yuri Volkov', 'instructor', '2023-12-01 10:40:00', 'Russia'),

-- admins
('admin1@platform.com', 'System Admin', 'admin', '2023-01-01 00:00:00', 'USA'),
('admin2@platform.com', 'Platform Admin', 'admin', '2023-01-01 00:00:00', 'Germany'),
('admin3@platform.com', 'Global Admin', 'admin', '2023-01-01 00:00:00', 'UK'),
('admin4@platform.com', 'Security Admin', 'admin', '2023-01-01 00:00:00', 'France'),
('admin5@platform.com', 'Support Admin', 'admin', '2023-01-01 00:00:00', 'Canada'),

-- extra students
('kate.miller@gmail.com', 'Kate Miller', 'student', '2024-03-03 09:10:00', 'USA'),
('robert.king@gmail.com', 'Robert King', 'student', '2024-03-05 18:45:00', 'USA'),
('elena.popova@mail.ru', 'Elena Popova', 'student', '2024-03-07 12:00:00', 'Russia'),
('andrey.sokolov@mail.ru', 'Andrey Sokolov', 'student', '2024-03-09 14:30:00', 'Russia'),
('irina.belova@mail.ru', 'Irina Belova', 'student', '2024-03-11 16:20:00', 'Russia'),
('daniel.lee@gmail.com', 'Daniel Lee', 'student', '2024-03-13 08:00:00', 'South Korea'),
('ahmed.ali@gmail.com', 'Ahmed Ali', 'student', '2024-03-15 21:10:00', 'Egypt'),
('mina.kim@gmail.com', 'Mina Kim', 'student', '2024-03-17 10:05:00', 'South Korea'),
('noah.green@gmail.com', 'Noah Green', 'student', '2024-03-19 19:40:00', 'USA'),
('victor.lopez@gmail.com', 'Victor Lopez', 'student', '2024-03-21 07:30:00', 'Mexico');


DROP TABLE IF EXISTS instructors;

CREATE TABLE instructors (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL ,
    bio TEXT,
    rating NUMERIC(3,2),
    experience_years INT
);

INSERT INTO instructors (user_id, bio, rating, experience_years) VALUES
(21, 'Backend developer with focus on databases and SQL optimization.', 4.8, 8),
(22, 'Python developer and data analyst with real industry experience.', 4.7, 6),
(23, 'Senior software engineer specializing in distributed systems.', 4.9, 10),
(24, 'Frontend developer and UX-focused instructor.', 4.6, 7),
(25, 'Data engineer working with big data and ETL pipelines.', 4.8, 9),
(26, 'Machine learning engineer and AI researcher.', 4.9, 11),
(27, 'Fullstack developer with strong DevOps background.', 4.7, 8),
(28, 'Software architect with experience in high-load systems.', 4.8, 12),
(29, 'Product-oriented developer and tech lead.', 4.6, 9),
(30, 'Backend engineer specializing in APIs and microservices.', 4.7, 7),

(31, 'Database administrator with focus on PostgreSQL performance.', 4.8, 13),
(32, 'Cloud engineer working with AWS and Kubernetes.', 4.7, 10),
(33, 'Security-focused developer and DevSecOps practitioner.', 4.6, 9),
(34, 'Mobile application developer for iOS and Android.', 4.5, 6),
(35, 'Game developer and computer graphics specialist.', 4.4, 5),
(36, 'QA automation engineer with Python and Java.', 4.6, 8),
(37, 'Data scientist with strong statistics background.', 4.9, 12),
(38, 'Business intelligence expert and SQL trainer.', 4.8, 11),
(39, 'Systems programmer and low-level optimization specialist.', 4.7, 14),
(40, 'Technical mentor and curriculum designer.', 4.9, 15);


DROP TABLE IF EXISTS courses;

CREATE TABLE courses (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    category TEXT NOT NULL,
    level TEXT NOT NULL CHECK (level IN ('beginner', 'middle', 'advanced')),
    price NUMERIC(10,2) NOT NULL,
    published_at TIMESTAMP NOT NULL,
    is_active BOOLEAN NOT NULL
);


INSERT INTO courses (title, category, level, price, published_at, is_active) VALUES
('PostgreSQL Basics', 'Databases', 'beginner', 49.00, '2023-09-01 10:00:00', true),
('Advanced PostgreSQL', 'Databases', 'advanced', 129.00, '2023-11-15 12:00:00', true),
('SQL for Data Analysis', 'Databases', 'middle', 79.00, '2023-10-10 09:30:00', true),
('Python for Beginners', 'Programming', 'beginner', 59.00, '2023-08-20 14:00:00', true),
('Python Backend Development', 'Programming', 'middle', 99.00, '2023-12-01 11:00:00', true),
('JavaScript Fundamentals', 'Programming', 'beginner', 55.00, '2023-07-05 16:20:00', true),
('Advanced JavaScript', 'Programming', 'advanced', 120.00, '2023-11-01 15:10:00', true),
('React from Scratch', 'Frontend', 'beginner', 69.00, '2023-09-18 13:40:00', true),
('React Performance Optimization', 'Frontend', 'advanced', 139.00, '2024-01-10 10:30:00', true),
('HTML & CSS Layouts', 'Frontend', 'beginner', 39.00, '2023-06-25 09:00:00', true),

('Data Analytics Fundamentals', 'Data', 'beginner', 65.00, '2023-08-01 10:00:00', true),
('Pandas & NumPy', 'Data', 'middle', 95.00, '2023-09-20 11:30:00', true),
('Machine Learning Basics', 'Data', 'middle', 110.00, '2023-10-15 12:45:00', true),
('Deep Learning Advanced', 'Data', 'advanced', 160.00, '2024-01-05 14:00:00', true),
('ETL Pipelines with Python', 'Data Engineering', 'middle', 125.00, '2023-11-22 10:15:00', true),

('Docker for Developers', 'DevOps', 'beginner', 70.00, '2023-09-05 09:20:00', true),
('Kubernetes in Practice', 'DevOps', 'advanced', 150.00, '2023-12-10 16:00:00', true),
('CI/CD Pipelines', 'DevOps', 'middle', 115.00, '2023-10-30 13:00:00', true),
('Linux for Engineers', 'DevOps', 'beginner', 45.00, '2023-07-15 08:50:00', true),

('System Design Fundamentals', 'Architecture', 'middle', 130.00, '2023-11-18 15:30:00', true),
('High Load Systems', 'Architecture', 'advanced', 180.00, '2024-02-01 11:10:00', true),
('Clean Code Principles', 'Software Engineering', 'beginner', 50.00, '2023-06-10 10:00:00', true),
('Refactoring Legacy Code', 'Software Engineering', 'advanced', 140.00, '2023-12-20 17:45:00', true),
('Testing and QA Automation', 'Software Engineering', 'middle', 90.00, '2023-09-28 14:20:00', true),

('Career Growth for Developers', 'Soft Skills', 'beginner', 35.00, '2023-05-01 09:00:00', false);


DROP TABLE IF EXISTS course_instructors;

CREATE TABLE course_instructors (
    course_id INT NOT NULL,
    instructor_id INT NOT NULL,
    PRIMARY KEY (course_id, instructor_id)
);

INSERT INTO course_instructors (course_id, instructor_id) VALUES
-- Databases
(1, 1), (1, 10),
(2, 1), (2, 8),
(3, 2), (3, 18),

-- Programming / Python / JS
(4, 2), (4, 6),
(5, 3), (5, 7),
(6, 4),
(7, 4), (7, 9),

-- Frontend
(8, 4), (8, 9),
(9, 9), (9, 8),
(10, 4),

-- Data
(11, 2), (11, 18),
(12, 18), (12, 6),
(13, 6), (13, 17),
(14, 17), (14, 6),
(15, 6), (15, 7),

-- DevOps
(16, 7), (16, 12),
(17, 12), (17, 8),
(18, 7), (18, 12),
(19, 7),

-- Architecture
(20, 8), (20, 3),
(21, 8), (21, 3),

-- Software Engineering
(22, 10),
(23, 10), (23, 3),
(24, 10), (24, 3),
(25, 20);


DROP TABLE IF EXISTS modules;

CREATE TABLE modules (
    id SERIAL PRIMARY KEY,
    course_id INT NOT NULL,
    title TEXT NOT NULL,
    order_index INT NOT NULL
);

INSERT INTO modules (course_id, title, order_index) VALUES
-- Course 1: PostgreSQL Basics
(1, 'Introduction to Databases', 1),
(1, 'Basic SQL Queries', 2),
(1, 'Filtering and Sorting', 3),

-- Course 2: Advanced PostgreSQL
(2, 'PostgreSQL Internals', 1),
(2, 'Indexes and Performance', 2),
(2, 'Transactions and Locks', 3),

-- Course 3: SQL for Data Analysis
(3, 'Data Exploration with SQL', 1),
(3, 'Aggregations and Grouping', 2),
(3, 'Window Functions', 3),

-- Course 4: Python for Beginners
(4, 'Python Basics', 1),
(4, 'Control Flow', 2),
(4, 'Functions and Modules', 3),

-- Course 5: Python Backend Development
(5, 'Backend Architecture', 1),
(5, 'Working with Databases', 2),
(5, 'Building REST APIs', 3),

-- Course 6: JavaScript Fundamentals
(6, 'JavaScript Syntax', 1),
(6, 'Working with Functions', 2),

-- Course 7: Advanced JavaScript
(7, 'Advanced Functions', 1),
(7, 'Asynchronous JavaScript', 2),
(7, 'Performance Optimization', 3),

-- Course 8: React from Scratch
(8, 'React Basics', 1),
(8, 'Components and Props', 2),
(8, 'State and Effects', 3),

-- Course 9: React Performance Optimization
(9, 'Rendering Optimization', 1),
(9, 'Memoization Techniques', 2),

-- Course 10: HTML & CSS Layouts
(10, 'HTML Structure', 1),
(10, 'CSS Flexbox', 2),
(10, 'CSS Grid', 3),

-- Course 11: Data Analytics Fundamentals
(11, 'Intro to Analytics', 1),
(11, 'Working with Data', 2),

-- Course 12: Pandas & NumPy
(12, 'NumPy Basics', 1),
(12, 'Pandas DataFrames', 2),
(12, 'Data Cleaning', 3),

-- Course 13: Machine Learning Basics
(13, 'ML Concepts', 1),
(13, 'Supervised Learning', 2),
(13, 'Model Evaluation', 3),

-- Course 14: Deep Learning Advanced
(14, 'Neural Networks', 1),
(14, 'Training Deep Models', 2),
(14, 'Model Optimization', 3),

-- Course 15: ETL Pipelines with Python
(15, 'ETL Concepts', 1),
(15, 'Extract and Transform', 2),
(15, 'Loading Data', 3),

-- Course 16: Docker for Developers
(16, 'Docker Basics', 1),
(16, 'Working with Images', 2),

-- Course 17: Kubernetes in Practice
(17, 'Kubernetes Architecture', 1),
(17, 'Deployments and Services', 2),
(17, 'Scaling Applications', 3),

-- Course 18: CI/CD Pipelines
(18, 'CI/CD Concepts', 1),
(18, 'Build Pipelines', 2),

-- Course 19: Linux for Engineers
(19, 'Linux Fundamentals', 1),
(19, 'File System and Processes', 2),

-- Course 20: System Design Fundamentals
(20, 'System Design Basics', 1),
(20, 'Scalability Patterns', 2),

-- Course 21: High Load Systems
(21, 'High Load Principles', 1),
(21, 'Caching Strategies', 2),
(21, 'Queue Systems', 3),

-- Course 22: Clean Code Principles
(22, 'Code Readability', 1),
(22, 'Refactoring Basics', 2),

-- Course 23: Refactoring Legacy Code
(23, 'Legacy Code Problems', 1),
(23, 'Safe Refactoring', 2),
(23, 'Testing Before Refactoring', 3),

-- Course 24: Testing and QA Automation
(24, 'Testing Fundamentals', 1),
(24, 'Automation Tools', 2),

-- Course 25: Career Growth for Developers
(25, 'Career Planning', 1),
(25, 'Soft Skills', 2);


DROP TABLE IF EXISTS lessons;

CREATE TABLE lessons (
    id SERIAL PRIMARY KEY,
    module_id INT NOT NULL ,
    title TEXT NOT NULL,
    lesson_type TEXT NOT NULL CHECK (lesson_type IN ('video', 'text', 'quiz')),
    duration_minutes INT NOT NULL,
    order_index INT NOT NULL
);


INSERT INTO lessons (module_id, title, lesson_type, duration_minutes, order_index) VALUES
-- Modules 1–10
(1, 'What is a Database', 'video', 15, 1),
(1, 'Database Types Overview', 'text', 10, 2),

(2, 'SELECT Basics', 'video', 20, 1),
(2, 'WHERE and ORDER BY', 'video', 25, 2),

(3, 'Filtering Data', 'video', 18, 1),
(3, 'Sorting Results', 'quiz', 10, 2),

(4, 'PostgreSQL Architecture', 'video', 22, 1),
(4, 'Storage and WAL', 'text', 15, 2),

(5, 'Index Types', 'video', 30, 1),
(5, 'Query Planning', 'quiz', 15, 2),

(6, 'Transactions Overview', 'video', 20, 1),
(6, 'Isolation Levels', 'text', 15, 2),

(7, 'Exploratory Queries', 'video', 18, 1),
(7, 'Data Profiling', 'quiz', 12, 2),

(8, 'GROUP BY Deep Dive', 'video', 25, 1),
(8, 'HAVING Clause', 'video', 20, 2),

(9, 'Window Functions Intro', 'video', 30, 1),
(9, 'ROW_NUMBER and RANK', 'quiz', 15, 2),

(10, 'Python Syntax Basics', 'video', 20, 1),
(10, 'Variables and Types', 'text', 15, 2),

-- Modules 11–30
(11, 'If Statements', 'video', 18, 1),
(11, 'Loops Overview', 'video', 22, 2),

(12, 'Functions Definition', 'video', 20, 1),
(12, 'Importing Modules', 'quiz', 10, 2),

(13, 'Backend Overview', 'video', 25, 1),
(13, 'Request Lifecycle', 'text', 20, 2),

(14, 'ORM Concepts', 'video', 30, 1),
(14, 'Database Connections', 'quiz', 15, 2),

(15, 'REST Basics', 'video', 20, 1),
(15, 'HTTP Methods', 'text', 15, 2),

(16, 'JavaScript Variables', 'video', 18, 1),
(16, 'Functions in JS', 'video', 22, 2),

(17, 'Closures', 'video', 25, 1),
(17, 'Advanced Functions Quiz', 'quiz', 15, 2),

(18, 'Async Programming', 'video', 30, 1),
(18, 'Promises and Async/Await', 'text', 20, 2),

(19, 'Performance Bottlenecks', 'video', 25, 1),
(19, 'Optimization Techniques', 'quiz', 15, 2),

(20, 'React Philosophy', 'video', 20, 1),
(20, 'JSX Basics', 'text', 15, 2),

-- Modules 31–50
(21, 'Components Overview', 'video', 25, 1),
(21, 'Props and State', 'video', 20, 2),

(22, 'useState Hook', 'video', 20, 1),
(22, 'useEffect Hook', 'quiz', 15, 2),

(23, 'Rendering Optimization', 'video', 30, 1),
(23, 'Memoization', 'text', 20, 2),

(24, 'HTML Semantics', 'video', 18, 1),
(24, 'Accessibility Basics', 'quiz', 10, 2),

(25, 'Flexbox Layout', 'video', 22, 1),
(25, 'Flexbox Practice', 'quiz', 15, 2),

(26, 'CSS Grid Intro', 'video', 25, 1),
(26, 'Grid Templates', 'text', 20, 2),

(27, 'Analytics Concepts', 'video', 20, 1),
(27, 'Metrics and KPIs', 'text', 15, 2),

(28, 'Working with Arrays', 'video', 25, 1),
(28, 'Vectorized Operations', 'quiz', 15, 2),

(29, 'DataFrames Basics', 'video', 30, 1),
(29, 'Indexing Data', 'text', 20, 2),

(30, 'Data Cleaning Intro', 'video', 25, 1),
(30, 'Handling Missing Values', 'quiz', 15, 2),

-- Modules 51–65
(31, 'ML Workflow', 'video', 25, 1),
(31, 'Train/Test Split', 'quiz', 15, 2),

(32, 'Model Training', 'video', 30, 1),
(32, 'Overfitting', 'text', 20, 2),

(33, 'Neural Networks Basics', 'video', 30, 1),
(33, 'Activation Functions', 'quiz', 15, 2),

(34, 'Backpropagation', 'video', 35, 1),
(34, 'Loss Functions', 'text', 20, 2),

(35, 'ETL Architecture', 'video', 25, 1),
(35, 'ETL Tools Overview', 'quiz', 15, 2),

(36, 'Data Extraction', 'video', 30, 1),
(36, 'Transforming Data', 'text', 20, 2),

(37, 'Loading Data', 'video', 25, 1),
(37, 'ETL Best Practices', 'quiz', 15, 2),

(38, 'Docker Images', 'video', 20, 1),
(38, 'Docker Containers', 'quiz', 10, 2),

(39, 'Image Optimization', 'video', 22, 1),
(39, 'Docker Compose', 'text', 20, 2),

(40, 'K8s Components', 'video', 30, 1),
(40, 'Cluster Architecture', 'text', 20, 2);


DROP TABLE IF EXISTS enrollments;

CREATE TABLE enrollments (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    course_id INT NOT NULL,
    enrolled_at TIMESTAMP NOT NULL,
    status TEXT NOT NULL CHECK (status IN ('active', 'completed', 'cancelled'))
);

INSERT INTO enrollments (user_id, course_id, enrolled_at, status) VALUES
-- user 1–10
(1, 1, '2024-01-15 10:00:00', 'completed'),
(1, 3, '2024-02-01 12:30:00', 'completed'),
(1, 8, '2024-03-10 09:20:00', 'active'),

(2, 1, '2024-01-20 14:00:00', 'completed'),
(2, 4, '2024-02-05 16:40:00', 'completed'),
(2, 11, '2024-03-01 11:00:00', 'active'),

(3, 6, '2024-01-18 09:15:00', 'completed'),
(3, 7, '2024-02-10 10:10:00', 'completed'),
(3, 9, '2024-03-12 18:00:00', 'active'),

(4, 10, '2024-01-25 17:30:00', 'completed'),
(4, 8, '2024-02-15 13:45:00', 'completed'),
(4, 20, '2024-03-20 10:00:00', 'active'),

(5, 4, '2024-01-28 08:40:00', 'completed'),
(5, 5, '2024-02-18 15:30:00', 'completed'),
(5, 12, '2024-03-25 09:00:00', 'active'),

(6, 2, '2024-02-01 12:00:00', 'cancelled'),
(6, 3, '2024-02-20 16:00:00', 'completed'),
(6, 15, '2024-03-10 14:30:00', 'active'),

(7, 6, '2024-01-30 09:20:00', 'completed'),
(7, 16, '2024-02-20 10:10:00', 'completed'),
(7, 17, '2024-03-15 11:00:00', 'active'),

(8, 8, '2024-02-02 18:30:00', 'completed'),
(8, 9, '2024-02-25 13:00:00', 'completed'),
(8, 21, '2024-03-18 09:45:00', 'active'),

(9, 11, '2024-02-05 11:15:00', 'completed'),
(9, 12, '2024-02-28 14:40:00', 'completed'),
(9, 14, '2024-03-22 10:30:00', 'active'),

(10, 19, '2024-02-10 08:00:00', 'completed'),
(10, 22, '2024-03-01 09:10:00', 'completed'),
(10, 23, '2024-03-25 17:20:00', 'active'),

-- user 36–50
(36, 1, '2024-02-12 10:00:00', 'completed'),
(36, 3, '2024-03-01 12:30:00', 'active'),

(37, 6, '2024-02-15 09:00:00', 'completed'),
(37, 7, '2024-03-05 10:20:00', 'active'),

(38, 8, '2024-02-18 14:40:00', 'completed'),
(38, 9, '2024-03-08 16:30:00', 'active'),

(39, 11, '2024-02-20 11:10:00', 'completed'),
(39, 12, '2024-03-10 09:00:00', 'active'),

(40, 16, '2024-02-22 10:30:00', 'completed'),
(40, 17, '2024-03-12 12:00:00', 'active'),

(41, 18, '2024-02-25 13:00:00', 'completed'),
(41, 19, '2024-03-15 15:30:00', 'active'),

(42, 20, '2024-02-28 09:45:00', 'completed'),
(42, 21, '2024-03-18 10:00:00', 'active'),

(43, 22, '2024-03-01 14:20:00', 'completed'),
(43, 23, '2024-03-20 16:00:00', 'active'),

(44, 24, '2024-03-05 11:10:00', 'completed'),
(44, 25, '2024-03-22 18:30:00', 'active'),

(45, 2, '2024-02-15 12:00:00', 'cancelled'),
(45, 5, '2024-03-10 14:00:00', 'active'),

(46, 7, '2024-02-18 10:10:00', 'completed'),
(46, 8, '2024-03-12 09:00:00', 'active'),

(47, 9, '2024-02-20 16:40:00', 'completed'),
(47, 10, '2024-03-18 11:30:00', 'active'),

(48, 11, '2024-02-25 09:00:00', 'completed'),
(48, 12, '2024-03-22 10:20:00', 'active'),

(49, 13, '2024-02-28 13:30:00', 'completed'),
(49, 14, '2024-03-25 15:10:00', 'active'),

(50, 15, '2024-03-01 10:00:00', 'completed'),
(50, 16, '2024-03-28 18:00:00', 'active');


DROP TABLE IF EXISTS progress;

CREATE TABLE progress (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    lesson_id INT NOT NULL,
    completed_at TIMESTAMP,
    progress_pct INT NOT NULL CHECK (progress_pct BETWEEN 0 AND 100)
);

INSERT INTO progress (user_id, lesson_id, completed_at, progress_pct) VALUES
-- user 1
(1, 1, '2024-01-16 10:00:00', 100),
(1, 2, '2024-01-16 11:00:00', 100),
(1, 3, '2024-01-17 09:30:00', 100),
(1, 4, NULL, 60),
(1, 5, NULL, 40),

-- user 2
(2, 1, '2024-01-21 14:00:00', 100),
(2, 2, '2024-01-21 15:00:00', 100),
(2, 6, '2024-01-22 10:20:00', 100),
(2, 7, NULL, 50),
(2, 8, NULL, 30),

-- user 3
(3, 9, '2024-01-19 09:00:00', 100),
(3, 10, '2024-01-19 10:00:00', 100),
(3, 11, '2024-01-20 11:30:00', 100),
(3, 12, NULL, 70),
(3, 13, NULL, 20),

-- user 4
(4, 14, '2024-01-26 18:00:00', 100),
(4, 15, '2024-01-26 19:00:00', 100),
(4, 16, NULL, 80),
(4, 17, NULL, 40),
(4, 18, NULL, 10),

-- user 5
(5, 19, '2024-01-29 09:00:00', 100),
(5, 20, '2024-01-29 10:30:00', 100),
(5, 21, '2024-01-30 11:00:00', 100),
(5, 22, NULL, 60),
(5, 23, NULL, 25),

-- user 6
(6, 24, '2024-02-21 16:00:00', 100),
(6, 25, NULL, 55),
(6, 26, NULL, 35),

-- user 7
(7, 27, '2024-01-31 10:00:00', 100),
(7, 28, '2024-01-31 11:20:00', 100),
(7, 29, NULL, 70),

-- user 8
(8, 30, '2024-02-03 19:00:00', 100),
(8, 31, '2024-02-03 20:00:00', 100),
(8, 32, NULL, 45),

-- user 9
(9, 33, '2024-02-06 12:00:00', 100),
(9, 34, NULL, 65),
(9, 35, NULL, 20),

-- user 10
(10, 36, '2024-02-11 09:00:00', 100),
(10, 37, '2024-02-11 10:00:00', 100),
(10, 38, NULL, 50),

-- users 36–50
(36, 39, '2024-02-13 11:00:00', 100),
(36, 40, NULL, 60),

(37, 41, '2024-02-16 10:30:00', 100),
(37, 42, NULL, 70),

(38, 43, '2024-02-19 15:00:00', 100),
(38, 44, NULL, 45),

(39, 45, '2024-02-21 12:00:00', 100),
(39, 46, NULL, 30),

(40, 47, '2024-02-23 11:00:00', 100),
(40, 48, NULL, 55),

(41, 49, '2024-02-26 14:00:00', 100),
(41, 50, NULL, 35),

(42, 51, '2024-03-01 10:00:00', 100),
(42, 52, NULL, 40),

(43, 53, '2024-03-02 15:30:00', 100),
(43, 54, NULL, 65),

(44, 55, '2024-03-06 12:00:00', 100),
(44, 56, NULL, 50),

(45, 57, NULL, 20),
(45, 58, NULL, 10),

(46, 59, '2024-02-19 11:00:00', 100),
(46, 60, NULL, 60),

(47, 61, '2024-02-21 17:00:00', 100),
(47, 62, NULL, 45),

(48, 63, '2024-02-26 09:00:00', 100),
(48, 64, NULL, 70),

(49, 65, '2024-02-28 14:00:00', 100),
(49, 66, NULL, 55),

(50, 67, '2024-03-02 11:00:00', 100),
(50, 68, NULL, 35);


DROP TABLE IF EXISTS lesson_results;

CREATE TABLE lesson_results (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    lesson_id INT NOT NULL,
    score INT NOT NULL CHECK (score BETWEEN 0 AND 100),
    passed BOOLEAN NOT NULL,
    attempt_number INT NOT NULL CHECK (attempt_number >= 1),
    completed_at TIMESTAMP NOT NULL
);


INSERT INTO lesson_results (user_id, lesson_id, score, passed, attempt_number, completed_at) VALUES
-- user 1
(1, 6, 85, true, 1, '2024-01-17 10:00:00'),
(1, 6, 92, true, 2, '2024-01-17 11:00:00'),
(1, 8, 70, true, 1, '2024-01-18 09:00:00'),
(1, 9, 45, false, 1, '2024-01-18 10:00:00'),
(1, 9, 78, true, 2, '2024-01-18 11:00:00'),

-- user 2
(2, 6, 60, false, 1, '2024-01-22 11:00:00'),
(2, 6, 82, true, 2, '2024-01-22 12:00:00'),
(2, 12, 88, true, 1, '2024-01-23 10:00:00'),
(2, 13, 50, false, 1, '2024-01-23 11:00:00'),
(2, 13, 76, true, 2, '2024-01-23 12:00:00'),

-- user 3
(3, 17, 90, true, 1, '2024-01-20 12:00:00'),
(3, 18, 65, true, 1, '2024-01-21 09:00:00'),
(3, 19, 40, false, 1, '2024-01-21 10:00:00'),
(3, 19, 75, true, 2, '2024-01-21 11:00:00'),

-- user 4
(4, 24, 88, true, 1, '2024-01-27 10:00:00'),
(4, 25, 72, true, 1, '2024-01-27 11:00:00'),
(4, 26, 55, false, 1, '2024-01-27 12:00:00'),
(4, 26, 80, true, 2, '2024-01-27 13:00:00'),

-- user 5
(5, 29, 95, true, 1, '2024-01-30 12:00:00'),
(5, 30, 78, true, 1, '2024-01-30 13:00:00'),
(5, 31, 48, false, 1, '2024-01-30 14:00:00'),
(5, 31, 82, true, 2, '2024-01-30 15:00:00'),

-- user 6
(6, 34, 60, false, 1, '2024-02-22 10:00:00'),
(6, 34, 79, true, 2, '2024-02-22 11:00:00'),
(6, 35, 85, true, 1, '2024-02-22 12:00:00'),

-- user 7
(7, 38, 88, true, 1, '2024-02-01 10:00:00'),
(7, 39, 52, false, 1, '2024-02-01 11:00:00'),
(7, 39, 77, true, 2, '2024-02-01 12:00:00'),

-- user 8
(8, 42, 90, true, 1, '2024-02-04 20:00:00'),
(8, 43, 66, true, 1, '2024-02-04 21:00:00'),

-- user 9
(9, 46, 58, false, 1, '2024-02-06 13:00:00'),
(9, 46, 81, true, 2, '2024-02-06 14:00:00'),

-- user 10
(10, 49, 92, true, 1, '2024-02-12 11:00:00'),
(10, 50, 73, true, 1, '2024-02-12 12:00:00'),

-- users 36–50 (смешанные попытки)
(36, 52, 65, true, 1, '2024-02-14 12:00:00'),
(36, 53, 45, false, 1, '2024-02-14 13:00:00'),
(36, 53, 78, true, 2, '2024-02-14 14:00:00'),

(37, 55, 88, true, 1, '2024-02-17 11:00:00'),
(37, 56, 70, true, 1, '2024-02-17 12:00:00'),

(38, 58, 60, false, 1, '2024-02-20 16:00:00'),
(38, 58, 83, true, 2, '2024-02-20 17:00:00'),

(39, 60, 91, true, 1, '2024-02-22 13:00:00'),
(39, 61, 74, true, 1, '2024-02-22 14:00:00'),

(40, 63, 55, false, 1, '2024-02-24 12:00:00'),
(40, 63, 80, true, 2, '2024-02-24 13:00:00'),

(41, 65, 89, true, 1, '2024-02-27 15:00:00'),
(41, 66, 68, true, 1, '2024-02-27 16:00:00'),

(42, 68, 62, true, 1, '2024-03-02 11:00:00'),
(42, 69, 47, false, 1, '2024-03-02 12:00:00'),
(42, 69, 79, true, 2, '2024-03-02 13:00:00'),

(43, 71, 90, true, 1, '2024-03-03 16:00:00'),
(43, 72, 75, true, 1, '2024-03-03 17:00:00'),

(44, 74, 58, false, 1, '2024-03-06 13:00:00'),
(44, 74, 84, true, 2, '2024-03-06 14:00:00'),

(45, 76, 35, false, 1, '2024-03-10 15:00:00'),

(46, 78, 88, true, 1, '2024-02-20 12:00:00'),
(46, 79, 72, true, 1, '2024-02-20 13:00:00'),

(47, 81, 60, false, 1, '2024-02-22 18:00:00'),
(47, 81, 82, true, 2, '2024-02-22 19:00:00'),

(48, 83, 91, true, 1, '2024-02-26 10:00:00'),
(48, 84, 69, true, 1, '2024-02-26 11:00:00'),

(49, 86, 87, true, 1, '2024-02-28 15:00:00'),
(49, 87, 74, true, 1, '2024-02-28 16:00:00'),

(50, 89, 63, true, 1, '2024-03-02 12:00:00'),
(50, 90, 48, false, 1, '2024-03-02 13:00:00'),
(50, 90, 80, true, 2, '2024-03-02 14:00:00');


DROP TABLE IF EXISTS payments;

CREATE TABLE payments (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    course_id INT NOT NULL,
    amount NUMERIC(10,2) NOT NULL,
    payment_date TIMESTAMP NOT NULL,
    status TEXT NOT NULL CHECK (status IN ('paid', 'failed', 'refunded')),
    payment_method TEXT NOT NULL
);

INSERT INTO payments (user_id, course_id, amount, payment_date, status, payment_method) VALUES
-- users 1–5
(1, 1, 49.00, '2024-01-15 09:50:00', 'paid', 'card'),
(1, 3, 79.00, '2024-02-01 12:20:00', 'paid', 'card'),
(1, 8, 69.00, '2024-03-10 09:10:00', 'paid', 'paypal'),

(2, 1, 49.00, '2024-01-20 13:50:00', 'paid', 'card'),
(2, 4, 59.00, '2024-02-05 16:30:00', 'paid', 'card'),
(2, 11, 65.00, '2024-03-01 10:50:00', 'failed', 'card'),

(3, 6, 55.00, '2024-01-18 09:05:00', 'paid', 'paypal'),
(3, 7, 120.00, '2024-02-10 09:55:00', 'paid', 'card'),
(3, 9, 139.00, '2024-03-12 17:50:00', 'paid', 'card'),

(4, 10, 39.00, '2024-01-25 17:20:00', 'paid', 'card'),
(4, 8, 69.00, '2024-02-15 13:30:00', 'paid', 'paypal'),
(4, 20, 130.00, '2024-03-20 09:45:00', 'paid', 'card'),

(5, 4, 59.00, '2024-01-28 08:30:00', 'paid', 'card'),
(5, 5, 99.00, '2024-02-18 15:20:00', 'paid', 'paypal'),
(5, 12, 95.00, '2024-03-25 08:50:00', 'paid', 'card'),

-- users 6–10
(6, 2, 129.00, '2024-02-01 11:50:00', 'failed', 'card'),
(6, 3, 79.00, '2024-02-20 15:50:00', 'paid', 'card'),
(6, 15, 125.00, '2024-03-10 14:20:00', 'paid', 'paypal'),

(7, 6, 55.00, '2024-01-30 09:10:00', 'paid', 'card'),
(7, 16, 70.00, '2024-02-20 10:00:00', 'paid', 'paypal'),
(7, 17, 150.00, '2024-03-15 10:45:00', 'paid', 'card'),

(8, 8, 69.00, '2024-02-02 18:15:00', 'paid', 'card'),
(8, 9, 139.00, '2024-02-25 12:50:00', 'paid', 'paypal'),
(8, 21, 180.00, '2024-03-18 09:35:00', 'paid', 'card'),

(9, 11, 65.00, '2024-02-05 11:00:00', 'paid', 'card'),
(9, 12, 95.00, '2024-02-28 14:30:00', 'paid', 'paypal'),
(9, 14, 160.00, '2024-03-22 10:15:00', 'paid', 'card'),

(10, 19, 45.00, '2024-02-10 07:50:00', 'paid', 'card'),
(10, 22, 50.00, '2024-03-01 09:00:00', 'paid', 'paypal'),
(10, 23, 140.00, '2024-03-25 17:10:00', 'refunded', 'card'),

-- users 36–50
(36, 1, 49.00, '2024-02-12 09:50:00', 'paid', 'card'),
(36, 3, 79.00, '2024-03-01 12:20:00', 'paid', 'paypal'),

(37, 6, 55.00, '2024-02-15 08:50:00', 'paid', 'card'),
(37, 7, 120.00, '2024-03-05 10:10:00', 'paid', 'card'),

(38, 8, 69.00, '2024-02-18 14:30:00', 'paid', 'paypal'),
(38, 9, 139.00, '2024-03-08 16:15:00', 'paid', 'card'),

(39, 11, 65.00, '2024-02-20 10:55:00', 'paid', 'card'),
(39, 12, 95.00, '2024-03-10 08:50:00', 'paid', 'paypal'),

(40, 16, 70.00, '2024-02-22 10:20:00', 'paid', 'card'),
(40, 17, 150.00, '2024-03-12 11:50:00', 'paid', 'card'),

(41, 18, 115.00, '2024-02-25 12:45:00', 'paid', 'paypal'),
(41, 19, 45.00, '2024-03-15 15:20:00', 'paid', 'card'),

(42, 20, 130.00, '2024-02-28 09:35:00', 'paid', 'card'),
(42, 21, 180.00, '2024-03-18 09:50:00', 'paid', 'paypal'),

(43, 22, 50.00, '2024-03-01 14:10:00', 'paid', 'card'),
(43, 23, 140.00, '2024-03-20 15:50:00', 'paid', 'paypal'),

(44, 24, 90.00, '2024-03-05 11:00:00', 'paid', 'card'),
(44, 25, 35.00, '2024-03-22 18:20:00', 'paid', 'paypal'),

(45, 2, 129.00, '2024-02-15 11:50:00', 'refunded', 'card'),
(45, 5, 99.00, '2024-03-10 13:50:00', 'paid', 'paypal'),

(46, 7, 120.00, '2024-02-18 10:00:00', 'paid', 'card'),
(46, 8, 69.00, '2024-03-12 08:50:00', 'paid', 'card'),

(47, 9, 139.00, '2024-02-20 16:30:00', 'paid', 'paypal'),
(47, 10, 39.00, '2024-03-18 11:20:00', 'paid', 'card'),

(48, 11, 65.00, '2024-02-25 08:50:00', 'paid', 'card'),
(48, 12, 95.00, '2024-03-22 10:00:00', 'paid', 'paypal'),

(49, 13, 110.00, '2024-02-28 13:20:00', 'paid', 'card'),
(49, 14, 160.00, '2024-03-25 15:00:00', 'paid', 'paypal'),

(50, 15, 125.00, '2024-03-01 09:50:00', 'paid', 'card'),
(50, 16, 70.00, '2024-03-28 17:45:00', 'paid', 'paypal');

DROP TABLE IF EXISTS certificates;

CREATE TABLE certificates (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    course_id INT NOT NULL,
    issued_at TIMESTAMP NOT NULL,
    UNIQUE (user_id, course_id)
);

INSERT INTO certificates (user_id, course_id, issued_at) VALUES
-- users 1–10
(1, 1, '2024-01-25 12:00:00'),
(1, 3, '2024-02-10 14:00:00'),

(2, 1, '2024-01-28 16:00:00'),
(2, 4, '2024-02-15 18:00:00'),

(3, 6, '2024-01-30 11:00:00'),
(3, 7, '2024-02-20 13:00:00'),

(4, 10, '2024-02-05 17:00:00'),
(4, 8, '2024-02-25 19:00:00'),

(5, 4, '2024-02-05 10:00:00'),
(5, 5, '2024-02-28 12:00:00'),

(6, 3, '2024-03-01 15:00:00'),

(7, 6, '2024-02-10 14:00:00'),
(7, 16, '2024-03-01 16:00:00'),

(8, 8, '2024-02-15 20:00:00'),
(8, 9, '2024-03-01 18:00:00'),

(9, 11, '2024-02-20 13:00:00'),
(9, 12, '2024-03-05 15:00:00'),

(10, 19, '2024-02-18 10:00:00'),
(10, 22, '2024-03-10 12:00:00'),

-- users 36–50
(36, 1, '2024-02-25 11:00:00'),
(36, 3, '2024-03-10 14:00:00'),

(37, 6, '2024-02-28 10:00:00'),

(38, 8, '2024-03-05 17:00:00'),

(39, 11, '2024-03-01 12:00:00'),

(40, 16, '2024-03-05 13:00:00'),

(41, 18, '2024-03-10 15:00:00'),

(42, 20, '2024-03-12 11:00:00'),

(43, 22, '2024-03-15 16:00:00'),

(44, 24, '2024-03-18 14:00:00'),

(45, 5, '2024-03-20 12:00:00'),

(46, 7, '2024-03-05 10:00:00'),

(47, 9, '2024-03-08 18:00:00'),

(48, 11, '2024-03-12 09:00:00'),

(49, 13, '2024-03-15 15:00:00'),

(50, 15, '2024-03-20 11:00:00');


DROP TABLE IF EXISTS reviews;

CREATE TABLE reviews (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    course_id INT NOT NULL,
    rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    created_at TIMESTAMP NOT NULL,
    UNIQUE (user_id, course_id)
);


INSERT INTO reviews (user_id, course_id, rating, comment, created_at) VALUES
-- users 1–10
(1, 1, 5, 'Great introduction to PostgreSQL, very clear explanations.', '2024-01-26 13:00:00'),
(1, 3, 4, 'Useful course, helped me understand SQL analytics.', '2024-02-11 15:00:00'),

(2, 1, 5, 'Perfect for beginners, highly recommended.', '2024-01-29 17:00:00'),
(2, 4, 4, 'Good Python basics, but could use more examples.', '2024-02-16 19:00:00'),

(3, 6, 5, 'Excellent JavaScript course!', '2024-02-01 12:00:00'),
(3, 7, 4, 'Advanced topics explained well.', '2024-02-21 14:00:00'),

(4, 10, 5, 'Loved the HTML and CSS layouts part.', '2024-02-06 18:00:00'),
(4, 8, 4, 'Good React introduction.', '2024-02-26 20:00:00'),

(5, 4, 5, 'Python course was very helpful.', '2024-02-06 11:00:00'),
(5, 5, 4, 'Backend topics are solid.', '2024-03-01 13:00:00'),

(6, 3, 4, 'Good SQL course, but a bit fast-paced.', '2024-03-02 16:00:00'),

(7, 6, 5, 'Clear and practical JavaScript explanations.', '2024-02-11 15:00:00'),
(7, 16, 4, 'Docker basics were explained nicely.', '2024-03-02 17:00:00'),

(8, 8, 5, 'React course exceeded expectations.', '2024-02-16 21:00:00'),
(8, 9, 4, 'Performance tips are useful.', '2024-03-02 19:00:00'),

(9, 11, 5, 'Great analytics fundamentals.', '2024-02-21 14:00:00'),
(9, 12, 4, 'Pandas explained clearly.', '2024-03-06 16:00:00'),

(10, 19, 5, 'Linux course was very practical.', '2024-02-19 11:00:00'),
(10, 22, 4, 'Clean Code ideas are helpful.', '2024-03-11 13:00:00'),

-- users 36–50
(36, 1, 5, 'Solid PostgreSQL basics.', '2024-02-26 12:00:00'),
(36, 3, 4, 'Good SQL analytics material.', '2024-03-11 15:00:00'),

(37, 6, 5, 'Very well structured JS course.', '2024-03-01 11:00:00'),

(38, 8, 4, 'React course is good but challenging.', '2024-03-06 18:00:00'),

(39, 11, 5, 'Analytics course is top-notch.', '2024-03-02 13:00:00'),

(40, 16, 4, 'Docker topics were useful.', '2024-03-06 14:00:00'),

(41, 18, 5, 'CI/CD explained very clearly.', '2024-03-11 16:00:00'),

(42, 20, 4, 'System design concepts are well explained.', '2024-03-13 12:00:00'),

(43, 22, 5, 'Clean Code course is a must-have.', '2024-03-16 17:00:00'),

(44, 24, 4, 'QA automation overview was helpful.', '2024-03-19 15:00:00'),

(45, 5, 4, 'Good backend practices.', '2024-03-21 13:00:00'),

(46, 7, 5, 'Advanced JS explained very clearly.', '2024-03-06 11:00:00'),

(47, 9, 4, 'Nice performance optimization techniques.', '2024-03-09 19:00:00'),

(48, 11, 5, 'Very practical analytics course.', '2024-03-13 10:00:00'),

(49, 13, 4, 'ML basics are well presented.', '2024-03-16 16:00:00'),

(50, 15, 5, 'ETL concepts explained clearly.', '2024-03-21 12:00:00');

