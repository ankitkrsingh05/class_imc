-- git
-- alter table
-- distinct
-- ordering
-- aggregate function
-- index
-- date functions
-- documentation
-- set operations - 
-- joins

-- altering of column nam
-- altering of column type
ALTER table employee ALTER COLUMN date_of_join TYPE date
-- altering of adding column
-- alter table <table_name> add column <column_name> <data_type>
alter table employee add column bonus int;
-- droping column
-- alter table <table_name> add column <column_name> <data_type>
alter table employee drop column bonus not null;

-- adding constraints -- naming contraints -- dropping constraints
-- alter table <constraint> add constraints <constraint_name> <constraint> ON (<columns list>)
alter table employee_temp 
add constraint pk_id PRIMARY KEY (emp_id,emp_fname)

alter table employee_temp drop constraint pk_id

select * from employee

-- list me all the departments from the employee table
select distinct dept from employee

-- anlytical functions
select count(*),max(salary),min(salary),avg(salary)
from employee

-- select <function(<column_name>)>
-- from <table_name>
-- group by <column_list>
--
-- 

-- write a sql query to 
-- find the number of members in each dept
-- total members,total salary,max salary,min_salary,avg salary
-- 
select 
	dept,
	count(emp_id) emp_cnt,
	sum(salary) total_sal,
	max(salary) max_sal,
	min(salary) min_sal,
	avg(salary) avg_sal,
	min(emp_fname)
from employee
group by dept
having sum(salary) > 1000000
order by dept,avg_sal


-- write a query to get 
-- the max salary,avg salary, for each kind of employee,
-- sort the data based on the min salary for each designation
select 
max(salary),avg(salary)
from employee
group by designation
order by min(salary)

-- write a query to get 
-- the min,max salary of 
-- each city ordered by max_sal in each city
select min(salary),max(salary)
from employee
group by city
order by max(salary)
-- write a query to 
-- get the count of distinct 
-- designation in each city,
select 
city,count(distinct designation) as cnt_desig
from employee
group by city
order by cnt_desig

-- 
select dept from employee
group by dept

update employee set bonus=10 where dept = 'education';
update employee set bonus=15 where dept = 'insurance';
update employee set bonus=20 where dept = 'healthcare';
update employee set bonus=25 where dept = 'finance';
update employee set bonus=30 where dept = 'automotive';

select * from employee
--- write a query to find 
-- the total distinct city 
-- for each designation
-- where city is either rnc,

-- write a query to get 
-- the count of employees whose 
-- salary is greater than the avg company salary
select count(emp_id)
from employee
where salary > 
(select avg(salary)
 from employee)

select * from employee 

select count(emp_id)
from employee
where salary >
-- write a query to find 
-- the sum of salary of employees for each city 
-- whose min bonus is between 10 - 25


-- subquery
create table dept as (
select distinct dept_id as dept_id 
from employee)
-- write a query to find 
-- the employees 
-- whose salary is greater than the dept table avg salary
select *
from employee
where salary >
(select avg(dept_sal) from dept)

select * from dept
update dept set dept_sal = 100000 where dept_id in ('healthcare','education')
)

-- UNION,UNION ALL,INTERSECT,MINUS
select dept from employee
union
select dept_id from dept
-- UNION ALL
select dept from employee
union all
select dept_id from dept
-- INTERSECT
select dept from employee
intersect
select dept_id from dept
-- MINUS

-- indexes makes the query fast 
-- we need to add the indexes in the condition/filtering clause
-- O(1) time complexity
create index <index> on <column_name>
--
create index index_cols on employee(dept)

select * from employee
where dept = 'finance'


-- sub query questions
-- joins all types,all joins
-- analytical function - partition by - important
-- interview question for count of rows
-- all datetime functions and questions
-- questions - interview
