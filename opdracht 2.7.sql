SELECT DISTINCT TOP (5) [products].ProductID
  ,[products].ProductName
  ,[customers].Country
  ,SUM([sales].Subtotal) AS "total salesresultaten"
  ,[employees].EmployeeID
  ,[employees].LastName
  ,[employees].FirstName
  ,[employees].Title
    
  FROM [Northwind].[dbo].[Products] AS [products]
  JOIN [Northwind].[dbo].[Order Details] AS [orderDetails] ON [products].ProductID = [orderDetails].ProductID
  JOIN [Northwind].[dbo].[Orders] AS [orders] ON [orders].OrderID = [orderDetails].OrderID
  JOIN [Northwind].[dbo].[Customers] AS [customers] ON [customers].CustomerID = [orders].CustomerID
  JOIN [Northwind].[dbo].[Employees] AS [employees] ON [employees].EmployeeID = [orders].EmployeeID
  JOIN [Northwind].[dbo].[Summary of Sales by Year] AS [sales] ON [sales].OrderID = [orderDetails].OrderID


  WHERE [customers].Country = 'Germany'

  GROUP BY [products].ProductID
    ,[products].ProductName
    ,[customers].Country
	,[employees].EmployeeID
    ,[employees].LastName
	,[employees].FirstName
    ,[employees].Title

  ORDER BY SUM([sales].Subtotal) DESC, [products].ProductID
