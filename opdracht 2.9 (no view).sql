SELECT TOP (5) [employees].EmployeeID
  ,[employees].LastName
  ,[employees].FirstName
  ,[employees].Title
  ,AVG([orderDetails].Quantity* [orderDetails].UnitPrice) AS "sales resultaat"
  
  FROM [Northwind].[dbo].[Employees] AS [employees]
  JOIN [Northwind].[dbo].[Orders] AS [orders] ON [employees].EmployeeID = [orders].EmployeeID
  JOIN [Northwind].[dbo].[Order Details] AS [orderDetails] ON [orderDetails].OrderID = [orders].OrderID
 
  GROUP BY [employees].EmployeeID
    ,[employees].LastName
	,[employees].FirstName
    ,[employees].Title

  ORDER BY SUM([orderDetails].Quantity* [orderDetails].UnitPrice) DESC, [employees].EmployeeID