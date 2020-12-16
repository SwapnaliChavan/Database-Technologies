create database Assignment7;
use Assignment7;

-- 1.	Write a Procedure that displays names and salaries of all Analysts recorded in the “emp” table by making use of a cursor.
select * from emp;
drop PROCEDURE Que1;
DELIMITER $$
CREATE PROCEDURE Que1 ()
BEGIN
DECLARE finished INTEGER DEFAULT 0;
DECLARE salary int(100);
declare emname varchar(30);

DEClARE cursal
CURSOR FOR (select ENAME,sal from emp where job = 'ANALYST');
-- declare NOT FOUND handler
DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
OPEN cursal;
getsal: LOOP
FETCH cursal INTO emname,salary;
IF finished = 1 THEN
LEAVE getsal;
END IF;
 select emname,salary;
END LOOP getsal;
CLOSE cursal;
END$$
DELIMITER ;

call Que1;

-- 2.	Write a Procedure to display top 5 employees based on highest salary and display employee number, employee name and salary using Cursor.

use Assignment5;
drop PROCEDURE Que2;
DELIMITER $$
CREATE PROCEDURE Que2 ()
BEGIN
DECLARE finished INTEGER DEFAULT 0;
DECLARE salary int(100);
declare emname varchar(30);
-- declare cursor for employee email
DEClARE EMPNUMBER int (10);
DEClARE cursal
CURSOR FOR (select distinct EMPNO,ENAME,sal from emp order by sal desc limit 5);
-- declare NOT FOUND handler
DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
OPEN cursal;
getsal: LOOP
FETCH cursal INTO EMPNUMBER,emname,salary;
IF finished = 1 THEN
LEAVE getsal;
END IF;
-- build email list
 select  EMPNUMBER,emname,salary;
END LOOP getsal;
-- select EMPNUMBER,emname,salary;
CLOSE cursal;
END$$
DELIMITER ;

SET @maxsal = "";
CALL Que2();
SELECT @maxsal;


-- 3.	Write  a procedure to display the concatenated first_name and last_name from “emp” table using cursors handle the  errors with Exit handler
drop PROCEDURE Que3;
DELIMITER $$
CREATE PROCEDURE Que3 ()
BEGIN
DECLARE finished INTEGER DEFAULT 0;
DECLARE  emname varchar(30);
declare job1 varchar(30);
declare a varchar(1000);
DEClARE cursal
CURSOR FOR (select ENAME,job from emp where sal > 100);
-- declare NOT FOUND handler
DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
OPEN cursal;
getsal: LOOP
FETCH cursal INTO emname,job1;
IF finished = 1 THEN
LEAVE getsal;
END IF;
select 'error handled';
-- build email list
set a =  concat(emname ,"works as",job1,"ïn cdac");
select a;
END LOOP getsal;
-- select EMPNUMBER,emname,salary;
CLOSE cursal;
END$$
DELIMITER ;

CALL Que3;

-- 4.	Write a procedure which select all the data from employee table and display the data of employee where employee name is ‘Manish’ using cursors.

drop  PROCEDURE Que4;

DELIMITER $$
CREATE PROCEDURE Que4 ()
BEGIN
DECLARE finished INTEGER DEFAULT 0;
declare empno1 int(10);
DECLARE sal1 int(100);
declare ename1 varchar(30);
declare mgr1 int(10);
declare hiredate1 date;
declare deptno1 int (10); 
declare job1 varchar(30);
DEClARE cursal
CURSOR FOR (select * from emp where ename = 'manish');
-- declare NOT FOUND handler
DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
OPEN cursal;
getsal: LOOP
FETCH cursal INTO empno1,ename1,job1,mgr1,hiredate1,sal1,deptno1;
IF finished = 1 THEN
LEAVE getsal;
END IF;
 select empno1,ename1,job1,mgr1,hiredate1,sal1,deptno1;
END LOOP getsal;
CLOSE cursal;
END$$
DELIMITER ;

call Que4;

-- 5.	Write a procedure which select delete the data from employee table if emp sal is less than 10000  using cursor and handle the  Sqlexception with continue handler
use Assignment5;
drop procedure details;
delimiter &&
create procedure details()
begin
declare empno int;
declare empname varchar(30);
declare emp_job varchar(20);
declare emp_mgr decimal(4,0);
declare emp_hiredate date;
declare emp_sal decimal(7,2);
declare dept_no decimal(2,0);
declare finished integer default 0;

declare display cursor for select * from emp ;
declare continue handler for SQLException set finished = 1 ;

open display ;
	getsal : LOOP
		fetch display into empno,empname,emp_job,emp_mgr,emp_hiredate,emp_sal,dept_no;
		if(finished = 1 ) then
             delete from emp where sal < 1000;
			 leave getsal;
		 end if ;
        select 'error handled';
	 end LOOP getsal;
close display ;
end &&
delimiter ;

select * from emp ;
call details();

