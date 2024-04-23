-- 1.Create a view of instructors without their salary called faculty
CREATE VIEW faculty AS SELECT ID, name, dept_name FROM instructor WHERE salary IS NULL;
-- 2.Create a view of department salary totals
CREATE VIEW department_salary_totals AS
SELECT dept_name, SUM(salary) AS total_salary
FROM instructor
GROUP BY dept_name; 
SELECT * FROM department_salary_totals;
-- 3.Create a role of student
CREATE ROLE student;
-- 4.Give select privileges on the view faculty to the role student.
GRANT SELECT ON faculty TO student;
-- 5.Create a new user and assign her the role of student.
CREATE USER 'new_user'@'localhost' IDENTIFIED BY 'pass';
GRANT ALL PRIVILEGES ON exp.* TO 'new_user'@'localhost';
Grant select on instructor to 'new_user'@'localhost';
-- 6. Login as this new user and find all instructors in the Biology department.

-- 7.Revoke privileges of the new user
REVOKE ALL PRIVILEGES ON exp.* FROM 'new_user'@'localhost';
-- 8.Remove the role of student.
DROP ROLE student;
-- 9.Give select privileges on the view faculty to the new user.
GRANT SELECT ON exp.faculty TO 'new_user'@'localhost';
-- 10.Login as this new user and find all instructors in the finance department.

-- 11.Login again as root user

-- 12.Create table teaches2 with same columns as teaches but with additional constraint that that semester is one of fall, winter, spring or summer.
CREATE TABLE teacher2 LIKE teacher;

ALTER TABLE teacher2
ADD CONSTRAINT chk_semester
CHECK (semester IN ('fall', 'winter', 'spring', 'summer'));

-- 13. Create index ID column of teaches. Compare the difference in time to obtain query results with or without index.
CREATE INDEX idx_id ON teacher (ID);
SELECT * FROM teacher WHERE ID = '';
SELECT * FROM teacher2;
-- 14.Drop the index to free up the space.
DROP INDEX idx_id ON teacher;