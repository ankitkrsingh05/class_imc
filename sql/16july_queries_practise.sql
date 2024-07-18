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
	
-- Write a query to display 
	-- the employee_id, first_name, last_name, and the length of the first name.
	select length(first_name) first_name_length,first_name from employees
-- Write a query to display the employee_id, first_name, last_name, the first name in uppercase, and the last name in lowercase.

	select upper(first_name) as upper_first_name,
		lower(last_name) as lower_last_name
		from employees
-- Write a query to display the employee_id, first_name, last_name, and the first name with any leading and trailing spaces removed.
	select trim(first_name) as trim_firt_name,ltrim 
	from employees
-- Write a query to display the employee_id, first_name, last_name, and the last name with all occurrences of the letter 'e' replaced with '3'.
	select replace(first_name,'e','3') as replaced_first_name
	from employees

-- Write a query to display the employee_id, first_name, last_name, 
	-- and the year each employee was hired.
	
-- Write a query to display the employee_id, first_name, last_name,
	-- and the hire_date. Also, display the date that is 6 months after the hire_date.
SELECT 
hire_date ,hire_date + INTERVAL '6 months'
from employees
;
-- select all the employess 
	-- whose first name starts with a vowel
select first_name,lower(left(first_name,1)) first_letter,
lower(substring(first_name from 3 for 3)) third_letter
from employees
where lower(left(first_name,1)) in ('a','e','i','o','u')

-- rank the employess in each department based on quartiles
select 
department_id,salary,ntile(4) over (partition by department_id order by salary) as ntile
from employees 
where department_id = 6
-- write a query to display the information about 
	-- all the employees who have joined 1 month after 'steven'
	select * from employees
	where hire_date > 
	(select hire_date 
	from employees 
	where first_name = 'Steven') + INTERVAL '1 months'

-- Write a query to display the employee_id, first_name, last_name,
	-- and the number of days between the hire_date and today's date.
-- Write a query to display the employee_id, first_name, last_name,
	-- and hire_date for employees who were hired in the year 2000.
-- Write a query to display the employee_id, first_name, last_name,
	-- and hire_date for employees who were hired in the last 30 days.

-- write a query to get 
-- the change in total salary expenditure 
-- for the organisation over the years
-- Note : its important to make sure you have the ordering 
		--	in over clause for functions like : lag,lead,rank,row_number and other ordering based functions
with cte as (
select sum(salary) total_salary,EXTRACT(YEAR FROM hire_date) as hire_year
from employees
group by EXTRACT(YEAR FROM hire_date)
)
select total_salary,
lead(total_salary) over(order by hire_year),
lag(total_salary) over(order by hire_year),
total_salary - lead(total_salary) over(order by hire_year) as change_salary
from cte
-- Official documentation : https://www.postgresql.org/docs/current/queries.html

-- remove duplicates from a table
with cte as (
select *,
row_number() over (partition by employee_id,first_name,last_name,email,hire_date) rn
from employees
)
select * from cte where rn=1
-- create table test_duplicates
-- as (
-- select employee_id,first_name,last_name,email,hire_date
-- from employees)
-- select * from test_duplicates
-- insert into test_duplicates 
-- values (
-- 100,	"Steven",	"King",	"steven.king@sqltutorial.org")

-- total records from employee and dept table -- cross join
-- i.e: each record from the first table would join with all the records from the second table
-- get me all the duplicate records in the table
select employee_id,first_name,last_name,email,phone_number
from employees
group by employee_id,first_name,last_name,email,phone_number
having count(*) > 1
-- delete all the duplicate records from the table
with cte as(
select *,row_number() over (partition by employee_id,first_name,last_name,email,phone_number) as rn
from employees
)
-- 1 abc test abc@test 1
-- 1 abc tes abc@test 2
-- 2 cde efg abc@test 1
-- 2 cde efg abc@test 2
select * 
from cte
where rn = 1
-- post these the table would contain only the unique records
-- select * from employees
select count(*)
from employees,departments

select 40 * 11 ;