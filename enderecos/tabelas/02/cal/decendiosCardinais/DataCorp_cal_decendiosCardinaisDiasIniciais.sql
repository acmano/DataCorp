/*
* TABELA: [DataCorp].[cal].[decendiosCardinaisDiasIniciais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisDiasIniciais].[decCarDiaIniFkDia] >>>'
  IF OBJECT_ID('[cal].[decCarDiaIniFkDia]') IS NOT NULL
    ALTER TABLE [cal].[decendiosCardinaisDiasIniciais]
      DROP CONSTRAINT [decCarDiaIniFkDia]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisDiasIniciais].[decCarDiaIniFkDecCar] >>>'
  IF OBJECT_ID('[cal].[decCarDiaIniFkDecCar]') IS NOT NULL
    ALTER TABLE [cal].[decendiosCardinaisDiasIniciais]
      DROP CONSTRAINT [decCarDiaIniFkDecCar]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[decendiosCardinaisDiasIniciais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'decendiosCardinaisDiasIniciais' )
  BEGIN
    DROP TABLE [cal].[decendiosCardinaisDiasIniciais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[decendiosCardinaisDiasIniciais]
  (

    [decCarDiaIniId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [decendiosCardinaisDiasIniciaisdecCarDiaIniIdNn] NOT NULL

  , [diaId]
      BIGINT
      CONSTRAINT [decendiosCardinaisDiasIniciaisdiaIdNn] NOT NULL

  , [decCarId]
      BIGINT
      CONSTRAINT [decendiosCardinaisDiasIniciaisdecCarIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[decendiosCardinaisDiasIniciais].[decCarDiaIniPk] >>>'
  ALTER TABLE [cal].[decendiosCardinaisDiasIniciais]
    ADD CONSTRAINT [decCarDiaIniPk]
      PRIMARY KEY CLUSTERED
      (
        [decCarDiaIniId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisDiasIniciais].[decCarDiaIniIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosCardinaisDiasIniciais') AND name='decCarDiaIniIxAk')
  BEGIN
    DROP INDEX [cal].[decendiosCardinaisDiasIniciais].[decCarDiaIniIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisDiasIniciais].[decCarDiaIniIxAk] >>>'
  CREATE UNIQUE INDEX [decCarDiaIniIxAk]
    ON [cal].[decendiosCardinaisDiasIniciais]
    (
      [diaId]
    , [decCarId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisDiasIniciais].[decCarDiaIniIxFkDia] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosCardinaisDiasIniciais') AND name='decCarDiaIniIxFkDia')
  BEGIN
    DROP INDEX [cal].[decendiosCardinaisDiasIniciais].[decCarDiaIniIxFkDia]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [decCarDiaIniIxFkDia]
    ON [cal].[decendiosCardinaisDiasIniciais]
    (
      [diaId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisDiasIniciais].[decCarDiaIniFkDia] >>>'
  ALTER TABLE [cal].[decendiosCardinaisDiasIniciais]
    ADD CONSTRAINT [decCarDiaIniFkDia]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisDiasIniciais].[decCarDiaIniIxFkDecCar] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosCardinaisDiasIniciais') AND name='decCarDiaIniIxFkDecCar')
  BEGIN
    DROP INDEX [cal].[decendiosCardinaisDiasIniciais].[decCarDiaIniIxFkDecCar]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [decCarDiaIniIxFkDecCar]
    ON [cal].[decendiosCardinaisDiasIniciais]
    (
      [decCarId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisDiasIniciais].[decCarDiaIniFkDecCar] >>>'
  ALTER TABLE [cal].[decendiosCardinaisDiasIniciais]
    ADD CONSTRAINT [decCarDiaIniFkDecCar]
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
