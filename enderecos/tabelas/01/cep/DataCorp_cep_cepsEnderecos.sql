/*
* TABELA: [DataCorp].[cep].[cepsEnderecos]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cep].[cepsEnderecos].[cepEndFkCepLog] >>>'
  IF OBJECT_ID('[cep].[cepEndFkCepLog]') IS NOT NULL
    ALTER TABLE [cep].[cepsEnderecos]
      DROP CONSTRAINT [cepEndFkCepLog]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cep].[cepsEnderecos].[cepEndFkEnd] >>>'
  IF OBJECT_ID('[cep].[cepEndFkEnd]') IS NOT NULL
    ALTER TABLE [cep].[cepsEnderecos]
      DROP CONSTRAINT [cepEndFkEnd]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cep].[cepsEnderecos] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cep' AND tabela.name = 'cepsEnderecos' )
  BEGIN
    DROP TABLE [cep].[cepsEnderecos]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cep].[cepsEnderecos]
  (

    [endCepLogId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [cepsEnderecosendCepLogIdNn] NOT NULL

  , [cepLogId]
      BIGINT
      CONSTRAINT [cepsEnderecoscepLogIdNn] NOT NULL

  , [endId]
      BIGINT
      CONSTRAINT [cepsEnderecosendIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cep].[cepsEnderecos].[endCepLogPk] >>>'
  ALTER TABLE [cep].[cepsEnderecos]
    ADD CONSTRAINT [endCepLogPk]
      PRIMARY KEY CLUSTERED
      (
        [endCepLogId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cep].[cepsEnderecos].[cepEndIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.cepsEnderecos') AND name='cepEndIxAk')
  BEGIN
    DROP INDEX [cep].[cepsEnderecos].[cepEndIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cep].[cepsEnderecos].[cepEndIxAk] >>>'
  CREATE UNIQUE INDEX [cepEndIxAk]
    ON [cep].[cepsEnderecos]
    (
      [cepLogId]
    , [endId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cep].[cepsEnderecos].[cepEndIxFkCepLog] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.cepsEnderecos') AND name='cepEndIxFkCepLog')
  BEGIN
    DROP INDEX [cep].[cepsEnderecos].[cepEndIxFkCepLog]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [cepEndIxFkCepLog]
    ON [cep].[cepsEnderecos]
    (
      [cepLogId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cep].[cepsEnderecos].[cepEndFkCepLog] >>>'
  ALTER TABLE [cep].[cepsEnderecos]
    ADD CONSTRAINT [cepEndFkCepLog]
    FOREIGN KEY
    (
      [cepLogId]
    )
    REFERENCES [DataCorp].[cep].[cepsLogradouros]
    (
      [cepLogId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cep].[cepsEnderecos].[cepEndIxFkEnd] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.cepsEnderecos') AND name='cepEndIxFkEnd')
  BEGIN
    DROP INDEX [cep].[cepsEnderecos].[cepEndIxFkEnd]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [cepEndIxFkEnd]
    ON [cep].[cepsEnderecos]
    (
      [endId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cep].[cepsEnderecos].[cepEndFkEnd] >>>'
  ALTER TABLE [cep].[cepsEnderecos]
    ADD CONSTRAINT [cepEndFkEnd]
    FOREIGN KEY
    (
      [endId]
    )
    REFERENCES [DataCorp].[cep].[enderecos]
    (
      [endId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH
