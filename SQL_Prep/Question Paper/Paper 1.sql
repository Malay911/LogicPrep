-- 📜 Paper 1: Table & Data Generation Scripts

-- Create Department Table
CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50) NOT NULL
);

-- Create Employee Table
CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    City VARCHAR(50),
    Mobile VARCHAR(20),
    JoiningDate DATE,
    Salary DECIMAL(10, 2),
    DeptID INT FOREIGN KEY REFERENCES Department(DeptID)
);

-- Insert Sample Departments
INSERT INTO Department (DeptID, DeptName) VALUES
(1, 'Computer'),
(2, 'Civil'),
(3, 'Mechanical'),
(4, 'HR'),
(5, 'Finance');

-- Insert Sample Employees
INSERT INTO Employee (EmpID, Name, Email, City, Mobile, JoiningDate, Salary, DeptID) VALUES
-- Q1: Changa
(101, 'Sandeep', 'sandeep@test.com', 'Mumbai', '1112223334', '2021-05-15', 50000.00, 1),
(102, 'Rajesh Kumar', 'rajesh@test.com', 'Changa', '2223334445', '2022-03-10', 55000.00, 1),

-- Q2: Joined after 01 Jun 2022, Computer or Civil
(103, 'Priya Sharma', 'priya@test.com', 'Pune', '3334445556', '2022-06-05', 60000.00, 1),
(104, 'Amit Singh', 'amit@test.com', 'Delhi', '4445556667', '2022-07-20', 62000.00, 2),

-- Q3: No mobile or email
(105, 'Sneha Patel', 'sneha@test.com', 'Pune', NULL, '2021-08-01', 58000.00, 1),
(106, 'Vikram Rathod', NULL, 'Mumbai', '6667778889', '2022-01-12', 53000.00, 2),

-- Q4/Q5: Top salaries
(107, 'Anjali Mehta', 'anjali@test.com', 'Delhi', '7778889990', '2020-02-18', 90000.00, 1),
(108, 'Manish Jain', 'manish@test.com', 'Changa', '8889990001', '2021-11-05', 85000.00, 2),
(109, 'Kavita Iyer', 'kavita@test.com', 'Pune', '9990001112', '2022-04-30', 88000.00, 1),

-- Q5: Top 3 dept wise
(110, 'Rahul Dave', 'rahul@test.com', 'Mumbai', '1231231234', '2021-09-22', 82000.00, 2),
(111, 'Meera Krishnan', 'meera@test.com', 'Delhi', '2342342345', '2022-08-14', 86000.00, 1),

-- Q9: Dept with > 9 (Computer will have 10)
(112, 'Varun Gill', 'varun@test.com', 'Pune', '3453453456', '2023-01-01', 50000.00, 1),
(113, 'Deepak Shah', 'deepak@test.com', 'Changa', '4564564567', '2023-02-11', 48000.00, 1),
(114, 'Nisha Verma', 'nisha@test.com', 'Mumbai', '5675675678', '2023-03-15', 47000.00, 1),
(115, 'Suresh Reddy', 'suresh@test.com', 'Delhi', '6786786789', '2023-04-20', 46000.00, 1),

-- Q10: Mechanical
(116, 'Rina Desai', 'rina@test.com', 'Pune', '7897897890', '2022-05-10', 60000.00, 3),
(117, 'Gaurav Kumar', 'gaurav@test.com', 'Mumbai', '8908908901', '2022-06-12', 65000.00, 3),

-- Q12: HR > 45k
(118, 'Pooja Singh', 'pooja@test.com', 'Delhi', '9019019012', '2021-07-07', 48000.00, 4),
(119, 'Alok Nath', 'alok@test.com', 'Pune', '0120120123', '2022-09-30', 40000.00, 4),

-- Q13: Same name
(120, 'Amit Singh', 'amit2@test.com', 'Pune', '1122112211', '2023-05-01', 51000.00, 5),
(121, 'Priya Sharma', 'priya2@test.com', 'Mumbai', '2233223322', '2023-06-10', 70000.00, 5);

--1: List all Employees which belongs to Changa.
SELECT EmpID,Name,City
FROM Employee
WHERE City='Changa'

--2: List all Employees who joined after 01 Jun, 2022 and belongs to either Computer or Civil.
SELECT Employee.EmpID,Employee.Name,Employee.JoiningDate,Department.DeptName
FROM Employee JOIN Department
ON Employee.DeptID=Department.DeptID
WHERE Department.DeptName IN ('Computer','Civil')
GROUP BY EmpID,Name,JoiningDate,DeptName
HAVING Employee.JoiningDate>'2022-06-01'

--3: List all Employees with department name who don't have either mobile or email.
SELECT Employee.EmpID,Employee.Name,Employee.Email,Employee.Mobile,Employee.JoiningDate,Department.DeptName
FROM Employee JOIN Department
ON Employee.DeptID=Department.DeptID
WHERE Employee.Mobile IS NULL OR Employee.Email IS NULL

--4: List top 5 employees as per salaries.
SELECT TOP 5 Employee.EmpID,Employee.Name,Employee.Salary
FROM Employee JOIN Department
ON Employee.DeptID=Department.DeptID
ORDER BY Employee.Salary DESC

--5: List top 3 employees department wise as per salaries.
WITH TOP3EMPLOYEE AS(
	SELECT Employee.EmpID,Employee.Name,Department.DeptID,Employee.Salary,
	ROW_NUMBER() OVER(
		PARTITION BY Employee.DeptID
		ORDER BY Employee.Salary DESC
	)as rn
	FROM Employee JOIN Department
	ON Employee.DeptID=Department.DeptID
)
SELECT TOP3EMPLOYEE.EmpID,TOP3EMPLOYEE.Salary
FROM TOP3EMPLOYEE JOIN Department
ON TOP3EMPLOYEE.DeptID=Department.DeptID
WHERE rn>=3
ORDER BY Department.DeptID,TOP3EMPLOYEE.Salary DESC

--6: List City with Employee Count.
SELECT Employee.City,COUNT(Employee.EmpID) AS EmployeeCount
FROM Employee JOIN Department
ON Employee.DeptID=Department.DeptID
GROUP BY Employee.City

--7: List City Wise Maximum, Minimum & Average Salaries & Give Proper Name As MaxSal, MinSal & AvgSal.
SELECT Employee.City,MAX(Employee.Salary) AS MaxSal,MIN(Employee.Salary) AS MinSal,AVG(Employee.Salary) AS AvgSal
FROM Employee
GROUP BY Employee.City

--8: List Department wise City wise Employee Count.
SELECT Department.DeptName,Employee.City,COUNT(Employee.EmpID) AS EmployeeCount
FROM Employee JOIN Department
ON Employee.DeptID=Department.DeptID
GROUP BY Department.DeptName,Employee.City

--9: List Departments with more than 9 employees.
SELECT Department.DeptName,COUNT(Employee.EmpID) AS EmployeeCount
FROM Employee JOIN Department
ON Employee.DeptID=Department.DeptID
GROUP BY Department.DeptName
HAVING COUNT(Employee.EmpID)>9

--10: Give 10% increment in salary to all employees who belongs to Mechanical Department.
UPDATE Employee
SET Employee.Salary=Employee.Salary+Employee.Salary*0.1
FROM Employee JOIN Department
ON Employee.DeptID=Department.DeptID
WHERE Department.DeptName='Mechanical'

--11: Update City of Sandeep from Mumbai to Pune having 101 as Employee ID.
UPDATE Employee
SET City='Pune'
WHERE EmpID=101

--12: Delete all the employees who belongs to HR Department & Salary is more than 45,000.
DELETE Employee
FROM Employee JOIN Department
ON Employee.DeptID=Department.DeptID
WHERE Department.DeptName='HR' AND Employee.Salary>45000

--13: List Employees with same name with occurrence of name.
SELECT Name,COUNT(Name) AS OccurrenceCount
FROM Employee
GROUP BY Name
HAVING COUNT(Name)>1

--14: List Department wise Average Salary.
SELECT Department.DeptName,AVG(Employee.Salary) AS AverageSalary
FROM Department JOIN Employee
ON Employee.DeptID=Department.DeptID
GROUP BY Department.DeptName 

--15: List City wise highest paid employee.
SELECT E1.City,E1.Name,E1.Salary
FROM Employee E1
WHERE E1.Salary=(
	SELECT MAX(E2.Salary)
	FROM Employee E2
	WHERE E2.City=E1.City
)
ORDER BY E1.Salary DESC