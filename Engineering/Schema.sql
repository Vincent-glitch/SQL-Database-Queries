
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
    birth_date datetime,
    first_name varchar(30),
    last_name varchar(30),
    sex varchar(1),
    hire_date datetime,
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

-- Creates a dept_emp table
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