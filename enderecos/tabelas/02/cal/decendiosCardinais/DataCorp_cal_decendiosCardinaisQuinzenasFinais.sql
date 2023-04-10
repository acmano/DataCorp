/*
* TABELA: [DataCorp].[cal].[decendiosCardinaisQuinzenasFinais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisQuinzenasFinais].[decCarQuiFinFkQui] >>>'
  IF OBJECT_ID('[cal].[decCarQuiFinFkQui]') IS NOT NULL
    ALTER TABLE [cal].[decendiosCardinaisQuinzenasFinais]
      DROP CONSTRAINT [decCarQuiFinFkQui]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisQuinzenasFinais].[decCarQuiFinFkDecCar] >>>'
  IF OBJECT_ID('[cal].[decCarQuiFinFkDecCar]') IS NOT NULL
    ALTER TABLE [cal].[decendiosCardinaisQuinzenasFinais]
      DROP CONSTRAINT [decCarQuiFinFkDecCar]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[decendiosCardinaisQuinzenasFinais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'decendiosCardinaisQuinzenasFinais' )
  BEGIN
    DROP TABLE [cal].[decendiosCardinaisQuinzenasFinais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[decendiosCardinaisQuinzenasFinais]
  (

    [decCarQuiFinId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [decendiosCardinaisQuinzenasFinaisdecCarQuiFinIdNn] NOT NULL

  , [quiId]
      BIGINT
      CONSTRAINT [decendiosCardinaisQuinzenasFinaisquiIdNn] NOT NULL

  , [decCarId]
      BIGINT
      CONSTRAINT [decendiosCardinaisQuinzenasFinaisdecCarIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[decendiosCardinaisQuinzenasFinais].[decCarQuiFinPk] >>>'
  ALTER TABLE [cal].[decendiosCardinaisQuinzenasFinais]
    ADD CONSTRAINT [decCarQuiFinPk]
      PRIMARY KEY CLUSTERED
      (
        [decCarQuiFinId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisQuinzenasFinais].[decCarQuiFinIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosCardinaisQuinzenasFinais') AND name='decCarQuiFinIxAk')
  BEGIN
    DROP INDEX [cal].[decendiosCardinaisQuinzenasFinais].[decCarQuiFinIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisQuinzenasFinais].[decCarQuiFinIxAk] >>>'
  CREATE UNIQUE INDEX [decCarQuiFinIxAk]
    ON [cal].[decendiosCardinaisQuinzenasFinais]
    (
      [quiId]
    , [decCarId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisQuinzenasFinais].[decCarQuiFinIxFkQui] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosCardinaisQuinzenasFinais') AND name='decCarQuiFinIxFkQui')
  BEGIN
    DROP INDEX [cal].[decendiosCardinaisQuinzenasFinais].[decCarQuiFinIxFkQui]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [decCarQuiFinIxFkQui]
    ON [cal].[decendiosCardinaisQuinzenasFinais]
    (
      [quiId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisQuinzenasFinais].[decCarQuiFinFkQui] >>>'
  ALTER TABLE [cal].[decendiosCardinaisQuinzenasFinais]
    ADD CONSTRAINT [decCarQuiFinFkQui]
    FOREIGN KEY
    (
      [quiId]
    )
    REFERENCES [DataCorp].[cal].[quinzenas]
    (
      [quiId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisQuinzenasFinais].[decCarQuiFinIxFkDecCar] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosCardinaisQuinzenasFinais') AND name='decCarQuiFinIxFkDecCar')
  BEGIN
    DROP INDEX [cal].[decendiosCardinaisQuinzenasFinais].[decCarQuiFinIxFkDecCar]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [decCarQuiFinIxFkDecCar]
    ON [cal].[decendiosCardinaisQuinzenasFinais]
    (
      [decCarId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisQuinzenasFinais].[decCarQuiFinFkDecCar] >>>'
  ALTER TABLE [cal].[decendiosCardinaisQuinzenasFinais]
    ADD CONSTRAINT [decCarQuiFinFkDecCar]
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
