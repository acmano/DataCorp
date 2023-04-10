USE DataCorp 
GO


IF OBJECT_ID('[ti].proSisFkSis') IS NOT NULL
  ALTER TABLE [ti].[programasSistemas]
    DROP CONSTRAINT [proSisFkSis]
go

IF OBJECT_ID('[ti].proSisFkPro') IS NOT NULL
  ALTER TABLE [ti].[programasSistemas]
    DROP CONSTRAINT [proSisFkPro]
go

IF OBJECT_ID('[ti].[programasSistemas]') IS NOT NULL
BEGIN
  DROP TABLE [ti].[programasSistemas]
  PRINT '<<< DROPPED TABLE [ti].[programasSistemas] >>>'
END
go
/* 
 * TABLE: [ti].[programasSistemas] 
 */

CREATE TABLE [ti].[programasSistemas](
  [proSisId]
    bigint
    IDENTITY(1,1)
    CONSTRAINT [programasSistemasProSisIdNn] NOT NULL
, [sisId]
    bigint
    CONSTRAINT [programasSistemasSisIdNn] NOT NULL
, [proId]
    bigint
    CONSTRAINT [programasSistemasProIdNn] NOT NULL
)
go

ALTER TABLE [ti].[programasSistemas]
  ADD CONSTRAINT [proSisIxPk]
  PRIMARY KEY CLUSTERED ([proSisId])
go

IF OBJECT_ID('ti.programasSistemas') IS NOT NULL
  PRINT '<<< CREATED TABLE ti.programasSistemas >>>'
ELSE
  PRINT '<<< FAILED CREATING TABLE ti.programasSistemas >>>'
go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.programasSistemas') AND name='proSisIxAk')
BEGIN
  DROP INDEX [ti].[programasSistemas].[proSisIxAk]
  PRINT '<<< DROPPED INDEX [ti].[programasSistemas].[proSisIxAk] >>>'
END
go

CREATE UNIQUE INDEX [proSisIxAk] ON [ti].[programasSistemas]([sisId], [proId])
go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.programasSistemas') AND name='proSisIxAk')
  PRINT '<<< CREATED INDEX ti.programasSistemas.proSisIxAk >>>'
ELSE
  PRINT '<<< FAILED CREATING INDEX ti.programasSistemas.proSisIxAk >>>'
go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.programasSistemas') AND name='proSisIxFkSis')
BEGIN
  DROP INDEX [ti].[programasSistemas].[proSisIxFkSis]
  PRINT '<<< DROPPED INDEX [ti].[programasSistemas].[proSisIxFkSis] >>>'
END
go

CREATE INDEX [proSisIxFkSis] ON [ti].[programasSistemas]([sisId])
go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.programasSistemas') AND name='proSisIxFkSis')
  PRINT '<<< CREATED INDEX ti.programasSistemas.proSisIxFkSis >>>'
ELSE
  PRINT '<<< FAILED CREATING INDEX ti.programasSistemas.proSisIxFkSis >>>'
go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.programasSistemas') AND name='proSisIxFkPro')
BEGIN
  DROP INDEX [ti].[programasSistemas].[proSisIxFkPro]
  PRINT '<<< DROPPED INDEX [ti].[programasSistemas].[proSisIxFkPro] >>>'
END
go

CREATE INDEX [proSisIxFkPro] ON [ti].[programasSistemas]([proId])
go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ti.programasSistemas') AND name='proSisIxFkPro')
  PRINT '<<< CREATED INDEX ti.programasSistemas.proSisIxFkPro >>>'
ELSE
  PRINT '<<< FAILED CREATING INDEX ti.programasSistemas.proSisIxFkPro >>>'
go

ALTER TABLE [ti].[programasSistemas]
  ADD CONSTRAINT [proSisFkSis] 
    FOREIGN KEY ([sisId])
    REFERENCES [ti].[sistemas]([sisId])
go

ALTER TABLE [ti].[programasSistemas]
  ADD CONSTRAINT [proSisFkPro] 
    FOREIGN KEY ([proId])
    REFERENCES [ti].[programas]([proId])
go


