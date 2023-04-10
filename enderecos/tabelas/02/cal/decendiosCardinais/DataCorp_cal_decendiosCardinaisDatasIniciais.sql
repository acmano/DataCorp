/*
* TABELA: [DataCorp].[cal].[decendiosCardinaisDatasIniciais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisDatasIniciais].[decCarDatIniFkDat] >>>'
  IF OBJECT_ID('[cal].[decCarDatIniFkDat]') IS NOT NULL
    ALTER TABLE [cal].[decendiosCardinaisDatasIniciais]
      DROP CONSTRAINT [decCarDatIniFkDat]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisDatasIniciais].[decCarDatIniFkDecCar] >>>'
  IF OBJECT_ID('[cal].[decCarDatIniFkDecCar]') IS NOT NULL
    ALTER TABLE [cal].[decendiosCardinaisDatasIniciais]
      DROP CONSTRAINT [decCarDatIniFkDecCar]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[decendiosCardinaisDatasIniciais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'decendiosCardinaisDatasIniciais' )
  BEGIN
    DROP TABLE [cal].[decendiosCardinaisDatasIniciais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[decendiosCardinaisDatasIniciais]
  (

    [decCarDatIniId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [decendiosCardinaisDatasIniciaisdecCarDatIniIdNn] NOT NULL

  , [datId]
      BIGINT
      CONSTRAINT [decendiosCardinaisDatasIniciaisdatIdNn] NOT NULL

  , [decCarId]
      BIGINT
      CONSTRAINT [decendiosCardinaisDatasIniciaisdecCarIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[decendiosCardinaisDatasIniciais].[decCarDatIniPk] >>>'
  ALTER TABLE [cal].[decendiosCardinaisDatasIniciais]
    ADD CONSTRAINT [decCarDatIniPk]
      PRIMARY KEY CLUSTERED
      (
        [decCarDatIniId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisDatasIniciais].[decCarDatIniIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosCardinaisDatasIniciais') AND name='decCarDatIniIxAk')
  BEGIN
    DROP INDEX [cal].[decendiosCardinaisDatasIniciais].[decCarDatIniIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisDatasIniciais].[decCarDatIniIxAk] >>>'
  CREATE UNIQUE INDEX [decCarDatIniIxAk]
    ON [cal].[decendiosCardinaisDatasIniciais]
    (
      [datId]
    , [decCarId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisDatasIniciais].[decCarDatIniIxFkDat] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosCardinaisDatasIniciais') AND name='decCarDatIniIxFkDat')
  BEGIN
    DROP INDEX [cal].[decendiosCardinaisDatasIniciais].[decCarDatIniIxFkDat]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [decCarDatIniIxFkDat]
    ON [cal].[decendiosCardinaisDatasIniciais]
    (
      [datId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisDatasIniciais].[decCarDatIniFkDat] >>>'
  ALTER TABLE [cal].[decendiosCardinaisDatasIniciais]
    ADD CONSTRAINT [decCarDatIniFkDat]
    FOREIGN KEY
    (
      [datId]
    )
    REFERENCES [DataCorp].[cal].[datas]
    (
      [datId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisDatasIniciais].[decCarDatIniIxFkDecCar] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosCardinaisDatasIniciais') AND name='decCarDatIniIxFkDecCar')
  BEGIN
    DROP INDEX [cal].[decendiosCardinaisDatasIniciais].[decCarDatIniIxFkDecCar]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [decCarDatIniIxFkDecCar]
    ON [cal].[decendiosCardinaisDatasIniciais]
    (
      [decCarId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisDatasIniciais].[decCarDatIniFkDecCar] >>>'
  ALTER TABLE [cal].[decendiosCardinaisDatasIniciais]
    ADD CONSTRAINT [decCarDatIniFkDecCar]
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
