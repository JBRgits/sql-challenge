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

--List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries ON employees.emp_no = salaries.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1/1/1986' AND '12/31/1986';

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.emp_no, employees.last_name, employees.first_name
FROM ((employees
INNER JOIN dept_manager ON employees.emp_no = dept_manager.emp_no)
INNER JOIN departments ON departments.dept_no = dept_manager.dept_no);

--List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM ((employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no)
INNER JOIN departments ON departments.dept_no = dept_emp.dept_no);

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM ((employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no)
INNER JOIN departments ON departments.dept_no = dept_emp.dept_no)
WHERE dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM ((employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no)
INNER JOIN departments ON departments.dept_no = dept_emp.dept_no)
WHERE dept_name = 'Sales' OR dept_name = 'Development';

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT employees.last_name, COUNT(employees.last_name) AS "Last Name Count"
From employees
GROUP BY employees.last_name
ORDER BY "Last Name Count" DESC;