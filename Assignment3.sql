create database Assignment3;
use Assignment3;
drop table Department;
create table Department(
	dept_id integer(10),
    dept_name varchar(50) not null,
    constraint pk_dept_id primary key(dept_id)
    );
desc Department;

INSERT INTO Department VALUES (1,"Finance");
INSERT INTO Department VALUES (2,"Training");
INSERT INTO Department VALUES (3,"Marketing");		 

drop table Employee;
create table Employee(
	emp_id integer(10) ,
	emp_name varchar(50),
	dept_id integer(10),
	salary integer(10),
	manager varchar(50)
    -- constraint fk_dept_id foreign key(dept_id) references Department(dept_id)
    );
  desc Employee;      
INSERT INTO Employee VALUES (1,"Arun",1,8000,4);
INSERT INTO Employee VALUES (2,"kiran",1,7000,1);
INSERT INTO Employee VALUES (3,"Scott",1,3000,1);
INSERT INTO Employee VALUES (4,"Max",2,9000,NULL);
INSERT INTO Employee VALUES (5,"Jack",2,8000,4);
INSERT INTO Employee VALUES (6,"King",NULL,6000,1);
select * from employee;

-- Apply not null,primary key and foreign key constraints.

-- ***********order by
-- 1. select all from authors sort ascending by author name.
SELECT * FROM AUTHORS
ORDER BY ANAME;

-- 2. select all from publishers sort descending by publisher name.
SELECT * FROM AUTHORS
ORDER BY ANAME DESC;

-- ***********group by
-- 1. select all data and sum of salary from employee and group according to deptid.
SELECT dept_id ,SUM(salary) 
FROM  Employee 
GROUP BY  dept_id;
-- 2. select deptid and sum of salary where salary is greater than 17000 and group by deptid.
SELECT dept_id ,SUM(salary) 
FROM  Employee where salary > 17000
GROUP BY  dept_id;

-- *********having
-- 1. select deptid and sum of salary where sum of salary is greater than 18000 and grup by deptid.  
SELECT dept_id ,SUM(salary) 
FROM  Employee
GROUP BY  dept_id
having  SUM(salary) > 18000;

-- 2. select deptid and sum of salary where sum of salary is less than 20000 and grup by deptid.
SELECT dept_id ,SUM(salary) 
FROM  Employee
GROUP BY  dept_id
having  SUM(salary) < 20000;

