
--update HumanResources.Employee set CurrentFlag = 1
--CREATE TABLE HumanResources.EmployeeList(NationalIdNumber varchar(10), Jobtitle varchar(100))
SELECT * FROM HumanResources.EmployeeList

USE AdventureWorks2017
GO

--Declaro als variables donde se almacenarán cada iteraccion
DECLARE @NationalIdNumber varchar(10), @JobTitle varchar(100)

--FAST_FORWARD tiene la propiedad de solo lectura
DECLARE micursor CURSOR FOR
SELECT NationalIdNumber, Jobtitle FROM HumanResources.Employee
WHERE gender = 'M'

OPEN micursor

--Leemos el primer registro y almacenamos los campos en las variables

FETCH NEXT FROM micursor
INTO @NationalIdNumber, @JobTitle

--Mientras @@FETCH_STATUS= 0, significa que aun no llego al final de la tabla.
WHILE @@FETCH_STATUS = 0
BEGIN
	--Inserto en la tabla EmployeList
	INSERT INTO HumanResources.EmployeeList VALUES (@NationalIdNumber, @JobTitle)

	--Actualizo el registro de la tabla employee que coincide con el actual de cursor.
	UPDATE HumanResources.Employee SET CurrentFlag = 0
	WHERE CURRENT OF micursor

	--Pasamos al siguiente registro
	FETCH NEXT FROM micursor
	INTO @NationalIdNumber, @JobTitle
END

CLOSE micursor
DEALLOCATE micursor --Se libera de memoria