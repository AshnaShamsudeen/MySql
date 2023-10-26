create database ust_db;
use ust_db;
create table employee(emp_id numeric(5),
					  emp_name varchar(50),
					  email varchar(50),
					  salary numeric(10,2));
-- How to create a table --
-- Employee-
-- emp_id : numeric(5)
-- emp_name:varchar(50)
-- email : varchar(50)
-- salary :numeric(10,2)


-- How to see all the tables in a DB
SHOW TABLES;

-- how to see the description of a table

desc employee;

-- How to inser some data
-- varchar values in single qoutes

insert into employee values(1001,'Suraj','suraj@yahoo.com',65000);
insert into employee values(1002,'Mohit','mohit@gmail.com',52000);
insert into employee values(1003,'Gaurav','gaurav@yahoo.com',55000);
insert into employee values(1004,'Harsh','harsh@gmail.com',68000);
insert into employee values(1005,'Javed','javed@yahoo.com',85000);

-- How to see the data

select * from employee;

-- altering a table(add anew column hire_date to employee table)

alter table employee add hiredate date;

-- change the data type to numeric(9,2) for salary column
alter table employee modify salary numeric(9,2);
-- add a primary key 
alter table employee add primary key(emp_id);

-- delete a column
alter  table employee drop salary;

-- delete the table
drop table employee;

-- clear all data
truncate table employee;

-- How to update the hiredate
update employee set hiredate='2020-04-27' where emp_id=1001;
update employee set hiredate='2021-04-20' where emp_id=1002;
update employee set hiredate='2020-04-15' where emp_id=1003;
update employee set hiredate='2019-04-10' where emp_id=1004;
update employee set hiredate='2015-05-20' where emp_id=1005;

-- how to delete a record

delete from employee where emp_id=1001;

insert into employee values(1001,'Suraj','suraj@yahoo.com',65000,'2020-04-27');
-- VIEWING ALL THE DATA
 select * from employee;
 
 -- find an employee by id
 select * from employee where emp_id=1002;
 
  -- find an employee by name
 
select * from employee where emp_name='Suraj';

-- find employee with salary >65000
select * from employee where salary>65000;


-- find employee with salary b/w 60000 and 70000
select * from employee where salary>=60000 AND salary<=70000 ;
select * from employee where salary BETWEEN 60000 AND 70000 ;

-- SHOW THE DETAILS OF THE EMPLOYEES WITH EMPLOYEE ID 1002,1005,1003
select * from employee where emp_id=1002 OR emp_id=1005 OR emp_id=1003 ;
select * from employee where emp_id IN(1002,1005,1003) ;

-- SORTING DATA DESCENDING ORDER
select * from employee ORDER BY SALARY DESC;
 
-- SORTING DATA ASCENDING ORDER
select * from employee ORDER BY SALARY ASC;

-- DISPLAY THE EMPLOYEE ID ,NAME AND SALARY
SELECT EMP_ID,EMP_NAME,SALARY FROM EMPLOYEE;

alter table employee add designation varchar(50);
update employee set designation='Clerk' where emp_id=1001;
update employee set designation='Salesman' where emp_id=1002;
update employee set designation='Analyst' where emp_id=1003;
update employee set designation='Clerk' where emp_id=1004;
update employee set designation='Manager' where emp_id=1005;
insert into employee values(2002,'Karan','karan@yahoo.com',75000,'2019-10-20','Analyst');
insert into employee values(2001,'Priyanka','priyanka@yahoo.com',72000,'2018-05-20','Analyst');

-- find all the jobs available in empoloyee table
select designation from employee;

-- find all unique jobs available in empoloyee table
select distinct designation from employee;



-- find the annual salary of each employee
select emp_name,salary,salary*12 as "annual salary" from employee;

-- Exercises

-- Find all the salesman
select emp_name from employee where designation='Salesman';

-- find the analysts earning more than 60000

select emp_name from employee where designation='Analyst' AND Salary>60000;

-- update the salary of each employee by 15%

update  employee set salary= salary*1.15 where emp_id in(1001,1002,1003,1004,1005,2001,2002);
 

-- increase salary of each clerk by 2000 Rs
select emp_name,salary,salary+2000 as "new salary" from employee where designation='Clerk'; 

update employee set salary=salary+2000 where emp_id in(1001,1004) ;
-- add a new coulmn dept with data-type numeric(3)
alter table employee add dept numeric(3);
select * from employee;
use ust_db;
-- insert data for dept coulumn for each employee.
-- (3 Depts - 10,20,30)
update employee set dept= 10 where emp_id=1001;
update employee set dept= 10 where emp_id=1002;
update employee set dept= 20 where emp_id=1003;
update employee set dept= 20 where emp_id=1004;
update employee set dept= 30 where emp_id=1005;
update employee set dept= 30 where emp_id=2001;
update employee set dept= 10 where emp_id=2002;



-- find all the employees belonging to dept 10
select * from employee where dept=10;
-- find the analysts is dept 20
select * from employee where dept= 20 and designation='Analyst';

-- find all the employees who are either clerk or analyst
select * from employee where designation='Clerk' or designation='analyst';
-- sort the employees based on dept no asc and salary desc

select * from employee ORDER BY DEPT,SALARY DESC ;
select * from employee ORDER BY SALARY DESC;


-- Grouping functions --

-- avg
select avg(salary) as 'average salary' from employee;

-- find the total employee count
select count(*) as 'total employees' from employee;

-- find the total salary in employee table
select sum(salary) as 'total salary' from employee;

-- find the total no. of employees in each department
select dept,count(*) as 'total employees' from employee group by dept;

-- find the avg salaries based on jobs

select designation,avg(salary) as 'new salary' from employee group by designation;


-- find the max,min,avg & total count based on jobs.
select designation,max(salary) as 'maximum salary',
					min(salary) as 'minimum salary',
					avg(salary) as 'average salary',
					count(*) as'total count' 
					from employee group by designation;

-- find the avg salary of dept no. 20.

select dept,avg(salary) as 'average salary' from employee where dept=20;

-- find the departments with more than 3 employees
select dept ,count(*) as' no of employees' from employee group by dept having count(*)>=3;

-- find the year of joining of each employee

select emp_name,extract(year from hiredate)
				as'joining year' from employee;
                
-- find the total experience of each employee
select emp_name,datediff(curdate(),hiredate)/365
				as 'total Exp.' from employee;
                
select emp_name,extract(year from now())-extract(year  from hiredate)
				as 'total exp.' from employee order by 2 desc;
                
                
-- Joins --

-- create a  table dept with dept(10,20,30,40),deptname(IT,Accounts,Sales,Management),
-- location(Banglore,tvm,chennai,kolkata)
                
	create table department (dept numeric(3),deptname varchar(50),location varchar(50));
    select * from department;
    insert into department values(10,'IT','Banglore');
    insert into department values(20,'Accounts','Trivandrum');
    insert into department values(30,'Sales','Chennai');
    insert into department values(40,'Management','Kolkata');

drop table department;

-- find all employees with dept details
select emp_id,emp_name,e.dept,deptname,location from employee e join department d 
												on e.dept=d.dept;
                                                
-- find all the employees working in trivandrum
select emp_id,emp_name,e.dept,deptname,location from employee e join department d on e.dept=d.dept where location='trivandrum';
-- dispaly the dept inf along with employee count
select d.dept,deptname ,count(*)from department d join employee e on e.dept=d.dept group by dept;
-- find the dept with no employees
-- find the dept with highest employees


drop table department;
create table department(dept numeric(3) primary key, -- auto_increment,
						dept_name varchar(50) unique not null,location varchar(50));
                        select * from department;
    insert into department values(10,'IT','Banglore');
    insert into department values(20,'Accounts','Trivandrum');
    insert into department values(30,'Sales','Chennai');
    insert into department values(40,'Management','Kolkata');
                        
-- Foregn key

alter table employee add constraint fk_dept foreign key(dept) references department(dept); 
-- Joins

select emp_id,emp_name,location from employee e left join department  d on e.dept=d.dept;
-- find dept with no employees
select location,d.dept,dept_name from employee e right join department  d on e.dept=d.dept where e.emp_id is null;
-- find the dept with  highest employee
select d.dept,dept_name, count(e.dept) as 'total employees' from department d left join employee e on d.dept=e.dept group by e.dept order by 3 desc limit 1;
-- find all the employees working in trivandrum
-- select * from employee where dept =(select dept from department where employeeemp_idemployeeemployee location='Trivandrum');
select * from customer_data;


select * from department;
select * from employee;
-- Retrieve a list of employees along with their corresponding department names
select  emp_name,dept_name from employee join department using(dept);
select  emp_name,dept_name from employee e join department d on e.dept=d.dept;
select  emp_name,dept_name from employee  join department where employee.dept=department.dept;


-- Retrieve the total number of employees in each department
select dept_name,count(*) as "Total" from employee e right join department d using(dept) group by dept_name;


-- Retrieve the highest salary in each department


select emp_name,max(salary) as "highest salary" from employee;

-- Retrieve the average salary for employees in each department

select dept_name,avg(salary) as "average salary" from employee e right join department d using(dept) group by dept_name;

-- Retrieve the average salary for employees in Sales department
select dept_name,avg(salary) as "average salary" from employee e right join department d using(dept) where dept_name="Sales";