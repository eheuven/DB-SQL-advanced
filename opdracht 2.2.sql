SELECT DISTINCT TOP (1000) [products].ProductName
	  ,[orderDetails].UnitPrice * [orderDetails].Quantity * (1 - [orderDetails].Discount) AS "sales resultaat"
	  ,[orders].*

      
  FROM [Northwind].[dbo].[Orders] AS [orders]
  JOIN [Northwind].[dbo].[Order Details] AS [orderDetails] ON [orders].OrderID = [orderDetails].OrderID
  JOIN [Northwind].[dbo].[Products] AS [products] ON [orderDetails].ProductID = [products].ProductID
  
  WHERE [products].ProductName = 'Pavlova'
  AND [orderDetails].UnitPrice * [orderDetails].Quantity * (1 - [orderDetails].Discount) > 800
