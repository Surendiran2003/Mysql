show databases;
use exp;
CREATE TABLE instructor (
    ID INT PRIMARY KEY,
    name VARCHAR(50),
    dept_name VARCHAR(50),
    salary INT
);

INSERT INTO instructor (ID, name, dept_name, salary) VALUES
(10101, 'Srinivasan', 'Comp. Sci.', 65000),
(12121, 'Wu', 'Finance', 90000),
(15151, 'Mozart', 'Music', 40000),
(22222, 'Einstein', 'Physics', 95000),
(32343, 'El Said', 'History', 60000),
(33456, 'Gold', 'Physics', 87000),
(45565, 'Katz', 'Comp. Sci.', 75000),
(58583, 'Califieri', 'History', 62000),
(76543, 'Singh', 'Finance', 80000),
(76766, 'Crick', 'Biology', 72000),
(83821, 'Brandt', 'Comp. Sci.', 92000),
(98345, 'Kim', 'Elec. Eng.', 80000);
select * from teacher;
select * from instructor;
show tables;
# 2

CREATE TABLE teacher (
    ID int,
    FOREIGN KEY (ID)
    REFERENCES instructor(ID),
    Course_id VARCHAR(10),
    sec_id INT,
    semester VARCHAR(20),
    teaches_year INT
);
INSERT INTO teacher (ID, Course_id, sec_id, semester, teaches_year) VALUES
(10101, 'CS-101', 1, 'Fall', 2017),
(10101, 'CS-315', 1, 'Spring', 2018),
(10101, 'CS-347', 1, 'Fall', 2017),
(12121, 'FIN-201', 1, 'Spring', 2018),
(15151, 'MU-199', 1, 'Spring', 2018),
(22222, 'PHY-101', 1, 'Fall', 2017),
(32343, 'HIS-351', 1, 'Spring', 2018),
(45565, 'CS-101', 1, 'Spring', 2018),
(45565, 'CS-319', 1, 'Spring', 2018),
(76766, 'BIO-101', 1, 'Summer', 2017),
(76766, 'BIO-301', 1, 'Summer', 2018),
(83821, 'CS-190', 1, 'Spring', 2017),
(83821, 'CS-190', 2, 'Spring', 2017),
(83821, 'CS-319', 2, 'Spring', 2018),
(98345, 'EE-181', 1, 'Spring', 2017);

-- 3 Insert following additional tuple in instructor ('10211', 'Smith', 'Biology', 66000)
INSERT INTO instructor (ID, name, dept_name, salary) VALUES ('10211', 'Smith', 'Biology', 66000);
-- 4 Delete this tuple from instructor ('10211', 'Smith', 'Biology', 66000)
delete from instructor where ID ='10211';
-- 5 Select tuples from instructor where dept_name = ‘History’
select * from instructor where dept_name = 'History';
-- 6 Find the Cartesian product instructor x teaches.
SELECT * FROM instructor CROSS JOIN teacher;
-- 9 Find the names of all instructors with salary between 90,000 and 100,000 (that is, ≥ 90,000 and ≤ 100,000)
select name from instructor where salary >= 90000 and salary <= 100000;
-- 8 Find the names of all instructors whose name includes the substring “dar”.
select name from instructor where name like '%an%';
-- 7 Find the names of all instructors who have taught some course and the course_id
select name from instructor, teacher where instructor.id = teacher.id;