/*
* TABELA: [DataCorp].[cal].[decendiosCardinaisQuinzenasIniciais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisQuinzenasIniciais].[decCarQuiIniFkQui] >>>'
  IF OBJECT_ID('[cal].[decCarQuiIniFkQui]') IS NOT NULL
    ALTER TABLE [cal].[decendiosCardinaisQuinzenasIniciais]
      DROP CONSTRAINT [decCarQuiIniFkQui]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisQuinzenasIniciais].[decCarQuiIniFkDecCar] >>>'
  IF OBJECT_ID('[cal].[decCarQuiIniFkDecCar]') IS NOT NULL
    ALTER TABLE [cal].[decendiosCardinaisQuinzenasIniciais]
      DROP CONSTRAINT [decCarQuiIniFkDecCar]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[decendiosCardinaisQuinzenasIniciais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'decendiosCardinaisQuinzenasIniciais' )
  BEGIN
    DROP TABLE [cal].[decendiosCardinaisQuinzenasIniciais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[decendiosCardinaisQuinzenasIniciais]
  (

    [decCarQuiIniId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [decendiosCardinaisQuinzenasIniciaisdecCarQuiIniIdNn] NOT NULL

  , [quiId]
      BIGINT
      CONSTRAINT [decendiosCardinaisQuinzenasIniciaisquiIdNn] NOT NULL

  , [decCarId]
      BIGINT
      CONSTRAINT [decendiosCardinaisQuinzenasIniciaisdecCarIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[decendiosCardinaisQuinzenasIniciais].[decCarQuiIniPk] >>>'
  ALTER TABLE [cal].[decendiosCardinaisQuinzenasIniciais]
    ADD CONSTRAINT [decCarQuiIniPk]
      PRIMARY KEY CLUSTERED
      (
        [decCarQuiIniId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisQuinzenasIniciais].[decCarQuiIniIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosCardinaisQuinzenasIniciais') AND name='decCarQuiIniIxAk')
  BEGIN
    DROP INDEX [cal].[decendiosCardinaisQuinzenasIniciais].[decCarQuiIniIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisQuinzenasIniciais].[decCarQuiIniIxAk] >>>'
  CREATE UNIQUE INDEX [decCarQuiIniIxAk]
    ON [cal].[decendiosCardinaisQuinzenasIniciais]
    (
      [quiId]
    , [decCarId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisQuinzenasIniciais].[decCarQuiIniIxFkQui] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosCardinaisQuinzenasIniciais') AND name='decCarQuiIniIxFkQui')
  BEGIN
    DROP INDEX [cal].[decendiosCardinaisQuinzenasIniciais].[decCarQuiIniIxFkQui]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [decCarQuiIniIxFkQui]
    ON [cal].[decendiosCardinaisQuinzenasIniciais]
    (
      [quiId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisQuinzenasIniciais].[decCarQuiIniFkQui] >>>'
  ALTER TABLE [cal].[decendiosCardinaisQuinzenasIniciais]
    ADD CONSTRAINT [decCarQuiIniFkQui]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisQuinzenasIniciais].[decCarQuiIniIxFkDecCar] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosCardinaisQuinzenasIniciais') AND name='decCarQuiIniIxFkDecCar')
  BEGIN
    DROP INDEX [cal].[decendiosCardinaisQuinzenasIniciais].[decCarQuiIniIxFkDecCar]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [decCarQuiIniIxFkDecCar]
    ON [cal].[decendiosCardinaisQuinzenasIniciais]
    (
      [decCarId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisQuinzenasIniciais].[decCarQuiIniFkDecCar] >>>'
  ALTER TABLE [cal].[decendiosCardinaisQuinzenasIniciais]
    ADD CONSTRAINT [decCarQuiIniFkDecCar]
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
