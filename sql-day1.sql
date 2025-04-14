CREATE TABLE emp (
    empid int,
    empname varchar(255),
    gender varchar(255),
    salary real
);
Select * from emp;

CREATE TABLE students (
rollNumber int,
name varchar(50),
engMarks int,
scnMarks int,
mathMarks int
);


insert into students values (
1 ,'Anurag', 80,75,79);
insert into students values (
2 ,'Rahul', 70,65,69);
insert into students values (
3 ,'Raj', 40,55,70);
insert into students values (
4 ,'Elon', 80,65,50);
insert into students values (
5 ,'Bill', 50,75,79);

select * from students;

update students set  name = 'Bill', 
  scnMarks =20, engMarks = 40 where rollNumber = 5;

select * from students;

delete from students where scnMarks = 20;
select * from students;

Alter Table students ADD totalMarks int;
Alter Table students ADD percentage real;

update students set totalmarks = engMarks+scnMarks + mathMarks;
update students set percentage = (totalmarks * 100)/300;

Alter Table students ADD g_class varchar(200);

update students set g_class = CASE
    WHEN percentage > 60 THEN 'FirstClass'
    WHEN 50 < percentage  or  percentage < 60 THEN 'SecondClass'
	ELSE 'Fail'
END;

CREATE TABLE receipts (
resId int constraint p_rid PRIMARY KEY,
customerName varchar(150),
AMOUNT real
)

insert into receipts values (1 , 'Ravi', 2000.00);
insert into receipts values (2 , 'sony', 5000.00);
insert into receipts values (3 , 'gauri', 3000.45);

select * from receipts;

CREATE TABLE student_details (
Rollnum int PRIMARY KEY,
studentname varchar(200) UNIQUE,
engmarks int check (engmarks>0 and engmarks<100 ),
scemarks int check (scemarks>0 and scemarks<100 ),
mathmarks int check (mathmarks>0 and mathmarks<100 )
);

insert into student_details values (1,'sameer',20,40,70);
insert into student_details values (2,'Elon',20,40,70);

select * from student_details;

CREATE TABLE emp_details(
empid int PRIMARY KEY,
empname Varchar(200) Constraint u_n unique,
gender char(50) Constraint s_g CHECK(gender = 'M' or gender = 'F'),
salary int Constraint s_sa CHECK (salary > 0),
tax FLOAT Constraint s_t CHECK (tax > 10),
bonus FLOAT Constraint s_b CHECK (bonus > 5 and bonus < 20),
designation Varchar(200) NOT NULL,
dept Varchar(200) NOT NULL
);

SELECT * FROM emp_details;