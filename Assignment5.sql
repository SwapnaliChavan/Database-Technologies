create database Assignment5;
use Assignment5;

Create table EMP (
 EMPNO int(4)not null, 
 ENAME varchar(30) not null, 
 JOB varchar(10), 
 MGR int(4), 
 HIREDATE date, 
 SAL double(7,2),
 DEPTNO int(2)
 ); 
 
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO ) values(1000,  'Manish' , 'SALESMAN', 1003,  '2020-02-18', 600,  30) ;
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO ) values(1001,  'Manoj' , 'SALESMAN', 1003,  '2018-02-18', 600,  30) ;
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO ) values(1002 , 'Ashish', 'SALESMAN',1003 , '2013-02-18',  750,  30 );
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO ) values(1004,  'Rekha', 'ANALYST', 1006 , '2001-02-18', 3000,  10);
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO ) values(1005 , 'Sachin', 'ANALYST', 1006 ,  '2019-02-18', 3000, 10 );
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO ) values(1006,  'Pooja',  'MANAGER',null,'2000-02-18' ,6000, 10 );

drop table dept;
Create table dept (
deptno numeric(4) not null, 
dname varchar(10) not null,
area varchar(30)
);

Insert into dept(deptno,dname,area) values(10,'HR','Mumbai');
Insert into dept(deptno,dname,area) values(20,'Purchase','Mumbai');
Insert into dept(deptno,dname,area) values(30,'Store', 'Delhi');
Insert into dept(deptno,dname,area) values(40,'Marketing','Pune');
Insert into dept(deptno,dname,area) values(50,'Finance','Delhi');
Insert into dept(deptno,dname,area) values(60,'Accounts','Mumbai');

-- 1.	Write a Procedure that accepts values of two non-zero numbers using IN parameter and perform addition, subtraction, multiplication, division and print.
delimiter $$
CREATE PROCEDURE my_proc_In5(In a int,In b Int)
BEGIN
 -- SELECT * FROM emp LIMIT param;
DECLARE c,d,e,f INT;
set c = a+b;
set d = a-b;
set e = a*b;
set f =a/b;
select c,d,e,f;
END $$

call my_proc_In5(10,15);

-- 2.	Write a Procedure to print the string in REVERSE order. Take the input using IN parameter. (Ex .Database , o/p :esabatad)
delimiter $$
CREATE PROCEDURE my_proc_In(In a varchar(15))
BEGIN
SELECT REVERSE(a);
END $$

call my_proc_In("EDAC juhu");

-- 3.	Write a Procedure to display top 5 employee based on highest salary and display employee number, employee name and salary.

delimiter $$
CREATE PROCEDURE sal1()
BEGIN
select distinct EMPNO,ENAME, sal from emp order by sal desc limit 5;
END $$

call sal1();	-- call procedure


-- 4.	Write a Procedure to create table emp_test with e_id integer, e_name varchar(10), e_joining_date date as columns
delimiter $$
CREATE PROCEDURE test()
BEGIN
create table emp_test(
e_id integer,
e_name varchar(10),
e_joining_date date);
END $$
 call test();
 desc emp_test;
 select * from emp_test;
 
-- 5.	Write a Procedure to add a department row in the DEPT table with the following values for columns
-- deptno  vaue 60,Dname  value should be  ‘Education’, area value should be Pune. 
select * from dept;

delimiter $$
CREATE PROCEDURE test1()
BEGIN
insert into dept values(60,'Education','Pune');
END $$

call test1;
 select * from dept;
 
-- 6.	Write a program that declares an integer variable called num, assigns a value to it and print,
-- the value of the variable itself, its square, and its cube.
delimiter $$
CREATE PROCEDURE square2(in num int)
BEGIN
select num*num;
select power(num,num);
END $$

call square2(3);

-- 7.	Write a program that declares an integer variable assign a value to it and display it using OUT parameter.
delimiter $$
CREATE PROCEDURE var(out a int)
BEGIN
SET a=10;
-- DECLARE a INT DEFAULT 10;
END $$

call var(@max);
select @max;

-- 8.	Write a program that demonstrates the usage of IN and OUT parameters.

DELIMITER $$
create procedure my_proc_INOUT(INOUT dept_name varchar(100))
begin
select concat (dname, " department is at location ", area) INTO dept_name
FROM dept where dname = dept_name;
END $$
set @x = 'Marketing';
call my_proc_INOUT (@x)

select @x;

select * from dept;















