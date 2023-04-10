/*
* TABELA: [DataCorp].[cep].[cepsSubDistritos]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cep].[cepsSubDistritos].[cepSubDisFkSubDis] >>>'
  IF OBJECT_ID('[cep].[cepSubDisFkSubDis]') IS NOT NULL
    ALTER TABLE [cep].[cepsSubDistritos]
      DROP CONSTRAINT [cepSubDisFkSubDis]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cep].[cepsSubDistritos].[cepSubDisFkCep] >>>'
  IF OBJECT_ID('[cep].[cepSubDisFkCep]') IS NOT NULL
    ALTER TABLE [cep].[cepsSubDistritos]
      DROP CONSTRAINT [cepSubDisFkCep]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cep].[cepsSubDistritos] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cep' AND tabela.name = 'cepsSubDistritos' )
  BEGIN
    DROP TABLE [cep].[cepsSubDistritos]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cep].[cepsSubDistritos]
  (

    [cepSubDisId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [cepsSubDistritoscepSubDisIdNn] NOT NULL

  , [subDisId]
      BIGINT
      CONSTRAINT [cepsSubDistritossubDisIdNn] NOT NULL

  , [cepId]
      BIGINT
      CONSTRAINT [cepsSubDistritoscepIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cep].[cepsSubDistritos].[cepSubDisPk] >>>'
  ALTER TABLE [cep].[cepsSubDistritos]
    ADD CONSTRAINT [cepSubDisPk]
      PRIMARY KEY CLUSTERED
      (
        [cepSubDisId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cep].[cepsSubDistritos].[cepSubDisIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.cepsSubDistritos') AND name='cepSubDisIxAk')
  BEGIN
    DROP INDEX [cep].[cepsSubDistritos].[cepSubDisIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cep].[cepsSubDistritos].[cepSubDisIxAk] >>>'
  CREATE UNIQUE INDEX [cepSubDisIxAk]
    ON [cep].[cepsSubDistritos]
    (
      [subDisId]
    , [cepId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cep].[cepsSubDistritos].[cepSubDisIxFkSubDis] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.cepsSubDistritos') AND name='cepSubDisIxFkSubDis')
  BEGIN
    DROP INDEX [cep].[cepsSubDistritos].[cepSubDisIxFkSubDis]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [cepSubDisIxFkSubDis]
    ON [cep].[cepsSubDistritos]
    (
      [subDisId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cep].[cepsSubDistritos].[cepSubDisFkSubDis] >>>'
  ALTER TABLE [cep].[cepsSubDistritos]
    ADD CONSTRAINT [cepSubDisFkSubDis]
    FOREIGN KEY
    (
      [subDisId]
    )
    REFERENCES [DataCorp].[ibge].[subDistritos]
    (
      [subDisId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cep].[cepsSubDistritos].[cepSubDisIxFkCep] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.cepsSubDistritos') AND name='cepSubDisIxFkCep')
  BEGIN
    DROP INDEX [cep].[cepsSubDistritos].[cepSubDisIxFkCep]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [cepSubDisIxFkCep]
    ON [cep].[cepsSubDistritos]
    (
      [cepId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cep].[cepsSubDistritos].[cepSubDisFkCep] >>>'
  ALTER TABLE [cep].[cepsSubDistritos]
    ADD CONSTRAINT [cepSubDisFkCep]
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
