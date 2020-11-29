-- List the following details of each employee: employee number, last name, first name, sex, and salary.
select 	employees.emp_no as "Employee Number"
		,employees.last_name as "Last Name"
		,employees.first_name as "First Name"
		,employees.sex as "Sex"
		,salaries.salary as "Salary"
from
	employees join salaries on employees.emp_no = salaries.emp_no 

-- List first name, last name, and hire date for employees who were hired in 1986.
select 	employees.last_name as "Last Name"
		,employees.first_name as "First Name"
		,employees.hire_date as "Hire Date"
from
	employees
where
	employees.hire_date like '%1986'

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

select 	D.dept_no as "Department Number"
		,D.dept_name as "Department Name"
		,E.emp_no as "Manager''s Employee Number"
		,E.last_name as "Last Name"
		,E.first_name as "First Name"
from department D join dep_manager DM on D.dept_no = DM.dept_no
	join employees E on DM.emp_no = E.emp_no 

-- List the department of each employee with the following information: employee number, last name, first name, and department name.

select 	E.emp_no
		, E.last_name
		, E.first_name
		, D.dept_name
from
	employees E join dept_emp DE on E.emp_no = DE.emp_no
	join department D on DE.dept_no = D.dept_no

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B"

select 
	first_name
	, last_name
	, sex
from 
	employees
where
	first_name = 'Hercules' and last_name like 'B%'
	
-- List all employees in the Sales department, including their employee number, last name, first name, and department name.

select 	employees.emp_no as "Employee Number"
		, employees.last_name as "Last Name"
		, employees.first_name as "First Name"
		,'Sales' as "Department Name"
from employees
where employees.emp_no in
	(select emp_no from dept_emp
		where dept_no IN (select dept_no from department
			where dept_name = 'Sales'))

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select 	E.emp_no as "Manager''s Employee Number"
		,E.last_name as "Last Name"
		,E.first_name as "First Name"
		,D.dept_name as "Department Name"
from department D join dept_emp DE on D.dept_no = DE.dept_no
	join employees E on DE.emp_no = E.emp_no 
Where
	D.dept_name = 'Sales' or D.dept_name = 'Development' 

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select 	last_name
		, count(*) as "Count"
from employees 
group by last_name 
order by "Count" desc, last_name asc -- desc is as requested and for the lastname I am making it asc