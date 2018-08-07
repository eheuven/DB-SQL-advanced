SELECT DISTINCT TOP (5) [products].ProductID
  ,[products].ProductName
  ,[customers].Country
  ,SUM([orderDetails].Quantity) AS "total sales aantal"
  ,[employees].EmployeeID
  ,[employees].LastName
  ,[employees].FirstName
  ,[employees].Title
    
  FROM [Northwind].[dbo].[Products] AS [products]
  JOIN [Northwind].[dbo].[Order Details] AS [orderDetails] ON [products].ProductID = [orderDetails].ProductID
  JOIN [Northwind].[dbo].[Orders] AS [orders] ON [orders].OrderID = [orderDetails].OrderID
  JOIN [Northwind].[dbo].[Customers] AS [customers] ON [orders].CustomerID = [customers].CustomerID 
  JOIN [Northwind].[dbo].[Employees] AS [employees] ON [employees].EmployeeID = [orders].EmployeeID

  WHERE [customers].Country = 'Germany'

  GROUP BY [products].ProductID
    ,[products].ProductName
    ,[customers].Country
	,[employees].EmployeeID
    ,[employees].LastName
	,[employees].FirstName
    ,[employees].Title

  ORDER BY SUM([orderDetails].Quantity) DESC, [products].ProductID
