-- Write a SQL statement to display numbers from 1 to 10.

CREATE OR REPLACE PROCEDURE print_num()
language plpgsql
as $$
begin
for a in 1..10 loop
	raise notice '%',a;
end loop;
end;$$

call print_num();
-- Write a SQL statement to display even numbers from 1 to 10.
CREATE OR REPLACE PROCEDURE print_even()
language plpgsql
as $$
begin
for a in 1..10 loop
		if a%2 = 0
			then raise notice '%',a;
		end if;
end loop;
end; $$

call print_even();

-- Write a SQL statement to add numbers from 1 to 10 and display the result.
Create table numbers(
num_id int primary key,
numbers int);

CREATE OR REPLACE PROCEDURE ins_num()
language plpgsql
as $$
begin
for a in 1..10 loop
	insert into numbers (num_id, numbers) values(a-1,a);
	end loop;
end;$$

call ins_num();
select * from numbers;

-- Write a SQL statement to multiple numbers from 1 to 10 and display the result.

CREATE OR REPLACE FUNCTION table_creator(num1 int)
RETURNS INT
LANGUAGE plpgsql
AS $$
begin
for t in 1..10 loop
	raise notice '% * % = %',num1,t,num1*t;
	end loop;
RETURN 0;
end; $$

Create or replace procedure table_handler()
language plpgsql
as $$
begin 
for n in 1..10 loop
	PERFORM table_creator(n);
	raise notice '            ';
end loop;
end; $$

call table_handler();

-- Write a PROCEDURE to calculate the area of a rectangle. User will enter the length and breadth and it should display the area.
CREATE OR REPLACE PROCEDURE cal_area_t1(h float, b float)
language plpgsql
AS $$
DECLARE 
	a int;
BEGIN
	a = (h*b)/2;
	raise notice 'the answer is: %',a;
end; $$

call cal_area_t1(50,20);

-- Write a PROCEDURE to check whether the number is prime number or not. User will enter a number and it should display whether it is a prime number or not.

 CREATE OR REPLACE PROCEDURE check_prime(num int)
 language plpgsql
 as $$
 begin

 if(num<=1)
 	then raise notice '% Not a prime number', num;
 end if;

 for i in 2..sqrt(num) loop
 	if (num % i = 0) 
	 Then raise notice '% Not a prime number',num;
	end if;
 end loop;

 raise notice '% number is prime',num;
 
 end; $$

 call check_prime(15);

-- Write a procedure which will bifurcate a fullname into firstname and lastname.User will enter fullname like Amit Patil and it should display FirstName : Amit and LastName : Patil
CREATE OR REPLACE PROCEDURE SPLIT(NAME1 VARCHAR(100))
LANGUAGE PLPGSQL
AS $$
DECLARE 
	FNAME VARCHAR(100);
	LNAME VARCHAR(100);
BEGIN 
	FNAME := SPLIT_PART(NAME1,' ',1);
	LNAME := SPLIT_PART(NAME1,' ',2);
	RAISE NOTICE 'F NAME : %',FNAME;
	RAISE NOTICE 'L NAME : %',LNAME;
END; $$

CALL SPLIT('Anurag Lanjewar');


-- Write a function to calculate the age in year. User will pass the Date of Birth and it should return the age in terms of number.
CREATE OR REPLACE FUNCTION AGE_CAL(dob DATE) 
RETURNS INT
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN DATE_PART('year', AGE(dob));
END;$$

SELECT AGE_CAL('05/04/2002');