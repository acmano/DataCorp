/*
* TABELA: [DataCorp].[cal].[decendiosCardinaisMesesIniciais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisMesesIniciais].[decCarMesIniFkMes] >>>'
  IF OBJECT_ID('[cal].[decCarMesIniFkMes]') IS NOT NULL
    ALTER TABLE [cal].[decendiosCardinaisMesesIniciais]
      DROP CONSTRAINT [decCarMesIniFkMes]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisMesesIniciais].[decCarMesIniFkDecCar] >>>'
  IF OBJECT_ID('[cal].[decCarMesIniFkDecCar]') IS NOT NULL
    ALTER TABLE [cal].[decendiosCardinaisMesesIniciais]
      DROP CONSTRAINT [decCarMesIniFkDecCar]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[decendiosCardinaisMesesIniciais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'decendiosCardinaisMesesIniciais' )
  BEGIN
    DROP TABLE [cal].[decendiosCardinaisMesesIniciais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[decendiosCardinaisMesesIniciais]
  (

    [decCarMesIniId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [decendiosCardinaisMesesIniciaisdecCarMesIniIdNn] NOT NULL

  , [mesId]
      BIGINT
      CONSTRAINT [decendiosCardinaisMesesIniciaismesIdNn] NOT NULL

  , [decCarId]
      BIGINT
      CONSTRAINT [decendiosCardinaisMesesIniciaisdecCarIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[decendiosCardinaisMesesIniciais].[decCarMesIniPk] >>>'
  ALTER TABLE [cal].[decendiosCardinaisMesesIniciais]
    ADD CONSTRAINT [decCarMesIniPk]
      PRIMARY KEY CLUSTERED
      (
        [decCarMesIniId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisMesesIniciais].[decCarMesIniIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosCardinaisMesesIniciais') AND name='decCarMesIniIxAk')
  BEGIN
    DROP INDEX [cal].[decendiosCardinaisMesesIniciais].[decCarMesIniIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisMesesIniciais].[decCarMesIniIxAk] >>>'
  CREATE UNIQUE INDEX [decCarMesIniIxAk]
    ON [cal].[decendiosCardinaisMesesIniciais]
    (
      [mesId]
    , [decCarId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisMesesIniciais].[decCarMesIniIxFkMes] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosCardinaisMesesIniciais') AND name='decCarMesIniIxFkMes')
  BEGIN
    DROP INDEX [cal].[decendiosCardinaisMesesIniciais].[decCarMesIniIxFkMes]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [decCarMesIniIxFkMes]
    ON [cal].[decendiosCardinaisMesesIniciais]
    (
      [mesId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisMesesIniciais].[decCarMesIniFkMes] >>>'
  ALTER TABLE [cal].[decendiosCardinaisMesesIniciais]
    ADD CONSTRAINT [decCarMesIniFkMes]
    FOREIGN KEY
    (
      [mesId]
    )
    REFERENCES [DataCorp].[cal].[meses]
    (
      [mesId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisMesesIniciais].[decCarMesIniIxFkDecCar] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosCardinaisMesesIniciais') AND name='decCarMesIniIxFkDecCar')
  BEGIN
    DROP INDEX [cal].[decendiosCardinaisMesesIniciais].[decCarMesIniIxFkDecCar]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [decCarMesIniIxFkDecCar]
    ON [cal].[decendiosCardinaisMesesIniciais]
    (
      [decCarId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisMesesIniciais].[decCarMesIniFkDecCar] >>>'
  ALTER TABLE [cal].[decendiosCardinaisMesesIniciais]
    ADD CONSTRAINT [decCarMesIniFkDecCar]
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
