SELECT DISTINCT TOP (1000) [products].ProductName
	  ,[orders].Freight
	  ,[orders].OrderID
	  ,[customers].CompanyName
    
  FROM [Northwind].[dbo].[Orders] AS [orders]
  JOIN [Northwind].[dbo].[Order Details] AS [orderDetails] ON [orders].OrderID = [orderDetails].OrderID
  JOIN [Northwind].[dbo].[Products] AS [products] ON [orderDetails].ProductID = [products].ProductID
  JOIN [Northwind].[dbo].[Customers] AS [customers] ON [customers].CustomerID = [orders].CustomerID

  WHERE [products].ProductName = 'Tofu'
  AND [orders].Freight > 25
  AND [orders].Freight < 50