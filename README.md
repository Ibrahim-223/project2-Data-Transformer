
# Project2 SQL Database Documentation

This project demonstrates SQL concepts including table creation, data insertion, joins, subqueries, date functions, string functions, window functions, and CASE expressions using a sample database **project2**.

## Database Schema

### 1. Customers Table
- CustomerId (PK)
- FirstName
- LastName
- Email
- RegistrationDate

### 2. Orders Table
- OrderId (PK)
- CustomerId (FK)
- OrderDate
- TotalAmount

### 3. Employees Table
- EmployeeId (PK)
- FirstName
- LastName
- Department
- HireDate
- Salary

## Included SQL Queries

### INNER JOIN (Orders with customers)
```sql
SELECT ...
FROM Orders O
INNER JOIN Customers C ON O.CustomerId = C.CustomerId;
```

### LEFT JOIN
```sql
SELECT ...
FROM Customers C
LEFT JOIN Orders O ON C.CustomerId = O.CustomerID;
```

### RIGHT JOIN
```sql
SELECT ...
FROM Orders O
RIGHT JOIN Customers C ON O.CustomerId = C.CustomerID;
```

### FULL OUTER JOIN (using UNION)
```sql
SELECT ...
FROM Customers C
LEFT JOIN Orders O ...

UNION

SELECT ...
FROM Customers C
RIGHT JOIN Orders O ...
```

### Subquery (customers above avg total amount)
```sql
SELECT ...
WHERE TotalAmount > (SELECT AVG(TotalAmount) FROM Orders);
```

### Subquery (employees above avg salary)
```sql
SELECT ...
WHERE Salary > (SELECT AVG(Salary) FROM Employees);
```

### Date functions
```sql
SELECT YEAR(OrderDate), MONTH(OrderDate) FROM Orders;
```

### Date difference
```sql
SELECT DATEDIFF(OrderDate, CURRENT_DATE()) FROM Orders;
```

### Date formatting
```sql
SELECT DATE_FORMAT(OrderDate, '%D-%M-%Y') FROM Orders;
```

### String functions
```sql
SELECT CONCAT(FirstName, ' ', LastName) FROM Customers;
SELECT UPPER(FirstName), LOWER(LastName) FROM Customers;
SELECT TRIM(Email) FROM Customers;
```

### Window function (Running total)
```sql
SELECT SUM(TotalAmount) OVER (ORDER BY OrderDate) FROM Orders;
```

### Window function (Ranking)
```sql
SELECT RANK() OVER (ORDER BY TotalAmount DESC) FROM Orders;
```

### CASE (Discount)
```sql
SELECT CASE 
        WHEN TotalAmount > 1000 THEN '10% OFF'
        WHEN TotalAmount > 500 THEN '5% OFF'
        ELSE 'No Discount'
       END
FROM Orders;
```

### CASE (Salary category)
```sql
SELECT CASE
        WHEN Salary >= 60000 THEN 'High Salary'
        WHEN Salary >= 40000 THEN 'Medium Salary'
        ELSE 'Low Salary'
       END
FROM Employees;
```

