-- get the top 3 salaried employees from each department
-- using subquery
-- issues with subquery
	-- can be used only once
	-- once calculated rank cannot be used again and again
-- benefits of cte (common table expression)
	-- makes the query modular
	-- the same cte can be used multiple times
select first_name,department_id,salary,rnk_salary
from (
select first_name,department_id,salary, 
dense_rank() over (partition by department_id order by salary desc) as rnk_salary
from employees 
where department_id = 6
order by salary desc
) as total_sal
where rnk_salary <=3

-- cte
with cte as(
select first_name,department_id,salary, 
dense_rank() over (partition by department_id order by salary desc) as rnk_salary
from employees 
where department_id = 6
order by salary desc
) 

select * from cte
where rnk_salary <=3;
-- get the 3rd highest salaried employee from  each department,
select * from cte
where rnk_salary =3

-- get the top 2 salaried employees from each department

-- get the 2nd employee from each department sorted by name
with cte as(
select first_name,department_id,salary, 
dense_rank() over (partition by department_id order by first_name) as rnk_name
from employees 
where department_id = 6
order by salary desc
) 
select first_name
from cte
where rnk_name = 2

-- we have a table with team name onto it
-- generate all the matches between individual team
-- make sure that the same team is not matched with itself -- interview question
create table cricket
(
teams varchar(20)
);
select * from cricket c1
join cricket c2
on c1.teams < c2.teams
order by c1.teams
select * from cricket;
insert into cricket (teams)
values 
('Australia'),
('India'),
('South Africa'),
('Pakistan'),
('Bangladesh')

--output 
australia india
india sout africa
south africa bangladesh
india pakistan

-- write a query to find all 
-- the employees whose manager have 5 letters in thier names and 
-- and have salary greater than 
-- the next employee(based on hire data) in thier department
with cte as (
select e.employee_id employee_id,e.first_name employee_name,
m.employee_id manager_id, m.first_name manager_name,
e.salary,e.hire_date,e.department_id,
lead(e.salary) over (partition by e.department_id order by e.hire_date) next_person_sal
from employees e 
join employees m
on e.manager_id = m.employee_id
where m.first_name ilike '_____' and e.employee_id in (120,100)
)
select * 
from cte
where salary > next_person_sal

select * from employees
where employee_id in (120,100)
-- cummulative sum,avg,min,max --
-- get the salary cummulative sum in each department
select 
employee_id,department_id,salary,
sum(salary) over (partition by department_id order by salary rows between CURRENT ROW AND UNBOUNDED FOLLOWING) as cumm_sal
from employees
where department_id = 3

-- ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW: 
		--Includes all rows from the beginning of the partition up to the current row.
-- ROWS BETWEEN 1 PRECEDING AND CURRENT ROW: 
		-- Includes the current row and one preceding row.
-- ROWS BETWEEN CURRENT ROW AND 1 FOLLOWING: Includes the current row and one following row.
-- ROWS BETWEEN 2 PRECEDING AND CURRENT ROW: Includes the current row and two preceding rows.
-- ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING: Includes the current row and all following rows.

-- get chanage in salary over the dates for each dept
select employee_id,hire_date,department_id,salary,salary - lag(salary) over (partition by department_id order by hire_date)
from employees
where department_id = 6
order by department_id

