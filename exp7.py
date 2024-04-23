import mysql.connector

# Create a connection to the MySQL server
cnx = mysql.connector.connect(user='root', password='password', host='localhost', database='exp')

# Create a cursor object
cursor = cnx.cursor()

# Define the queries to execute
queries = ["select * from instructor order by salary",
           "select course_id from teacher where (semester = 'fall' and teaches_year = '2017') or (semester = 'spring' and teaches_year='2018')",
           "select course_id from teacher where (semester = 'fall' and teaches_year = '2017') and (semester = 'spring' and teaches_year='2018')",
           "select course_id from teacher where (semester = 'fall' and teaches_year = '2017') not in (semester = 'spring' and teaches_year='2018')",
           "delete from instructor where ID in (10212, 10211, 1022)",
           "select * from instructor",
            "INSERT INTO instructor (ID, name, dept_name, salary) VALUES ('10211','Smith', 'Biology', 66000), \
            ('10212','Tom', 'Biology', NULL)",
           "select * from instructor",
           "select * from instructor where salary is null",
           "select count(ID) from teacher where teaches_year='2018'",
           "select count(*) from teacher",
           "select dept_name, AVG(salary) from instructor where group by dept_name"
           "select name from instructor where name not in ('Mozart', 'Einstein')",
           "select name from instructor where salary>any (select salary from instructor where dept_name = 'Biology')",
           "select name from instructor  where salary > ALL (select salary from instructor where dept_name = 'comp. sci.');",
           #"SELECT dept_name FROM instructor GROUP BY dept_name HAVING SUM(salary) > (SELECT AVG(total_salary) FROM (SELECT SUM(salary) AS total_salary FROM instructor GROUP BY dept_name) AS subquery);"
           #"SELECT dept_name FROM instructor GROUP BY dept_name HAVING SUM(salary) > ( SELECT AVG(total_salary) FROM ( SELECT SUM(salary) AS total_salary FROM instructor GROUP BY dept_name ) AS subquery );",
           


]
results = cursor.execute("select name, course_id from instructor, teacher where instructor.ID=teacher.ID", multi=True)
# Execute the queries
results = cursor.execute(";".join(queries), multi=True)

# Process the results
count = 1
for result in results:
    if result.with_rows:
        for row in result:
            print(row)
    else:
        print("No result found")
    print("Query {}: {}".format(count, result.statement))
    count += 1

# Close the cursor and connection
cursor.close()
cnx.close()
