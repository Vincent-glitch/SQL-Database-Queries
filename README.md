# SQL-Database-Queries 
This project looks at a large fictitious tech company that is wanting to run some queries on their past employees. 

There are six CSV files:  **departments, dept_emp, dept_manager, employees, salaries** and **titles**.  
I created an entity-relationship diagram (ERD) to show the relationships between the tables.


This project has two main focuses: Data Engineering & Data Analysis with SQL.
#### Data Engineering

An [ERD](ERD.png) was used to create the schema to begin creating our SQL Database.
![ERD](Engineering/ERD.png)

#### Data Analysis
After creating the ERD, the CSV files were imported into SQL using **pgAdmin 4**. I produced the following lists:
1. The employee number, last name, first name, sex, and salary pf each employee.
2. First name, last name, and hire date for employees who were hired in 1986.
3. The manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
4. The department of each employee with the following information: employee number, last name, first name, and department name.
5. The first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
6. All employees in the Sales department, including their employee number, last name, first name, and department name.
7. All employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
8. In descending order, the frequency count of employee last names, i.e., how many employees share each last name.
---
### Tech Stack
* SQL (pgAdmin 4)
* Python (Jupyter Lab & Notebook)

### User Instructions
* Clone the repository: git clone https://github.com/Vincent-glitch/SQL-Database-Queries.git 
* Establish SQL database to query from
* Import the tables into your database
* Open the [Tables & Queries SQL](Analysis/TablesQueriesSQL.sql) schema in your SQL database and execute each statement.
