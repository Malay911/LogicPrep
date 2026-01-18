-- Create Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    JoinDate DATE NOT NULL
);

-- Create Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    StockQuantity INT NOT NULL
);

-- Create Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    OrderDate DATE NOT NULL,
    Quantity INT NOT NULL,
    Price DECIMAL(10,2) NOT NULL,       -- Price at time of order
    Amount DECIMAL(10,2) NOT NULL,     -- Total = Quantity * Price
    ShippedDate DATE NULL,
    OrderStatus VARCHAR(20) CHECK (OrderStatus IN ('Pending', 'Shipped', 'Delivered', 'Cancelled'))
);

-- Create Payments Table
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
    PaymentDate DATE NOT NULL,
    PaymentAmount DECIMAL(10,2) NOT NULL
);

-- Insert Sample Customers
INSERT INTO Customers (CustomerID, Name, JoinDate) VALUES
(1, 'Arun Kumar', '2023-01-10'),
(2, 'Bhavna Gupta', '2023-02-15'),
(3, 'Chetan Shah', '2023-03-20'),
(4, 'Divya Iyer', '2023-04-05'),
(5, 'Esha David', '2023-05-12'); -- Q5: No orders

-- Insert Sample Products
INSERT INTO Products (ProductID, ProductName, Category, Price, StockQuantity) VALUES
(101, 'Laptop', 'Electronics', 1200.00, 10),
(102, 'Wireless Mouse', 'Electronics', 25.00, 50),
(103, 'Keyboard', 'Electronics', 45.00, 30), -- Q4: Basis for price comparison
(104, 'Desk Chair', 'Furniture', 150.00, 20),
(105, 'Coffee Maker', 'Appliances', 80.00, 5),
(106, 'Cookbook', 'Books', 30.00, 100); -- Q7: Category with no orders

-- Insert Sample Orders
INSERT INTO Orders (OrderID, CustomerID, ProductID, OrderDate, Quantity, Price, Amount, ShippedDate, OrderStatus) VALUES
-- Q1: Arun's orders for outstanding amount
(1, 1, 101, '2025-01-15', 1, 1200.00, 1200.00, '2025-01-17', 'Delivered'), -- Fully paid
(2, 1, 102, '2025-02-10', 2, 25.00, 50.00, '2025-02-11', 'Delivered'),   -- Partially paid

-- Q2: Bhavna 2 orders, same product, same day
(3, 2, 101, '2025-03-05', 1, 1200.00, 1200.00, '2025-03-07', 'Delivered'), -- Q3: Delivered, no payment
(4, 2, 101, '2025-03-05', 1, 1200.00, 1200.00, '2025-03-08', 'Shipped'),

-- Q6: Stock < Pending
(5, 3, 105, '2025-04-01', 5, 80.00, 400.00, NULL, 'Pending'), -- Stock 5, Pending 5
(6, 4, 105, '2025-04-02', 2, 80.00, 160.00, NULL, 'Pending'), -- Stock 5, Pending 5+2=7

-- Q8: Re-order within 7 days (Arun, Mouse)
(7, 1, 102, '2025-04-05', 1, 25.00, 25.00, '2025-04-06', 'Delivered'), -- First order
(8, 1, 102, '2025-04-08', 1, 25.00, 25.00, '2025-04-09', 'Delivered'), -- Re-order 3 days later

-- Q10: Date-wise pending
(9, 3, 102, '2025-04-02', 1, 25.00, 25.00, NULL, 'Pending');

-- Insert Sample Payments
INSERT INTO Payments (OrderID, PaymentDate, PaymentAmount) VALUES
(1, '2025-01-18', 1200.00), -- Q1: Fully paid
(2, '2025-02-13', 30.00);    -- Q1: Partially paid (50 - 30 = 20 outstanding)

--🚀 Paper 6: SQL Queries

--1: List Customers with total outstanding amount.
SELECT Customers.Name,SUM(Orders.Amount) AS OutstandingAmount
FROM Customers LEFT JOIN Orders
ON Customers.CustomerID=Orders.CustomerID
LEFT JOIN Payments
ON Payments.OrderID=Orders.OrderID
WHERE Payments.PaymentAmount IS NULL
GROUP BY Customers.Name
HAVING SUM(Orders.Amount)>0

--2: List Customers who placed more than 2 orders in a single day of a same product.
SELECT Customers.Name,Products.ProductName,COUNT(Orders.OrderID) AS TotalOrders,SUM(Orders.Amount) AS TotalAmount
FROM Customers JOIN Orders
ON Customers.CustomerID=Orders.CustomerID
JOIN Products
ON Products.ProductID=Orders.ProductID
GROUP BY Customers.Name,Products.ProductName,Orders.OrderDate
HAVING COUNT(Orders.OrderID)>2

--3: List Orders which are delivered but payment not received.
SELECT Customers.Name,Products.ProductName,Orders.OrderID,Orders.OrderDate,Orders.Amount
FROM Customers JOIN Orders
ON Customers.CustomerID=Orders.CustomerID
JOIN Products
ON Products.ProductID=Orders.ProductID
LEFT JOIN Payments
ON Orders.OrderID=Payments.OrderID
WHERE Payments.OrderID IS NULL AND Orders.OrderStatus='Delivered'

--4: List All Products whose price is more than Product "Keyboard".
SELECT Products.ProductName,Products.Price
FROM Products
WHERE Products.Price>(
	SELECT Products.Price
	FROM Products
	WHERE Products.ProductName='Keyboard'
)

--5: List Customers which have not placed a single order.
SELECT Customers.CustomerID,Customers.Name,Customers.JoinDate
FROM Customers LEFT JOIN Orders
ON Customers.CustomerID=Orders.CustomerID
WHERE Orders.OrderID IS NULL

--6: List Products where StockQuantity is less than Pending Order Total Quantity.
SELECT Products.ProductName,Products.StockQuantity,SUM(Orders.Quantity) AS PendingOrderQuantity
FROM Products JOIN Orders
ON Products.ProductID=Orders.ProductID
GROUP BY Products.ProductName,Products.StockQuantity
HAVING Products.StockQuantity<SUM(Orders.Quantity)

--7: Category Wise Sales Summary (Include all the category even if with zero orders).
SELECT Products.Category,COUNT(DISTINCT Customers.CustomerID) AS NoofCustomers,COUNT(DISTINCT Orders.OrderID) AS NOofOrders,COUNT(DISTINCT Products.ProductID) AS NoofProducts,SUM(Orders.Quantity) AS TotalQuantity,SUM(Orders.Amount) AS TotalOrderAmount
FROM Products LEFT JOIN Orders
ON Products.ProductID=Orders.ProductID
LEFT JOIN Customers
ON Customers.CustomerID=Orders.CustomerID
LEFT JOIN Payments
ON Payments.OrderID=Orders.OrderID
GROUP BY Products.Category

--8: List Customer with Order detail who has placed order of same product again within 7 days.
SELECT Customers.Name,Products.ProductName,O2.OrderID,O2.Quantity
FROM Orders O1 JOIN Orders O2
ON O1.CustomerID=O2.CustomerID
AND O1.ProductID=O2.ProductID
AND DATEDIFF(DAY,O1.OrderDate,O2.OrderDate) BETWEEN 1 AND 7
JOIN Customers
ON Customers.CustomerID=O2.CustomerID
JOIN Products
ON Products.ProductID=O2.ProductID

--9: Product Wise Total Orders, Lowest Price, Highest Price & Average Price.
SELECT Products.Category,Products.ProductName,COUNT(Orders.OrderID) AS TotalOrders,MIN(Products.Price) AS LowestPrice,MAX(Products.Price) AS HighestPrice,AVG(Products.Price) AS AveragePrice
FROM Products JOIN Orders
ON Products.ProductID=Orders.ProductID
GROUP BY Products.Category,Products.ProductName

--10: List Date Wise Pending Order and Pending Ordered Quantity Product Wise between fromDate and toDate.
SELECT Orders.OrderDate,Products.ProductName,COUNT(Orders.OrderID) AS TotalPendingOrders,SUM(Orders.Quantity) AS TotalPendingQuantity
FROM Orders JOIN Products
ON Orders.ProductID=Products.ProductID
WHERE Orders.OrderStatus='Pending'
GROUP BY Orders.OrderDate,Products.ProductName
HAVING Orders.OrderDate BETWEEN '2025-04-01' AND '2025-04-03'