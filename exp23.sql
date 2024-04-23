show databases;
use exp;
show tables;
select * from instructor;
select * from teacher;
-- 1 Order the tuples in the instructors relation as per their salary.
select * from instructor order by salary;
-- 2 Find courses that ran in Fall 2017 or in Spring 2018
select course_id from teacher where (semester = 'fall' and teaches_year = '2017') or (semester = 'spring' and teaches_year='2018');
-- 3 Find courses that ran in Fall 2017 and in Spring 2018
select course_id from teacher where (semester = 'fall' and teaches_year = '2017') and (semester = 'spring' and teaches_year='2018');
-- 4 Find courses that ran in Fall 2017 but not in Spring 2018
select course_id from teacher where (semester = 'fall' and teaches_year = '2017') not in (semester = 'spring' and teaches_year='2018');
-- 5 Insert following additional tuples in instructor :('10211', 'Smith', 'Biology', 66000), ('10212', 'Tom', 'Biology', NULL )
INSERT INTO instructor (ID, name, dept_name, salary) VALUES ('10211','Smith', 'Biology', 66000), 	
('1022','Tom', 'Biology', NULL);
-- 6 Find all instructors whose salary is null.
select * from instructor where salary is null;
-- 7 Find the average salary of instructors in the Computer Science department.
select avg(salary) from instructor where dept_name = 'Comp. Sci.';
