-- last class query discussion

-- 8 -Retrieve the number of distinct jobs and 
-- the total number of employees in each department where the average salary is above50k
-- listing the department name, distinct job count, and total employee count.
select d.department_name,count(distinct e.job_id) as distinct_jobs, count(e.employee_id) total_employees
from employees e
join departments d
on e.department_id = d.department_id
group by d.department_id,d.department_name
having avg(e.salary) > 5000

-- 9 Retrieve the total salary expenditure for each department and location, 
-- listing the department name, location, and total salary, 
-- only for departments with more than 3 employees and locations in 'Seattle'.
select d.department_name,l.city,sum(e.salary) as total_expenditure,count(employee_id)
from employees e
join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id
group by d.department_id,d.department_name,l.city
having count(e.employee_id) > 3 and l.city = 'Seattle';
-- 10 Retrieve the departments that have the average salary
-- greater than avg company salary, listing the department name and average salary.
select d.department_id,d.department_name
from employees e
join departments d
on e.department_id = d.department_id
group by d.department_id,d.department_name
having avg(e.salary) > (select avg(salary) from employees)
-- find the avg salary from the employee table amd put it in subquery


CREATE TABLE table1 (
    id SERIAL PRIMARY KEY,
    value INTEGER
);
INSERT INTO table1 (value) VALUES (1), (2), (2), (NULL), (1), (2), (NULL), (4), (5);

CREATE TABLE table2 (
    id SERIAL PRIMARY KEY,
    value INTEGER
);
INSERT INTO table2 (value) VALUES (1), (1) , (1), (2),(NULL), (NULL), (1), (2), (NULL), (6);

-- Verify data in table1
SELECT value FROM table1 order by value;

-- Verify data in table2
SELECT value FROM table2 order by value;

-- join
-- left
-- right
-- inner
-- full


select count(*)
from table1 t1
join table2 t2
on t1.value=t2.value
union all

select count(*)
from table1 t1
left join table2 t2
on t1.value=t2.value

union all
select count(*)
from table1 t1
right join table2 t2
on t1.value=t2.value

union all
select count(*)
from table1 t1
inner join table2 t2
on t1.value=t2.value

union all
select count(*)
from table1 t1
full join table2 t2
on t1.value=t2.value

select value from table1 order by value
select value from table2 order by value
select t1.value,t2.value
from table1 t1
full join table2 t2
on t1.value = t2.value
order by t1.value

-- for each of the joins write the total number of records you would get

-- Analytical functions
-- cte

-- get the list of employees with their salaries and 
-- their rank within their department based on salary.

select * 
from employees 
where department_id = 6
order by salary desc
--
select e.employee_id,e.first_name,d.department_name,d.department_id,e.salary,rank() over (partition by d.department_id order by salary desc) as rank_within_dept
from employees e
join departments d
on e.department_id = d.department_id
where d.department_id = 6
order by department_id

--dense rank
select e.employee_id,e.first_name,d.department_name,d.department_id,e.salary,dense_rank() over (partition by d.department_id order by salary desc) as rank_within_dept
from employees e
join departments d
on e.department_id = d.department_id
where d.department_id = 6
order by department_id

-- dense rank
-- cte - common table expression
-- it makes the code modular(can be used multiple times)
-- get me the second highest salaried employee in each department --interview
WITH cte as (
	select employee_id,first_name, salary,department_id,
	dense_rank() over(partition by department_id order by salary desc) emp_rank
	from employees
)
select * 
from cte
where emp_rank =2;
-- Calculate Dense Rank of Employees by Hire Date in each department
select employee_id,first_name,hire_date
department_id,salary,
dense_rank() over (partition by department_id order by hire_date) as rank_hire_date
from employees e
where department_id = 6
order by hire_date

-- Calculate Percent Rank of Employees by Salary over the organization
select employee_id,first_name,hire_date,
department_id,salary,
DENSE_RANK() over (order by salary desc) as percent_rank_sal
from employees e
where department_id = 6
order by salary desc

-- number the employees ordered by their name in each department
select first_name,department_id,ROW_NUMBER() over (partition by department_id order by first_name) as emp_numbering
from employees
where department_id = 6
order by first_name

-- get the top 3 salaried employees from each department

-- get the 3rd highest salaried employee from  each department,

-- get the 2nd employee from each department sorted by name

-- get chanage in salary over the dates for each dept
select employee_id,hire_date,department_id,salary,salary - lag(salary) over (partition by department_id order by hire_date)
from employees
where department_id = 6
order by department_id

