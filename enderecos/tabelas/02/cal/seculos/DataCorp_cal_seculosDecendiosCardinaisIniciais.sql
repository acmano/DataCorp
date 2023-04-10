/*
* TABELA: [DataCorp].[cal].[seculosDecendiosCardinaisIniciais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosDecendiosCardinaisIniciais].[secDecCarIniFkDecCar] >>>'
  IF OBJECT_ID('[cal].[secDecCarIniFkDecCar]') IS NOT NULL
    ALTER TABLE [cal].[seculosDecendiosCardinaisIniciais]
      DROP CONSTRAINT [secDecCarIniFkDecCar]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosDecendiosCardinaisIniciais].[secDecCarIniFkSec] >>>'
  IF OBJECT_ID('[cal].[secDecCarIniFkSec]') IS NOT NULL
    ALTER TABLE [cal].[seculosDecendiosCardinaisIniciais]
      DROP CONSTRAINT [secDecCarIniFkSec]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[seculosDecendiosCardinaisIniciais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'seculosDecendiosCardinaisIniciais' )
  BEGIN
    DROP TABLE [cal].[seculosDecendiosCardinaisIniciais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[seculosDecendiosCardinaisIniciais]
  (

    [secDecCarIniId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [seculosDecendiosCardinaisIniciaissecDecCarIniIdNn] NOT NULL

  , [decCarId]
      BIGINT
      CONSTRAINT [seculosDecendiosCardinaisIniciaisdecCarIdNn] NOT NULL

  , [secId]
      BIGINT
      CONSTRAINT [seculosDecendiosCardinaisIniciaissecIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[seculosDecendiosCardinaisIniciais].[secDecCarIniPk] >>>'
  ALTER TABLE [cal].[seculosDecendiosCardinaisIniciais]
    ADD CONSTRAINT [secDecCarIniPk]
      PRIMARY KEY CLUSTERED
      (
        [secDecCarIniId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosDecendiosCardinaisIniciais].[secDecCarIniIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosDecendiosCardinaisIniciais') AND name='secDecCarIniIxAk')
  BEGIN
    DROP INDEX [cal].[seculosDecendiosCardinaisIniciais].[secDecCarIniIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosDecendiosCardinaisIniciais].[secDecCarIniIxAk] >>>'
  CREATE UNIQUE INDEX [secDecCarIniIxAk]
    ON [cal].[seculosDecendiosCardinaisIniciais]
    (
      [decCarId]
    , [secId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosDecendiosCardinaisIniciais].[secDecCarIniIxFkDecCar] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosDecendiosCardinaisIniciais') AND name='secDecCarIniIxFkDecCar')
  BEGIN
    DROP INDEX [cal].[seculosDecendiosCardinaisIniciais].[secDecCarIniIxFkDecCar]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [secDecCarIniIxFkDecCar]
    ON [cal].[seculosDecendiosCardinaisIniciais]
    (
      [decCarId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosDecendiosCardinaisIniciais].[secDecCarIniFkDecCar] >>>'
  ALTER TABLE [cal].[seculosDecendiosCardinaisIniciais]
    ADD CONSTRAINT [secDecCarIniFkDecCar]
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


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosDecendiosCardinaisIniciais].[secDecCarIniIxFkSec] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosDecendiosCardinaisIniciais') AND name='secDecCarIniIxFkSec')
  BEGIN
    DROP INDEX [cal].[seculosDecendiosCardinaisIniciais].[secDecCarIniIxFkSec]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [secDecCarIniIxFkSec]
    ON [cal].[seculosDecendiosCardinaisIniciais]
    (
      [secId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosDecendiosCardinaisIniciais].[secDecCarIniFkSec] >>>'
  ALTER TABLE [cal].[seculosDecendiosCardinaisIniciais]
    ADD CONSTRAINT [secDecCarIniFkSec]
    FOREIGN KEY
    (
      [secId]
    )
    REFERENCES [DataCorp].[cal].[seculos]
    (
      [secId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

END TRY
BEGIN CATCH
  SET @mensagem = @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  RAISERROR ( @mensagem, 16, @erro )
END CATCH
