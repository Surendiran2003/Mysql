-- 1. Find all departments where the total salary is greater than the average of the total salary at all departments
SELECT dept_name FROM instructor GROUP BY dept_name HAVING SUM(salary) > (SELECT AVG(total_salary)
FROM (SELECT SUM(salary) AS total_salary FROM instructor GROUP BY dept_name) AS subquery);
SELECT dept_name FROM instructor GROUP BY dept_name HAVING SUM(salary) > (SELECT AVG(total_salary) FROM (SELECT SUM(salary) AS total_salary FROM instructor GROUP BY dept_name) AS subquery);
+-----------+
| dept_name |
+-----------+
| biology   |     
| comp.sci  |      
| finance   |      
| physics   |   
+-----------+
4 rows in set (0.000 sec)
-- 2. List the names of instructors along with the course ID of the courses that they taught.
SELECT instructor.name, teacher.course_id FROM instructor JOIN teacher ON instructor.ID = teacher.ID;
select name, course_id from instructor, teacher where instructor.ID=teacher.ID;
+------------+-----------+
| name       | course_id |
+------------+-----------+
| srinivasan | CS-101    |
| srinivasan | CS-315    |
| srinivasan | CS-347    |
| wu         | FIN-201   |
| mozarat    | MU-199    |
| einstein   | PHY-101   |
| el said    | HIS-351   |
| katz       | CS-319    |
| crick      | BIO-101   |
| crick      | BIO-301   |
| brandt     | CS-190    |
| brandt     | CS-319    |
| kim        | EE-181    |
+------------+-----------+
-- 3. List the names of instructors along with the course ID of the courses that they taught. In case, an instructor teaches no courses keep the course ID as null.
SELECT instructor.name, teacher.course_id FROM instructor left JOIN teacher ON instructor.ID = teacher.ID;

+------------+-----------+
| name       | course_id |
+------------+-----------+
| srinivasan | CS-101    |
| srinivasan | CS-315    |
| srinivasan | CS-347    |
| smith      | NULL      |
| tom        | NULL      |
| wu         | FIN-201   |
| mozarat    | MU-199    |
| einstein   | PHY-101   |
| el said    | HIS-351   |
| gold       | NULL      |
| katz       | CS-319    |
| califeri   | NULL      |
| singh      | NULL      |
| crick      | BIO-101   |
| crick      | BIO-301   |
| brandt     | CS-190    |
| brandt     | CS-319    |
| kim        | EE-181    |
+------------+-----------+
18 rows in set (0.000 sec)
-- 4. Create a view of instructors without their salary called faculty
CREATE VIEW faculty AS SELECT ID, name, dept_name FROM instructor;
select * from faculty;

+-------+------------+-----------+
| id    | name       | dept_name |
+-------+------------+-----------+
| 10101 | srinivasan | comp.sci  |
| 10211 | smith      | biology   |
| 10212 | tom        | biology   |
| 12121 | wu         | finance   |
| 15151 | mozarat    | music     |
| 22222 | einstein   | physics   |
| 32343 | el said    | history   |
| 33456 | gold       | physics   |
| 45565 | katz       | comp.sci  |
| 58583 | califeri   | history   |
| 76543 | singh      | finance   |
| 76766 | crick      | biology   |
| 83821 | brandt     | comp.sci  |
| 98345 | kim        | elec.eng  |
+-------+------------+-----------+
-- 5. Give select privileges on the view faculty to the new user.
GRANT SELECT ON faculty TO new_user;
