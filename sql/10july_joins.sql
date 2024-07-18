-- joins
-- cte
-- ER diagram
-- question on join- left,inner, self
-- analytical functions
-- questions on analytical functions

--syntax
-- select <column_name>
-- from <table_1> alias_table1
-- <type_of join >join <table_2> alias_table2

-- TYPES OF JOINS
	-- LEFT JOIN - all the rows from the left table and the matching rows
	-- RIGHT JOIN- all the rows from the left table and the matching rows
	-- INNER JOIN - all the rows from the left table and the matching rows
	-- FULL JOIN -  all the rows from both the tables
	-- SELF JOIN - self join

-- Retrieve a list of employees along with their department names.
select *
from employees e
join departments d
on e.department_id = d.department_id;
-- join any_other_table at
-- on e.tbl_id = at.tbl_id;

select * from employees
where employee_id in (201,202);
select * from departments;
update employees set department_id = NULL where department_id= 2
-- left table - employees right table - department
select * from employees
-- Retrieve a list of all departments and 
-- the employees in those departments, including departments with no employees.
select *
from employees e
right join departments d
on e.department_id = d.department_id;
-- Retrieve a list of 
-- all employees and their department names, 
-- including employees not assigned to any department.
select *
from employees e
left join departments d
on d.department_id = e.department_id;
-- Retrieve a list of all departments and employees, 
-- showing all departments and employees regardless of whether they are assigned.
select *
from employees e
full join departments d
on e.department_id = d.department_id;

-- self join explaination 

select employee_id, first_name,manager_id
from employees
-- Retrieve a list of 
-- employees with thier manager name -- interview question in variation
select *
from employees e
join employees e1
on e.manager_id = e1.employee_id;

-- 1 -get all the employees whose salary is greater than thier manager
select *
from employees e
join employees e1
on e.manager_id = e1.employee_id;
where e.salary>e1.salary
-- 2- get all the employees whose working city is in "London" or Munich
select *
from employees e
join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id
where l.city in ("London" ,"Munich")
-- 3- get all the employees whose salary is greater than 
-- thier job title min_salary
select * 
from employees e
join jobs j
on e.job_id = j.job_id
where e.salary> j.min_salary

-- 4 - get the total number of employees in each region
select r.region_id,r.region_name,count(employee_id)
from employees e
join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id
join countries c
on l.country_id = c.country_id
join regions r
on c.region_id = r.region_id
group by r.region_id,r.region_name
-- 5 -Retrieve the total salary expenditure for each department, 
-- listing the department name and total salary.
select d.department_name,sum(e.salary) as total_salary
from employees e
join departments d
on e.department_id = d.department_id
group by d.department_id,d.department_name
-- 6 -Retrieve the count of employees in each department,
-- including departments with no employees.
select d.department_name,count(distinct e.employee_id)
from employees e
right join departments d
on e.department_id = d.department_id
group by d.department_id,d.department_name
-- 7- Retrieve the total salary expenditure for 
-- each department where the total expenditure is greater than 100,00
-- listing the department name and total salary.
select d.department_name,sum(e.salary) total_expediture
from employees e
right join departments d
on e.department_id = d.department_id
group by d.department_id,d.department_name
having sum(e.salary) > 10000

