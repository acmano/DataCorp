IF OBJECT_ID('[nacoesPaises]') IS NOT NULL
BEGIN
    DROP TABLE [nacoesPaises]
    PRINT '<<< DROPPED TABLE [nacoesPaises] >>>'
END
go
/* 
 * TABLE: [nacoesPaises] 
 */

CREATE TABLE [nacoesPaises](
    [nacPaiID]  int    IDENTITY(1,1),
    [nacID]     int    NOT NULL,
    [paiID]     int    NOT NULL
)
go



IF OBJECT_ID('nacoesPaises') IS NOT NULL
    PRINT '<<< CREATED TABLE nacoesPaises >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE nacoesPaises >>>'
go

/* 
 * TABLE: [nacoesPaises] 
 */

ALTER TABLE [nacoesPaises] ADD 
    CONSTRAINT [nacPaiIxPk] PRIMARY KEY CLUSTERED ([nacPaiID])
go

IF OBJECT_ID('nacoesPaises') IS NOT NULL
    PRINT '<<< CREATED TABLE nacoesPaises >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE nacoesPaises >>>'
go

/* 
 * INDEX: [nacPaiIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('nacoesPaises') AND name='nacPaiIxAk')
BEGIN
    DROP INDEX [nacoesPaises].[nacPaiIxAk]
    PRINT '<<< DROPPED INDEX [nacoesPaises].[nacPaiIxAk] >>>'
END
go

/* 
 * INDEX: [nacPaiIxFkNac] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('nacoesPaises') AND name='nacPaiIxFkNac')
BEGIN
    DROP INDEX [nacoesPaises].[nacPaiIxFkNac]
    PRINT '<<< DROPPED INDEX [nacoesPaises].[nacPaiIxFkNac] >>>'
END
go

/* 
 * INDEX: [nacFkEntPai] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('nacoesPaises') AND name='nacFkEntPai')
BEGIN
    DROP INDEX [nacoesPaises].[nacFkEntPai]
    PRINT '<<< DROPPED INDEX [nacoesPaises].[nacFkEntPai] >>>'
END
go

/* 
 * INDEX: [paiFkNacPai] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('nacoesPaises') AND name='paiFkNacPai')
BEGIN
    DROP INDEX [nacoesPaises].[paiFkNacPai]
    PRINT '<<< DROPPED INDEX [nacoesPaises].[paiFkNacPai] >>>'
END
go

/* 
 * INDEX: [nacPaiIxAk] 
 */

CREATE UNIQUE INDEX [nacPaiIxAk] ON [nacoesPaises]([paiID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('nacoesPaises') AND name='nacPaiIxAk')
    PRINT '<<< CREATED INDEX nacoesPaises.nacPaiIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX nacoesPaises.nacPaiIxAk >>>'
go

/* 
 * INDEX: [nacPaiIxFkNac] 
 */

CREATE INDEX [nacPaiIxFkNac] ON [nacoesPaises]([nacID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('nacoesPaises') AND name='nacPaiIxFkNac')
    PRINT '<<< CREATED INDEX nacoesPaises.nacPaiIxFkNac >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX nacoesPaises.nacPaiIxFkNac >>>'
go

/* 
 * INDEX: [nacFkEntPai] 
 */

CREATE INDEX [nacFkEntPai] ON [nacoesPaises]([nacID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('nacoesPaises') AND name='nacFkEntPai')
    PRINT '<<< CREATED INDEX nacoesPaises.nacFkEntPai >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX nacoesPaises.nacFkEntPai >>>'
go

/* 
 * INDEX: [paiFkNacPai] 
 */

CREATE INDEX [paiFkNacPai] ON [nacoesPaises]([paiID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('nacoesPaises') AND name='paiFkNacPai')
    PRINT '<<< CREATED INDEX nacoesPaises.paiFkNacPai >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX nacoesPaises.paiFkNacPai >>>'
go

