/*
* TABELA: [DataCorp].[cep].[cepsLogradouros]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cep].[cepsLogradouros].[cepLogFkLogLogTip] >>>'
  IF OBJECT_ID('[cep].[cepLogFkLogLogTip]') IS NOT NULL
    ALTER TABLE [cep].[cepsLogradouros]
      DROP CONSTRAINT [cepLogFkLogLogTip]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cep].[cepsLogradouros].[cepLogFkCep] >>>'
  IF OBJECT_ID('[cep].[cepLogFkCep]') IS NOT NULL
    ALTER TABLE [cep].[cepsLogradouros]
      DROP CONSTRAINT [cepLogFkCep]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cep].[cepsLogradouros] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cep' AND tabela.name = 'cepsLogradouros' )
  BEGIN
    DROP TABLE [cep].[cepsLogradouros]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cep].[cepsLogradouros]
  (

    [cepLogId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [cepsLogradourosCepLogIdNn] NOT NULL

  , [logLogTipId]
      BIGINT
      CONSTRAINT [cepsLogradouroslogLogTipIdNn] NOT NULL

  , [cepId]
      BIGINT
      CONSTRAINT [cepsLogradouroscepIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cep].[cepsLogradouros].[cepLogPk] >>>'
  ALTER TABLE [cep].[cepsLogradouros]
    ADD CONSTRAINT [cepLogPk]
      PRIMARY KEY CLUSTERED
      (
        [cepLogId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cep].[cepsLogradouros].[cepLogIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.cepsLogradouros') AND name='cepLogIxAk')
  BEGIN
    DROP INDEX [cep].[cepsLogradouros].[cepLogIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cep].[cepsLogradouros].[cepLogIxAk] >>>'
  CREATE UNIQUE INDEX [cepLogIxAk]
    ON [cep].[cepsLogradouros]
    (
      [logLogTipId]
    , [cepId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cep].[cepsLogradouros].[cepLogIxFkLogLogTip] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.cepsLogradouros') AND name='cepLogIxFkLogLogTip')
  BEGIN
    DROP INDEX [cep].[cepsLogradouros].[cepLogIxFkLogLogTip]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [cepLogIxFkLogLogTip]
    ON [cep].[cepsLogradouros]
    (
      [logLogTipId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cep].[cepsLogradouros].[cepLogFkLogLogTip] >>>'
  ALTER TABLE [cep].[cepsLogradouros]
    ADD CONSTRAINT [cepLogFkLogLogTip]
    FOREIGN KEY
    (
      [logLogTipId]
    )
    REFERENCES [DataCorp].[cep].[logradourosLogradourosTipos]
    (
      [logLogTipId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cep].[cepsLogradouros].[cepLogIxFkCep] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.cepsLogradouros') AND name='cepLogIxFkCep')
  BEGIN
    DROP INDEX [cep].[cepsLogradouros].[cepLogIxFkCep]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [cepLogIxFkCep]
    ON [cep].[cepsLogradouros]
    (
      [cepId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cep].[cepsLogradouros].[cepLogFkCep] >>>'
  ALTER TABLE [cep].[cepsLogradouros]
    ADD CONSTRAINT [cepLogFkCep]
    FOREIGN KEY
    (
      [cepId]
    )
    REFERENCES [DataCorp].[cep].[ceps]
    (
      [cepId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH
