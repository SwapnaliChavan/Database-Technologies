create database Assignment7;
use Assignment7;

create table Ord_master(
ord_no int (20) primary key,
cust_cd varchar(20),
status varchar(30)
);

insert into Ord_master values(1,'C1','P');

create table  Ord_dtl(
ord_no int (20) ,
Prod_cd  varchar(20) primary key,
Qty int(30),
constraint fk_ord_no foreign key(ord_no) references Ord_master(ord_no)
);

insert into Ord_dtl values(1,'P1',100);
insert into Ord_dtl values(1,'P2',200);
insert into Ord_dtl values(1,'P3',300);


create table   Prod_master(
Prod_cd  varchar(20),
Prod_name  varchar(20),
Qty_in_stock  int(30),
Booked_qty int(10),
constraint fk_Prod_cd foreign key(Prod_cd) references Ord_dtl(Prod_cd)
);

insert into Prod_master values('p1','Floppies',10000,1000);
insert into Prod_master values('p2','Printers',5000  ,600);
insert into Prod_master values('p3','Modems',3000 ,200);

-- 1. Write a Before Insert trigger on Ord_dtl. Anytime a row is inserted in Ord_dtl, the
	-- Booked_qty in Prod_master should be increased accordingly
    
delimiter $$
CREATE TRIGGER QUE1 BEFORE INSERT ON Ord_dtl
FOR EACH ROW 
BEGIN
UPDATE Prod_master SET Booked_qty=Booked_qty + NEW.Qty WHERE  Prod_cd=NEW.Prod_cd;
END$$
insert into Ord_dtl values(1,'P4',100);
-- delete from Ord_dtl where Prod_cd='P3'

select * from Ord_dtl;

-- 2. Write a Before Delete trigger on Ord_dtl. Anytime a row is deleted from Ord_dtl, the
	-- Booked_qty in Prod_mastershould be decreased accordingly.
delimiter $$
CREATE TRIGGER QUE2 AFTER DELETE ON Ord_dtl
FOR EACH ROW 
BEGIN
UPDATE Prod_master SET Booked_qty=Booked_qty - OLD.Qty WHERE  Prod_cd=OLD.Prod_cd;
END$$

CREATE TABLE dept_sal (dept_no INT , tota_salary INT4); 

INSERT INTO DEPT_SAL VALUES(30,1950),(10,12000)
-- SELECT * FROM EMP;
-- SELECT * FROM DEPT_SAL;

-- 3. write A trigger to update the total salary of a department in dept_sal  table  when an employee is added or removed from  emp table .
	-- Create table dept_sal (dept_no, tota_salary) – this table contains the total of salaries of employees working into that particular department
delimiter $$
CREATE TRIGGER QUE3 AFTER INSERT ON EMP
FOR EACH ROW
BEGIN
UPDATE DEPT_SAL SET tota_salary=tota_salary + NEW.SAL WHERE DEPT_NO=NEW.DEPTNO;
END$$
-- INSERT INTO EMP values(1007 , 'abcd', 'DEVELOPER', 1006 ,  '2019-02-18', 5000, 30 );

delimiter $$
CREATE TRIGGER QUE4 AFTER DELETE ON EMP
FOR EACH ROW
BEGIN
UPDATE DEPT_SAL SET tota_salary=tota_salary - OLD.SAL WHERE DEPT_NO=OLD.DEPTNO;
END$$
-- DELETE FROM EMP WHERE EMPNO=1007
