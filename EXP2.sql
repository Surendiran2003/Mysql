-- 3 Insert following additional tuple in instructor ('10211', 'Smith', 'Biology', 66000)
INSERT INTO instructor (ID, name, dept_name, salary) VALUES ('10211', 'Smith', 'Biology', 66000);
-- 4 Delete this tuple from instructor ('10211', 'Smith', 'Biology', 66000)
delete from instructor where ID =10211;
-- 5 Select tuples from instructor where dept_name = ‘History’
select * from instructor where dept_name = 'History';
-- 6 Find the Cartesian product instructor x teaches.
SELECT * FROM instructor CROSS JOIN teacher;
-- 9 Find the names of all instructors with salary between 90,000 and 100,000 (that is, ≥ 90,000 and ≤ 100,000)
select name from instructor where salary >= 90000 and salary <= 100000;
select name from instructor where salary between 90000 and 100000; 
-- 8 Find the names of all instructors whose name includes the substring “dar”.
select name from instructor where name like '%an%';
-- 7 Find the names of all instructors who have taught some course and the course_id
select name from instructor, teacher where instructor.id = teacher.id;