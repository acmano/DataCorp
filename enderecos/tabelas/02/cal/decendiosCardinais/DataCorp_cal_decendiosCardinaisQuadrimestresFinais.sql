/*
* TABELA: [DataCorp].[cal].[decendiosCardinaisQuadrimestresFinais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisQuadrimestresFinais].[decCarQuaFinFkQua] >>>'
  IF OBJECT_ID('[cal].[decCarQuaFinFkQua]') IS NOT NULL
    ALTER TABLE [cal].[decendiosCardinaisQuadrimestresFinais]
      DROP CONSTRAINT [decCarQuaFinFkQua]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisQuadrimestresFinais].[decCarQuaFinFkDecCar] >>>'
  IF OBJECT_ID('[cal].[decCarQuaFinFkDecCar]') IS NOT NULL
    ALTER TABLE [cal].[decendiosCardinaisQuadrimestresFinais]
      DROP CONSTRAINT [decCarQuaFinFkDecCar]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[decendiosCardinaisQuadrimestresFinais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'decendiosCardinaisQuadrimestresFinais' )
  BEGIN
    DROP TABLE [cal].[decendiosCardinaisQuadrimestresFinais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[decendiosCardinaisQuadrimestresFinais]
  (

    [decCarQuaFinId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [decendiosCardinaisQuadrimestresFinaisdecCarQuaFinIdNn] NOT NULL

  , [quaId]
      BIGINT
      CONSTRAINT [decendiosCardinaisQuadrimestresFinaisquaIdNn] NOT NULL

  , [decCarId]
      BIGINT
      CONSTRAINT [decendiosCardinaisQuadrimestresFinaisdecCarIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[decendiosCardinaisQuadrimestresFinais].[decCarQuaFinPk] >>>'
  ALTER TABLE [cal].[decendiosCardinaisQuadrimestresFinais]
    ADD CONSTRAINT [decCarQuaFinPk]
      PRIMARY KEY CLUSTERED
      (
        [decCarQuaFinId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisQuadrimestresFinais].[decCarQuaFinIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosCardinaisQuadrimestresFinais') AND name='decCarQuaFinIxAk')
  BEGIN
    DROP INDEX [cal].[decendiosCardinaisQuadrimestresFinais].[decCarQuaFinIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisQuadrimestresFinais].[decCarQuaFinIxAk] >>>'
  CREATE UNIQUE INDEX [decCarQuaFinIxAk]
    ON [cal].[decendiosCardinaisQuadrimestresFinais]
    (
      [quaId]
    , [decCarId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisQuadrimestresFinais].[decCarQuaFinIxFkQua] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosCardinaisQuadrimestresFinais') AND name='decCarQuaFinIxFkQua')
  BEGIN
    DROP INDEX [cal].[decendiosCardinaisQuadrimestresFinais].[decCarQuaFinIxFkQua]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [decCarQuaFinIxFkQua]
    ON [cal].[decendiosCardinaisQuadrimestresFinais]
    (
      [quaId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisQuadrimestresFinais].[decCarQuaFinFkQua] >>>'
  ALTER TABLE [cal].[decendiosCardinaisQuadrimestresFinais]
    ADD CONSTRAINT [decCarQuaFinFkQua]
    FOREIGN KEY
    (
      [quaId]
    )
    REFERENCES [DataCorp].[cal].[quadrimestres]
    (
      [quaId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisQuadrimestresFinais].[decCarQuaFinIxFkDecCar] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosCardinaisQuadrimestresFinais') AND name='decCarQuaFinIxFkDecCar')
  BEGIN
    DROP INDEX [cal].[decendiosCardinaisQuadrimestresFinais].[decCarQuaFinIxFkDecCar]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [decCarQuaFinIxFkDecCar]
    ON [cal].[decendiosCardinaisQuadrimestresFinais]
    (
      [decCarId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisQuadrimestresFinais].[decCarQuaFinFkDecCar] >>>'
  ALTER TABLE [cal].[decendiosCardinaisQuadrimestresFinais]
    ADD CONSTRAINT [decCarQuaFinFkDecCar]
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
