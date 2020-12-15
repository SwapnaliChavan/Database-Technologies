create database Assignment6;
use Assignment6;

-- 1.	Write function that accepts a positive number from a user and displays its factorial on the screen.
drop function positive_number;

delimiter $$
create function positive_number (var int)returns int
begin
declare factorial int default 1;
declare counter int;
 set counter =  var;
a_loop : repeat  
set factorial = factorial * counter;
set counter = counter-1;
until counter = 1
end repeat;
return factorial;
end $$

select positive_number(4)

-- 2.	Write a function that accepts a positive number ‘n’ and displays whether that number is a Prime number or not.

drop function Prime_number;
delimiter $$
CREATE FUNCTION Prime_number(X INT) RETURNS VARCHAR(10)
BEGIN
	DECLARE a ,b INT;
	SET b=2;
	SET a=X/2;
	IF X=0 || X=1 THEN 
		RETURN 'NOT PRIME';
    ELSE
		L1: LOOP
		WHILE b<=a DO
			IF X%b=0 THEN 
				RETURN 'NOT PRIME';
				LEAVE L1;
				ELSE
				SET b=b+1;
				ITERATE L1;
			END IF;
	   END WHILE;
       RETURN 'PRIME';
	END LOOP L1;
	END IF;
END$$

select Prime_number(6);

-- 3.	Write a function to Convert an inputed number of inches into yards, feet, and inches. For example, 124 inches equals 3 yards, 1 foot, and 4 inches.
 
 drop function convesion;
delimiter $$
create function convesion( val int(20)) returns varchar(200)
begin
return concat(val ,' inches ', round(val/36),' yards ',round(val/12),' foot ');
end$$

select convesion(24);

-- 4.	Write a function to update salary of the employees of specified dept by 10%. Take dept no as parameter.
use Assignment5;

drop function salary;
delimiter $$
create function salary ( val int(20)) returns int(20)
begin
declare a int (20);
update emp set SAL = SAL * 0.1  where deptno = val;
return a;
end;$$

SET SQL_SAFE_UPDATES=0;
select salary(10) IN SAL FROM EMP;

-- 5.	Create a function named USER_ANNUAL_COMP that has a parameter p_eno for passing on the values of  an employee number of the employee and p_comp for passing the compansation. 
	-- In the function calculates and returns the annual compensation of the employee by using the following formula.
	-- annual_compensation =  (p_sal+p_comm)*12
	-- If the salary or commission value is NULL then zero should be substituted for it.  Give a call to USER_ANNUAL_COMP.

use Assignment5;

drop function USER_ANNUAL_COMP;

delimiter $$
create function USER_ANNUAL_COMP ( p_eno int(20),P_COMM int(20)) returns int(20)
begin
DECLARE A INT(20);
DECLARE annual_compensation INT (20);
set a = (select SAL from emp where EMPNO = p_eno);
IF (a = NULL| P_COMM = NULL) THEN
SET a = P_COMM = 0;
ELSE
SET annual_compensation = (a + P_COMM)*12;
RETURN annual_compensation;
END IF;
END$$

SELECT  USER_ANNUAL_COMP(1002,1);

-- 6.	Create a procedure called USER_QUERY_EMP that accepts three parameters.
	-- Parameter p_myeno is of IN parameter mode which provides the empno value. 
	-- The other two parameters p_myjob and p_mysal are of OUT mode. 
	-- The procedure retrieves the salary and job of an employee with the provided employee number 
    -- and assigns those to the two OUT parameters respectively. 
	-- The procedure should raise the error if the empno does not exist in the EMP table by displaying an appropriate message
use Assignment5;
DROP procedure USER_QUERY_EMP;
delimiter $$
create procedure USER_QUERY_EMP(in p_myeno int(20),out p_myjob VARCHAR(200),out p_mysal int(20))
begin
IF(SELECT EMPNO FROM EMP where empno = p_myeno) THEN
select SAL,JOB INTO p_mysal, P_MYJOB  from emp where empno = p_myeno;
ELSE
SET P_MYJOB = 'EMPNO IS NOT AVALIABLE';
end IF;
END$$

call USER_QUERY_EMP(1010,@p_myjob,@p_mysal);
select @p_myjob,@p_mysal;

-- 7.	Create a procedure to print the inputted string in reverse order. If  inputted string is null display an appropriate message
drop PROCEDURE my_proc_In;

delimiter $$
CREATE PROCEDURE my_proc_In(INOUT a varchar(30))
BEGIN
if(isnull(a))then
set a ='incorrect input';
else 
SELECT REVERSE(a);
end if;
END $$

set @b = "EDAC juhu";
set @b = NULL;
call my_proc_In(@b);
call my_proc_In(@b);
select @b;

-- 8.	Create a procedure named ‘tabledetails’ which gives all the details of a particular table stored in database.
use Assignment5;

drop PROCEDURE tabledetails;

delimiter $$
CREATE PROCEDURE tabledetails(IN a varchar(30))
BEGIN
DESC a;
END $$
 
 call tabledetails(emp);





