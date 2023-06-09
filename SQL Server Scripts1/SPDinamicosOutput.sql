USE AdventureWorks2017

--SP DINAMICO CON PARAMETRO DE OUTPUT

DECLARE @out nvarchar(MAX) --Lo definimos NVARCHAR porque es el tipo requerido por SP_EXECUTESQL
exec SEL_ProductosOutput 'N', @out OUTPUT
--PRINT @out
EXEC SP_EXECUTESQL @out

CREATE Proc SEL_ProductosOutput(
	@orden char (1),
	@out varchar (MAX) OUTPUT
)
AS

DECLARE @script nvarchar(MAX)
DECLARE @orderby nvarchar(500)

SET @script = 'Select productid, name, listprice from Production.Product'

SET @orderby = (CASE WHEN @orden = 'N' THEN ' ORDER BY name '
					 WHEN @orden = 'I' THEN ' ORDER BY productid '
					 WHEN @orden = 'P' THEN ' ORDER BY listprice '
END)

SET @out = @script + @orderby

--EXEC SP_EXECUTESQL @script

