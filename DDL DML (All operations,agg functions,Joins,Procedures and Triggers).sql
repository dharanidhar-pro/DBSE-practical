USE ddl_dml_practice;
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    department VARCHAR(50),
    marks INT
);
SHOW TABLES;
DESCRIBE students;
ALTER TABLE students
ADD email VARCHAR(100);
DESCRIBE students;
ALTER TABLE students
MODIFY student_name VARCHAR(150);
DESCRIBE students;
RENAME TABLE students TO student_records;
SHOW TABLES;
INSERT INTO student_records
(student_id, student_name, department, marks, email)
VALUES
(1, 'Dharani dhar', 'CSE', 85, 'dd@gmail.com'),
(2, 'Rahul', 'ECE', 78, 'rahul@gmail.com'),
(3, 'Arjun', 'CSE', 92, 'arjun@gmail.com');
SELECT * FROM student_records;
TRUNCATE TABLE student_records;
SELECT * FROM student_records;
DESCRIBE student_records;
DROP TABLE student_records;
SHOW TABLES;
USE ddl_dml_practice;
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    department VARCHAR(50),
    marks INT
);
INSERT INTO students
(student_id, student_name, department, marks)
VALUES
(1, 'Dharanidhar', 'CSE', 85),
(2, 'Rahul', 'ECE', 78),
(3, 'Arjun', 'CSE', 92),
(4, 'Sneha', 'IT', 88),
(5, 'Kiran', 'CSE', 74);
SELECT * FROM students;
UPDATE students
SET marks = 82
WHERE student_id = 2;
SELECT * FROM students;
DELETE FROM students
WHERE student_id = 5;
SELECT * FROM students;
SELECT *

FROM students
WHERE marks > 80;
SELECT *
FROM students
WHERE department = 'CSE';
SELECT *
FROM students
ORDER BY marks DESC;
SELECT *
FROM students
ORDER BY marks ASC;
SELECT department, COUNT(*) AS total_students
FROM students
GROUP BY department;
SELECT department, AVG(marks) AS average_marks
FROM students
GROUP BY department;
SELECT department, COUNT(*) AS total_students
FROM students
GROUP BY department
HAVING COUNT(*) > 1;
SELECT department, AVG(marks) AS average_marks
FROM students
GROUP BY department
HAVING AVG(marks) > 85;
SELECT MIN(marks) AS minimum_marks
FROM students;
SELECT MAX(marks) AS maximum_marks
FROM students;
SELECT COUNT(*) AS total_students
FROM students;
SELECT SUM(marks) AS total_marks
FROM students;
SELECT AVG(marks) AS average_marks
FROM students;
CREATE TABLE cse_students (
    student_id INT,
    student_name VARCHAR(100)
);

CREATE TABLE scholarship_students (
    student_id INT,
    student_name VARCHAR(100)
);
INSERT INTO cse_students VALUES
(1, 'Dd'),
(2, 'Arjun'),
(3, 'Rahul');

INSERT INTO scholarship_students VALUES
(2, 'Arjun'),
(3, 'Rahul'),
(4, 'Sneha');
SELECT student_id, student_name
FROM cse_students

UNION

SELECT student_id, student_name
FROM scholarship_students;
USE ddl_dml_practice;
CREATE TABLE cse_students (
    student_id INT,
    student_name VARCHAR(100)
);
INSERT INTO cse_students VALUES
(1, 'Dd'),
(2, 'Arjun'),
(3, 'Rahul');
SELECT * FROM cse_students;
SELECT * FROM scholarship_students;
SELECT student_id, student_name
FROM cse_students

UNION

SELECT student_id, student_name
FROM scholarship_students;
SELECT student_id, student_name
FROM cse_students

INTERSECT

SELECT student_id, student_name
FROM scholarship_students;

USE ddl_dml_practice;

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    dept_id INT
);
INSERT INTO departments (dept_id, dept_name)
VALUES
(10, 'CSE'),
(20, 'ECE'),
(30, 'IT'),
(40, 'MECH');
INSERT INTO employees (emp_id, emp_name, dept_id)
VALUES
(101, 'Dharani dhar', 10),
(102, 'Rahul', 20),
(103, 'Arjun', 10),
(104, 'Sneha', 30),
(105, 'Kiran', NULL);
SELECT * FROM departments;
SELECT * FROM employees;
SELECT
    employees.emp_id,
    employees.emp_name,
    departments.dept_name
FROM employees
INNER JOIN departments
ON employees.dept_id = departments.dept_id;
SELECT
    employees.emp_id,
    employees.emp_name,
    departments.dept_name
FROM employees
LEFT JOIN departments
ON employees.dept_id = departments.dept_id;
SELECT
    employees.emp_id,
    employees.emp_name,
    departments.dept_name
FROM employees
RIGHT JOIN departments
ON employees.dept_id = departments.dept_id;
SELECT
    employees.emp_id,
    employees.emp_name,
    departments.dept_name
FROM employees
LEFT JOIN departments
ON employees.dept_id = departments.dept_id

UNION

SELECT
    employees.emp_id,
    employees.emp_name,
    departments.dept_name
FROM employees
RIGHT JOIN departments
ON employees.dept_id = departments.dept_id;
SELECT
    employees.emp_name,
    departments.dept_name
FROM employees
CROSS JOIN departments;
ALTER TABLE employees
ADD manager_id INT;
UPDATE employees
SET manager_id = CASE emp_id
    WHEN 101 THEN NULL
    WHEN 102 THEN 101
    WHEN 103 THEN 101
    WHEN 104 THEN 101
    WHEN 105 THEN 102
END
WHERE emp_id IN (101, 102, 103, 104, 105);
SELECT emp_id, emp_name, manager_id
FROM employees;
SELECT
    e.emp_name AS employee,
    m.emp_name AS manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.emp_id;
USE ddl_dml_practice;
DELIMITER //

CREATE PROCEDURE show_students()
BEGIN
    SELECT * FROM students;
END //

DELIMITER ;
CALL show_students();
DELIMITER //

CREATE PROCEDURE students_by_department(IN dept VARCHAR(50))
BEGIN
    SELECT *
    FROM students
    WHERE department = dept;
END //

DELIMITER ;
CALL students_by_department('CSE');
CREATE TABLE marks_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    old_marks INT,
    new_marks INT,
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE marks_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    old_marks INT,
    new_marks INT,
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
DELIMITER //

CREATE TRIGGER before_marks_update
BEFORE UPDATE ON students
FOR EACH ROW
BEGIN
    INSERT INTO marks_log (student_id, old_marks, new_marks)
    VALUES (OLD.student_id, OLD.marks, NEW.marks);
END //

DELIMITER ;
UPDATE students
SET marks = 90
WHERE student_id = 1;
SELECT * FROM students;
SELECT * FROM marks_log;
