IF OBJECT_ID('[sufixosTiposSufixos]') IS NOT NULL
BEGIN
    DROP TABLE [sufixosTiposSufixos]
    PRINT '<<< DROPPED TABLE [sufixosTiposSufixos] >>>'
END
go
/* 
 * TABLE: [sufixosTiposSufixos] 
 */

CREATE TABLE [sufixosTiposSufixos](
    [sufTipSufID]  int    IDENTITY(1,1),
    [sufTipID]     int    NOT NULL,
    [sufID]        int    NOT NULL
)
go



IF OBJECT_ID('sufixosTiposSufixos') IS NOT NULL
    PRINT '<<< CREATED TABLE sufixosTiposSufixos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE sufixosTiposSufixos >>>'
go

/* 
 * TABLE: [sufixosTiposSufixos] 
 */

ALTER TABLE [sufixosTiposSufixos] ADD 
    CONSTRAINT [sufTipSufIxPk] PRIMARY KEY CLUSTERED ([sufTipSufID])
go

IF OBJECT_ID('sufixosTiposSufixos') IS NOT NULL
    PRINT '<<< CREATED TABLE sufixosTiposSufixos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE sufixosTiposSufixos >>>'
go

/* 
 * INDEX: [sufTipSufIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('sufixosTiposSufixos') AND name='sufTipSufIxAk')
BEGIN
    DROP INDEX [sufixosTiposSufixos].[sufTipSufIxAk]
    PRINT '<<< DROPPED INDEX [sufixosTiposSufixos].[sufTipSufIxAk] >>>'
END
go

/* 
 * INDEX: [sufTipSufIxFkSufTip] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('sufixosTiposSufixos') AND name='sufTipSufIxFkSufTip')
BEGIN
    DROP INDEX [sufixosTiposSufixos].[sufTipSufIxFkSufTip]
    PRINT '<<< DROPPED INDEX [sufixosTiposSufixos].[sufTipSufIxFkSufTip] >>>'
END
go

/* 
 * INDEX: [sufTipSufIxFkSuf] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('sufixosTiposSufixos') AND name='sufTipSufIxFkSuf')
BEGIN
    DROP INDEX [sufixosTiposSufixos].[sufTipSufIxFkSuf]
    PRINT '<<< DROPPED INDEX [sufixosTiposSufixos].[sufTipSufIxFkSuf] >>>'
END
go

/* 
 * INDEX: [sufTipSufFkSufTip] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('sufixosTiposSufixos') AND name='sufTipSufFkSufTip')
BEGIN
    DROP INDEX [sufixosTiposSufixos].[sufTipSufFkSufTip]
    PRINT '<<< DROPPED INDEX [sufixosTiposSufixos].[sufTipSufFkSufTip] >>>'
END
go

/* 
 * INDEX: [sufTipSufFkSuf] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('sufixosTiposSufixos') AND name='sufTipSufFkSuf')
BEGIN
    DROP INDEX [sufixosTiposSufixos].[sufTipSufFkSuf]
    PRINT '<<< DROPPED INDEX [sufixosTiposSufixos].[sufTipSufFkSuf] >>>'
END
go

/* 
 * INDEX: [sufTipSufIxAk] 
 */

CREATE UNIQUE INDEX [sufTipSufIxAk] ON [sufixosTiposSufixos]([sufTipID], [sufID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('sufixosTiposSufixos') AND name='sufTipSufIxAk')
    PRINT '<<< CREATED INDEX sufixosTiposSufixos.sufTipSufIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX sufixosTiposSufixos.sufTipSufIxAk >>>'
go

/* 
 * INDEX: [sufTipSufIxFkSufTip] 
 */

CREATE INDEX [sufTipSufIxFkSufTip] ON [sufixosTiposSufixos]([sufTipID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('sufixosTiposSufixos') AND name='sufTipSufIxFkSufTip')
    PRINT '<<< CREATED INDEX sufixosTiposSufixos.sufTipSufIxFkSufTip >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX sufixosTiposSufixos.sufTipSufIxFkSufTip >>>'
go

/* 
 * INDEX: [sufTipSufIxFkSuf] 
 */

CREATE INDEX [sufTipSufIxFkSuf] ON [sufixosTiposSufixos]([sufID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('sufixosTiposSufixos') AND name='sufTipSufIxFkSuf')
    PRINT '<<< CREATED INDEX sufixosTiposSufixos.sufTipSufIxFkSuf >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX sufixosTiposSufixos.sufTipSufIxFkSuf >>>'
go

/* 
 * INDEX: [sufTipSufFkSufTip] 
 */

CREATE INDEX [sufTipSufFkSufTip] ON [sufixosTiposSufixos]([sufTipID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('sufixosTiposSufixos') AND name='sufTipSufFkSufTip')
    PRINT '<<< CREATED INDEX sufixosTiposSufixos.sufTipSufFkSufTip >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX sufixosTiposSufixos.sufTipSufFkSufTip >>>'
go

/* 
 * INDEX: [sufTipSufFkSuf] 
 */

CREATE INDEX [sufTipSufFkSuf] ON [sufixosTiposSufixos]([sufID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('sufixosTiposSufixos') AND name='sufTipSufFkSuf')
    PRINT '<<< CREATED INDEX sufixosTiposSufixos.sufTipSufFkSuf >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX sufixosTiposSufixos.sufTipSufFkSuf >>>'
go

