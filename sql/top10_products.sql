
SELECT TOP 10
    p.ProductID,
    p.Name AS ProductName,
    SUM(d.OrderQty) AS TotalQuantitySold,
    AVG(d.LineTotal) AS AvgSale,
    STDEV(d.LineTotal) AS StdDevSale,
    MAX(h.OrderDate) AS LastSaleDate
FROM SalesOrderDetail d
JOIN SalesOrderHeader h 
ON d.SalesOrderID = h.SalesOrderID
JOIN Product p 
ON d.ProductID = p.ProductID
JOIN Customer c 
ON h.CustomerID = c.CustomerID
WHERE c.CustomerType = 'FISICO'
GROUP BY p.ProductID, p.Name
ORDER BY TotalQuantitySold DESC;
