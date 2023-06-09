--SP DINAMICO

--SELECT * FROM Production.Product

EXEC SEL_Productos 'P'

ALTER Proc SEL_Productos(
	@orden char (1)
)
AS

DECLARE @script nvarchar(MAX)
DECLARE @orderby nvarchar(500)

SET @script = 'Select productid, name, listprice from Production.Product'

SET @orderby = (CASE WHEN @orden = 'N' THEN ' ORDER BY name '
					 WHEN @orden = 'I' THEN ' ORDER BY productid '
					 WHEN @orden = 'P' THEN ' ORDER BY listprice '
END)

SET @script = @script + @orderby

EXEC SP_EXECUTESQL @script