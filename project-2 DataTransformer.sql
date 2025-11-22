create database project2;
use project2;

create table Customers(
CustomerId int primary key,
FirstName varchar(30),
lastName varchar(30),
Email varchar(30),
RegistrationDate date
);

insert into Customers(CustomerId, FirstName, LastName, Email, RegistrationDate) values
(1, 'John', 'Doe', 'john.doe@email.com', '2022-03-15'),
(2, 'Jane', 'Smith', 'jane.smith@gmail.com', '2021-11-02'),
(3, 'lily', 'potter', 'potter.lily@mail.com', '2020-04-16'),
(4, 'roy', 'melfoy', 'roy.malfoy@mail.com', '2022-11-25'),
(5, 'ron', 'visely', 'visely@mail.com', '2021-01-18');
select * from Customers;

create table Orders(
OrderId int primary key,
CustomerId int,
OrderDate date,
TotalAmount decimal(6,2),
foreign key(CustomerId) references Customers(CustomerId)
);

insert into Orders(OrderId, CustomerId, OrderDate, TotalAmount) values
(101, 1, '2023-07-01', 150.50),
(102, 2, '2023-07-03', 200.75),
(103, 3, '2024-01-22', 320.40),
(104, 4, '2024-05-11', 110.00),
(105, 5, '2023-11-28', 410.50);
select * from Orders;

create table Employees(
EmployeeId int primary key,
FirstName varchar(30),
LastName varchar(30),
Department varchar(15),
HireDate DATE,
Salary decimal(6.2)
);

insert into Employees(
EmployeeId, FirstName, LastName, Department, HireDate, Salary
) values
(1, 'Mark', 'Johnson', 'sales', '2020-01-01', 50000.00),
(2, 'Susan', 'Doe', 'HR', '2021-03-20', 55000.00),
(3, 'Sufi', 'Shaikh', 'sales', '2021-09-01', 45000.00),
(4, 'Aman', 'Modan', 'HR', '2020-05-18', 60000.00),
(5, 'Raees', 'Ansari', 'sales', '2010-11-22', 30000.00);

select * from Employees;
# retrive all orders and customers detail where order exist using inner join
select
O.OrderId,
O.CustomerId, 
O.OrderDate,
O.TotalAmount,
C.CustomerId,
C.FirstName,
C.LastName,
C.Email,
C.RegistrationDate
from Orders as O
inner join Customers as C
ON O.CustomerId = C.CustomerId;

select 
C.CustomerId,
C.FirstName,
C.LastName,
C.Email,
C.RegistrationDate,
O.OrderId,
O.OrderDate,
O.TotalAmount 
from Customers as C
LEFT JOIN Orders as O
ON C.CustomerId = O.CustomerID;

select
O.OrderId,
O.CustomerId,
O.OrderDate,
O.TotalAmount,
C.CustomerId,
C.FirstName,
C.LastName
from Orders as O
RIGHT JOIN Customers as C
ON O.CustomerId = C.CustomerID;


select
C.CustomerId,
C.FirstName,
C.LastName,
C.Email,
C.RegistrationDate,
O.OrderId,
O.OrderDate,
O.TotalAmount
from Customers as C
LEFT JOIN Orders as O
ON C.CustomerId = O.CustomerID

UNION

select 
C.CustomerId,
C.FirstName,
C.LastName,
C.Email,
C.RegistrationDate,
O.OrderId,
O.OrderDate,
O.TotalAmount
from Customers as C
RIGHT JOIN Orders as O
ON C.CustomerId = O.CustomerID;

select
C.CustomerId,
C.FirstName,
C.LastName,
O.OrderId,
O.TotalAmount,
(select avg(TotalAmount) from Orders) as above_avg_amount
from Customers as C
INNER JOIN Orders as O
ON C.CustomerId = O.CustomerID
where O.TotalAmount > (select avg(TotalAmount) from Orders);

select 
EmployeeId,
FirstName,
Salary,
(select avg(salary) from Employees) as salary_above_avg
from Employees
where salary > (select avg(salary) from Employees);

select
OrderDate,
year(OrderDate) as Order_year,
month(OrderDate) as Order_month
from Orders;

select
OrderDate,
current_date(),
datediff(OrderDate, current_date) as date_difference from Orders;

select 
OrderDate,
date_format(OrderDate, '%D-%M-%Y') as D_M_Y from Orders;

select 
FirstName,
LastName,
concat(FirstName, ' ', LastName)
from Customers;

update Customers
set FirstName = 'Jonathan'
where CustomerID = 1;

select
FirstName,
LastName,
upper(FirstName) as upper,
lower(LastName) as lower
from Customers;

select 
Email,
trim(Email) as Tream
from Customers;

SELECT 
    OrderId,
    OrderDate,
    TotalAmount,
    SUM(TotalAmount) OVER (
        ORDER BY OrderDate
    ) AS Running_Total
FROM Orders;

SELECT
    OrderId,
    CustomerId,
    OrderDate,
    TotalAmount,
    RANK() OVER (
        ORDER BY TotalAmount DESC
    ) AS Amount_Rank
FROM Orders;

SELECT
    OrderId,
    CustomerId,
    OrderDate,
    TotalAmount,

    CASE
        WHEN TotalAmount > 1000 THEN '10% OFF'
        WHEN TotalAmount > 500 THEN '5% OFF'
        ELSE 'No Discount'
    END AS Discount
FROM Orders;

SELECT
    EmployeeId,
    FirstName,
    LastName,
    Department,
    Salary,
    
    CASE
        WHEN Salary >= 60000 THEN 'High Salary'
        WHEN Salary >= 40000 THEN 'Medium Salary'
        ELSE 'Low Salary'
    END AS Salary_Category
FROM Employees;



