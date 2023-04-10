use DataCorp

IF OBJECT_ID('[geo].nacMunFkMun') IS NOT NULL
  ALTER TABLE [geo].[nacoesMundos]
    DROP CONSTRAINT [nacMunFkMun]
GO

IF OBJECT_ID('[geo].ctnMunFkMun') IS NOT NULL
  ALTER TABLE [geo].[continentesMundos]
    DROP CONSTRAINT [ctnMunFkMun]
GO


/* 
* TABLE: [geo].[mundos] 
*/

IF OBJECT_ID('[geo].[mundos]') IS NOT NULL
BEGIN
  DROP TABLE [geo].[mundos]
  PRINT '<<< DROPPED TABLE [geo].[mundos] >>>'
END
go

CREATE TABLE [geo].[mundos]
(
  [munID]
    bigInt
    IDENTITY(1,1)
, [nome]
    varchar(64)
    NOT NULL
)
go

ALTER TABLE [geo].[mundos]
  ADD CONSTRAINT [munIxPk]
  PRIMARY KEY CLUSTERED ([munID])
go

IF OBJECT_ID('geo.mundos') IS NOT NULL
  PRINT '<<< CREATED TABLE geo.mundos >>>'
ELSE
  PRINT '<<< FAILED CREATING TABLE geo.mundos >>>'
go

/* 
* INDEX: [munIxAk] 
*/

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.mundos') AND name='munIxAk')
BEGIN
  DROP INDEX [geo].[mundos].[munIxAk]
  PRINT '<<< DROPPED INDEX [geo].[mundos].[munIxAk] >>>'
END
go

/* 
* INDEX: [munIxAk] 
*/

CREATE UNIQUE INDEX [munIxAk] ON [geo].[mundos]([nome])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.mundos') AND name='munIxAk')
  PRINT '<<< CREATED INDEX geo.mundos.munIxAk >>>'
ELSE
  PRINT '<<< FAILED CREATING INDEX geo.mundos.munIxAk >>>'
go

