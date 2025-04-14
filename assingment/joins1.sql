CREATE TABLE dept(
dID INT PRIMARY KEY NOT NULL,
dNAME VARCHAR(100),
managerNAME VARCHAR(100)
);

CREATE TABLE designation(
dsID INT PRIMARY KEY NOT NULL,
dsNAME VARCHAR(100),
dID INT,
CONSTRAINT fk_Did FOREIGN KEY (dID) REFERENCES dept(dID)
);

CREATE TABLE emp (
eID INT PRIMARY KEY NOT NULL,
eNAME VARCHAR (100),
dsID INT,
CONSTRAINT fk_Dd1 FOREIGN KEY (dsID) REFERENCES designation(dsID)
);
ALTER TABLE emp ADD salary REAL;



SELECT * FROM dept;
SELECT * FROM designation;
SELECT * FROM emp;


SELECT * FROM dept	INNER JOIN designation ON dept.dID = designation.dID; 
SELECT * FROM dept	INNER JOIN designation ON dept.dID = designation.dID INNER JOIN emp ON emp.dsID = designation.dsID;  
SELECT dept.dname, designation.dsname, emp.ename, dept.managerNAME FROM dept	INNER JOIN designation ON dept.dID = designation.dID INNER JOIN emp ON emp.dsID = designation.dsID;  

SELECT emp.ename, emp.salary, dept.managerNAME FROM dept	INNER JOIN designation ON dept.dID = designation.dID INNER JOIN emp ON emp.dsID = designation.dsID;  

 
insert into dept values (1,'admin','suleman');
insert into dept values (2,'Lscs','vedant');
insert into dept values (3,'astra','rajesh');

insert into designation values (101,'developer',1);
insert into designation values (102,'developer',2);
insert into designation values (103,'developer',3);
insert into designation values (104,'support',2);


insert into emp values(7001,'vinay',101);
insert into emp values(7002,'ajay',102);
insert into emp values(7003,'anurag',103);
insert into emp values(7004,'Raj',104);
UPDATE emp set salary = 35000;



