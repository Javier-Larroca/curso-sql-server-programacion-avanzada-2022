--BUSQUEDAS
select * from Person.Person P
	left join Person.EmailAddress E
		on e.BusinessEntityID = P.BusinessEntityID
	where isnull (e.BusinessEntityID, '') = ''
		and isnull(P.Title, '') = ''

declare @nombre char(30) = null 
set @nombre = 'Roberto'
select * from person.person
	where FirstName = (case when isnull(@nombre,'')<>'' then @nombre
							else FirstName
							end)

--BUSQUEDAS ENTRE BASES DE DATOS
insert into person.EmailAddress
select * from person.EmailAddress A
	right join AdventureWorks2017_NUEVA.person.EmailAddress B
		on B.BusinessentityId = A.BusinessEntityID
	where ISNULL(A.BusinessentityId, 0) = 0


select * from Sales.SpecialOffer

select * from Sales.SpecialOfferCustomer

select * from Sales.SpecialOfferReseller

select C.[Description],
	R.[Description],
	C.DiscountPct,
	R.DiscountPct,
	C.DiscountPct + R.DiscountPct as DiscountPctTotal
	from Sales.SpecialOfferCustomer C
	cross join Sales.SpecialOfferReseller R


