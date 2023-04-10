/*
* TABELA: [DataCorp].[cal].[decendiosCardinaisDiasFinais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisDiasFinais].[decCarDiaFinFkDia] >>>'
  IF OBJECT_ID('[cal].[decCarDiaFinFkDia]') IS NOT NULL
    ALTER TABLE [cal].[decendiosCardinaisDiasFinais]
      DROP CONSTRAINT [decCarDiaFinFkDia]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisDiasFinais].[decCarDiaFinFkDecCar] >>>'
  IF OBJECT_ID('[cal].[decCarDiaFinFkDecCar]') IS NOT NULL
    ALTER TABLE [cal].[decendiosCardinaisDiasFinais]
      DROP CONSTRAINT [decCarDiaFinFkDecCar]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[decendiosCardinaisDiasFinais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'decendiosCardinaisDiasFinais' )
  BEGIN
    DROP TABLE [cal].[decendiosCardinaisDiasFinais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[decendiosCardinaisDiasFinais]
  (

    [decCarDiaFinId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [decendiosCardinaisDiasFinaisdecCarDiaFinIdNn] NOT NULL

  , [diaId]
      BIGINT
      CONSTRAINT [decendiosCardinaisDiasFinaisdiaIdNn] NOT NULL

  , [decCarId]
      BIGINT
      CONSTRAINT [decendiosCardinaisDiasFinaisdecCarIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[decendiosCardinaisDiasFinais].[decCarDiaFinPk] >>>'
  ALTER TABLE [cal].[decendiosCardinaisDiasFinais]
    ADD CONSTRAINT [decCarDiaFinPk]
      PRIMARY KEY CLUSTERED
      (
        [decCarDiaFinId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisDiasFinais].[decCarDiaFinIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosCardinaisDiasFinais') AND name='decCarDiaFinIxAk')
  BEGIN
    DROP INDEX [cal].[decendiosCardinaisDiasFinais].[decCarDiaFinIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisDiasFinais].[decCarDiaFinIxAk] >>>'
  CREATE UNIQUE INDEX [decCarDiaFinIxAk]
    ON [cal].[decendiosCardinaisDiasFinais]
    (
      [diaId]
    , [decCarId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisDiasFinais].[decCarDiaFinIxFkDia] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosCardinaisDiasFinais') AND name='decCarDiaFinIxFkDia')
  BEGIN
    DROP INDEX [cal].[decendiosCardinaisDiasFinais].[decCarDiaFinIxFkDia]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [decCarDiaFinIxFkDia]
    ON [cal].[decendiosCardinaisDiasFinais]
    (
      [diaId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisDiasFinais].[decCarDiaFinFkDia] >>>'
  ALTER TABLE [cal].[decendiosCardinaisDiasFinais]
    ADD CONSTRAINT [decCarDiaFinFkDia]
    FOREIGN KEY
    (
      [diaId]
    )
    REFERENCES [DataCorp].[cal].[dias]
    (
      [diaId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisDiasFinais].[decCarDiaFinIxFkDecCar] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosCardinaisDiasFinais') AND name='decCarDiaFinIxFkDecCar')
  BEGIN
    DROP INDEX [cal].[decendiosCardinaisDiasFinais].[decCarDiaFinIxFkDecCar]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [decCarDiaFinIxFkDecCar]
    ON [cal].[decendiosCardinaisDiasFinais]
    (
      [decCarId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisDiasFinais].[decCarDiaFinFkDecCar] >>>'
  ALTER TABLE [cal].[decendiosCardinaisDiasFinais]
    ADD CONSTRAINT [decCarDiaFinFkDecCar]
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
