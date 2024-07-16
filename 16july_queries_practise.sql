-- string function
-- codes on datetime
-- case questions/pivot
-- miscellanious questions

-- Write a query to display the employee_id, first_name, last_name, salary, and a column indicating whether the salary is 'High', 'Medium', or 'Low'. Assume that:
	-- Low salary is less than 8000.
	-- Medium salary is between 8000 and 12000.
	-- High salary is greater than 12000.
	-- Syntax:
		-- case 
		-- 	when <condition1> then <statement>
		-- 	when <condition1> then <statement>
		-- 	.
		-- 	.
		-- end as <alias>
			
	
	select 
		employee_id,first_name,
		case 
			when salary < 8000 then 'Low'
			when salary > 8000 and salary < 1200 then 'Medium'
			when salary > 1200 then 'High'
			else 'Normal'
			end as salary_range	,salary
	from employees
	select * from employees
-- write a query to generate the average salary under each manager
	select
		m.employee_id as manager_id,
		m.first_name as manager_name,
		avg(e.salary) as avg_salary
	from employees e
	join employees m
	on e.manager_id = m.employee_id
	group by m.employee_id,m.first_name
	
	select * from employees
-- NULL handling query : Write a query to display 
	-- the employee_id, first_name, last_name, --
	-- phone_number, and email. If the phone_number is NULL, 
	-- display '000.000.0000'.
	select phone_number,coalesce(phone_number,'000.000.0000') as 
	from employees
	-- where phone_number is null
	
-- Write a query to display the 
	-- employee_id, first_name, last_name, 
	-- and a new column that combines the first name and last name into a single string separated by a space.
	
-- Write a query to display the employee_id, first_name, last_name, and the length of the first name.
-- Write a query to display the employee_id, first_name, last_name, the first name in uppercase, and the last name in lowercase.
-- Write a query to display the employee_id, first_name, last_name, and the first name with any leading and trailing spaces removed.
-- Write a query to display the employee_id, first_name, last_name, and the last name with all occurrences of the letter 'e' replaced with '3'.

-- Write a query to display the employee_id, first_name, last_name, and the year each employee was hired.
-- Write a query to display the employee_id, first_name, last_name, and the hire_date. Also, display the date that is 6 months after the hire_date.
-- Write a query to display the employee_id, first_name, last_name, and the number of days between the hire_date and today's date.
-- Write a query to display the employee_id, first_name, last_name, and hire_date for employees who were hired in the year 2000.
-- Write a query to display the employee_id, first_name, last_name, and hire_date for employees who were hired in the last 30 days.

-- remove duplicates from a table
-- total records from employee and dept table

