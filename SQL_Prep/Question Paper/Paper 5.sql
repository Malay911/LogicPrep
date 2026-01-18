-- Create Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(50) NOT NULL,
    JoinDate DATE NOT NULL
);

-- Create Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50),
    Price DECIMAL(10,2) NOT NULL,
    StockQuantity INT NOT NULL
);

-- Create Orders Table
CREATE TABLE Orders (
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
INSERT INTO Customers (Name, JoinDate) VALUES
('Alice Smith', '2023-01-15'),
('Bob Johnson', '2023-02-20'),
('Charlie Brown', '2023-03-05'),
('David Lee', '2023-04-10'),
('Eve Davis', '2023-05-12');

-- Insert Sample Products
INSERT INTO Products (ProductName, Category, Price, StockQuantity) VALUES
('16" Laptop', 'Computer', 1200.00, 10),
('Wireless Mouse', 'Computer', 25.00, 50),
('iPhone 15', 'Mobile', 999.00, 20),
('Galaxy S24', 'Mobile', 899.00, 30),
('Mechanical Keyboard', 'Computer', 75.00, 5),  -- Low stock
('4K Monitor', 'Computer', 450.00, 15),
('Desk Lamp', 'Home', 45.00, 100);             -- Never ordered

-- Insert Sample Orders
INSERT INTO Orders (CustomerID, ProductID, OrderDate, Quantity, Price, TotalOrderAmount, OrderStatus) VALUES
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
SELECT TOP 5 Customers.Name,Products.ProductName,Orders.TotalOrderAmount
FROM Customers JOIN Orders
ON Customers.CustomerID=Orders.CustomerID
JOIN Products
ON Products.ProductID=Orders.ProductID
ORDER BY Orders.TotalOrderAmount DESC

--2: List Products with Category which are never ordered.
SELECT Products.ProductName,Products.Category
FROM Products LEFT JOIN Orders
ON Products.ProductID=Orders.ProductID
WHERE Orders.ProductID IS NULL

--3: List Category wise total orders, total ordered quantity and total order amount.
SELECT Products.Category,COUNT(Orders.OrderID) AS TotalOrders,SUM(Orders.Quantity) AS TotalOrderedQuantity,SUM(Orders.TotalOrderAmount) AS TotalOrderAmount
FROM Products JOIN Orders
ON Products.ProductID=Orders.ProductID
GROUP BY Products.Category

--4: List Products with Average Price of "Computer" Category.
SELECT Products.ProductName,AVG(Products.Price) AS Price
FROM Products
WHERE Products.Category='Computer'
GROUP BY Products.ProductName

-- 5: Find Customers who ordered the same product more than once. (repeat buyers)
SELECT Customers.Name,Products.ProductName
FROM Customers JOIN Orders
ON Customers.CustomerID=Orders.CustomerID
JOIN Products
ON Orders.ProductID=Products.ProductID
GROUP BY Customers.Name,Products.ProductName
HAVING COUNT(*)>1

--6: Which Product is highest selling in terms of quantity?
SELECT TOP 1 WITH TIES Products.ProductName,SUM(Orders.Quantity) AS TotalQuantitySold
FROM Products JOIN Orders
ON Products.ProductID=Orders.ProductID
GROUP BY Products.ProductName
ORDER BY SUM(Orders.Quantity) DESC

--7: Delete those orders which are Cancelled and placed before '2024-01-01'.
DELETE
FROM Orders
WHERE Orders.OrderStatus='Cancelled' AND Orders.OrderDate<'2024-01-01'

--8: List products whose current stock is less than current pending orders. 
SELECT Products.ProductName,MAX(Products.StockQuantity) AS StockQuantity,SUM(Orders.Quantity) AS PendingQuantity
FROM Products JOIN Orders
ON Products.ProductID=Orders.ProductID
WHERE Orders.OrderStatus='Pending'
GROUP BY Products.ProductName
HAVING MAX(Products.StockQuantity)<SUM(Orders.Quantity)

--9: List Top 10 Customers with highest total order amount of Category "Mobile". 
SELECT TOP 10 Customers.Name,MAX(Orders.TotalOrderAmount) AS TotalMobileAmount
FROM Customers JOIN Orders
ON Customers.CustomerID=Orders.CustomerID
JOIN Products
ON Orders.ProductID=Products.ProductID
WHERE Products.Category='Mobile'
GROUP BY Customers.Name
ORDER BY MAX(Orders.TotalOrderAmount) DESC

--10: List Date wise Total Order Amount.
SELECT Orders.OrderDate,SUM(Orders.TotalOrderAmount) AS TotalAmount
FROM Orders
GROUP BY Orders.OrderDate
