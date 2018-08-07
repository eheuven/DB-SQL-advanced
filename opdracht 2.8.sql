SELECT TOP (1000) [products].ProductName
  ,[products].SupplierID
  ,[suppliers].CompanyName
  
  FROM [Northwind].[dbo].[Products] AS [products]
  FULL JOIN [Northwind].[dbo].[Suppliers] AS [suppliers] ON [suppliers].SupplierID = [products].SupplierID
