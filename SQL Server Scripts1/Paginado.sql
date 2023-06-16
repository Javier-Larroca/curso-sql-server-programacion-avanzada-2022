
DECLARE @PageNumber AS INT,
	@PageSize AS INT,
	@TotalPages AS INT 

SET @PageNumber = 0
SET @PageSize = 10
SET @TotalPages = (SELECT COUNT (*) FROM Sales.SalesOrderHeader) / @PageSize

SELECT RowNumber,
	@TotalPages as TotalPages,
	SalesOrderNumber,
	PurchaseOrderNumber,
	AccountNumber,
	CustomerID
	FROM
	(SELECT *,
		ROW_NUMBER() OVER (ORDER BY SalesOrderId) AS RowNumber
		FROM Sales.SalesOrderHeader) AS Sales
	WHERE RowNumber BETWEEN @PageSize * @PageNumber + 1
		AND @PageSize * (@PageNumber + 1)

