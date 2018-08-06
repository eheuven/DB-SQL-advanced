SELECT DISTINCT TOP (5) [products].ProductID
  ,[products].ProductName
  ,[customers].Country
  ,SUM([sales].SaleAmount) AS "total sales aantal"
  ,[employees].EmployeeID
  ,[employees].LastName
  ,[employees].FirstName
  ,[employees].Title
    
  FROM [Northwind].[dbo].[Products] AS [products]
  JOIN [Northwind].[dbo].[Order Details] AS [orderDetails] ON [products].ProductID = [orderDetails].ProductID
  JOIN [Northwind].[dbo].[Sales Totals by Amount] AS [sales] ON [sales].OrderID = orderDetails.OrderID
  JOIN [Northwind].[dbo].[Customers] AS [customers] ON [customers].CompanyName = [sales].CompanyName

  JOIN [Northwind].[dbo].[Orders] AS [orders] ON [orders].CustomerID = [customers].CustomerID 
												AND [orders].OrderID = [orderDetails].OrderID
  JOIN [Northwind].[dbo].[Employees] AS [employees] ON [employees].EmployeeID = [orders].EmployeeID

  WHERE [customers].Country = 'Germany'

  GROUP BY [products].ProductID
    ,[products].ProductName
    ,[customers].Country
	,[employees].EmployeeID
    ,[employees].LastName
	,[employees].FirstName
    ,[employees].Title

  ORDER BY SUM([sales].SaleAmount) DESC, [products].ProductID
