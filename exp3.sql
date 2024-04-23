-- 1. Find the total number of instructors who teach a course in the Spring 2018 semester.
SELECT COUNT(id) FROM teacher WHERE teaches_year=2018;
-- 2. Find the number of tuples in the teaches relation
SELECT COUNT(*) FROM teacher;
-- 3. Find the average salary of instructors in each department
SELECT dept_name, AVG(salary) FROM instructor GROUP BY dept_name;
-- 4. Find the names and average salaries of all departments whose average salary is greater than 42000
select dept_name, avg(salary) from instructor group by dept_name having avg(salary)>42000;
-- 5. Name all instructors whose name is neither “Mozart” nor Einstein”.
SELECT name FROM instructor WHERE name NOT IN ('Mozart', 'Einstein');
-- 6. Find names of instructors with salary greater than that of some (at least one) instructor in the Biology department.
select name from instructor where salary>any (select salary from instructor where dept_name = 'Biology');
-- 7. Find the names of all instructors whose salary is greater than the salary of all instructors in the Biology department.
SELECT name FROM instructor WHERE salary > ALL (SELECT salary FROM instructor WHERE dept_name = 'Music');
-- 8. Find the average instructors’ salaries of those departments where the average salary is greater than 42,000.
select avg(salary) from instructor group by dept_name having avg(salary)>42000;