/*
* TABELA: [DataCorp].[cal].[decendiosCardinaisTrimestresFinais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisTrimestresFinais].[decCarTriFinFkTri] >>>'
  IF OBJECT_ID('[cal].[decCarTriFinFkTri]') IS NOT NULL
    ALTER TABLE [cal].[decendiosCardinaisTrimestresFinais]
      DROP CONSTRAINT [decCarTriFinFkTri]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisTrimestresFinais].[decCarTriFinFkDecCar] >>>'
  IF OBJECT_ID('[cal].[decCarTriFinFkDecCar]') IS NOT NULL
    ALTER TABLE [cal].[decendiosCardinaisTrimestresFinais]
      DROP CONSTRAINT [decCarTriFinFkDecCar]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[decendiosCardinaisTrimestresFinais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'decendiosCardinaisTrimestresFinais' )
  BEGIN
    DROP TABLE [cal].[decendiosCardinaisTrimestresFinais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[decendiosCardinaisTrimestresFinais]
  (

    [decCarTriFinId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [decendiosCardinaisTrimestresFinaisdecCarTriFinIdNn] NOT NULL

  , [triId]
      BIGINT
      CONSTRAINT [decendiosCardinaisTrimestresFinaistriIdNn] NOT NULL

  , [decCarId]
      BIGINT
      CONSTRAINT [decendiosCardinaisTrimestresFinaisdecCarIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[decendiosCardinaisTrimestresFinais].[decCarTriFinPk] >>>'
  ALTER TABLE [cal].[decendiosCardinaisTrimestresFinais]
    ADD CONSTRAINT [decCarTriFinPk]
      PRIMARY KEY CLUSTERED
      (
        [decCarTriFinId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisTrimestresFinais].[decCarTriFinIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosCardinaisTrimestresFinais') AND name='decCarTriFinIxAk')
  BEGIN
    DROP INDEX [cal].[decendiosCardinaisTrimestresFinais].[decCarTriFinIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisTrimestresFinais].[decCarTriFinIxAk] >>>'
  CREATE UNIQUE INDEX [decCarTriFinIxAk]
    ON [cal].[decendiosCardinaisTrimestresFinais]
    (
      [triId]
    , [decCarId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisTrimestresFinais].[decCarTriFinIxFkTri] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosCardinaisTrimestresFinais') AND name='decCarTriFinIxFkTri')
  BEGIN
    DROP INDEX [cal].[decendiosCardinaisTrimestresFinais].[decCarTriFinIxFkTri]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [decCarTriFinIxFkTri]
    ON [cal].[decendiosCardinaisTrimestresFinais]
    (
      [triId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisTrimestresFinais].[decCarTriFinFkTri] >>>'
  ALTER TABLE [cal].[decendiosCardinaisTrimestresFinais]
    ADD CONSTRAINT [decCarTriFinFkTri]
    FOREIGN KEY
    (
      [triId]
    )
    REFERENCES [DataCorp].[cal].[trimestres]
    (
      [triId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisTrimestresFinais].[decCarTriFinIxFkDecCar] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosCardinaisTrimestresFinais') AND name='decCarTriFinIxFkDecCar')
  BEGIN
    DROP INDEX [cal].[decendiosCardinaisTrimestresFinais].[decCarTriFinIxFkDecCar]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [decCarTriFinIxFkDecCar]
    ON [cal].[decendiosCardinaisTrimestresFinais]
    (
      [decCarId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisTrimestresFinais].[decCarTriFinFkDecCar] >>>'
  ALTER TABLE [cal].[decendiosCardinaisTrimestresFinais]
    ADD CONSTRAINT [decCarTriFinFkDecCar]
    FOREIGN KEY
    (
      [decCarId]
    )
    REFERENCES [DataCorp].[cal].[decendiosCardinais]
    (
      [decCarId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH
