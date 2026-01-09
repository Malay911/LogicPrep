--📜 Paper 5: Table & Data Generation Scripts

-- Create Customers Table
CREATE TABLE Customers2 (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(50) NOT NULL,
    JoinDate DATE NOT NULL
);

-- Create Products Table
CREATE TABLE Products2 (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50),
    Price DECIMAL(10,2) NOT NULL,
    StockQuantity INT NOT NULL
);

-- Create Orders Table
CREATE TABLE Orders2 (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    OrderDate DATE NOT NULL,
    Quantity INT NOT NULL,
    TotalOrderAmount DECIMAL(10,2) NOT NULL,
    Price DECIMAL(10,2) NOT NULL, -- Price at the time of sale
    OrderStatus VARCHAR(20) CHECK (OrderStatus IN ('Pending', 'Shipped', 'Delivered', 'Cancelled'))
);

-- Insert Sample Customers
INSERT INTO Customers2 (Name, JoinDate) VALUES
('Alice Smith', '2023-01-15'),
('Bob Johnson', '2023-02-20'),
('Charlie Brown', '2023-03-05'),
('David Lee', '2023-04-10'),
('Eve Davis', '2023-05-12');

-- Insert Sample Products
INSERT INTO Products2 (ProductName, Category, Price, StockQuantity) VALUES
('16" Laptop', 'Computer', 1200.00, 10),
('Wireless Mouse', 'Computer', 25.00, 50),
('iPhone 15', 'Mobile', 999.00, 20),
('Galaxy S24', 'Mobile', 899.00, 30),
('Mechanical Keyboard', 'Computer', 75.00, 5),  -- Low stock
('4K Monitor', 'Computer', 450.00, 15),
('Desk Lamp', 'Home', 45.00, 100);             -- Never ordered

-- Insert Sample Orders
INSERT INTO Orders2 (CustomerID, ProductID, OrderDate, Quantity, Price, TotalOrderAmount, OrderStatus) VALUES
-- High-value orders
(4, 3, '2024-10-01', 3, 999.00, 2997.00, 'Pending'),   -- David, iPhone 15
(2, 3, '2024-05-11', 2, 999.00, 1998.00, 'Shipped'),    -- Bob, iPhone 15
(1, 1, '2024-05-10', 1, 1200.00, 1200.00, 'Delivered'), -- Alice, Laptop
(2, 1, '2024-07-15', 1, 1200.00, 1200.00, 'Delivered'), -- Bob, Laptop

-- Repeat buyers (Alice on iPhone, Eve on Keyboard)
(1, 3, '2024-10-05', 1, 999.00, 999.00, 'Delivered'),  -- Alice, iPhone 15
(1, 3, '2024-10-10', 1, 999.00, 999.00, 'Delivered'),  -- Alice, iPhone 15 (Repeat)

-- Stock < Pending query (Keyboard: Stock 5, Pending 3+4=7)
(5, 5, '2024-11-15', 3, 75.00, 225.00, 'Pending'),    -- Eve, Keyboard
(5, 5, '2024-11-16', 4, 75.00, 300.00, 'Pending'),    -- Eve, Keyboard (Repeat)

-- Cancelled order before 2024
(2, 2, '2023-12-20', 1, 25.00, 25.00, 'Cancelled'),   -- Bob, Mouse

-- Other orders
(1, 2, '2024-05-10', 1, 25.00, 25.00, 'Delivered'),    -- Alice, Mouse
(3, 4, '2024-06-01', 1, 899.00, 899.00, 'Delivered');  -- Charlie, Galaxy S24

--🚀 Paper 5: SQL Queries
--1: List top 5 highest amount orders with Customer Name & Product Name.
SELECT TOP 5 Customers2.Name,Products2.ProductName,Orders2.TotalOrderAmount
FROM Customers2 JOIN Orders2
ON Customers2.CustomerID=Orders2.CustomerID
JOIN Products2
ON Orders2.ProductID=Products2.ProductID
ORDER BY Orders2.TotalOrderAmount DESC

--2: List Products with Category which are never ordered.
SELECT Products2.ProductName,Products2.Category
FROM Products2 LEFT JOIN Orders2
ON Products2.ProductID=Orders2.ProductID
WHERE Orders2.ProductID IS NULL

--3: List Category wise total orders, total ordered quantity and total order amount.
SELECT Products2.Category,COUNT(Orders2.OrderID) as TotalOrders,SUM(Orders2.Quantity) as TotalOrderedQuantity,SUM(Orders2.TotalOrderAmount) as TotalOrderAmount
FROM Products2 JOIN Orders2
ON Products2.ProductID=Orders2.ProductID
GROUP BY Products2.Category

--4: List Products with Average Price of "Computer" Category.
SELECT Products2.ProductName,AVG(Products2.Price)
FROM Products2
WHERE Products2.Category='Computer'
GROUP BY Products2.ProductName

--5: Find Customers who ordered the same product more than once.
SELECT Customers2.Name,Products2.ProductName,COUNT(*) AS TimesOrdered
FROM Customers2 JOIN Orders2
ON Customers2.CustomerID=Orders2.CustomerID
JOIN Products2
ON Orders2.ProductID=Products2.ProductID
GROUP BY Customers2.Name,Products2.ProductName
HAVING COUNT(*)>1

--6: Which Product is highest selling in terms of quantity?
SELECT TOP 1 WITH TIES Products2.ProductName,SUM(Orders2.Quantity)
FROM Products2 JOIN Orders2
ON Products2.ProductID=Orders2.ProductID
GROUP BY Products2.ProductName
ORDER BY SUM(Orders2.Quantity) DESC

--7: Delete those orders which are Cancelled and placed before '2024-01-01'.
DELETE 
FROM Orders2
WHERE OrderStatus='Cancelled' AND OrderDate<'2024-01-01'

--8: List products whose current stock is less than current pending orders.
SELECT Products2.ProductName,SUM(Products2.StockQuantity)
FROM Products2 JOIN Orders2
ON Products2.ProductID=Orders2.ProductID
WHERE Orders2.OrderStatus='Pending'
GROUP BY Products2.ProductName
HAVING Products2.StockQuantity<SUM(Orders2.Quantity)

--9: List Top 10 Customers with highest total order amount of Category "Mobile".
SELECT TOP 10 Customers2.Name,MAX(Orders2.TotalOrderAmount)
FROM Customers2 JOIN Orders2
ON Customers2.CustomerID=Orders2.CustomerID
GROUP BY Customers2.Name
ORDER BY MAX(Orders2.TotalOrderAmount) DESC

--10: List Date wise Total Order Amount.
SELECT Orders2.OrderDate,SUM(Orders2.TotalOrderAmount)
FROM Orders2 JOIN 