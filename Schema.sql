DROP TABLE IF EXISTS departments;
CREATE TABLE departments(
dept_no VARCHAR(4) not NULL,
dept_name VARCHAR(35) not NULL,
PRIMARY KEY(dept_no)
);

DROP TABLE IF EXISTS titles;
CREATE TABLE titles(
title_id VARCHAR(6) not NULL,
title VARCHAR(25) not NULL,
PRIMARY KEY (title_id)
);

DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
emp_no INT(7) not NULL,
emp_title VARCHAR(5) not NULL,
birth_date DATE not NULL,
first_name VARCHAR(20) not NULL,
last_name VARCHAR(20) not NULL,
sex VARCHAR(1) not NULL,
hire_date DATE not NULL,
PRIMARY KEY (emp_no),
FOREIGN KEY (emp_title) REFERENCES titles(title_id)
);

DROP TABLE IF EXISTS dept_employees;
CREATE TABLE dept_employees(
emp_no INT(6) not NULL,
dept_no VARCHAR(5) not NULL,
FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
FOREIGN KEY(dept_no) REFERENCES departments(dept_no)
);

DROP TABLE IF EXISTS dept_managers;
CREATE TABLE dept_managers(
dept_no VARCHAR(5) not NULL,
emp_no INT(6) not NULL,
FOREIGN KEY(dept_no) REFERENCES departments(dept_no),
FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
);

DROP TABLE IF EXISTS salaries;
CREATE TABLE salaries(
emp_no INT(6) not NULL,
salary INT(9) not NULL,
FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
);




