/*
* TABELA: [DataCorp].[cep].[cepsDistritos]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cep].[cepsDistritos].[cepDisFkDis] >>>'
  IF OBJECT_ID('[cep].[cepDisFkDis]') IS NOT NULL
    ALTER TABLE [cep].[cepsDistritos]
      DROP CONSTRAINT [cepDisFkDis]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cep].[cepsDistritos].[cepDisFkCep] >>>'
  IF OBJECT_ID('[cep].[cepDisFkCep]') IS NOT NULL
    ALTER TABLE [cep].[cepsDistritos]
      DROP CONSTRAINT [cepDisFkCep]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cep].[cepsDistritos] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cep' AND tabela.name = 'cepsDistritos' )
  BEGIN
    DROP TABLE [cep].[cepsDistritos]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cep].[cepsDistritos]
  (

    [cepDisId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [cepsDistritoscepDisIdNn] NOT NULL

  , [disId]
      BIGINT
      CONSTRAINT [cepsDistritosdisIdNn] NOT NULL

  , [cepId]
      BIGINT
      CONSTRAINT [cepsDistritoscepIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cep].[cepsDistritos].[cepDisPk] >>>'
  ALTER TABLE [cep].[cepsDistritos]
    ADD CONSTRAINT [cepDisPk]
      PRIMARY KEY CLUSTERED
      (
        [cepDisId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cep].[cepsDistritos].[cepDisIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.cepsDistritos') AND name='cepDisIxAk')
  BEGIN
    DROP INDEX [cep].[cepsDistritos].[cepDisIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cep].[cepsDistritos].[cepDisIxAk] >>>'
  CREATE UNIQUE INDEX [cepDisIxAk]
    ON [cep].[cepsDistritos]
    (
      [disId]
    , [cepId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cep].[cepsDistritos].[cepDisIxFkDis] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.cepsDistritos') AND name='cepDisIxFkDis')
  BEGIN
    DROP INDEX [cep].[cepsDistritos].[cepDisIxFkDis]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [cepDisIxFkDis]
    ON [cep].[cepsDistritos]
    (
      [disId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cep].[cepsDistritos].[cepDisFkDis] >>>'
  ALTER TABLE [cep].[cepsDistritos]
    ADD CONSTRAINT [cepDisFkDis]
    FOREIGN KEY
    (
      [disId]
    )
    REFERENCES [DataCorp].[ibge].[distritos]
    (
      [disId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cep].[cepsDistritos].[cepDisIxFkCep] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cep.cepsDistritos') AND name='cepDisIxFkCep')
  BEGIN
    DROP INDEX [cep].[cepsDistritos].[cepDisIxFkCep]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [cepDisIxFkCep]
    ON [cep].[cepsDistritos]
    (
      [cepId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cep].[cepsDistritos].[cepDisFkCep] >>>'
  ALTER TABLE [cep].[cepsDistritos]
    ADD CONSTRAINT [cepDisFkCep]
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
