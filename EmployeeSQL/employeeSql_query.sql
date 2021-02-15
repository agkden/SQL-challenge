
/******************************
	Data Analysis
******************************/

-- List the following details of each employee: employee number, last name, first name, sex, and salary.

select
	e.emp_no as "Employee Number"
	,e.last_name as "Last Name"
	,e.first_name as "First Name"
	,e.sex as "Gender"
	,s.salary as "Salary"
from
	Employees as e
join
	Salaries as s on e.emp_no = s.emp_no
order by
--	e.last_name, e.first_name;
	"Last Name", "First Name";

-- List first name, last name, and hire date for employees who were hired in 1986.

select
	e.emp_no as "Employee Number"
	,e.first_name as "First Name"
	,e.last_name as "Last Name"
	,e.hire_date as "Hire Date"
from
	Employees as e
where
	e.hire_date between '1/1/1986' and '12/31/1986'
order by
	e.hire_date;
	

-- List the manager of each department with the following information:
-- department number, department name, the manager's employee number, last name, first name.

select
	d.dept_no as "Department Number"
	,d.dept_name as "Department Name"
	,e.emp_no as "Employee Number"
	,e.last_name as "Last Name"
	,e.first_name as "First Name"
from
	Employees as e 
join
	Dept_manager as dm on e.emp_no = dm.emp_no
join
	Departments as d on dm.dept_no = d.dept_no
order by
--	e.last_name, e.first_name;
--	"Last Name", "First Name";
	"Department Number";

-- List the department of each employee with the following information:
-- employee number, last name, first name, and department name.

select
	e.emp_no as "Employee Number"
	,e.last_name as "Last Name"
	,e.first_name as "First Name"
	,d.dept_name as "Department Name"
from
	Employees as e 
join
	Dept_emp as de on e.emp_no = de.emp_no
join
	Departments as d on de.dept_no = d.dept_no
order by
--	e.last_name, e.first_name;
	"Last Name", "First Name";



-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

select
	e.first_name as "First Name"
	,e.last_name as "Last Name"
from
	Employees as e
where
	e.first_name = 'Hercules'
  	and e.last_name like 'B%'
order by
--	e.last_name;
	"Last Name";

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.

select
	e.emp_no as "Employee Number"
	,e.last_name as "Last Name"
	,e.first_name as "First Name"
	,d.dept_name as "Department Name"
from
	Employees as e 
join
	Dept_emp as de on e.emp_no = de.emp_no
join
	Departments as d on de.dept_no = d.dept_no
where
	d.dept_name = 'Sales'
order by
--	e.last_name, e.first_name;
	"Last Name", "First Name";


-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

select
	e.emp_no as "Employee Number"
	,e.last_name as "Last Name"
	,e.first_name as "First Name"
	,d.dept_name as "Department Name"
from
	Employees as e 
join
	Dept_emp as de on e.emp_no = de.emp_no
join
	Departments as d on de.dept_no = d.dept_no
-- where
-- 	d.dept_name = 'Sales'
--  or d.dept_name = 'Development'
where
	d.dept_name in ('Sales', 'Development')
order by
--	e.last_name, e.first_name;
	"Last Name", "First Name";


-- In descending order, list the frequency count of employee last names,
-- i.e., how many employees share each last name.

select
	e.last_name as "Last Name"
	,count(e.last_name) as "Last Name Frequency"
from
	Employees as e
group by
	e.last_name
order by
	count(e.last_name) desc;



