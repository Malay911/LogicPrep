-- Create the DEPT table first, as PERSON depends on it
CREATE TABLE DEPT (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL UNIQUE,
    DepartmentCode VARCHAR(50) NOT NULL UNIQUE,
    Location VARCHAR(50) NOT NULL
);

-- Create the PERSON table with a Foreign Key
CREATE TABLE PERSON (
    PersonID INT PRIMARY KEY,
    PersonName VARCHAR(100) NOT NULL,
    DepartmentID INT,
    Salary DECIMAL(8, 2) NOT NULL,
    JoiningDate DATE NOT NULL,
    City VARCHAR(100) NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES DEPT(DepartmentID)
);

-- Insert data into the DEPT table
INSERT INTO DEPT (DepartmentID, DepartmentName, DepartmentCode, Location)
VALUES
(1, 'Admin', 'Adm', 'A-Block'),
(2, 'Computer', 'CE', 'C-Block'),
(3, 'Civil', 'CI', 'G-Block'),
(4, 'Electrical', 'EE', 'E-Block'),
(5, 'Mechanical', 'ME', 'B-Block'),
(6, 'Marketing', 'Mkt', 'F-Block'),
(7, 'Accounts', 'Acc', 'A-Block');

-- Insert data into the PERSON table
INSERT INTO PERSON (PersonID, PersonName, DepartmentID, Salary, JoiningDate, City)
VALUES
(101, 'Rahul Tripathi', 2, 56000.00, '2000-01-01', 'Rajkot'),
(102, 'Hardik Pandya', 3, 18000.00, '2001-09-25', 'Ahmedabad'),
(103, 'Bhavin Kanani', 4, 25000.00, '2000-05-14', 'Baroda'),
(104, 'Bhoomi Vaishnav', 1, 39000.00, '2005-02-08', 'Rajkot'),
(105, 'Rohit Topiya', 2, 17000.00, '2001-07-23', 'Jamnagar'),
(106, 'Priya Menpara', NULL, 9000.00, '2000-10-18', 'Ahmedabad'),
(107, 'Neha Sharma', 2, 34000.00, '2002-12-25', 'Rajkot'),
(108, 'Nayan Goswami', 3, 25000.00, '2001-07-01', 'Rajkot'),
(109, 'Mehul Bhundiya', 4, 13500.00, '2005-01-09', 'Baroda'),
(110, 'Mohit Maru', 5, 14000.00, '2000-05-25', 'Jamnagar'),
(111, 'Alok Nath', 2, 36000.00, '2003-03-15', 'Ahmedabad'),
(112, 'Seema Jain', 3, 28000.00, '2002-06-18', 'Baroda'),
(113, 'Karan Singh', 1, 41000.00, '2004-11-30', 'Rajkot'),
(114, 'Riya Gupta', 5, 16000.00, '2001-02-12', 'Ahmedabad'),
(115, 'Suresh Patel', 7, 32000.00, '2003-08-20', 'Jamnagar'),
(116, 'Meena Kumari', 7, 30000.00, '2004-01-01', 'Rajkot'),
(117, 'Vikram Batra', NULL, 11000.00, '2005-04-05', 'Baroda');

--PART-A
--1. Combine information FROM Person and Department table using cross join or Cartesian product.
SELECT PERSON.PersonName,DEPT.DepartmentName
FROM PERSON CROSS JOIN DEPT

--2. Find all persons with their department name.
SELECT PERSON.PersonName,DEPT.DepartmentName
FROM PERSON JOIN DEPT
ON PERSON.DepartmentID=DEPT.DepartmentID

--3. Find all persons with their department name & code.
SELECT PERSON.PersonName,DEPT.DepartmentName,DEPT.DepartmentCode
FROM PERSON JOIN DEPT
ON PERSON.DepartmentID=DEPT.DepartmentID

--4. Find all persons with their department code and location.
SELECT PERSON.PersonName,DEPT.DepartmentCode,DEPT.Location
FROM PERSON JOIN DEPT
ON PERSON.DepartmentID=DEPT.DepartmentID

--5. Find the detail of the person who belongs to Mechanical department.
SELECT PERSON.PersonID,PERSON.PersonName,DEPT.DepartmentID,PERSON.Salary,PERSON.JoiningDate,PERSON.City
FROM PERSON JOIN DEPT
ON PERSON.DepartmentID=DEPT.DepartmentID
WHERE DEPT.DepartmentName='Mechanical'

--6. Final person’s name, department code and salary who lives in Ahmedabad city.
SELECT PERSON.PersonName,DEPT.DepartmentCode,PERSON.Salary
FROM PERSON JOIN DEPT
ON PERSON.DepartmentID=DEPT.DepartmentID
WHERE PERSON.City='Ahmedabad'

--7. Find the person's name whose department is in C-Block.
SELECT PERSON.PersonName
FROM PERSON JOIN DEPT
ON PERSON.DepartmentID=DEPT.DepartmentID
WHERE DEPT.Location='C-Block'

--8. Retrieve person name, salary & department name who belongs to Jamnagar city.
SELECT PERSON.PersonID,PERSON.Salary,DEPT.DepartmentName
FROM PERSON JOIN DEPT
ON PERSON.DepartmentID=DEPT.DepartmentID
WHERE PERSON.City='Jamnagar'

--9. Retrieve person’s detail who joined the Civil department after 1-Aug-2001.
SELECT PERSON.PersonID,PERSON.PersonName,DEPT.DepartmentID,PERSON.Salary,PERSON.JoiningDate,PERSON.City
FROM PERSON JOIN DEPT
ON PERSON.DepartmentID=DEPT.DepartmentID
WHERE DEPT.DepartmentName='Civil' and PERSON.JoiningDate>'2001-08-01'

--10. Display all the person's name with the department whose joining date difference with the current date is more than 365 days.
SELECT PERSON.PersonName,DEPT.DepartmentName
FROM PERSON JOIN DEPT
ON PERSON.DepartmentID=DEPT.DepartmentID
WHERE DATEDIFF(DAY,JoiningDate,GETDATE())>365

--11. Find department wise person counts.
SELECT DEPT.DepartmentName,COUNT(PERSON.PersonID)
FROM PERSON JOIN DEPT
ON PERSON.DepartmentID=DEPT.DepartmentID
GROUP BY DEPT.DepartmentName

--12. Give department wise maximum & minimum salary with department name. 
SELECT DEPT.DepartmentName,MAX(PERSON.Salary) as MaxSalary,MIN(PERSON.Salary) as MinSalary
FROM PERSON JOIN DEPT
ON PERSON.DepartmentID=DEPT.DepartmentID
GROUP BY DEPT.DepartmentName

--13. Find city wise total, average, maximum and minimum salary.
SELECT PERSON.City,SUM(PERSON.Salary) as TotalSalary,AVG(PERSON.Salary) as AvgSalary,MAX(PERSON.Salary) as MaxSalary,MIN(PERSON.Salary) as MinSalary
FROM PERSON JOIN DEPT
ON PERSON.DepartmentID=DEPT.DepartmentID
GROUP BY PERSON.City

--14. Find the average salary of a person who belongs to Ahmedabad city.
SELECT AVG(PERSON.Salary) as AvgSalary_Ahmedabad
FROM PERSON JOIN DEPT
ON PERSON.DepartmentID=DEPT.DepartmentID
WHERE PERSON.City='Ahmedabad'

--15. Produce Output Like: <PersonName> lives in <City> and works in <DepartmentName> Department.
SELECT CONCAT(PERSON.PersonName, ' lives in ',PERSON.City,' and works in ',DEPT.DepartmentName, ' Department.') as PersonDetails
FROM PERSON JOIN DEPT
ON PERSON.DepartmentID=DEPT.DepartmentID

--PART-B
--1. Produce Output Like: <PersonName> earns <Salary> FROM <DepartmentName> department monthly.
SELECT CONCAT(PERSON.PersonName,' earns ',PERSON.Salary,DEPT.DepartmentName,' department monthly.') as SalaryDetails
FROM PERSON JOIN DEPT
ON PERSON.DepartmentID=DEPT.DepartmentID

--2. Find city & department wise total, average & maximum salaries.
SELECT PERSON.City,DEPT.DepartmentName,SUM(PERSON.Salary) as TotalSalary,AVG(PERSON.Salary) as AvgSalary,MAX(PERSON.Salary) as MaxSalary
FROM PERSON JOIN DEPT
ON PERSON.DepartmentID=DEPT.DepartmentID
GROUP BY PERSON.City,DEPT.DepartmentName

--3. Find all persons who do not belong to any department.
SELECT PERSON.PersonID,PERSON.PersonName,DEPT.DepartmentID,PERSON.Salary,PERSON.JoiningDate,PERSON.City
FROM PERSON LEFT JOIN DEPT
ON PERSON.DepartmentID=DEPT.DepartmentID
WHERE DEPT.DepartmentID IS NULL

--4. Find all departments whose total salary is exceeding 100000.
SELECT DEPT.DepartmentName,SUM(PERSON.Salary) as TotalSalary
FROM PERSON JOIN DEPT
ON PERSON.DepartmentID=DEPT.DepartmentID
GROUP BY DEPT.DepartmentName
HAVING SUM(PERSON.Salary)>100000

--PART-C
--1. List all departments who have no person.
SELECT DEPT.DepartmentName
FROM PERSON RIGHT JOIN DEPT
ON PERSON.DepartmentID=DEPT.DepartmentID
WHERE PERSON.PersonID IS NULL

--2. List out department names in which more than two persons are working.
SELECT DEPT.DepartmentName,COUNT(PERSON.PersonID) as PersonCount 
FROM PERSON JOIN DEPT
ON PERSON.DepartmentID=DEPT.DepartmentID
GROUP BY DEPT.DepartmentName
HAVING COUNT(PERSON.PersonID)>2

--3. Give a 10% increment in the computer department employee’s salary.
SELECT PERSON.PersonName,PERSON.Salary
FROM PERSON JOIN DEPT
ON PERSON.DepartmentID=DEPT.DepartmentID
WHERE DEPT.DepartmentName='Computer'

UPDATE PERSON
SET Salary=SALARY+SALARY*0.1
FROM PERSON JOIN DEPT
ON PERSON.DepartmentID=DEPT.DepartmentID
WHERE DEPT.DepartmentName='Computer'

SELECT PERSON.PersonName,PERSON.Salary
FROM PERSON JOIN DEPT
ON PERSON.DepartmentID=DEPT.DepartmentID
WHERE DEPT.DepartmentName='Computer'

-- Advanced SQL Joins
-- 📚 Part 1: Book & Author Schema

-- Create Author table
CREATE TABLE Author (
    AuthorID INT PRIMARY KEY,
    AuthorName VARCHAR(100) NOT NULL,
    Country VARCHAR(50) NULL
);

-- Create Publisher table
CREATE TABLE Publisher (
    PublisherID INT PRIMARY KEY,
    PublisherName VARCHAR(100) NOT NULL UNIQUE,
    City VARCHAR(50) NOT NULL
);

-- Create Book table with Foreign Keys
CREATE TABLE Book (
    BookID INT PRIMARY KEY,
    Title VARCHAR(200) NOT NULL,
    AuthorID INT NOT NULL,
    PublisherID INT NOT NULL,
    Price DECIMAL(8, 2) NOT NULL,
    PublicationYear INT NOT NULL,
    FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID),
    FOREIGN KEY (PublisherID) REFERENCES Publisher(PublisherID)
);

-- Insert into Author
INSERT INTO Author (AuthorID, AuthorName, Country)
VALUES
(1, 'Chetan Bhagat', 'India'),
(2, 'Arundhati Roy', 'India'),
(3, 'Amish Tripathi', 'India'),
(4, 'Ruskin Bond', 'India'),
(5, 'Jhumpa Lahiri', 'India'),
(6, 'Paulo Coelho', 'Brazil'),
(7, 'Sudha Murty', 'India'),
(8, 'Vikram Seth', 'India'),
(9, 'Kiran Desai', 'India'); -- Author with no books

-- Insert into Publisher
INSERT INTO Publisher (PublisherID, PublisherName, City)
VALUES
(1, 'Rupa Publications', 'New Delhi'),
(2, 'Penguin India', 'Gurugram'),
(3, 'HarperCollins India', 'Noida'),
(4, 'Aleph Book Company', 'New Delhi'),
(5, 'Westland', 'Chennai');

-- Insert into Book
INSERT INTO Book (BookID, Title, AuthorID, PublisherID, Price, PublicationYear)
VALUES
(101, 'Five Point Someone', 1, 1, 250.00, 2004),
(102, 'The God of Small Things', 2, 2, 350.00, 1997),
(103, 'Immortals of Meluha', 3, 3, 300.00, 2010),
(104, 'The Blue Umbrella', 4, 1, 180.00, 1980),
(105, 'The Lowland', 5, 2, 400.00, 2013),
(106, 'Revolution 2020', 1, 1, 275.00, 2011),
(107, 'Sita: Warrior of Mithila', 3, 3, 320.00, 2017),
(108, 'The Room on the Roof', 4, 4, 200.00, 1956),
(109, 'A Suitable Boy', 8, 2, 600.00, 1993),
(110, 'Scion of Ikshvaku', 3, 5, 350.00, 2015),
(111, 'Wise and Otherwise', 7, 2, 210.00, 2002),
(112, '2 States', 1, 1, 260.00, 2009);

-- 📖 Part – A: Book Queries
--1. List all books with their authors.
SELECT Book.Title,Author.AuthorName
FROM Book JOIN Author
ON Book.AuthorID=Author.AuthorID

--2. List all books with their publishers.
SELECT Book.Title,Publisher.PublisherName
FROM Book JOIN Publisher
ON Book.PublisherID=Publisher.PublisherID

--3. List all books with their authors and publishers.
SELECT Book.Title,Author.AuthorName,Publisher.PublisherName
FROM Book JOIN Author
ON Book.AuthorID=Author.AuthorID
JOIN Publisher
ON Book.PublisherID=Publisher.PublisherID

--4. List all books published after 2010 with their authors and publisher and price.
SELECT Book.Title,Author.AuthorName,Publisher.PublisherName,Book.Price
FROM Book JOIN Author
ON Book.AuthorID=Author.AuthorID
JOIN Publisher
ON Book.PublisherID=Publisher.PublisherID
WHERE Book.PublicationYear>2010

--5. List all authors and the number of books they have written.
SELECT Author.AuthorName,COUNT(Book.BookID) as NumberOfBooks
FROM Book JOIN Author
ON Book.AuthorID=Author.AuthorID
GROUP BY Author.AuthorName

--6. List all publishers and the total price of books they have published.
SELECT Publisher.PublisherName,SUM(Book.Price) as TotalPrice
FROM Book JOIN Publisher
ON Book.PublisherID=Publisher.PublisherID
GROUP BY Publisher.PublisherName

--7. List authors who have not written any books.
SELECT Author.AuthorName
FROM Author LEFT JOIN Book
ON Book.AuthorID=Author.AuthorID
WHERE Book.BookID IS NULL

--8. Display total number of Books and Average Price of every Author.
SELECT Author.AuthorName,COUNT(Book.BookID) as NumberOfBooks,AVG(Book.Price) as AveragePrice
FROM Author JOIN Book
ON Book.AuthorID=Author.AuthorID
GROUP BY Author.AuthorName

--9. lists each publisher along with the total number of books they have published, sorted from highest to lowest.
SELECT Publisher.PublisherName,COUNT(Book.BookID) as BookCount
FROM Book JOIN Publisher
ON Book.PublisherID=Publisher.PublisherID
GROUP BY Publisher.PublisherName
ORDER BY COUNT(Book.BookID) DESC

--10. Display number of books published each year.
SELECT Book.PublicationYear,COUNT(Book.BookID) as NumberOfBooks
FROM Book JOIN Publisher
ON Book.PublisherID=Publisher.PublisherID
GROUP BY Book.PublicationYear

-- 📖 Part – B: Book Queries
--1. List the publishers whose total book prices exceed 500, ordered by the total price.
SELECT Publisher.PublisherName,SUM(Book.Price) as TotalPrice
FROM Book JOIN Publisher
ON Book.PublisherID=Publisher.PublisherID
GROUP BY Publisher.PublisherName
HAVING SUM(Book.Price)>500
ORDER BY SUM(Book.Price)

--2. List most expensive book for each author, sort it with the highest price.
SELECT Author.AuthorName,Book.Title,Book.Price
FROM Author JOIN Book
ON Book.AuthorID=Author.AuthorID
WHERE Book.Price=(SELECT MAX(Book.Price)
				  FROM Book
				  WHERE AuthorID=Author.AuthorID)
ORDER BY Book.Price DESC

WITH MAXPRICE AS(
	SELECT AuthorID,MAX(Book.Price) AS MAXPRICE
	FROM Book
	GROUP BY AuthorID
)
SELECT Author.AuthorName,Book.Title,Book.Price
FROM MAXPRICE JOIN Book
ON Book.AuthorID=MAXPRICE.AuthorID
AND Book.Price=MAXPRICE.MAXPRICE
JOIN Author
ON Author.AuthorID=Book.AuthorID
ORDER BY Book.Price DESC

-- 👨‍💼 Part – C: Employee & Location Schema
--1

--COUNTRY
CREATE TABLE Country (
    Cid INT PRIMARY KEY,
    Cname VARCHAR(100)
);

--STATE
CREATE TABLE State (
    Sid INT PRIMARY KEY,
    Sname VARCHAR(100),
    Cid INT,
    FOREIGN KEY (Cid) REFERENCES Country(Cid)
);

--DISTRICT
CREATE TABLE District (
    Did INT PRIMARY KEY,
    Dname VARCHAR(100),
    Sid INT,
    FOREIGN KEY (Sid) REFERENCES State(Sid)
);

--DEPT_INFO
CREATE TABLE Dept_info (
    Did INT PRIMARY KEY,
    Dname VARCHAR(100)
);

--CITY_INFO
CREATE TABLE City_info (
    Cid INT PRIMARY KEY,
    Cname VARCHAR(100),
    Did INT,
    FOREIGN KEY (Did) REFERENCES District(Did)
);

--EMP_INFO
CREATE TABLE Emp_info (
    Eid INT PRIMARY KEY,
    Ename VARCHAR(100),
    Did INT,
    Cid INT,
    Salary DECIMAL(12,2),
    Experience INT,
    FOREIGN KEY (Did) REFERENCES Dept_info(Did),
    FOREIGN KEY (Cid) REFERENCES City_info(Cid)
);

--2

--COUNTRY
INSERT INTO Country VALUES 
(1, 'India'),
(2, 'USA'),
(3, 'Canada'),
(4, 'UK'),
(5, 'Australia');

--STATE
INSERT INTO State VALUES
(1, 'Gujarat', 1),
(2, 'Maharashtra', 1),
(3, 'California', 2),
(4, 'Ontario', 3),
(5, 'Victoria', 5);

--DISTRICT
INSERT INTO District VALUES
(101, 'Rajkot', 1),
(102, 'Ahmedabad', 1),
(103, 'Mumbai', 2),
(104, 'Los Angeles', 3),
(105, 'Toronto', 4);

--DEPT_INFO
INSERT INTO Dept_info VALUES
(10, 'IT'),
(20, 'HR'),
(30, 'Sales'),
(40, 'Finance'),
(50, 'Admin');

--CITY_INFO
INSERT INTO City_info VALUES
(1001, 'Rajkot', 101),
(1002, 'Sanand', 102),
(1003, 'Bandra', 103),
(1004, 'Santa Monica', 104),
(1005, 'North York', 105);

--EMP_INFO
INSERT INTO Emp_info VALUES
(1, 'Anil Sharma', 10, 1001, 80000, 5),
(2, 'Priya Singh', 20, 1003, 65000, 3),
(3, 'Rajesh Kumar', 30, 1002, 70000, 4),
(4, 'Meena Patel', 10, 1001, 82000, 6),
(5, 'Suresh Desai', 40, 1004, 95000, 8);

--INVALID INSERT
INSERT INTO Emp_info VALUES
(6, 'Fake User', 999, 1001, 50000, 2);

--3
SELECT Emp_info.Ename as EmpName,
	   Dept_info.Dname as DeptName,
	   Emp_info.Salary,
	   Emp_info.Experience,
	   City_info.Cname as CityName,
	   District.Dname as DistrictName,
	   State.Sname as StateName,
	   Country.Cname as CountryName
FROM Emp_info
JOIN Dept_info ON Emp_info.Did=Dept_info.Did
JOIN City_info ON Emp_info.Cid=City_info.Cid
JOIN District ON City_info.Did=District.Did
JOIN State ON District.Sid=State.Sid
JOIN Country ON State.Cid=Country.Cid