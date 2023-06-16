--UPDATE INNER JOIN
/*
update person.person set Suffix = e.NationalIDNumber
	from person.person p
		inner join HumanResources.Employee e
		on e.BusinessEntityID = p.BusinessEntityID
	where e.JobTitle = 'Sales Representative'
	*/

WITH Employee AS (
	SELECT BusinessEntityID, NationalIDNumber
		FROM HumanResources.Employee
	WHERE JobTitle = 'Sales Representative'
)

UPDATE Person.Person SET Suffix = E.NationalIDNumber
	FROM Person.Person AS P
	INNER JOIN Employee E
	ON E.BusinessEntityID = P.BusinessEntityID

