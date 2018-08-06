SELECT DISTINCT TOP (1000) [products].ProductName
	  ,[region].RegionDescription
	  ,[territories].TerritoryDescription
    
  FROM [Northwind].[dbo].[Orders] AS [orders]
  JOIN [Northwind].[dbo].[Order Details] AS [orderDetails] ON [orders].OrderID = [orderDetails].OrderID
  JOIN [Northwind].[dbo].[Products] AS [products] ON [orderDetails].ProductID = [products].ProductID
  JOIN [Northwind].[dbo].[EmployeeTerritories] AS [EmployeeTerritories] ON [EmployeeTerritories].EmployeeID = [orders].EmployeeID
  JOIN [Northwind].[dbo].[Territories] AS [territories] ON [territories].TerritoryID = [EmployeeTerritories].TerritoryID
  JOIN [Northwind].[dbo].[Region] AS [region] ON [region].RegionID = [territories].RegionID

  WHERE [products].ProductName = 'Chocolade'

  ORDER BY [region].RegionDescription
