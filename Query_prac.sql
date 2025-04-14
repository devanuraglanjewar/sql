CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT CHECK (age >= 18),
    department_id INT,
    salary DECIMAL(10,2),
    joining_date DATE DEFAULT CURRENT_DATE
);

INSERT INTO Employees (emp_id, name, age, department_id, salary, joining_date) VALUES
(1, 'Alice', 30, 1, 70000, '2022-01-15'),
(2, 'Bob', 25, 2, 60000, '2023-03-10'),
(3, 'Charlie', 28, 1, 75000, '2021-07-22'),
(4, 'David', 35, 3, 80000, '2020-05-05'),
(5, 'Eva', 27, 2, 65000, '2023-06-15');


CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) UNIQUE
);

INSERT INTO Departments (department_id, department_name) VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance');

CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50) NOT NULL,
    start_date DATE,
    end_date DATE,
    emp_id INT,
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id)
);

INSERT INTO Projects (project_id, project_name, start_date, end_date, emp_id) VALUES
(101, 'AI Development', '2023-01-01', '2024-01-01', 1),
(102, 'HR Management System', '2023-05-01', '2024-05-01', 2),
(103, 'Finance Dashboard', '2022-09-15', '2023-09-15', 4);

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    city VARCHAR(50)
);

INSERT INTO Customers (customer_id, name, email, phone, city) VALUES
(1, 'John Doe', 'john@example.com', '9876543210', 'Mumbai'),
(2, 'Jane Smith', 'jane@example.com', '9765432109', 'Delhi'),
(3, 'Michael Brown', 'michael@example.com', '9898989898', 'Bangalore');


CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE DEFAULT CURRENT_DATE,
    amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Orders (order_id, customer_id, order_date, amount) VALUES
(1001, 1, '2024-01-15', 5000),
(1002, 2, '2024-01-18', 3000),
(1003, 3, '2024-01-20', 7000),
(1004, 3, '2025-01-30', 7000),
(1005, 1, '2024-01-22', 4500);

SELECT * FROM Employees;
SELECT * FROM Projects;
SELECT * FROM Departments;
SELECT * FROM Customers;

-- Fetch employees who joined after January 1, 2022
SELECT * FROM Employees WHERE joining_date > '2022-01-01';

-- List all customers in descending order of their names.
SELECT name from Customers order by name ASC;

-- Fetch the top 3 highest-paid employees
SELECT name, salary from Employees ORDER BY salary DESC LIMIT 3

-- Find the total number of employees in the IT department
SELECT COUNT(*) FROM Employees Where department_id = 1

--Calculate the average salary of all employees.
SELECT AVG(salary) As AVG_SAL  FROM Employees

-- Show the total salary expense for each department.
Select department_id, SUM(salary) AS total_sal from Employees GROUP BY department_id;
Select Departments.department_name, SUM(salary) AS total_sal from Employees inner join Departments ON Departments.department_id = Employees.department_id GROUP BY department_name 

-- Display departments where total salary expense is more than 1,30,000
SELECT department_id, SUM(salary) AS total_salary 
FROM Employees 
GROUP BY department_id 
HAVING SUM(salary) > 130000; 

Select Departments.department_name, SUM(salary) AS total_sal from Employees 
inner join Departments ON Departments.department_id = Employees.department_id 
GROUP BY department_name HAVING SUM(salary) > 130000; 

Select * from Orders;
-- create a proceure to delete record which is old than one year
CREATE OR REPLACE PROCEDURE deleter()
language plpgsql
as $$
BEGIN 
	Delete from Orders Where order_date < (CURRENT_DATE - Interval '1 year');
END; $$

CALL deleter();
truncate table orders;
SELECT * FROM EMPLOYEES;

-- Write a stored procedure to increase the salary of employees in a given department

CREATE OR REPLACE Procedure increment_sal(dept_id INT)
language plpgsql
AS $$
begin
 	update Employees
	SET salary = salary * 1.10
	WHERE department_id = dept_id;
END; $$

CALL increment_sal(1);

-- WRITE A FUNCTION TO GIVE 10% BONUS OF EMPLOYEES SALARY

CREATE OR REPLACE FUNCTION bonus(emp_salary )
language plpgsql
AS $$
Begin 