
SELECT TOP 10
    p.ProductID,
    p.Name AS ProductName,
    SUM(d.OrderQty) AS TotalQuantitySold,
    AVG(d.LineTotal) AS AvgSale,
    STDEV(d.LineTotal) AS StdDevSale,
    MAX(h.OrderDate) AS LastSaleDate
FROM SalesOrderHeader h
JOIN SalesOrderDetail d ON h.SalesOrderID = d.SalesOrderID
JOIN Product p ON p.ProductID = d.ProductID
JOIN Customer c ON h.CustomerID = c.CustomerID
WHERE c.CustomerType = 'FISICO'
GROUP BY p.ProductID, p.Name
ORDER BY TotalQuantitySold DESC;
