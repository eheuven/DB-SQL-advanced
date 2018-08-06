SELECT DISTINCT TOP (5) [employees].EmployeeID
  ,[employees].LastName
  ,[employees].FirstName
  ,[employees].Title
  ,AVG([sales].Subtotal) AS "sales resultaat"
  
  FROM [Northwind].[dbo].[Employees] AS [employees]
  JOIN [Northwind].[dbo].[Orders] AS [orders] ON [employees].EmployeeID = [orders].EmployeeID
  JOIN [Northwind].[dbo].[Summary of Sales by Year] AS [sales] ON [sales].OrderID = [orders].OrderID

  GROUP BY [employees].EmployeeID
    ,[employees].LastName
	,[employees].FirstName
    ,[employees].Title

  ORDER BY AVG([sales].Subtotal) DESC