-- 1. List the following details of each employee: employee number, last name, first name,
-- gender, and salary.

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary 
FROM salaries
JOIN employees 
ON employees.emp_no=salaries.emp_no; 

-- 2. List employees who were hired in 1986. 

SELECT * FROM employees
WHERE hire_date >= '01/01/1986'
AND hire_date <= '12/31/1986'; 

-- 3. List the manager of each department with the following information: department number,
-- department name, the manager's employee number, last name, first name, and start and 
-- end employement dates. 

SELECT departments.dept_no, departments.dept_name, dept_managers.emp_no, employees.last_name, employees.first_name, dept_managers.from_date, dept_managers.to_date 
FROM departments
JOIN dept_managers
ON departments.dept_no=dept_managers.dept_no
JOIN employees
ON dept_managers.emp_no=employees.emp_no; 

-- 4. List the department of each employee with the following info: employee number, last name,
-- first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_managers
JOIN employees
ON dept_managers.emp_no=employees.emp_no
JOIN departments
ON dept_managers.dept_no=departments.dept_no;

-- 5. List all the employees whose first name is "Hercules" and last name begins with "B". 

SELECT * FROM employees 
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name,
-- first name, and department name.

SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM departments
JOIN dept_emp
ON departments.dept_no=dept_emp.dept_no
JOIN employees
ON employees.emp_no=dept_emp.emp_no
WHERE dept_name = 'Sales';

-- 7. List all the employees in the Sales and Development departments, including their employee number,
-- last name, first name, and department name. 
 
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM departments
JOIN dept_emp
ON departments.dept_no=dept_emp.dept_no
JOIN employees
ON employees.emp_no=dept_emp.emp_no
WHERE dept_name = 'Sales'
OR dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e. how many people share
-- the same last name. 
 
SELECT last_name, COUNT(last_name) AS "Last Name Count"
FROM employees
GROUP BY last_name
ORDER BY "Last Name Count" DESC; 

