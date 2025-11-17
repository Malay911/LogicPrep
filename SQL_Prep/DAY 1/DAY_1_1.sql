-- Create the EMP table
CREATE TABLE EMP (
    EID INT PRIMARY KEY,
    EName VARCHAR(50),
    Department VARCHAR(50),
    Salary INT,
    JoiningDate DATE,
    City VARCHAR(50),
    Gender VARCHAR(10)
);

-- Insert data into the EMP table
INSERT INTO EMP (EID, EName, Department, Salary, JoiningDate, City, Gender)
VALUES
(101, 'Rahul', 'Admin', 56000, '1990-01-01', 'Rajkot', 'Male'),
(102, 'Hardik', 'IT', 18000, '1990-09-25', 'Ahmedabad', 'Male'),
(103, 'Bhavin', 'HR', 25000, '1991-05-14', 'Baroda', 'Male'),
(104, 'Bhoomi', 'Admin', 39000, '1991-02-08', 'Rajkot', 'Female'),
(105, 'Rohit', 'IT', 17000, '1990-07-23', 'Jamnagar', 'Male'),
(106, 'Priya', 'IT', 9000, '1990-10-18', 'Ahmedabad', 'Female'),
(107, 'Bhoomi', 'HR', 34000, '1991-12-25', 'Rajkot', 'Female'),
(108, 'Manish', 'IT', 22000, '1990-04-20', 'Baroda', 'Male'),
(109, 'Kavita', 'Admin', 35000, '1992-03-12', 'Ahmedabad', 'Female'),
(110, 'Suresh', 'HR', 28000, '1991-11-05', 'Jamnagar', 'Male'),
(111, 'Pooja', 'IT', 19000, '1991-01-30', 'Rajkot', 'Female'),
(112, 'Amit', 'Admin', 42000, '1990-08-19', 'Baroda', 'Male'),
(113, 'Rekha', 'HR', 31000, '1992-07-02', 'Ahmedabad', 'Female'),
(114, 'Vijay', 'IT', 20000, '1990-06-11', 'Rajkot', 'Male'),
(115, 'Meera', 'Admin', 38000, '1991-10-09', 'Jamnagar', 'Female');

-- Create the SALES_DATA table
CREATE TABLE SALES_DATA (
    Region VARCHAR(50),
    Product VARCHAR(50),
    Sales_Amount INT,
    Year INT
);

-- Insert data into the SALES_DATA table
INSERT INTO SALES_DATA (Region, Product, Sales_Amount, Year)
VALUES
('North America', 'Watch', 1500, 2023),
('Europe', 'Mobile', 1200, 2023),
('Asia', 'Watch', 1800, 2023),
('North America', 'TV', 900, 2024),
('Europe', 'Watch', 2000, 2024),
('Asia', 'Mobile', 1000, 2024),
('North America', 'Mobile', 1600, 2023),
('Europe', 'TV', 1500, 2023),
('Asia', 'TV', 1100, 2024),
('North America', 'Watch', 1700, 2024),
('Asia', 'Watch', 2200, 2024),
('Europe', 'Mobile', 1400, 2024),
('North America', 'TV', 1300, 2023),
('Asia', 'TV', 1000, 2023),
('Europe', 'Watch', 1800, 2023),
('North America', 'Mobile', 1100, 2024),
('Asia', 'Laptop', 3000, 2023),
('Europe', 'Laptop', 3500, 2024),
('North America', 'Laptop', 2800, 2024),
('Asia', 'Mobile', 1300, 2023);


--1. Display the Highest, Lowest, Label the columns Maximum, Minimum respectively.
Select MAX(Salary) AS Maximum,MIN(Salary) AS Minimum 
from EMP

--2. Display Total, and Average salary of all employees. Label the columns Total_Sal and Average_Sal, respectively.
Select SUM(Salary) as Total_Sal,AVG(Salary) as Average_Sal
from EMP

--3. Find total number of employees of EMPLOYEE table.
Select COUNT(EID) as Total_Employees
from EMP

--4. Find highest salary from Rajkot city.
Select MAX(Salary) as Max_Salary_Rajkot
from EMP

--5. Give maximum salary from IT department.
Select MAX(Salary) as Max_Salary_IT
from EMP
WHERE Department='IT'

--6. Count employee whose joining date is after 8-Feb-91.
Select COUNT(EID) as Employee_Count
from EMP
where JoiningDate>='1991-02-08'

--7. Display average salary of Admin department.
Select AVG(Salary) as Avg_Salary_Admin
from EMP
WHERE Department='Admin'

--8. Display total salary of HR department.
Select SUM(Salary) as Total_Salary_HR
from EMP
WHERE Department='HR'

--9. Count total number of cities of employee without duplication.
Select COUNT(DISTINCT City) as Unique_Cities
from EMP

--10. Count unique departments.
Select COUNT(DISTINCT Department) as Unique_Departments
from Emp

--11. Give minimum salary of employee who belongs to Ahmedabad.
Select MIN(Salary) as Min_Salary_Ahmedabad
from EMP
WHERE City='Ahmedabad'

--12. Find city wise highest salary.
Select City,MAX(Salary) as Max_Salary
from EMP
GROUP BY City

--13. Find department wise lowest salary.
Select Department,MIN(Salary) as Min_Salary
from EMP
GROUP BY Department

--14. Display city with the total number of employees belonging to each city.
Select City,COUNT(EID) as Employee_Count
from EMP
GROUP BY City

--15. Give total salary of each department of EMP table.
Select Department,SUM(Salary) as Total_Salary 
from EMP
GROUP BY Department

--16. Give average salary of each department of EMP table without displaying the respective department name.
Select AVG(Salary) as Average_Salary
from EMP
GROUP BY Department

--17. Count the number of employees for each department in every city.
Select Department,City,COUNT(EID) as Employee_Count
from EMP
GROUP BY Department,City

--18. Calculate the total salary distributed to male and female employees.
Select Gender,SUM(Salary) as Total_Salary
from EMP
GROUP BY Gender

--19. Give city wise maximum and minimum salary of female employees.
Select City,MAX(Salary) as Max_Salary,MIN(Salary) as Min_Salary 
from EMP
WHERE Gender='Female'
GROUP BY City

--20. Calculate department, city, and gender wise average salary.
Select Department,City,Gender,AVG(Salary) as Average_Salary
from EMP
GROUP BY Department,City,Gender

--Part-B
--1. Count the number of employees living in Rajkot
Select COUNT(EID) as Rajkot_Employees
from EMP
WHERE City='Rajkot'

--2. Display the difference between the highest and lowest salaries. Label the column DIFFERENCE.
Select MAX(Salary)-MIN(Salary) as DIFFERENCE
from EMP

--3. Display the total number of employees hired before 1st January, 1991.
Select COUNT(EID) as Hired_Before_1991
from EMP
WHERE JoiningDate<'1991-01-01'

--Part-C
--1. Count the number of employees living in Rajkot or Baroda.
Select COUNT(EID) as Employee_Count
from EMP
WHERE City IN('Rajkot','Baroda')

--2. Display the total number of employees hired before 1st January, 1991 in IT department.
Select COUNT(EID) as Employee_Count
from EMP
WHERE JoiningDate<'1991-01-01' and Department='IT'

--3. Find the Joining Date wise Total Salaries.
Select JoiningDate,SUM(Salary) as Total_Salary
from EMP
GROUP BY JoiningDate

--4. Find the Maximum salary department & city wise in which city name starts with ‘R’.
Select Department,City,MAX(Salary) as Max_Salary
from EMP
WHERE City like 'R%'
GROUP BY Department,City

--Queries on SALES_DATA Table
--Part-A

--1. Display Total Sales Amount by Region.
Select Region,SUM(Sales_Amount) as Total_Sales
from SALES_DATA
GROUP BY REGION

--2. Display Average Sales Amount by Product.
Select Product,AVG(Sales_Amount) as Average_Sales
from SALES_DATA
GROUP BY Product

--3. Display Maximum Sales Amount by Year.
Select YEAR,MAX(Sales_Amount) as Max_Sales
from SALES_DATA
GROUP BY YEAR

--4. Display Minimum Sales Amount by Region and Year.
Select REGION,YEAR,MIN(Sales_Amount) as Min_Sales
from SALES_DATA
GROUP BY REGION,YEAR

--5. Count of Products Sold by Region.
Select REGION,COUNT(Product) as Product_Count 
from SALES_DATA
GROUP BY REGION

--6. Display Sales Amount by Year and Product.
Select YEAR,Product,SUM(Sales_Amount) as Total_Sales 
from SALES_DATA
GROUP BY YEAR,Product

--7. Display Regions with Total Sales Greater Than 5000.
Select REGION,SUM(Sales_Amount) as Total_Sales
from SALES_DATA
GROUP BY REGION
HAVING SUM(Sales_Amount)>5000

--8. Display Products with Average Sales Less Than 10000.
Select Product,AVG(Sales_Amount) as Average_Sales
from SALES_DATA
GROUP BY Product
HAVING AVG(Sales_Amount)<10000

--9. Display Years with Maximum Sales Exceeding 500.
Select YEAR,MAX(Sales_Amount) as Max_Sales
from SALES_DATA
GROUP BY YEAR
HAVING MAX(Sales_Amount)>500

--10. Display Regions with at Least 3 Distinct Products Sold.
Select REGION,COUNT(DISTINCT Product) as Distinct_Products 
from SALES_DATA
GROUP BY REGION
HAVING COUNT(DISTINCT Product)>=3

--11. Display Years with Minimum Sales Less Than 1000.
Select YEAR,MIN(Sales_Amount) as Min_Sales
from SALES_DATA
GROUP BY YEAR
HAVING MIN(Sales_Amount)<1000

--12. Display Total Sales Amount by Region for Year 2023, Sorted by Total Amount.
Select REGION,SUM(Sales_Amount) as Total_Sales_2023 
from SALES_DATA
WHERE YEAR=2023
GROUP BY REGION
ORDER BY SUM(Sales_Amount) ASC

--13. Find the Region Where 'Mobile' Had the Lowest Total Sales Across All Years.
Select TOP 1 REGION,SUM(Sales_Amount) as Total_Mobile_Sales
from SALES_DATA
WHERE Product='Mobile'
GROUP BY REGION
ORDER BY SUM(Sales_Amount) ASC

--14. Find the Product with the Highest Sales Across All Regions in 2023.
Select TOP 1 Product,SUM(Sales_Amount) as Total_Sales_2023
from SALES_DATA
WHERE YEAR=2023
GROUP BY Product
ORDER BY SUM(Sales_Amount) DESC

--15. Find Regions Where 'TV' Sales in 2023 Were Greater Than 1000. 
Select REGION,Sales_Amount as TV_Sales_2023 
from SALES_DATA
where Product='TV' and YEAR=2023 and Sales_Amount>1000

--Part-B
--1. Display Count of Orders by Year and Region, Sorted by Year and Region.
Select YEAR,REGION,COUNT(Product) as Order_Count 
from SALES_DATA
GROUP BY YEAR,REGION
ORDER BY YEAR,REGION

--2. Display Regions with Maximum Sales Amount Exceeding 1000 in Any Year, Sorted by Region. 
Select REGION,MAX(Sales_Amount) as Max_Sale
from SALES_DATA
GROUP BY REGION
HAVING MAX(Sales_Amount)>100
ORDER BY REGION

--3. Display Years with Total Sales Amount Less Than 10000, Sorted by Year Descending.
Select YEAR,SUM(Sales_Amount)
from SALES_DATA
GROUP BY YEAR
HAVING SUM(Sales_Amount)<10000
ORDER BY YEAR DESC

--4. Display Top 3 Regions by Total Sales Amount in Year 2024.
Select TOP 3 REGION,SUM(Sales_Amount) as Total_Sales_2024 
from SALES_DATA
WHERE YEAR=2024
GROUP BY REGION

--5. Find the Year with the Lowest Total Sales Across All Regions.
Select TOP 1 YEAR,SUM(Sales_Amount) as Total_Sales
from SALES_DATA
GROUP BY YEAR
ORDER BY YEAR ASC

--Part-C
--1. Display Products with Average Sales Amount Between 1000 and 2000, Ordered by Product Name.
Select Product,AVG(Sales_Amount) as Average_Sales
from SALES_DATA
GROUP BY PRODUCT
HAVING AVG(Sales_Amount) BETWEEN 1000 and 2000
ORDER BY Product

--2. Display Years with More Than 1 Orders from Each Region.
Select Year
from SALES_DATA
GROUP BY YEAR
HAVING COUNT(Product)>1

--3. Display Regions with Average Sales Amount Above 1500 in Year 2023 sort by amount in descending.
Select REGION,AVG(Sales_Amount)
from SALES_DATA
WHERE YEAR=2023
GROUP BY REGION
HAVING AVG(Sales_Amount)>1500
ORDER BY AVG(Sales_Amount) DESC

--4. Find out region wise duplicate product.
Select REGION,Product,COUNT(Product) as Occurrences
from SALES_DATA
GROUP BY REGION,PRODUCT

--5. Find out year wise duplicate product.
Select YEAR,Product,COUNT(Product) as Occurrences
from SALES_DATA
GROUP BY YEAR,PRODUCT