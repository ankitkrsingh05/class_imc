-- Database: imarticus

-- DROP DATABASE IF EXISTS imarticus;

-- DML - Data manipulation language - UPDATE,DELETE,INSERT
-- DDL - Data definition language -CREATE,ALTER,TRUNCATE,DROP,RENAME
-- DQL - Data query language - SELECT

-- JOB Role requirement :
	-- 

-- datatypes: int,float,date,char,varchar,datetime
-- contraints: not null,unique,primary key
-- primary key is the uniquely identifiable key in a table which cannot be null
-- primary key - not null + unique

create table employee (
emp_id int primary key,
emp_fname varchar(30),
emp_lname varchar(30),
salary float not null,
dept varchar(20),
designation varchar(20),
city varchar(20);
insert into employee (emp_id,emp_fname,emp_lname,salary,dept,designation,city)
values (1,'rudransh','maurya',2000000.0,'finance','Manager','LCN' ),
(2,'farhan','khan',320000.0,'insurance','Data Analyst','JPR' ),
(3,'Ankit','Singh',2130000.0,'automotive','Data Analyst','TN' ),
(4,'Ravikash','Verma',112000.0,'education','Manager','RNC' ),
(5,'Vikas','maurya',1040000.0,'healtcare','Manager','BBS' )


insert into employee
values (6,'Akash','Gupta',1040000.0,'healtcare','Data Analyst ','BBS' ),
(7,'Vikas','maurya',9890000.0,'education','Data scientist','DEL' ),
(8,'Vikas','maurya',8090000.0,'finance','Software Engineer','LCN' )


-- Data querying 

select * 
from employee;

select emp_id,emp_fname,emp_lname,salary,dept,designation,city
from employee;


create table temp_table as ( 
select emp_id,salary,dept
from employee)

select * from temp_table;

CRUD - 

-- CREATE
--CREATE db,table
-- READ
--filtering/ 
-- where,having (condtion on group by)
-- and,or,in , between<lower_value> and <upper_value>, =,<,>,!=,<>,
-- like,ilike,wildcharacters
select * from employee;
-- All the employees where salary > 100000,
select * from employee where salary > 100000;
-- All the employees where salary < 100000,
select * from employee where salary < 100000;
-- All the employees whose city is either RNC,DEL
select * from employee where city = 'RNC' or city = 'DEL';
select * from employee where city in ('RNC','DEL');
-- ALL the employees who are not manager
select * from employee where designation <> 'Manager'
select * from employee where designation != 'Manager'; 
-- ALL the employees who have the salary between 100000 and 200000
select * from employee where salary between 1000000 and 2000000
-- ilike,like,wildcard usage
-- 
-- select all the employee whose first name starts with a
select * from employee where emp_fname like 'a%'

-- select all the employee who has u in their last name
select * from employee where emp_lname ilike '%u%'
-- select all the employees whose first_name has exactly 5 characters
select * from employee where emp_fname ilike '_____'
-- select all the employees whose last_name ends with a
select * from employee where emp_lname ilike '%a'
-- select all the employees 
-- whose last_name ends with a and has a salary greater than 100000 
-- and works in healtcare dept
select * from employee 
where emp_lname ilike '%a' and salary > 100000 and dept = 'healtcare'
-- for null
-- condition for is null
insert into employee
values (9,'Akash',NULL,1040000.0,'healtcare','Data Analyst ','BBS' ),
(10,'Vikas',NULL,9890000.0,'education',NULL,'DEL'),
(11,'Vikas',NULL,8090000.0,'finance',NULL,'LCN')

-- select all the employees whose last name is null
select * from employee where emp_lname is null
-- select all the employees whose designation is not null
select * from employee  where designation is not null

--alter table <table_name> add column <column_name> <data type>
-- alter table <table_name> alter column 
alter table employee add column doj date;
-- ALTER TABLE table_name DROP COLUMN column_name;
-- ALTER TABLE table_name ALTER COLUMN column_name TYPE datatype;
-- ALTER TABLE table_name ALTER COLUMN column_name TYPE datatype;
-- 
-- update <table_name> set <column_name> = <value>,<column_name> = <value>... where <condition>
update employee 
set city= 'LKN',salary = 250000 
where city = 'LCN'
--
ALTER table employee RENAME doj to date_of_join 

create table employee_temp as ( 
select *
from employee)

select * from employee
-- DELETE (DML)
-- delete from <table_name> where <condition>
-- delete all the employees 
-- whose designation is Software Engineer/ starts with software 
delete from employee_temp where designation ='Software Engineer'
delete from employee_temp where designation ilike 'software%'
delete from employee_temp where designation like 'Software%'
-- drop table
drop table employee_temp
-- to delete the database
drop database test
-- delete all the employee whose designation is not data anallyst

-- TRUNCATE (DDL)
TRUNCATE employee
-- DROP (DDL)

-- DIFFERENCES IN DEPTH
--  DROP -  ddl drops the complete table
-- TRUNCATE     - DELETE
delete from employee_temp - DML
truncate employee_temp - DDL
-- 

select * from employee

alter table employee add column dept_id int

select distinct dept from employee
-- For understanding of 1- many reationship 
-- and primary key and foreign key
update employee set dept_id= 1 where dept = 'education'
update employee set dept_id= 2 where dept = 'insurance'
update employee set dept_id= 3 where dept = 'healtcare'
update employee set dept_id= 4 where dept = 'finance'
update employee set dept_id= 5 where dept = 'automotive'

