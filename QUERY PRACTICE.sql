-- question to master sql
SELECT * FROM JOB;
select * from new_joinee;
-- filtering and aggregation
-- find the total number of new joinee
SELECT COUNT(EMP_NAME) FROM NEW_JOINEE;

-- Find the high salary
SELECT SALARY FROM JOB ORDER BY SALARY DESC LIMIT 1;

-- Find the avrage age of employee
Select avg(EMP_AGE) from NEW_JOINEE;

-- Retrive all employee who join after 1,2023
Select * from NEW_JOINEE where JOINING_DATE > '2023-01-01';

-----------------------------------------------------------------------------------------------------------------------------------------
-- Joins & Relationship
-- Retrive employee with their role
Select e.emp_id, e.emp_name, j.JOB_ROLE from NEW_JOINEE e inner join JOB j ON e.job_id = j.job_id order by e.emp_id ASC;

-- Retrive employee whose salary is greater than 50000
Select e.emp_name, j.SALARY from JOB j inner join NEW_JOINEE e ON e.job_id=j.job_id where j.salary > 50000 order by j.salary ASC;

-- Retrive employee with no job
SELECT e.emp_name, e.emp_id from NEW_JOINEE e inner join job j on e.job_id=j.job_id where e.job_id = null;

-------------------------------------------------------------------------------------------------------------------------------------------
-- subqueries

-- Find employee who's salary is greater than avarage salary
Select e.emp_name, j.salary from NEW_JOINEE e join JOB j ON e.job_id = j.job_id 
where 
	j.salary > (select avg(salary) from job);

-- retrive second heighest salary
SELECT SALARY FROM JOB ORDER BY SALARY DESC LIMIT 1 OFFSET 1;

-- Find all jobrole that have atleast one employee assigned
SELECT DISTINCT J.JOB_ROLE FROM JOB J JOIN NEW_JOINEE N ON J.JOB_ID = N.JOB_ID ORDER BY J.JOB_ROLE;



-- UPDATE AND MODIFICATION

-- Update the salary of all employee with the role of software engineer
UPDATE JOB SET SALARY = SALARY * 1.10 WHERE JOB_ROLE = 'Software Engineer';

-- Change the job role of employee with specific id
UPDATE NEW_JOINEE SET JOB_ID = 3 WHERE EMP_ID = 130;


-- Delete employee who have 0 years of experiance
DELETE FROM NEW_JOINEE WHERE EMP_EXPERIENCE = 0;

