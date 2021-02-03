-- Creates a departments table
CREATE TABLE departments (
    dept_no varchar(10),
    dept_name varchar(30),
    primary key (dept_no)
);

-- Creates a titles table
CREATE TABLE titles (
    title_id varchar(10),
    title varchar(30),
    primary key (title_id)
);

-- Creates a employees table
CREATE TABLE employees (
    emp_no int,
    emp_title_id varchar(10),
    birth_date varchar(10),
    first_name varchar(30),
    last_name varchar(30),
    sex varchar(1),
    hire_date varchar(10),
    primary key (emp_no),
    foreign key (emp_title_id) references titles(title_id)
);

-- Creates a salaries table
CREATE TABLE salaries (
    emp_no int,
    salary money,
    primary key (emp_no),
    foreign key (emp_no) references employees(emp_no)
);

--  Creates a dept_emp table
CREATE TABLE dept_emp (
    emp_no int,
    dept_no varchar(10),
    primary key (emp_no,dept_no),
    foreign key (emp_no) references employees(emp_no),
    foreign key (dept_no) references departments(dept_no)
);

-- Creates a dept_manager table
CREATE TABLE dept_manager (
    dept_no varchar(10),
    emp_no int,
    primary key (emp_no),
    foreign key (dept_no) references departments(dept_no),
    foreign key (emp_no) references employees(emp_no)
);

--Lists the details of each employee: employee number, last name, first name, sex, and salary.
select  salaries.emp_no, last_name, first_name, sex, salary
from employees
inner join salaries on employees.emp_no=salaries.emp_no;

--Lists first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, hire_date
from employees
where hire_date like '%1986';

--Lists the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, last_name, first_name
from departments
join dept_manager on departments.dept_no = dept_manager.dept_no
join employees on dept_manager.emp_no=employees.emp_no;

--Lists the department of each employee with the following information: employee number, last name, first name, and department name.
select employees.emp_no, last_name, first_name, dept_name
from employees
join dept_emp on employees.emp_no=dept_emp.emp_no
join departments on dept_emp.dept_no=departments.dept_no;

--Lists first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name, sex
from employees
where first_name='Hercules' and last_name like 'B%';

--Lists all employees in the Sales department, including their employee number, last name, first name, and department name.
select dept_emp.emp_no, last_name, first_name, dept_name
from departments
join dept_emp on departments.dept_no=dept_emp.dept_no
join employees on dept_emp.emp_no=employees.emp_no
where departments.dept_name='Sales';

--Lists all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select employees.emp_no, last_name, first_name, dept_name
from employees
join dept_emp on employees.emp_no=dept_emp.emp_no
join departments on dept_emp.dept_no=departments.dept_no
where departments.dept_name in ('Sales', 'Development');

--In descending order, lists the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(last_name)
from employees
group by last_name order by last_name desc;