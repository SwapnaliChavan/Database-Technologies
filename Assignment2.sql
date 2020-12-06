create database Assignment2;
use Assignment2;

CREATE TABLE PUBLISHERS(
    PNAME VARCHAR(30),
    PHONE VARCHAR(30),
    EMAIL VARCHAR(50)
);

CREATE TABLE  AUTHORS(
	AID Integer(10),
    ANAME VARCHAR(30),
    PHONE VARCHAR(30)
);

CREATE TABLE  TITLES(
    TITLEID  Integer(5),
    TITLE VARCHAR(30),
    PUBID Integer(3),
    TITLEPrice Integer(10),
    PUBDATE DATE
);


CREATE TABLE  TITLEAUTHORS(
	AUID Integer(5) ,
    TITLEID  Integer(5) ,
    IMPORTANCE Integer(2)
);

CREATE TABLE SUBJECTS(
    SUBID VARCHAR(5),
    SNAME VARCHAR(30)
);

INSERT INTO PUBLISHERS VALUES ('WILLEY','91-11-23260877','WDT@VSNL.NET');
INSERT INTO PUBLISHERS VALUES ('WROX','91-11-2345688','INFO@WROX.COM');
INSERT INTO PUBLISHERS VALUES ('TATA MCGRAW-HILL','91-11-33333322','FEEDBACK@TATAMCGRAWHILL.COM');
INSERT INTO PUBLISHERS VALUES ('TECHMEDIA','91-11-33257660','BOOKS@TECHMEDIA.COM');

INSERT INTO AUTHORS VALUES (101,'HERBERT SCHILD','91-11-23260877');
INSERT INTO AUTHORS VALUES (102,'JAMES GOODWILL','91-11-23276877');
INSERT INTO AUTHORS VALUES (103,'DAVAID HUNTER','91-11-258960877');
INSERT INTO AUTHORS VALUES (104,'STEPHEN WALTHER','91-11-245670877');
INSERT INTO AUTHORS VALUES (105,'KEVIN LONEY','91-11-88860877');
INSERT INTO AUTHORS VALUES (106,'ED. ROMANS','91-11-678260877');

INSERT INTO TITLES VALUES (1001,'ASP.NET UNLEASHED',432,100,'2006-04-03');
INSERT INTO TITLES VALUES (1002,'ORACLE10G COMP. REF',575,200,'2004-06-10');
INSERT INTO TITLES VALUES (1003,'MASTERING EJB',475,300,'1996-09-12');
INSERT INTO TITLES VALUES (1004,'JAVA COMP. REF',499,400,'2010-03-20');
INSERT INTO TITLES VALUES (1005,'PRO. VB.NET',450,500,'2001-04-20');

INSERT INTO TITLEAUTHORS VALUES (1001,104,1);
INSERT INTO TITLEAUTHORS VALUES (1002,105,1);
INSERT INTO TITLEAUTHORS VALUES (1003,106,1);
INSERT INTO TITLEAUTHORS VALUES (1004,101,1);
INSERT INTO TITLEAUTHORS VALUES (1005,103,1);
INSERT INTO TITLEAUTHORS VALUES (1005,102,2);

INSERT INTO SUBJECTS VALUES ('ORA','ORACLE DATABASE 10g');
INSERT INTO SUBJECTS VALUES ('JAVA','JAVA LANGUAGE');
INSERT INTO SUBJECTS VALUES ('JEE','JAVA ENTEPRISE EDITION');
INSERT INTO SUBJECTS VALUES ('VB','VISUAL BASIC.NET');
INSERT INTO SUBJECTS VALUES ('ASP','ASP.NET');

show tables;

-- select * from PUBLISHERS;
-- select * from AUTHORS;
-- select * from TITLES;
-- select * from TITLEAUTHORS;
-- select * from SUBJECTS;


-- 1. select subject name "oracle" from subjects table.
select * from subjects where SNAME like '%oracle%';

-- 2. select subject name starts whith 'j'.
select * from subjects where SNAME like "j%";

-- 3. select subject name which contains ".net" .
select * from subjects where SNAME like "%.net%";

-- 4. select author name ends with 'er'.
select * from AUTHORS where ANAME like "%er";

-- 5. select publishers name which contains "hill".
select * from PUBLISHERS where PNAME like "%hill%";

-- ******************(relational operator)***********************
-- 1. select title from title table having price less than 500.
select title from TITLES where TITLEPrice < 500;

-- 2. select title from title table published before '3 april'.
select title from TITLES where PUBDATE < "2003-04-03";

-- 3. select subject name from subject having id as 'java' or 'jee'.
select SUBID  from subjects where SNAME like "%java%" or "%jee%";

-- 4. seelct author name from author table id greater than '103'.
select ANAME from AUTHORS where AID >'103';

-- 5. select all from title having titleid as 101 or price > 400.
select * from TITLES where TITLEID ='1001' or TITLEPrice > 400;

-- **********************(IN operator)*************************
-- 6.select all from publishers table  where publisher name is ('TECHMEDIA', 'WROX');
select * from publishers where PNAME in ('TECHMEDIA', 'WROX');

-- ******************(aggregate function)**********************
-- 1. select maximum price from titles table.
select max(TITLEPrice) from TITLES;

-- 2. select average importance from titleauthors. 
select avg(IMPORTANCE)from TITLEAUTHORS;

-- 3. select number of records from author table.

-- 4. select sum of prices of all books.
select sum(TITLEprice) price from TITLES;

-- ********************(date)********************************
-- 1. select title from title table where month is 'Apr'.
select TITLE  from titles where PUBDATE like "%04%";

-- 2. select year from system date.
select YEAR(CURDATE());

-- 3. select month from system date.
select MONTH(CURDATE());

--  4. select last day of month when 'java' book published.
SELECT LAST_DAY(PUBDATE) from titles where TITLE = 'JAVA COMP. REF';

-- **********************(DML)*******************************
-- create table Employee with emp_id (number),emp_name(char(50)) and insert some value.

create table Employee(
	emp_id Integer(10),
    emp_name char(50)
    );

insert into Employee values(1,'poonam');
insert into Employee values(2,'pooja');

-- 1. Add one column name 'dept_id ' in table name 'Employee';
Alter table Employee add column dept_id integer(10);
select * from Employee;

-- 2. Change the datatype of column 'char' from tablename 'Employee' to 'varchar2'.
alter table Employee modify column emp_name varchar(10);
desc Employee;

-- 3. update name of employee to 'Scott'
SET SQL_SAFE_UPDATES=0;
update Employee set emp_name = "Scott" where emp_id=1;

-- 4. truncate the table.
truncate table Employee;
show tables;
select * from Employee;


-- **********************************************************
-- Table=> Emp
-- SAL(float(7,3))
-- ------------------
-- 1234.567
-- 1530.019
-- 1652.786
-- 1775.156

create table Employee1(
	salary float(7.3)
    );
    
    insert into Employee1 values(1234.567);
    insert into Employee1 values(1530.019);
	insert into Employee1 values(1652.786);
	insert into Employee1 values(1775.156);
    insert into Employee1 values(-1775.156);
    
    -- Perform :
-- 1. round
SELECT ROUND(salary,1)from Employee1 where salary > 0;

-- 2. truncate 
truncate table Employee1;

-- 3. ceil
SELECT ceil(salary)from Employee1 where salary > 0;

-- 4. floor
SELECT floor(salary)from Employee1 where salary > 0;

-- 5. sign(-15)
SELECT sign(salary)from Employee1 where salary < 99999;

-- 6. mod
SELECT mod(salary,2)from Employee1 where salary > 0;

-- 7. sqrt
SELECT sqrt(salary)from Employee1 where salary > 0;
-- 8. power
SELECT power(salary,2)from Employee1 where salary > 0;


-- *****************************************************************
-- 1. perform all string function on string "CDAC juhu".
SELECT char_length("CDAC juhu");
SELECT REVERSE("CDAC juhu");
SELECT REPEAT("CDAC juhu",2);
SELECT ascii('C');
 SELECT 'CDAC' || ' ' || 'juhu' FROM dual;
select LCASE ("CDAC juhu");
select UCASE ("CDAC juhu");

-- 2. perform different date and time functions. 
SELECT NOW();
SELECT CURDATE();
SELECT CURTIME();
select MONTH(CURDATE());
select YEAR(CURDATE());
SELECT DATE_FORMAT("2017-06-15", "%Y %M %D");  
SELECT DATE_FORMAT("2017-06-15", "%y %m %d");  
SELECT DATE_FORMAT("2017-06-15", "%a %b %c");  




