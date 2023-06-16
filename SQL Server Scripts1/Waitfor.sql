

BEGIN TRAN 

	update person.person set Suffix = e.NationalIDNumber
		from person.person p
			inner join HumanResources.Employee e
			on e.BusinessEntityID = p.BusinessEntityID
		where e.JobTitle = 'Sales Representative'

WAITFOR DELAY '00:00:07'
ROLLBACK TRAN 

