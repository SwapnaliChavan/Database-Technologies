create database Assignment9;
use assignment9;
create table emp(
empno int(10),
ename varchar(20),
job varchar(20),
mgr varchar(10),
hiredate date,
sal  double(7,2),
deptno  int(10)
);

insert into emp values(1000,"Manish","Salesman",1003,"2020-02-18",600.00,30);
insert into emp values(1001,"Manoj","Salesman",1003,"2018-02-18",600.00,30);
insert into emp values(1002,"Ashish","Salesman",1003,"2013-02-18",750.00,30);
insert into emp values(1004,"Rekha","Analyst",1006,"2001-02-18",3000.00,10);
insert into emp values(1005,"Sachin","Analyst",1006,"2019-02-18",3000.00,10);
insert into emp values(1006,"Pooja","MAnager",Null,"2000-02-18",6000.00,10);
insert into emp values(1007,"Schema","Secretary",Null,"2000-02-10",6000.00,10);

-- 1.	Find all the employee name starting with ‘sc’;
SELECT ename FROM emp WHERE ename REGEXP '^sc';

-- 2.	Find all the employee name endiing with ‘ng’;
SELECT ename FROM emp WHERE ename REGEXP 'ng$';

-- 3.	write query to find all employee job containing characters ’io’ or ‘ea’.
SELECT job FROM emp WHERE job REGEXP 'io|ea';

-- 4.	Write a query to find all names containing characters {s,d}.
SELECT ename FROM emp WHERE ename rlike '[s,d]';

-- 5.
CREATE TABLE tutorial (
id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY, 
title VARCHAR(200), 
description TEXT, 
FULLTEXT(title,description)
) ;

INSERT INTO tutorial (title,description) VALUES
('SQL Joins','An SQL JOIN clause combines rows from two or more tables. It creates a set of rows in a temporary table.'),
('SQL Equi Join','SQL EQUI JOIN performs a JOIN against equality or matching column(s) values of the associated tables. An equal sign (=) is used as comparison operator in the where clause to refer equality.'),
('SQL Left Join','The SQL LEFT JOIN, joins two tables and fetches rows based on a condition, which is matching in both the tables and the unmatched rows will also be available from the table before the JOIN clause.'),
('SQL Cross Join','The SQL CROSS JOIN produces a result set which is the number of rows in the first table multiplied by the number of rows in the second table, if no WHERE clause is used along with CROSS JOIN.'),
('SQL Full Outer Join','In SQL the FULL OUTER JOIN combines the results of both left and right outer joins and returns all (matched or unmatched) rows from the tables on both sides of the join clause.'),
('SQL Self Join','A self join is a join in which a table is joined with itself (which is also called Unary relationships), especially when the table has a FOREIGN KEY which references its own PRIMARY KEY.');

select * from tutorial;

-- 6.	Write a query to find ‘Left right’ in description field.
SELECT *  FROM tutorial WHERE  MATCH(title,description) AGAINST ('Left right' IN NATURAL LANGUAGE MODE);


-- 7.	Write a query to find the count of ‘Left right’ string matches in description field.
SELECT count(*)  FROM tutorial WHERE  MATCH(title,description) AGAINST ('Left right' IN NATURAL LANGUAGE MODE);

-- 8.	Write a query that retrieves all the rows that contain the word 'Joins' but not 'right'.
SELECT * FROM tutorial WHERE  MATCH(title,description) AGAINST ('+Joins -right' IN BOOLEAN MODE);
