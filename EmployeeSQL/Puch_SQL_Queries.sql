--Queries for Data Analysis 
--List the emoloyee number, last name, first name, sex and salary of each employee.
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary 
from employees e
join salaries s
on e.emp_no = s.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.
select first_name, last_name, hire_date 
from employees
where hire_date > date '1986-01-01' 
and hire_date < date '1987-01-01';

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
select m.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name 
from employees e
join dept_manager m ON m.emp_no = e.emp_no
join departments d on d.dept_no = m.dept_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
select de.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name 
from dept_emp de
join employees e on e.emp_no = de.emp_no
join departments d on d.dept_no = de.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select * from employees
where sex = 'M'
and first_name = 'Hercules'
and last_name like 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.
select d.emp_no, e.last_name, e.first_name 
from dept_emp d
join employees e
on e.emp_no = d.emp_no
where dept_no in
	(select dept_no 
	from departments
	where dept_name = 'Sales');

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select de.emp_no, e.last_name, e.first_name, d.dept_name 
from dept_emp de
join employees e on e.emp_no = de.emp_no
join departments d on d.dept_no = de.dept_no
where de.dept_no in
	(select dept_no 
	from departments
	where dept_name in ('Sales', 'Development'));


--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
select last_name, count(last_name) 
from employees
group by last_name;


