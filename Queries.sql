-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no,employees.first_name,employees.last_name,employees.sex,salaries.salary
FROM employees
INNER JOIN salaries ON employees.emp_no=salaries.emp_no;


-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date FROM employees
WHERE hire_date >= '01/01/1986'
AND hire_date < '01/01/1987';


-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT employees.last_name, employees.first_name, employees.emp_no, 
departments.dep_no,departments.dept_name, 
FROM employees
INNER JOIN departments ON employees.emp_no=departments.emp_no
INNER JOIN dept_emp ON employees.emp_no=dept_emp.emp_no
WHERE employees.emp_title = 'm0001';

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, dep.dept_name
FROM employees AS e
INNER JOIN dept_emp ON e.emp_no=dept_emp.emp_no
INNER JOIN departments AS dep ON e.dept_no=dep.dept_no;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT e.first_name,e.last_name,e.sex 
FROM employees AS e
WHERE e.first_name ='Hercules'
AND e.last_name LIKE 'B%';
    
-- 6. List all employees in the Sales department, including:
-- employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, dep.dept_name
FROM employees AS e
INNER JOIN dept_emp ON e.emp_no=dept_emp.emp_no
INNER JOIN departments ON e.emp_no=departments.emp_no
WHERE e.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, dep.dept_name
FROM employees AS e
INNER JOIN dept_emp ON e.emp_no=dept_emp.emp_no
INNER JOIN departments ON e.emp_no=departments.emp_no
WHERE e.dept_name = 'Sales' OR e.dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names,
-- i.e., how many employees share each last name.
SELECT last_name, count(last_name) 
FROM employees
GROUP BY last_name
ORDER BY count(last_name) DESC;
