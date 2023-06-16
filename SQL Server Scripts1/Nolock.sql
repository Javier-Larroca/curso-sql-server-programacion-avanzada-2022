--Query que demore
BEGIN TRAN

UPDATE Sales.SalesOrderHeader SET [Status] = 4

SELECT DISTINCT *
 FROM Sales.SalesOrderHeader SOH
 INNER JOIN Sales.SalesOrderDetail SOD 
  ON SOD.SalesOrderID = SOH.SalesOrderID
 INNER JOIN Production.Product P
  ON P.ProductID = SOD.ProductID
 INNER JOIN Production.ProductSubcategory PSC
  ON PSC.ProductSubcategoryID = P.ProductSubcategoryID
 CROSS JOIN Production.ProductCategory PC 

 ROLLBACK TRAN


 --Select con NOLOCK que permite ver los resultados aunque la tabla este en una transaccion
SELECT DISTINCT *
 FROM Sales.SalesOrderHeader SOH (NOLOCK)

