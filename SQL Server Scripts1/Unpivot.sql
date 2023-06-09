

WITH VentasPorCategoria AS (
SELECT DISTINCT DATEPART(year, SOH.OrderDate) AS anio, 
	PC.[name] as categoria,
	P.ProductID
 FROM Sales.SalesOrderHeader SOH
 INNER JOIN Sales.SalesOrderDetail SOD 
  ON SOD.SalesOrderID = SOH.SalesOrderID
 INNER JOIN Production.Product P
  ON P.ProductID = SOD.ProductID
 INNER JOIN Production.ProductSubcategory PSC
  ON PSC.ProductSubcategoryID = P.ProductSubcategoryID
 INNER JOIN Production.ProductCategory PC 
  ON PC.ProductCategoryID = PSC.ProductCategoryID)

  --Aplicamos PIVOT al resultado guardado en VentasPorCategoria

SELECT * FROM VentasPorCategoria
PIVOT (COUNT(ProductID) FOR anio IN([2014], [2013], [2011])) AS pivotTabe
UNPIVOT (ProductId FOR anio IN([2014], [2013], [2011])) AS unpivotTable