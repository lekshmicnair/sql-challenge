--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT 
	e.emp_no as "employee number", 
	e.last_name,
	e.first_name,
	e.sex,
	s.salary
FROM
employees e
INNER JOIN salaries s ON
e.emp_no=s.emp_no
ORDER by e.emp_no;
	

--List first name, last name, and hire date for employees who were hired in 1986.
SELECT 
	first_name,
	last_name,
	hire_date
FROM employees
WHERE hire_date >= '1986-01-01' AND
	   hire_date < '1987-01-01'
ORDER BY hire_date;

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT 
	dm.dept_no,
	dept.dept_name,
	emp.emp_no,
	emp.last_name,
	emp.first_name
FROM dept_manager dm
INNER JOIN employees emp ON
dm.emp_no=emp.emp_no
INNER JOIN departments dept ON
dept.dept_no=dm.dept_no
ORDER BY dm.dept_no;


--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT 
	emp.emp_no,
	emp.last_name,
	emp.first_name,
	dept.dept_name
FROM employees emp
INNER JOIN dept_emp demp ON
demp.emp_no=emp.emp_no
INNER JOIN departments dept ON
dept.dept_no=demp.dept_no
ORDER BY emp.emp_no;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT 
	first_name,
	last_name,
	sex
FROM employees
WHERE first_name='Hercules' AND
	   last_name like 'B%';


--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT 
	emp.emp_no,
	emp.last_name,
	emp.first_name,
	dept.dept_name
FROM employees emp
INNER JOIN dept_emp demp ON
demp.emp_no=emp.emp_no
INNER JOIN departments dept ON
dept.dept_no=demp.dept_no
WHERE dept.dept_name='Sales'
ORDER BY emp.emp_no;


--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT 
	emp.emp_no,
	emp.last_name,
	emp.first_name,
	dept.dept_name
FROM employees emp
INNER JOIN dept_emp demp ON
demp.emp_no=emp.emp_no
INNER JOIN departments dept ON
dept.dept_no=demp.dept_no
WHERE dept.dept_name='Sales' OR dept.dept_name='Development'
ORDER BY emp.emp_no;

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT 
	last_name,
 	count(last_name) as lastname_count
FROM employees
GROUP BY last_name
ORDER BY lastname_count DESC;
