/*
* TABELA: [DataCorp].[cep].[logradourosLogradourosTipos]
*/

USE DataCorp
GO

SET CONCAT_NULL_YIELDS_NULL OFF;
SET NOCOUNT ON ;

DECLARE @mensagem   varchar(100);
DECLARE @erro BIT = 0;

BEGIN TRY
  DECLARE @mensagemP1 varchar(100) = '<<< ';
  DECLARE @mensagemP2 varchar(100);
  DECLARE @mensagemP3 varchar(100);
  DECLARE @mensagemP4 varchar(100);

  SET @erro = 1
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cep].[logradourosLogradourosTipos].[logLogTipFkLogTip] >>>'
  IF OBJECT_ID('[cep].[logLogTipFkLogTip]') IS NOT NULL
    ALTER TABLE [cep].[logradourosLogradourosTipos]
      DROP CONSTRAINT [logLogTipFkLogTip]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cep].[logradourosLogradourosTipos].[logLogTipFkLog] >>>'
  IF OBJECT_ID('[cep].[logLogTipFkLog]') IS NOT NULL
    ALTER TABLE [cep].[logradourosLogradourosTipos]
      DROP CONSTRAINT [logLogTipFkLog]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cep].[logradourosLogradourosTipos] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cep' AND tabela.name = 'logradourosLogradourosTipos' )
  BEGIN
    DROP TABLE [cep].[logradourosLogradourosTipos]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cep].[logradourosLogradourosTipos]
  (

    [logLogTipId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [logradourosLogradourosTiposlogLogTipIdNn] NOT NULL

  , [logTipId]
      BIGINT
      CONSTRAINT [logradourosLogradourosTiposlogTipIdNn] NOT NULL

  , [logId]
      BIGINT
      CONSTRAINT [logradourosLogradourosTiposlogIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cep].[logradourosLogradourosTipos].[logLogTipPk] >>>'
  ALTER TABLE [cep].[logradourosLogradourosTipos]
    ADD CONSTRAINT [logLogTipPk]
      PRIMARY KEY CLUSTERED
      (
        [logLogTipId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cep].[logradourosLogradourosTipos].[logLogTipIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.logradourosLogradourosTipos') AND name='logLogTipIxAk')
  BEGIN
    DROP INDEX [cep].[logradourosLogradourosTipos].[logLogTipIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cep].[logradourosLogradourosTipos].[logLogTipIxAk] >>>'
  CREATE UNIQUE INDEX [logLogTipIxAk]
    ON [cep].[logradourosLogradourosTipos]
    (
      [logTipId]
    , [logId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cep].[logradourosLogradourosTipos].[logLogTipIxFkLogTip] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.logradourosLogradourosTipos') AND name='logLogTipIxFkLogTip')
  BEGIN
    DROP INDEX [cep].[logradourosLogradourosTipos].[logLogTipIxFkLogTip]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [logLogTipIxFkLogTip]
    ON [cep].[logradourosLogradourosTipos]
    (
      [logTipId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cep].[logradourosLogradourosTipos].[logLogTipFkLogTip] >>>'
  ALTER TABLE [cep].[logradourosLogradourosTipos]
    ADD CONSTRAINT [logLogTipFkLogTip]
    FOREIGN KEY
    (
      [logTipId]
    )
    REFERENCES [DataCorp].[cep].[logradourosTipos]
    (
      [logTipId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cep].[logradourosLogradourosTipos].[logLogTipIxFkLog] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.logradourosLogradourosTipos') AND name='logLogTipIxFkLog')
  BEGIN
    DROP INDEX [cep].[logradourosLogradourosTipos].[logLogTipIxFkLog]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [logLogTipIxFkLog]
    ON [cep].[logradourosLogradourosTipos]
    (
      [logId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cep].[logradourosLogradourosTipos].[logLogTipFkLog] >>>'
  ALTER TABLE [cep].[logradourosLogradourosTipos]
    ADD CONSTRAINT [logLogTipFkLog]
    FOREIGN KEY
    (
      [logId]
    )
    REFERENCES [DataCorp].[cep].[logradouros]
    (
      [logId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH
