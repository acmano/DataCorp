/*
* TABELA: [DataCorp].[cal].[decendiosCardinaisQuadrimestresIniciais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisQuadrimestresIniciais].[decCarQuaIniFkQua] >>>'
  IF OBJECT_ID('[cal].[decCarQuaIniFkQua]') IS NOT NULL
    ALTER TABLE [cal].[decendiosCardinaisQuadrimestresIniciais]
      DROP CONSTRAINT [decCarQuaIniFkQua]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisQuadrimestresIniciais].[decCarQuaIniFkDecCar] >>>'
  IF OBJECT_ID('[cal].[decCarQuaIniFkDecCar]') IS NOT NULL
    ALTER TABLE [cal].[decendiosCardinaisQuadrimestresIniciais]
      DROP CONSTRAINT [decCarQuaIniFkDecCar]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[decendiosCardinaisQuadrimestresIniciais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'decendiosCardinaisQuadrimestresIniciais' )
  BEGIN
    DROP TABLE [cal].[decendiosCardinaisQuadrimestresIniciais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[decendiosCardinaisQuadrimestresIniciais]
  (

    [decCarQuaIniId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [decendiosCardinaisQuadrimestresIniciaisdecCarQuaIniIdNn] NOT NULL

  , [quaId]
      BIGINT
      CONSTRAINT [decendiosCardinaisQuadrimestresIniciaisquaIdNn] NOT NULL

  , [decCarId]
      BIGINT
      CONSTRAINT [decendiosCardinaisQuadrimestresIniciaisdecCarIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[decendiosCardinaisQuadrimestresIniciais].[decCarQuaIniPk] >>>'
  ALTER TABLE [cal].[decendiosCardinaisQuadrimestresIniciais]
    ADD CONSTRAINT [decCarQuaIniPk]
      PRIMARY KEY CLUSTERED
      (
        [decCarQuaIniId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisQuadrimestresIniciais].[decCarQuaIniIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosCardinaisQuadrimestresIniciais') AND name='decCarQuaIniIxAk')
  BEGIN
    DROP INDEX [cal].[decendiosCardinaisQuadrimestresIniciais].[decCarQuaIniIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisQuadrimestresIniciais].[decCarQuaIniIxAk] >>>'
  CREATE UNIQUE INDEX [decCarQuaIniIxAk]
    ON [cal].[decendiosCardinaisQuadrimestresIniciais]
    (
      [quaId]
    , [decCarId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisQuadrimestresIniciais].[decCarQuaIniIxFkQua] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosCardinaisQuadrimestresIniciais') AND name='decCarQuaIniIxFkQua')
  BEGIN
    DROP INDEX [cal].[decendiosCardinaisQuadrimestresIniciais].[decCarQuaIniIxFkQua]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [decCarQuaIniIxFkQua]
    ON [cal].[decendiosCardinaisQuadrimestresIniciais]
    (
      [quaId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisQuadrimestresIniciais].[decCarQuaIniFkQua] >>>'
  ALTER TABLE [cal].[decendiosCardinaisQuadrimestresIniciais]
    ADD CONSTRAINT [decCarQuaIniFkQua]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisQuadrimestresIniciais].[decCarQuaIniIxFkDecCar] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosCardinaisQuadrimestresIniciais') AND name='decCarQuaIniIxFkDecCar')
  BEGIN
    DROP INDEX [cal].[decendiosCardinaisQuadrimestresIniciais].[decCarQuaIniIxFkDecCar]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [decCarQuaIniIxFkDecCar]
    ON [cal].[decendiosCardinaisQuadrimestresIniciais]
    (
      [decCarId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisQuadrimestresIniciais].[decCarQuaIniFkDecCar] >>>'
  ALTER TABLE [cal].[decendiosCardinaisQuadrimestresIniciais]
    ADD CONSTRAINT [decCarQuaIniFkDecCar]
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
