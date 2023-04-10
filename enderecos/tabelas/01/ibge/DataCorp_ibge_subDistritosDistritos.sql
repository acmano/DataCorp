/*
* TABELA: [DataCorp].[ibge].[subDistritosDistritos]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[ibge].[subDistritosDistritos].[subDisDisFkDis] >>>'
  IF OBJECT_ID('[ibge].[subDisDisFkDis]') IS NOT NULL
    ALTER TABLE [ibge].[subDistritosDistritos]
      DROP CONSTRAINT [subDisDisFkDis]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[ibge].[subDistritosDistritos].[subDisDisFkSubDis] >>>'
  IF OBJECT_ID('[ibge].[subDisDisFkSubDis]') IS NOT NULL
    ALTER TABLE [ibge].[subDistritosDistritos]
      DROP CONSTRAINT [subDisDisFkSubDis]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[ibge].[subDistritosDistritos] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'ibge' AND tabela.name = 'subDistritosDistritos' )
  BEGIN
    DROP TABLE [ibge].[subDistritosDistritos]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [ibge].[subDistritosDistritos]
  (

    [subDisDisId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [subDistritosDistritossubDisDisIdNn] NOT NULL

  , [disId]
      BIGINT
      CONSTRAINT [subDistritosDistritosdisIdNn] NOT NULL

  , [subDisId]
      BIGINT
      CONSTRAINT [subDistritosDistritossubDisIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[ibge].[subDistritosDistritos].[subDisDisPk] >>>'
  ALTER TABLE [ibge].[subDistritosDistritos]
    ADD CONSTRAINT [subDisDisPk]
      PRIMARY KEY CLUSTERED
      (
        [subDisDisId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[ibge].[subDistritosDistritos].[subDisDisIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.subDistritosDistritos') AND name='subDisDisIxAk')
  BEGIN
    DROP INDEX [ibge].[subDistritosDistritos].[subDisDisIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[ibge].[subDistritosDistritos].[subDisDisIxAk] >>>'
  CREATE UNIQUE INDEX [subDisDisIxAk]
    ON [ibge].[subDistritosDistritos]
    (
      [disId]
    , [subDisId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[ibge].[subDistritosDistritos].[subDisDisIxFkDis] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.subDistritosDistritos') AND name='subDisDisIxFkDis')
  BEGIN
    DROP INDEX [ibge].[subDistritosDistritos].[subDisDisIxFkDis]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [subDisDisIxFkDis]
    ON [ibge].[subDistritosDistritos]
    (
      [disId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[ibge].[subDistritosDistritos].[subDisDisFkDis] >>>'
  ALTER TABLE [ibge].[subDistritosDistritos]
    ADD CONSTRAINT [subDisDisFkDis]
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
  SET @mensagemP4 = 'Index       [DataCorp].[ibge].[subDistritosDistritos].[subDisDisIxFkSubDis] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('ibge.subDistritosDistritos') AND name='subDisDisIxFkSubDis')
  BEGIN
    DROP INDEX [ibge].[subDistritosDistritos].[subDisDisIxFkSubDis]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [subDisDisIxFkSubDis]
    ON [ibge].[subDistritosDistritos]
    (
      [subDisId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[ibge].[subDistritosDistritos].[subDisDisFkSubDis] >>>'
  ALTER TABLE [ibge].[subDistritosDistritos]
    ADD CONSTRAINT [subDisDisFkSubDis]
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

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH
