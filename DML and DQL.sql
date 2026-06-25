-- =========================================
--  CRUD Operations
-- =========================================

-- CREATE
INSERT INTO students (first_name, last_name, email, date_of_birth, department_id, enrollment_year)
VALUES ('Simran', 'Kaur', 'simran.kaur@gisma.com', '2003-03-19', 1, 2024);

-- READ
SELECT s.student_id, s.first_name, s.last_name, d.department_name
FROM students s
JOIN departments d ON s.department_id = d.department_id
WHERE d.department_name = 'Computer Science';

-- UPDATE
UPDATE students
SET email = 'aman.newemail@gisma.com'
WHERE student_id = 1;

-- DELETE
DELETE FROM students
WHERE email = 'simran.kaur@gisma.com';

-- =========================================
--  Join Queries
-- =========================================

-- Table to find students with departments
SELECT s.student_id, s.first_name, s.last_name, d.department_name
FROM students s
JOIN departments d ON s.department_id = d.department_id;

-- Table to find Courses with instructors
SELECT c.course_name, c.credits, i.first_name, i.last_name
FROM courses c
JOIN instructors i ON c.instructor_id = i.instructor_id;

-- Table to find students enrolled in courses
SELECT s.first_name, s.last_name, c.course_name, e.semester
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id;

-- Table to find students with grades
SELECT s.first_name, s.last_name, c.course_name, g.grade, g.marks
FROM grades g
JOIN enrollments e ON g.enrollment_id = e.enrollment_id
JOIN students s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id;

-- =========================================
--  Aggregate Queries
-- =========================================

-- Table to find the number of students in each department
SELECT d.department_name, COUNT(s.student_id) AS total_students
FROM departments d
LEFT JOIN students s ON d.department_id = s.department_id
GROUP BY d.department_name;

-- Table to find the average marks in each course
SELECT c.course_name, AVG(g.marks) AS average_marks
FROM grades g
JOIN enrollments e ON g.enrollment_id = e.enrollment_id
JOIN courses c ON e.course_id = c.course_id
GROUP BY c.course_name;

-- Query to find the highest marks
SELECT MAX(marks) AS highest_marks
FROM grades;

-- =========================================
-- 10. Queries Using Views
-- =========================================

SELECT * FROM student_department_view;
SELECT * FROM student_course_grades;

-- Table to find students scoring above 80 using view
SELECT *
FROM student_course_grades
WHERE marks > 80;
