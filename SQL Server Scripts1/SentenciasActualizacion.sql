
--INSER INTO
insert into personEjemplo
	select firstName, lastName from person.person

--UPDATE INNER JOIN
update person.person set Suffix = e.NationalIDNumber
	from person.person p
		inner join HumanResources.Employee e
		on e.BusinessEntityID = p.BusinessEntityID
	where e.JobTitle = 'Sales Representative'

--DELETE INNER JOIN
delete e
	from person.EmailAddress e
		inner join person.BusinessEntity b
			on b.BusinessEntityID = e.BusinessEntityID
		inner join HumanResources.Employee h
			on h.BusinessEntityID = b.BusinessEntityID
		where h.JobTitle = 'Tool Designer'

--SELECT INTO (Copia unicamente la estructura de una tabla)
select * into emailBackup
	from person.EmailAddress
	where 1=0

--SELECT INTO (Copia estructura y datos de una tabla, sin PK e indices)
select * into person.personCopia
	from person.Person

--SELECT INTO (Copia tabla en otra BD)
select * into AdventureBak..personAddr
	from person.Address

--SELECT INTYO (Copia tabla con campo IDENTITY)
select identity(int, 1, 1) as id, * into AdventureBak..personPhoneNew
	from person.PersonPhone

--CLONE DATABASE
dbcc clonedatabase(AdventureBak, AdventureCopia)