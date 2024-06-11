show databases;
use exp;
show tables;
select * from instructor;
+-------+------------+-----------+--------+
| id    | name       | dept_name | salary |
+-------+------------+-----------+--------+
| 10101 | srinivasan | comp.sci  |  65000 |
| 10211 | smith      | biology   |  66000 |
| 10212 | tom        | biology   |   NULL |
| 12121 | wu         | finance   |  90000 |
| 15151 | mozarat    | music     |  40000 |
| 22222 | einstein   | physics   |  95000 |
| 32343 | el said    | history   |  60000 |
| 33456 | gold       | physics   |  87000 |
| 45565 | katz       | comp.sci  |  75000 |
| 58583 | califeri   | history   |  62000 |
| 76543 | singh      | finance   |  80000 |
| 76766 | crick      | biology   |  72000 |
| 83821 | brandt     | comp.sci  |  92000 |
| 98345 | kim        | elec.eng  |  80000 |
+-------+------------+-----------+--------+
14 rows in set (0.001 sec)
select * from teacher;
+-------+-----------+--------+----------+------+
| id    | course_id | sec_id | semester | year |
+-------+-----------+--------+----------+------+
| 10101 | CS-101    |      1 | fall     | 2017 |
| 10101 | CS-315    |      1 | spring   | 2018 |
| 10101 | CS-347    |      1 | fall     | 2017 |
| 12121 | FIN-201   |      1 | spring   | 2018 |
| 15151 | MU-199    |      1 | spring   | 2018 |
| 22222 | PHY-101   |      1 | fall     | 2017 |
| 10101 | CS-101    |      1 | spring   | 2018 |
| 32343 | HIS-351   |      1 | spring   | 2018 |
| 45565 | CS-319    |      1 | spring   | 2018 |
| 45565 | CS-319    |      1 | spring   | 2017 |
| 76766 | BIO-101   |      1 | summer   | 2018 |
| 76766 | BIO-301   |      1 | summer   | 2017 |
| 83821 | CS-190    |      1 | spring   | 2017 |
| 83821 | CS-190    |      2 | spring   | 2017 |
| 83821 | CS-319    |      2 | spring   | 2018 |
| 98345 | EE-181    |      1 | spring   | 2017 |
+-------+-----------+--------+----------+------+
16 rows in set (0.000 sec)
-- 1 Order the tuples in the instructors relation as per their salary.
select * from instructor order by salary;
+-------+------------+-----------+--------+
| id    | name       | dept_name | salary |
+-------+------------+-----------+--------+
| 10212 | tom        | biology   |   NULL |
| 15151 | mozarat    | music     |  40000 |
| 32343 | el said    | history   |  60000 |
| 58583 | califeri   | history   |  62000 |
| 10101 | srinivasan | comp.sci  |  65000 |
| 10211 | smith      | biology   |  66000 |
| 76766 | crick      | biology   |  72000 |
| 45565 | katz       | comp.sci  |  75000 |
| 98345 | kim        | elec.eng  |  80000 |
| 76543 | singh      | finance   |  80000 |
| 33456 | gold       | physics   |  87000 |
| 12121 | wu         | finance   |  90000 |
| 83821 | brandt     | comp.sci  |  92000 |
| 22222 | einstein   | physics   |  95000 |
+-------+------------+-----------+--------+
14 rows in set (0.000 sec)
-- 2 Find courses that ran in Fall 2017 or in Spring 2018
select course_id from teacher where (semester = 'fall' and teaches_year = '2017') or (semester = 'spring' and teaches_year='2018');
+-----------+
| course_id |
+-----------+
| CS-101    |
| CS-315    |
| CS-347    |
| FIN-201   |
| MU-199    |
| PHY-101   |
| HIS-351   |
| CS-319    |
+-----------+
8 rows in set (0.000 sec)
-- 3 Find courses that ran in Fall 2017 and in Spring 2018
select course_id from teacher where (semester = 'fall' and teaches_year = '2017') and (semester = 'spring' and teaches_year='2018');
+-----------+
| course_id |
+-----------+
| CS-315    |
| FIN-201   |
| MU-199    |
| CS-101    |
| HIS-351   |
| CS-319    |
| CS-319    |
+-----------+
7 rows in set (0.000 sec)
-- 4 Find courses that ran in Fall 2017 but not in Spring 2018
select course_id from teacher where (semester = 'fall' and teaches_year = '2017') not in (semester = 'spring' and teaches_year='2018');
+-----------+
| course_id |
+-----------+
| CS-101    |
| CS-347    |
| PHY-101   |
+-----------+
3 rows in set (0.000 sec)
-- 5 Insert following additional tuples in instructor :('10211', 'Smith', 'Biology', 66000), ('10212', 'Tom', 'Biology', NULL )
INSERT INTO instructor (ID, name, dept_name, salary) VALUES ('10211','Smith', 'Biology', 66000), 	
('1022','Tom', 'Biology', NULL);
-- 6 Find all instructors whose salary is null.
select * from instructor where salary is null;
+-------+------+-----------+--------+
| id    | name | dept_name | salary |
+-------+------+-----------+--------+
| 10212 | tom  | biology   |   NULL |
+-------+------+-----------+--------+
1 row in set (0.000 sec)

-- 7 Find the average salary of instructors in the Computer Science department.
select avg(salary) from instructor where dept_name = 'Comp. Sci.';
+------------+
| avg_salary |
+------------+
| 77333.3333 |
+------------+
1 row in set (0.000 sec)
