
-- Create departments table
CREATE TABLE departments (
	dept_no VARCHAR,
	dept_name VARCHAR
);


-- Create dept_emp table
CREATE TABLE dept_emp (
	emp_no INT,
	dept_no VARCHAR
);


-- Create dept_manager table
CREATE TABLE dept_manager (
	dept_no VARCHAR,
	emp_no INT
);


-- Create employees table
CREATE TABLE employees (
	emp_no INT,
	emp_title_id VARCHAR,
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date DATE
);


-- Create salaries table
CREATE TABLE salaries (
	emp_no INT,
	salary INT
);


-- Create titles table
CREATE TABLE titles (
	title_id VARCHAR,
	title VARCHAR
);

SELECT * FROM employees