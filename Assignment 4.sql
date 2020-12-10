-- Joins, Union, Subquery,Sequence

create database Assignment4;
use Assignment4;

create table dept1(
dept_id int(10),
dept_name varchar(20),
loc varchar(20),
constraint pk_dept_id primary key(dept_id)
);

insert into dept1 values(10,'SENG','JUHU');
insert into dept1 values(20,'ITSS','JUHU');
insert into dept1 values(30,'CNIE','JUHU');
insert into dept1 values(40,'ETU','KHARGHAR');
insert into dept1 values(50,'NETWORKING','PUNE');
insert into dept1 values(60,'DATABASE','MUMBAI');
insert into dept1 values(70,'DAta structure','MUMBAI');
insert into dept1 values(80,'Software engg','MUMBAI');


SELECT * FROM DEPT1;

create table emp1(
empno int(10),
emp_name varchar(20),
job varchar(20),
mgr varchar(10),
hiredate date,
sal  int(10),
comm  int(10),
dept_id  int(10),
constraint fk_dept_id foreign key(dept_id) references Dept1(dept_id)
);

insert into emp1 values(1001,"Shilpa","PTO",Null,"2006-11-01",50000,5000,10);
insert into emp1 values(1002,"Snehal","PE",1001,"2012-11-01",40000,5000,10);
insert into emp1 values(1003,"Aditya","PE",1001,"2016-02-10",40000,4000,20);
insert into emp1 values(1004,"Omkar","PE",Null,"2017-01-01",40000,4000,10);
insert into emp1 values(1005,"Rajeev","PTO",Null,"2019-01-01",30000,6000,20);
insert into emp1 values(1006,"Sachin","TO",1001,"2008-05-01",32000,3200,Null);

--  ************joins*****************
--  1. select dept_name and emp_name where dept_id is same.

select dept_name,dept1.dept_id , emp_name,emp1.dept_id from dept1,emp1 where dept1.dept_id = emp1.dept_id;
select dept_name , emp_name from dept1,emp1 where dept1.dept_id = emp1.dept_id;

-- 2. select all from both tables where dept_id is same.
select * from dept1,emp1 where dept1.dept_id = emp1.dept_id;

-- 3. select dept_id and sum of salary group it by dept_id.
select dept_id,sum(sal)  from emp1 group by dept_id;

-- 4. select dept_name and emp_name apply right outer join and left outer join.
select dept_name,emp_name from dept1 right outer join emp1 on dept1.dept_id = emp1.dept_id;
select dept_name,emp_name from dept1 left outer join emp1 on dept1.dept_id = emp1.dept_id;

-- 5. select emp_name with their respective manager names.
select emp_name,mgr from emp1;

-- 6. select epm_name with their respective department names.
select emp_name ,dept_name from dept1 join emp1 on dept1.dept_id = emp1.dept_id;

-- *************union****************
/*	Emp1			Emp2
emp_no     emp_name	emp_no     emp_name
---------------------   ------------------------
1		A		1		A
2		B		2		B
3		C		4		D
				5		E
 */               
 -- 1.	select same data from both table.
 drop table emp2;
create table emp2(
emp_no int(10),
emp_name varchar(20),
constraint pk_dept_id primary key(emp_no)
);

insert into emp2 values (1,'A');
insert into emp2 values (2,'B');
insert into emp2 values (3,'C');
select * from emp2;
 drop table emp3;

create table emp3(
emp_no int(10),
emp_name varchar(20),
constraint fk1_dept_id foreign key(emp_no) references emp2(emp_no)
);

insert into emp3 values (1,'A');
insert into emp3 values (2,'B');
insert into emp3 values (4,'D');
insert into emp3 values (5,'E');


SELECT emp_no FROM emp2
UNION 
SELECT emp_no FROM emp3;

show tables;
/*
************subQuery*************
1. select employee having  same salary as 'Arun'.
*/
select * from emp1 where sal = (select sal from emp1 where emp_name ='snehal');

-- 2. select employee belonging to same dept as 'jack'.

select * from emp1 where job = (select job from emp1 where emp_name ='snehal');
select * from emp1;


-- 3. select name of employee havin lowest salary.
select emp_name ,min(sal)from emp1;

-- 4. update salary = 15000 of employees belonging to same dept as 'Max'.
SET SQL_SAFE_UPDATES=0;
update emp1 set sal = 15000 in (select sal from emp1 where emp_name ='snehal');

  set sal=sal+15000
  where job in (select job from emp1 group by job having sum(salary)>15000 where emp_name ='snehal');