IF OBJECT_ID('[cep].[sufixosTiposSufixos]') IS NOT NULL
BEGIN
    DROP TABLE [cep].[sufixosTiposSufixos]
    PRINT '<<< DROPPED TABLE [cep].[sufixosTiposSufixos] >>>'
END
go
/* 
 * TABLE: [cep].[sufixosTiposSufixos] 
 */

CREATE TABLE [cep].[sufixosTiposSufixos](
    [sufTipSufID]  int    IDENTITY(1,1),
    [sufTipID]     int    NOT NULL,
    [sufID]        int    NOT NULL
)
go



IF OBJECT_ID('cep.sufixosTiposSufixos') IS NOT NULL
    PRINT '<<< CREATED TABLE cep.sufixosTiposSufixos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cep.sufixosTiposSufixos >>>'
go

/* 
 * TABLE: [cep].[sufixosTiposSufixos] 
 */

ALTER TABLE [cep].[sufixosTiposSufixos] ADD 
    CONSTRAINT [sufTipSufIxPk] PRIMARY KEY CLUSTERED ([sufTipSufID])
go

IF OBJECT_ID('cep.sufixosTiposSufixos') IS NOT NULL
    PRINT '<<< CREATED TABLE cep.sufixosTiposSufixos >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE cep.sufixosTiposSufixos >>>'
go

/* 
 * INDEX: [sufTipSufIxAk] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.sufixosTiposSufixos') AND name='sufTipSufIxAk')
BEGIN
    DROP INDEX [cep].[sufixosTiposSufixos].[sufTipSufIxAk]
    PRINT '<<< DROPPED INDEX [cep].[sufixosTiposSufixos].[sufTipSufIxAk] >>>'
END
go

/* 
 * INDEX: [sufTipSufIxFkSufTip] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.sufixosTiposSufixos') AND name='sufTipSufIxFkSufTip')
BEGIN
    DROP INDEX [cep].[sufixosTiposSufixos].[sufTipSufIxFkSufTip]
    PRINT '<<< DROPPED INDEX [cep].[sufixosTiposSufixos].[sufTipSufIxFkSufTip] >>>'
END
go

/* 
 * INDEX: [sufTipSufIxFkSuf] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.sufixosTiposSufixos') AND name='sufTipSufIxFkSuf')
BEGIN
    DROP INDEX [cep].[sufixosTiposSufixos].[sufTipSufIxFkSuf]
    PRINT '<<< DROPPED INDEX [cep].[sufixosTiposSufixos].[sufTipSufIxFkSuf] >>>'
END
go

/* 
 * INDEX: [sufTipSufFkSufTip] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.sufixosTiposSufixos') AND name='sufTipSufFkSufTip')
BEGIN
    DROP INDEX [cep].[sufixosTiposSufixos].[sufTipSufFkSufTip]
    PRINT '<<< DROPPED INDEX [cep].[sufixosTiposSufixos].[sufTipSufFkSufTip] >>>'
END
go

/* 
 * INDEX: [sufTipSufFkSuf] 
 */

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.sufixosTiposSufixos') AND name='sufTipSufFkSuf')
BEGIN
    DROP INDEX [cep].[sufixosTiposSufixos].[sufTipSufFkSuf]
    PRINT '<<< DROPPED INDEX [cep].[sufixosTiposSufixos].[sufTipSufFkSuf] >>>'
END
go

/* 
 * INDEX: [sufTipSufIxAk] 
 */

CREATE UNIQUE INDEX [sufTipSufIxAk] ON [cep].[sufixosTiposSufixos]([sufTipID], [sufID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.sufixosTiposSufixos') AND name='sufTipSufIxAk')
    PRINT '<<< CREATED INDEX cep.sufixosTiposSufixos.sufTipSufIxAk >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.sufixosTiposSufixos.sufTipSufIxAk >>>'
go

/* 
 * INDEX: [sufTipSufIxFkSufTip] 
 */

CREATE INDEX [sufTipSufIxFkSufTip] ON [cep].[sufixosTiposSufixos]([sufTipID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.sufixosTiposSufixos') AND name='sufTipSufIxFkSufTip')
    PRINT '<<< CREATED INDEX cep.sufixosTiposSufixos.sufTipSufIxFkSufTip >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.sufixosTiposSufixos.sufTipSufIxFkSufTip >>>'
go

/* 
 * INDEX: [sufTipSufIxFkSuf] 
 */

CREATE INDEX [sufTipSufIxFkSuf] ON [cep].[sufixosTiposSufixos]([sufID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.sufixosTiposSufixos') AND name='sufTipSufIxFkSuf')
    PRINT '<<< CREATED INDEX cep.sufixosTiposSufixos.sufTipSufIxFkSuf >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.sufixosTiposSufixos.sufTipSufIxFkSuf >>>'
go

/* 
 * INDEX: [sufTipSufFkSufTip] 
 */

CREATE INDEX [sufTipSufFkSufTip] ON [cep].[sufixosTiposSufixos]([sufTipID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.sufixosTiposSufixos') AND name='sufTipSufFkSufTip')
    PRINT '<<< CREATED INDEX cep.sufixosTiposSufixos.sufTipSufFkSufTip >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.sufixosTiposSufixos.sufTipSufFkSufTip >>>'
go

/* 
 * INDEX: [sufTipSufFkSuf] 
 */

CREATE INDEX [sufTipSufFkSuf] ON [cep].[sufixosTiposSufixos]([sufID])
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.sufixosTiposSufixos') AND name='sufTipSufFkSuf')
    PRINT '<<< CREATED INDEX cep.sufixosTiposSufixos.sufTipSufFkSuf >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX cep.sufixosTiposSufixos.sufTipSufFkSuf >>>'
go

