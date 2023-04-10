IF OBJECT_ID('[geo].[nacoesPaises]') IS NOT NULL
BEGIN
    DROP TABLE [geo].[nacoesPaises]
    PRINT '<<< DROPPED TABLE [geo].[nacoesPaises] >>>'
END
go
/* 
 * TABLE: [geo].[nacoesPaises] 
 */

CREATE TABLE [geo].[nacoesPaises](
    [nacPaiID]  int    IDENTITY(1,1),
    [nacID]     int    NOT NULL,
    [paiID]     int    NOT NULL
)
go



IF OBJECT_ID('geo.nacoesPaises') IS NOT NULL
    PRINT '<<< CREATED TABLE geo.nacoesPaises >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE geo.nacoesPaises >>>'
go

/* 
 * TABLE: [geo].[nacoesPaises] 
 */

ALTER TABLE [geo].[nacoesPaises] ADD 
    CONSTRAINT [nacPaiIxPk] PRIMARY KEY CLUSTERED ([nacPaiID])
go

IF OBJECT_ID('geo.nacoesPaises') IS NOT NULL
    PRINT '<<< CREATED TABLE geo.nacoesPaises >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE geo.nacoesPaises >>>'
go

/* 
 * INDEX: [nacPaiIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesPaises') AND name='nacPaiIxAk')
BEGIN
    DROP INDEX [geo].[nacoesPaises].[nacPaiIxAk]
    PRINT '<<< DROPPED INDEX [geo].[nacoesPaises].[nacPaiIxAk] >>>'
END
go

/* 
 * INDEX: [nacPaiIxFkNac] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesPaises') AND name='nacPaiIxFkNac')
BEGIN
    DROP INDEX [geo].[nacoesPaises].[nacPaiIxFkNac]
    PRINT '<<< DROPPED INDEX [geo].[nacoesPaises].[nacPaiIxFkNac] >>>'
END
go

/* 
 * INDEX: [nacFkEntPai] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesPaises') AND name='nacFkEntPai')
BEGIN
    DROP INDEX [geo].[nacoesPaises].[nacFkEntPai]
    PRINT '<<< DROPPED INDEX [geo].[nacoesPaises].[nacFkEntPai] >>>'
END
go

/* 
 * INDEX: [paiFkNacPai] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesPaises') AND name='paiFkNacPai')
BEGIN
    DROP INDEX [geo].[nacoesPaises].[paiFkNacPai]
    PRINT '<<< DROPPED INDEX [geo].[nacoesPaises].[paiFkNacPai] >>>'
END
go

/* 
 * INDEX: [nacPaiIxAk] 
 */

CREATE UNIQUE INDEX [nacPaiIxAk] ON [geo].[nacoesPaises]([paiID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesPaises') AND name='nacPaiIxAk')
    PRINT '<<< CREATED INDEX geo.nacoesPaises.nacPaiIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX geo.nacoesPaises.nacPaiIxAk >>>'
go

/* 
 * INDEX: [nacPaiIxFkNac] 
 */

CREATE INDEX [nacPaiIxFkNac] ON [geo].[nacoesPaises]([nacID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesPaises') AND name='nacPaiIxFkNac')
    PRINT '<<< CREATED INDEX geo.nacoesPaises.nacPaiIxFkNac >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX geo.nacoesPaises.nacPaiIxFkNac >>>'
go

/* 
 * INDEX: [nacFkEntPai] 
 */

CREATE INDEX [nacFkEntPai] ON [geo].[nacoesPaises]([nacID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesPaises') AND name='nacFkEntPai')
    PRINT '<<< CREATED INDEX geo.nacoesPaises.nacFkEntPai >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX geo.nacoesPaises.nacFkEntPai >>>'
go

/* 
 * INDEX: [paiFkNacPai] 
 */

CREATE INDEX [paiFkNacPai] ON [geo].[nacoesPaises]([paiID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('geo.nacoesPaises') AND name='paiFkNacPai')
    PRINT '<<< CREATED INDEX geo.nacoesPaises.paiFkNacPai >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX geo.nacoesPaises.paiFkNacPai >>>'
go

