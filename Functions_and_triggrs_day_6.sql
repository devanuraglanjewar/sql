 CREATE TABLE  ADDITION(
NUM1 INT,
NUM2 INT,
RESULTS INT
);

CREATE OR REPLACE FUNCTION addi(num1 int, num2 int)
RETURNs INT
language plpgsql
AS $$
DECLARE
	R INT = 0;
BEGIN 
	R = num1 + num2;
RETURN R;
END; $$

create or replace procedure sp_result(num1 int, num2 int)
language plpgsql
as $$
DECLARE
begin
INSERT INTO ADDITION (NUM1,NUM2,RESULTS) VALUES (num1, num2, addi(num1,num2));
raise notice 'operation done';	
end;$$;

call sp_result(1,2);

--------------------------------------------------
SELECT * FROM emp1;

create or replace FUNCTION getdata(dep varchar(100))
RETURNS TABLE (e_id int, e_name varchar(100))
language plpgsql
as $$
begin
RETURN QUERY (SELECT empid, empname FROM emp1 where dept = dep );
end;$$
select * from getdata('IT');
DROP FUNCTION getdata;
-----------------------------------------
CREATE OR REPLACE FUNCTION fn_emptr()
RETURNS TRIGGER
language plpgsql
AS $$
BEGIN
RAISE NOTICE 'DETAILS ADDED';
RETURN NEW;
END ; $$

CREATE TRIGGER TR_AFI AFTER INSERT ON emp1 FOR EACH ROW EXECUTE PROCEDURE fn_emptr();

INSERT INTO emp1 (empname, gender, sal, tax, dept, desg) values ('RAJ','MALE',70000,20000,'HR','HR-MANAGER');

--------------------- AUDIT TRIGGER EXAMPLE
CREATE TABLE EMP_AUDIT (
empid INT, empname VARCHAR(100), gender VARCHAR(100), sal REAL, tax REAL, dept VARCHAR(100), desg VARCHAR(100), UPDATEBY VARCHAR(100), UPDATED_DATE_TIME TIMESTAMP 
);
DROP TABLE EMP_AUDIT;

CREATE OR REPLACE FUNCTION fn_empaudits()
RETURNS TRIGGER 
language plpgsql
AS $$
BEGIN 
	INSERT INTO EMP_AUDIT VALUES (old.empid,old.empname,old.gender,old.sal,old.tax,old.dept,old.desg);
	RAISE NOTICE 'VALUES ARE UPDATED AND OLD VALUE IS STORED IN THE AUDIT TABLE';
RETURN NEW;
END;$$

CREATE or REPLACE TRIGGER TR_AUDIT AFTER DELETE ON emp1 FOR EACH ROW EXECUTE PROCEDURE fn_empaudits();

DELETE FROM EMP1 WHERE EMPID=101;

select * from emp_audit;

SELECT * FROM EMP_AUDIT;
SELECT * FROM emp1;
---------------------------------------------- TRY NEW 
