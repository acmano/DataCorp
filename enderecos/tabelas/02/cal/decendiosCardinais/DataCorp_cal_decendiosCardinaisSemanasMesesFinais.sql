/*
* TABELA: [DataCorp].[cal].[decendiosCardinaisSemanasMesesFinais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisSemanasMesesFinais].[decCarSemMesFinFkSemMes] >>>'
  IF OBJECT_ID('[cal].[decCarSemMesFinFkSemMes]') IS NOT NULL
    ALTER TABLE [cal].[decendiosCardinaisSemanasMesesFinais]
      DROP CONSTRAINT [decCarSemMesFinFkSemMes]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisSemanasMesesFinais].[decCarSemMesFinFkDecCar] >>>'
  IF OBJECT_ID('[cal].[decCarSemMesFinFkDecCar]') IS NOT NULL
    ALTER TABLE [cal].[decendiosCardinaisSemanasMesesFinais]
      DROP CONSTRAINT [decCarSemMesFinFkDecCar]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[decendiosCardinaisSemanasMesesFinais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'decendiosCardinaisSemanasMesesFinais' )
  BEGIN
    DROP TABLE [cal].[decendiosCardinaisSemanasMesesFinais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[decendiosCardinaisSemanasMesesFinais]
  (

    [decCarSemMesFinId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [decendiosCardinaisSemanasMesesFinaisdecCarSemMesFinIdNn] NOT NULL

  , [semMesId]
      BIGINT
      CONSTRAINT [decendiosCardinaisSemanasMesesFinaissemMesIdNn] NOT NULL

  , [decCarId]
      BIGINT
      CONSTRAINT [decendiosCardinaisSemanasMesesFinaisdecCarIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[decendiosCardinaisSemanasMesesFinais].[decCarSemMesFinPk] >>>'
  ALTER TABLE [cal].[decendiosCardinaisSemanasMesesFinais]
    ADD CONSTRAINT [decCarSemMesFinPk]
      PRIMARY KEY CLUSTERED
      (
        [decCarSemMesFinId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisSemanasMesesFinais].[decCarSemMesFinIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosCardinaisSemanasMesesFinais') AND name='decCarSemMesFinIxAk')
  BEGIN
    DROP INDEX [cal].[decendiosCardinaisSemanasMesesFinais].[decCarSemMesFinIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisSemanasMesesFinais].[decCarSemMesFinIxAk] >>>'
  CREATE UNIQUE INDEX [decCarSemMesFinIxAk]
    ON [cal].[decendiosCardinaisSemanasMesesFinais]
    (
      [semMesId]
    , [decCarId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisSemanasMesesFinais].[decCarSemMesFinIxFkSemMes] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosCardinaisSemanasMesesFinais') AND name='decCarSemMesFinIxFkSemMes')
  BEGIN
    DROP INDEX [cal].[decendiosCardinaisSemanasMesesFinais].[decCarSemMesFinIxFkSemMes]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [decCarSemMesFinIxFkSemMes]
    ON [cal].[decendiosCardinaisSemanasMesesFinais]
    (
      [semMesId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisSemanasMesesFinais].[decCarSemMesFinFkSemMes] >>>'
  ALTER TABLE [cal].[decendiosCardinaisSemanasMesesFinais]
    ADD CONSTRAINT [decCarSemMesFinFkSemMes]
    FOREIGN KEY
    (
      [semMesId]
    )
    REFERENCES [DataCorp].[cal].[semanasMeses]
    (
      [semMesId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisSemanasMesesFinais].[decCarSemMesFinIxFkDecCar] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosCardinaisSemanasMesesFinais') AND name='decCarSemMesFinIxFkDecCar')
  BEGIN
    DROP INDEX [cal].[decendiosCardinaisSemanasMesesFinais].[decCarSemMesFinIxFkDecCar]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [decCarSemMesFinIxFkDecCar]
    ON [cal].[decendiosCardinaisSemanasMesesFinais]
    (
      [decCarId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisSemanasMesesFinais].[decCarSemMesFinFkDecCar] >>>'
  ALTER TABLE [cal].[decendiosCardinaisSemanasMesesFinais]
    ADD CONSTRAINT [decCarSemMesFinFkDecCar]
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
