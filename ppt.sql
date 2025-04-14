CREATE TABLE Employee (
    Employee_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(50),
    Salary INT,
    Age INT
);

INSERT INTO Employee (Employee_ID, Name, Department, Salary, Age)
VALUES
    (1, 'John', 'HR', 50000, 25),
    (2, 'Alice', 'IT', 60000, 30),
    (3, 'Bob', 'Finance', 55000, 35),
    (4, 'Mary', 'IT', 70000, 40),
    (5, 'Steve', 'HR', 50000, 25);

SELECT * FROM Employee;

-- Performing all aggregate functions
SELECT 
    COUNT(*) AS Total_Employees, -- Total number of rows
    COUNT(DISTINCT Department) AS Distinct_Departments, -- Number of unique departments
    SUM(Salary) AS Total_Salary, -- Sum of all salaries
    AVG(Salary) AS Average_Salary, -- Average salary
    MIN(Salary) AS Minimum_Salary, -- Minimum salary
    MAX(Salary) AS Maximum_Salary -- Maximum salary
FROM Employee;