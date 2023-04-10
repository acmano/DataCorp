/*
* TABELA: [DataCorp].[cep].[ceps]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cep].[ceps].[cepFkDiv] >>>'
  IF OBJECT_ID('[cep].[cepFkDiv]') IS NOT NULL
    ALTER TABLE [cep].[ceps]
      DROP CONSTRAINT [cepFkDiv]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cep].[ceps].[cepFkSuf] >>>'
  IF OBJECT_ID('[cep].[cepFkSuf]') IS NOT NULL
    ALTER TABLE [cep].[ceps]
      DROP CONSTRAINT [cepFkSuf]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cep].[ceps] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cep' AND tabela.name = 'ceps' )
  BEGIN
    DROP TABLE [cep].[ceps]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cep].[ceps]
  (

    [cepId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [cepsCepIdNn] NOT NULL

  , [divId]
      BIGINT
      CONSTRAINT [cepsdivIdNn] NOT NULL

  , [sufId]
      BIGINT
      CONSTRAINT [cepssufIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cep].[ceps].[cepPk] >>>'
  ALTER TABLE [cep].[ceps]
    ADD CONSTRAINT [cepPk]
      PRIMARY KEY CLUSTERED
      (
        [cepId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cep].[ceps].[cepIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.ceps') AND name='cepIxAk')
  BEGIN
    DROP INDEX [cep].[ceps].[cepIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cep].[ceps].[cepIxAk] >>>'
  CREATE UNIQUE INDEX [cepIxAk]
    ON [cep].[ceps]
    (
      [divId]
    , [sufId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cep].[ceps].[cepIxFkDiv] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.ceps') AND name='cepIxFkDiv')
  BEGIN
    DROP INDEX [cep].[ceps].[cepIxFkDiv]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [cepIxFkDiv]
    ON [cep].[ceps]
    (
      [divId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cep].[ceps].[cepFkDiv] >>>'
  ALTER TABLE [cep].[ceps]
    ADD CONSTRAINT [cepFkDiv]
    FOREIGN KEY
    (
      [divId]
    )
    REFERENCES [DataCorp].[cep].[divisoes]
    (
      [divId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cep].[ceps].[cepIxFkSuf] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.ceps') AND name='cepIxFkSuf')
  BEGIN
    DROP INDEX [cep].[ceps].[cepIxFkSuf]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [cepIxFkSuf]
    ON [cep].[ceps]
    (
      [sufId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cep].[ceps].[cepFkSuf] >>>'
  ALTER TABLE [cep].[ceps]
    ADD CONSTRAINT [cepFkSuf]
    FOREIGN KEY
    (
      [sufId]
    )
    REFERENCES [DataCorp].[cep].[sufixos]
    (
      [sufId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH
