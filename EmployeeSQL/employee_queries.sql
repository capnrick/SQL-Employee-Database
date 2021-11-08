--Data Analysis

--database created using employee_logical_ERD_Postgre.sql file

--Once you have a complete database, create queries to do the following:

--1.List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT emp.emp_no,
	   emp.last_name,
	   emp.first_name,
	   emp.sex,
	   s.salary
FROM salaries as s
INNER JOIN employees AS emp ON
emp.emp_no = s.emp_no;

--2.List first name, last name, and hire date for employees who were hired in 1986.

SELECT	first_name,
		last_name,
		hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;


--3.List the manager of each department with the following information: department number, department name, the manager's employee number, 
--last name, first name.

SELECT	depm.dept_no,
		dep.dept_name,
		depm.emp_no,
		emp.last_name,
		emp.first_name
FROM departments AS dep
LEFT JOIN dept_manager AS depm ON
dep.dept_no = depm.dept_no
LEFT JOIN employees AS emp ON
depm.emp_no = emp.emp_no;


--4.List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT 	emp.emp_no,
		emp.last_name,
		emp.first_name,
		departments.dept_name
FROM employees AS emp
JOIN dept_emp ON emp.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dep_no = departments.dept_no;

--found typo error for column name in dept_emp table, should be dept_no and not dep_no, will use dep_no to reference column


--5.List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name,last_name,sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';


--6.List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT 	emp.emp_no,
		emp.last_name,
		emp.first_name,
		dep.dept_name
FROM employees AS emp
LEFT JOIN dept_emp AS depe ON emp.emp_no = depe.emp_no
LEFT JOIN departments AS dep ON depe.dep_no = dep.dept_no
WHERE dept_name = 'Sales';

--7.List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT 	emp.emp_no,
		emp.last_name,
		emp.first_name,
		dep.dept_name
FROM employees AS emp
LEFT JOIN dept_emp AS depe ON emp.emp_no = depe.emp_no
LEFT JOIN departments AS dep ON dep.dept_no = dep.dept_no
WHERE dept_name='Sales'
OR dept_name='Development';


--8.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name) AS "Number of people with Last Name"
FROM employees
GROUP BY last_name
ORDER BY "Number of people with Last Name" DESC;

--epilogue--Evidence in hand, you march into your boss's office and present the visualization. 
--With a sly grin, your boss thanks you for your work. 
--On your way out of the office, you hear the words, "Search your ID number." 
--You look down at your badge to see that your employee ID number is 499942
SELECT * FROM employees
WHERE emp_no=499942;

--empoloyee's name is April Foolsday, and not even hired on April, hired on Feb 10, 1997