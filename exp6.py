import mysql.connector

# Create a connection to the MySQL server
cnx = mysql.connector.connect(user='root', password='password', host='localhost', database='exp')

# Create a cursor object
cursor = cnx.cursor()

# Define the queries to execute
queries = ["delete from instructor where ID='10211'",
    "insert into instructor (ID, name, dept_name, salary) values ('10211', 'Smith', 'Biology', 66000)",
           "select * from instructor",
           "delete from instructor where ID='10211'",
           "select * from instructor",
           "select * from instructor where dept_name='history'",
           "select * from instructor cross join teacher",
           "select name from instructor,teacher where instructor.ID=teacher.ID",
           "select name from instructor where name like '%a%'",
           "select name from instructor where salary between 90000 and 100000",
           #"select name from instructor where salary >= 90000 and salary<=100000",

]

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
