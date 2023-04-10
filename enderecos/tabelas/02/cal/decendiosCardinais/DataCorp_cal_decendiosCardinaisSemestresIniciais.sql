/*
* TABELA: [DataCorp].[cal].[decendiosCardinaisSemestresIniciais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisSemestresIniciais].[decCarSemIniFkSem] >>>'
  IF OBJECT_ID('[cal].[decCarSemIniFkSem]') IS NOT NULL
    ALTER TABLE [cal].[decendiosCardinaisSemestresIniciais]
      DROP CONSTRAINT [decCarSemIniFkSem]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisSemestresIniciais].[decCarSemIniFkDecCar] >>>'
  IF OBJECT_ID('[cal].[decCarSemIniFkDecCar]') IS NOT NULL
    ALTER TABLE [cal].[decendiosCardinaisSemestresIniciais]
      DROP CONSTRAINT [decCarSemIniFkDecCar]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[decendiosCardinaisSemestresIniciais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'decendiosCardinaisSemestresIniciais' )
  BEGIN
    DROP TABLE [cal].[decendiosCardinaisSemestresIniciais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[decendiosCardinaisSemestresIniciais]
  (

    [decCarSemIniId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [decendiosCardinaisSemestresIniciaisdecCarSemIniIdNn] NOT NULL

  , [smtId]
      BIGINT
      CONSTRAINT [decendiosCardinaisSemestresIniciaissmtIdNn] NOT NULL

  , [decCarId]
      BIGINT
      CONSTRAINT [decendiosCardinaisSemestresIniciaisdecCarIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[decendiosCardinaisSemestresIniciais].[decCarSemIniPk] >>>'
  ALTER TABLE [cal].[decendiosCardinaisSemestresIniciais]
    ADD CONSTRAINT [decCarSemIniPk]
      PRIMARY KEY CLUSTERED
      (
        [decCarSemIniId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisSemestresIniciais].[decCarSemIniIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosCardinaisSemestresIniciais') AND name='decCarSemIniIxAk')
  BEGIN
    DROP INDEX [cal].[decendiosCardinaisSemestresIniciais].[decCarSemIniIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisSemestresIniciais].[decCarSemIniIxAk] >>>'
  CREATE UNIQUE INDEX [decCarSemIniIxAk]
    ON [cal].[decendiosCardinaisSemestresIniciais]
    (
      [smtId]
    , [decCarId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisSemestresIniciais].[decCarSemIniIxFkSem] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosCardinaisSemestresIniciais') AND name='decCarSemIniIxFkSem')
  BEGIN
    DROP INDEX [cal].[decendiosCardinaisSemestresIniciais].[decCarSemIniIxFkSem]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [decCarSemIniIxFkSem]
    ON [cal].[decendiosCardinaisSemestresIniciais]
    (
      [smtId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisSemestresIniciais].[decCarSemIniFkSem] >>>'
  ALTER TABLE [cal].[decendiosCardinaisSemestresIniciais]
    ADD CONSTRAINT [decCarSemIniFkSem]
    FOREIGN KEY
    (
      [smtId]
    )
    REFERENCES [DataCorp].[cal].[semestres]
    (
      [smtId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisSemestresIniciais].[decCarSemIniIxFkDecCar] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosCardinaisSemestresIniciais') AND name='decCarSemIniIxFkDecCar')
  BEGIN
    DROP INDEX [cal].[decendiosCardinaisSemestresIniciais].[decCarSemIniIxFkDecCar]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [decCarSemIniIxFkDecCar]
    ON [cal].[decendiosCardinaisSemestresIniciais]
    (
      [decCarId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisSemestresIniciais].[decCarSemIniFkDecCar] >>>'
  ALTER TABLE [cal].[decendiosCardinaisSemestresIniciais]
    ADD CONSTRAINT [decCarSemIniFkDecCar]
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
