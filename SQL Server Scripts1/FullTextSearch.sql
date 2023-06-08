
--Contains (Para búsquedas más precisas)
select * from person.Address A
	where contains(A.AddressLine1, '"first avenue"')


--Contains / AND / AND NOT / OR

select * from person.Address A 
	where contains (A.AddressLine1, '"avenue port" OR port')

--Contains Near 

select * from person.Address A
	where contains (A.AddressLine1, '"5415 San" NEAR dr')

select * from person.Address A
	where contains (A.AddressLine1, 'NEAR((21, centrale), 6)')
	
select * from person.Address A --order by len(AddressLine1) desc
	where contains (A.AddressLine1, 'NEAR((hilton,factory,25),5)')

--FORMSOF INFLECTIONAL (Sustantivos)

select * from person.Address A
	where contains (A.AddressLine1, 'FORMSOF(INFLECTIONAL, "centrals")')

--FORMSOF INFLECTIONAL (Verbos)
select * from person.Address A
	where A.AddressID = 8

update person.Address set AddressLine1='6387 Scenic Avenue hacer' 
	where AddressID = 8

select * from person.Address A
	where contains(A.AddressLine1, 'FORMSOF(INFLECTIONAL, "HAGO")', LANGUAGE 3082)
--LOCALID ESPAÑA


--Obtener todos los timpos verbales de un verbo
-- 3082 es el LocalId de España
select display_term
from SYS.DM_FTS_PARSER('FORMSOF(INFLECTIONAL, trabajo)', 3082, 0, 0)

--FREETEXT

select * from person.Address A
	where freetext(A.AddressLine1, '"99828 Routh asdasd 825"')



alter fulltext index on person.address start update population