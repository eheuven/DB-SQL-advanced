SELECT TOP (1000) [customers].CustomerID
      ,[customers].CompanyName
      
  FROM [Northwind].[dbo].[Customers] AS [customers]
  JOIN [Northwind].[dbo].[Orders] AS [orders] ON [customers].CustomerID = [orders].CustomerID

  WHERE [customers].City = 'London'

  GROUP BY [customers].CustomerID
      ,[customers].CompanyName

  HAVING COUNT([orders].OrderID) < 5