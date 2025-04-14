CREATE TABLE JOB(
JOB_ID INT PRIMARY KEY NOT NULL,
JOB_ROLE VARCHAR (100),
SALARY INT
);

CREATE TABLE NEW_JOINEE(
EMP_ID INT PRIMARY KEY NOT NULL,
EMP_NAME VARCHAR (50),
EMP_EMAIL VARCHAR (100),
EMP_AGE INT,
EMP_EXPERIENCE INT,
JOINING_DATE TIMESTAMP
);
ALTER TABLE NEW_JOINEE ADD COLUMN JOB_ID INT;
ALTER TABLE NEW_JOINEE ADD CONSTRAINT FK_JD FOREIGN KEY (JOB_ID)
    REFERENCES JOB(JOB_ID)

INSERT INTO JOB (JOB_ID, JOB_ROLE, SALARY) VALUES
(1, 'Software Engineer', 70000),
(2, 'Data Analyst', 65000),
(3, 'Cloud Engineer', 80000),
(4, 'Database Administrator', 75000),
(5, 'Machine Learning Engineer', 90000),
(6, 'Cybersecurity Analyst', 85000),
(7, 'Frontend Developer', 72000),
(8, 'Backend Developer', 78000),
(9, 'DevOps Engineer', 82000),
(10, 'AI Researcher', 95000);

INSERT INTO NEW_JOINEE (EMP_ID, EMP_NAME, EMP_EMAIL, EMP_AGE, EMP_EXPERIENCE, JOINING_DATE) VALUES
(101, 'Rahul Sharma', 'rahul.sharma@example.com', 25, 2, '2025-03-01 09:00:00'),
(102, 'Priya Verma', 'priya.verma@example.com', 27, 4, '2025-02-15 10:00:00'),
(103, 'Amit Gupta', 'amit.gupta@example.com', 24, 1, '2025-03-03 11:00:00'),
(104, 'Neha Patel', 'neha.patel@example.com', 28, 5, '2025-01-20 08:30:00'),
(105, 'Vikram Rao', 'vikram.rao@example.com', 26, 3, '2025-02-25 14:00:00'),
(106, 'Ananya Sen', 'ananya.sen@example.com', 23, 1, '2025-03-05 10:15:00'),
(107, 'Siddharth Jain', 'siddharth.jain@example.com', 29, 6, '2025-01-10 09:45:00'),
(108, 'Rohan Mehta', 'rohan.mehta@example.com', 30, 7, '2025-02-12 08:00:00'),
(109, 'Sneha Kapoor', 'sneha.kapoor@example.com', 22, 0, '2025-03-07 12:30:00'),
(110, 'Kunal Malhotra', 'kunal.malhotra@example.com', 27, 4, '2025-02-20 13:00:00'),
(111, 'Arjun Nair', 'arjun.nair@example.com', 24, 2, '2025-03-06 09:20:00'),
(112, 'Megha Bansal', 'megha.bansal@example.com', 26, 3, '2025-02-28 10:50:00'),
(113, 'Deepak Joshi', 'deepak.joshi@example.com', 31, 8, '2025-01-25 14:30:00'),
(114, 'Ritika Sharma', 'ritika.sharma@example.com', 25, 2, '2025-03-10 11:15:00'),
(115, 'Nikhil Reddy', 'nikhil.reddy@example.com', 28, 5, '2025-01-15 07:45:00'),
(116, 'Pooja Iyer', 'pooja.iyer@example.com', 23, 1, '2025-03-09 10:00:00'),
(117, 'Suresh Menon', 'suresh.menon@example.com', 29, 6, '2025-02-18 12:00:00'),
(118, 'Alok Das', 'alok.das@example.com', 27, 4, '2025-02-08 08:45:00'),
(119, 'Tanvi Kulkarni', 'tanvi.kulkarni@example.com', 26, 3, '2025-03-12 14:15:00'),
(120, 'Gaurav Singh', 'gaurav.singh@example.com', 25, 2, '2025-03-04 09:10:00'),
(121, 'Bhavna Sharma', 'bhavna.sharma@example.com', 28, 5, '2025-02-22 13:30:00'),
(122, 'Pranav Chatterjee', 'pranav.chatterjee@example.com', 24, 1, '2025-03-14 10:45:00'),
(123, 'Rakesh Yadav', 'rakesh.yadav@example.com', 30, 7, '2025-01-30 08:10:00'),
(124, 'Divya Agarwal', 'divya.agarwal@example.com', 22, 0, '2025-03-15 11:50:00'),
(125, 'Sahil Saxena', 'sahil.saxena@example.com', 29, 6, '2025-02-14 09:55:00'),
(126, 'Manisha Nair', 'manisha.nair@example.com', 27, 4, '2025-02-05 07:30:00'),
(127, 'Abhishek Tiwari', 'abhishek.tiwari@example.com', 26, 3, '2025-03-16 14:45:00'),
(128, 'Sonal Mishra', 'sonal.mishra@example.com', 25, 2, '2025-03-08 09:35:00'),
(129, 'Karthik Pillai', 'karthik.pillai@example.com', 31, 8, '2025-01-18 08:20:00'),
(130, 'Jyoti Choudhary', 'jyoti.choudhary@example.com', 24, 1, '2025-03-17 12:10:00');

CREATE TABLE LOGTABLE (
EMP_ID INT PRIMARY KEY NOT NULL,
EMP_NAME VARCHAR (50),
EMP_EMAIL VARCHAR (100),
EMP_AGE INT,
EMP_EXPERIENCE INT,
JOINING_DATE TIMESTAMP,
DELETE_BY VARCHAR(100),
DELETE_TIME TIMESTAMP
);

SELECT * FROM NEW_JOINEE;
SELECT * FROM LOGTABLE;

-- join
SELECT e.emp_id, e.emp_name, e.emp_experience, j.JOB_ROLE, j.salary from NEW_JOINEE e inner join job j on e.job_id = j.job_id order by e.emp_id asc;

-- join with subquery
select e.emp_name, j.JOB_ROLE from NEW_JOINEE e join job j on e.job_id = j.job_id where j.JOB_ROLE in (select job_role from job group by JOB_ROLE );

-- CTE
WITH l1_exp AS (
select * from NEW_JOINEE where emp_experience > 4 ORDER BY emp_experience ASC
)SELECT * FROM l1_exp;

-- Procedure
CREATE OR REPLACE PROCEDURE DATA_ADDER(E_ID INT, E_NAME VARCHAR (50), E_EMAIL VARCHAR(50), E_AGE INT, E_EXPERIENCE INT, J_DATE TIMESTAMP)
LANGUAGE plpgsql
AS $$
declare
	EMP_ID INT = E_ID;
	EMP_NAME VARCHAR (50) = E_NAME;
	EMP_EMAIL VARCHAR(50) =  E_EMAIL;
	EMP_AGE INT  = E_AGE;
	EMP_EXPERIENCE INT = E_EXPERIENCE;
	JOINING_DATE TIMESTAMP = J_DATE;
BEGIN
INSERT INTO NEW_JOINEE (EMP_ID, EMP_NAME, EMP_EMAIL, EMP_AGE, EMP_EXPERIENCE, JOINING_DATE) VALUES
(EMP_ID, EMP_NAME, EMP_EMAIL, EMP_AGE, EMP_EXPERIENCE, JOINING_DATE);
RAISE NOTICE 'DATA ENTERED';
END;
$$;
  
CALL DATA_ADDER(131, 'Jyoti Lanjewar', 'jyoti.Lanjewar@example.com', 24, 2, '2023-05-15 10:10:00');

-- FUNCTION
CREATE OR REPLACE FUNCTION 








