-- ROLLNO, ENG,SCN,MATH
CREATE TABLE STUDENTS (
ROLLNO INT PRIMARY KEY,
ENGMARKS FLOAT,
SCNMARKS FLOAT,
MATHMARKS FLOAT
);
CREATE TABLE STUDENTDETAILS(
ROLLNO INT,
TOTALMARKS FLOAT,
PERCENTAGE FLOAT,
GRADE VARCHAR(100),
FOREIGN KEY(ROLLNO) REFERENCES STUDENTS(ROLLNO)
);

CREATE TABLE ERRORLOGS (
ERRORID INT GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
ERRORMSG VARCHAR (2000),
ERRORSTATE VARCHAR (2000),
ERRORGENERATEDBY VARCHAR (2000),
ERRORDATETIME TIMESTAMP
);

create or replace procedure sp_result(rolln int, eng_m int, scn_m int, math_m int)
language plpgsql
as $$
declare 
totalm int;
per FLOAT; 
g VARCHAR(100);
C_O_U_N_T int;
begin	
	IF (eng_m >100 OR scn_m > 100 OR math_m > 100) THEN
		RAISE EXCEPTION 'YOUR INPUT VALUE IS OUT OF RANGE';
	END IF;
	
	totalm = eng_m + scn_m + math_m;
	per = totalm/3.0;
	g = case
    when (per >= 75) then
    'Distinction'
    when(per >= 60) then
    'First Class'
    when(per >= 50) then
    'Second Class'
    when(per >= 35) then
    'Third Class'
    else 'Fail'
    end;
	
	Select count(*) into C_O_U_N_T from STUDENTS where ROLLNO = rolln;
	if (C_O_U_N_T = 0) then
		INSERT INTO STUDENTS (ROLLNO, ENGMARKS, SCNMARKS, MATHMARKS)VALUES (rolln, eng_m, scn_m, math_m);
		INSERT INTO STUDENTDETAILS (ROLLNO,TOTALMARKS, PERCENTAGE, GRADE) VALUES (rolln,totalm,per,g);
		raise notice 'data inserted';
	else 
		update STUDENTS set ENGMARKS = eng_m, SCNMARKS = scn_m, MATHMARKS = math_m where ROLLNO = rolln;
		update STUDENTDETAILS set TOTALMARKS = totalm, PERCENTAGE = per,  GRADE = g where ROLLNO = rolln;
		raise notice 'data Updated';
	end if;
	
	exception
	when others then 
		raise notice 'unexpected exception';
		INSERT INTO ERRORLOGS(ERRORMSG,ERRORSTATE,ERRORGENERATEDBY,ERRORDATETIME) VALUES (SQLERRM,SQLSTATE,CURRENT_USER,NOW());	
end;
$$;

call sp_result(4,150,50,50);
select * from STUDENTDETAILS;
select * from STUDENTS;
SELECT * FROM ERRORLOGS;
TRUNCATE TABLE STUDENTS;
DROP TABLE STUDENTS;

