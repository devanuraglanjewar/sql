SELECT * FROM department;
do
$$
declare 
	cur_emp CURSOR FOR SELECT emp_id, emp_name FROM employees;
	eid int;
	ename varchar(100);

Begin
	OPEN cur_emp;
	fetch next from cur_emp into eid,ename;
	loop
	raise notice 'ID = %  Name = %',eid,ename;
	fetch next from cur_emp into eid,ename;
	exit when not found;
	end loop;
end;$$

SELECT * FROM employees;
-- Subquery
-- write a query to find the employee in each dept

Select * from employees E Where E.salary < (SELECT AVG(SALARY) FROM employees Where dept_id = E.dept_id);

-- Find the details of the employee who is getting the min salary in each dept
 Select E.emp_id, E.emp_name, D.dept_name, E.salary from employees E inner join department D ON d.dept_id = E.dept_id  Where salary = (SELECT min(SALARY) FROM employees Where dept_id = E.dept_id);

-- BY CTE
 WITH Lowest_salary AS (
SELECT min(SALARY) min_sal, dept_id FROM employees group by dept_id
)
Select E.emp_id, E.emp_name, E.dept_id, E.salary from employees E 
INNER JOIN Lowest_salary L ON L.dept_id = E.dept_id AND E.salary = L.min_sal;

