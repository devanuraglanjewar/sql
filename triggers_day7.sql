SELECT * FROM student3;
SELECT  * FROM student_details;

ALTER TABLE student_details ADD COLUMN PERCENTAGE FLOAT;

CREATE TABLE student3 (
	stuID int, stuNAME VARCHAR(100), MATH INT, ENG INT, SCN INT
);


CREATE OR REPLACE FUNCTION fn_insert()
RETURNS TRIGGER 
language plpgsql
AS $$
DECLARE
 tot int := 0;
 per decimal(10,2) := 0;
BEGIN 
	tot = new.MATH + new.ENG + new.SCN;
 	per = tot/3;
	INSERT INTO student_details (rollnum, studentname, mathmarks, engmarks, scemarks, total, percentage) VALUES (new.stuID, new.stuNAME, new.MATH, new.ENG, new.SCN, tot, per);
	RAISE NOTICE 'values are inserted in students_details';
RETURN NEW;
END;$$

CREATE or REPLACE TRIGGER TR_AUDIT AFTER INSERT ON student3 FOR EACH ROW EXECUTE PROCEDURE fn_insert();

INSERT INTO student3 (stuID, stuNAME, MATH, ENG, SCN) values (2, 'Sumiti', 50,40,70);


truncate table student_details;

CREATE TABLE CUSTOMER (C_ID INT, C_NAME VARCHAR(100), EMAIL VARCHAR (100), MOBILE VARCHAR(100));

INSERT INTO CUSTOMER (C_ID, C_NAME, EMAIL, MOBILE) VALUEs (1,'ANURAG','anurag2lanjewar@gmail.com', '8788501591'),
															(2,'RAJ','raj3lanjewar@gmail.com', '8767501591'),
															(3,'RAM','ram3lanjewar@gmail.com', '8767501534');

select * from CUSTOMER;
CREATE TABLE CUSTOMER_AUDIT (C_ID INT, C_NAME VARCHAR(100), EMAIL VARCHAR (100), MOBILE VARCHAR(100), DELETEDBY VARCHAR(100), DELETED_DATE_TIME TIMESTAMP);
select * from  CUSTOMER_AUDIT;

CREATE OR REPLACE FUNCTION fn_audit_entry ()
RETURNS TRIGGER 
language plpgsql
AS $$
BEGIN 
	INSERT INTO CUSTOMER_AUDIT (C_ID, C_NAME, EMAIL, MOBILE, DELETEDBY, DELETED_DATE_TIME ) VALUES (OLD.C_ID, OLD.C_NAME, OLD.EMAIL, OLD.MOBILE, USER,NOW());
	RAISE NOTICE 'ROW IS DELETED, CHECK CUSTOMER_AUDIT TABLE';
RETURN OLD;
END;$$

CREATE or REPLACE TRIGGER TR_delete AFTER DELETE ON CUSTOMER FOR EACH ROW EXECUTE PROCEDURE fn_audit_entry ();

DELETE FROM  CUSTOMER WHERE C_ID = 2;