
/*
SELECT * FROM Sales.SalesPerson
SELECT * FROM Sales.SalesTerritory
*/
BEGIN TRY 
	SET NOCOUNT ON
	INSERT INTO Sales.SalesPerson
	VALUES(270, 20, 100, 200, 0, 25000, 200000, NEWID(), GETDATE())
END TRY
BEGIN CATCH
	RAISERROR ('Error al insertar una venta', 16, 1)
END CATCH

--Errores personalizados
--Id error > 50000
--Severity 1 a 25

--SP_ADDMESSAGE 50001, 16, 'Ocurrió un error de Foreign Key en la tabla Sales.SalesPerson, por favor los datos ingresados.'

BEGIN TRY 
	SET NOCOUNT ON
	INSERT INTO Sales.SalesPerson
	VALUES(270, 20, 100, 200, 0, 25000, 200000, NEWID(), GETDATE())
END TRY
BEGIN CATCH
	IF @@ERROR = 547
		RAISERROR (50001, -1, 4, 'Sales.SalesPerson')
	ELSE
		RAISERROR ('(0) Error inesperado', 16, 4)
END CATCH

--SP_DROPMESSAGE 50001

SP_ADDMESSAGE 50001, 16, 'Ocurrió un error de Foreign Key en la tabla %s, por favor los datos ingresados.'
