SELECT DISTINCT TOP (1000) [products].ProductName
	  ,[subtotals].Subtotal
	  ,[orders].*

  FROM [Northwind].[dbo].[Orders] AS [orders]
  JOIN [Northwind].[dbo].[Order Details] AS [orderDetails] ON [orders].OrderID = [orderDetails].OrderID
  JOIN [Northwind].[dbo].[Products] AS [products] ON [orderDetails].ProductID = [products].ProductID
  JOIN [Northwind].[dbo].[Order Subtotals] AS [subtotals] ON [subtotals].OrderID = [orders].OrderID

  WHERE [products].ProductName = 'Pavlova'
  AND [subtotals].Subtotal > 800
