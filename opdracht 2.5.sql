SELECT DISTINCT TOP (1000) [employees].City
    
  FROM [Northwind].[dbo].[Employees] AS [employees]

  WHERE [employees].City IN (SELECT [customers].City
								FROM [Northwind].[dbo].[Customers] AS [customers])