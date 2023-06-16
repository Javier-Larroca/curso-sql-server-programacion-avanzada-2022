
DBCC FREEPROCCACHE WITH NO_INFOMSGS
DBCC DROPCLEANBUFFERS WITH NO_INFOMSGS

SELECT * FROM [Person].[Contact]
WHERE Email = 'ornare.lectus@orciquis.com'

--CREATE CLUSTERED INDEX IX_Contact_Email
--	ON [Person].[Contact] (Email)

CREATE NONCLUSTERED INDEX IX_Contact_Email
	ON [Person].[Contact] (Email)


