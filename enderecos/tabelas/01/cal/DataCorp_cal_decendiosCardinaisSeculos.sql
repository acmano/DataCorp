/*
* TABELA: [DataCorp].[cal].[decendiosCardinaisSeculos]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisSeculos].[decCarSecFkSec] >>>'
  IF OBJECT_ID('[cal].[decCarSecFkSec]') IS NOT NULL
    ALTER TABLE [cal].[decendiosCardinaisSeculos]
      DROP CONSTRAINT [decCarSecFkSec]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisSeculos].[decCarSecFkDecCar] >>>'
  IF OBJECT_ID('[cal].[decCarSecFkDecCar]') IS NOT NULL
    ALTER TABLE [cal].[decendiosCardinaisSeculos]
      DROP CONSTRAINT [decCarSecFkDecCar]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[decendiosCardinaisSeculos] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'decendiosCardinaisSeculos' )
  BEGIN
    DROP TABLE [cal].[decendiosCardinaisSeculos]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[decendiosCardinaisSeculos]
  (

    [decCarSecId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [decendiosCardinaisSeculosdecCarSecIdNn] NOT NULL

  , [secId]
      BIGINT
      CONSTRAINT [decendiosCardinaisSeculossecIdNn] NOT NULL

  , [decCarId]
      BIGINT
      CONSTRAINT [decendiosCardinaisSeculosdecCarIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[decendiosCardinaisSeculos].[decCarSecPk] >>>'
  ALTER TABLE [cal].[decendiosCardinaisSeculos]
    ADD CONSTRAINT [decCarSecPk]
      PRIMARY KEY CLUSTERED
      (
        [decCarSecId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisSeculos].[decCarSecIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosCardinaisSeculos') AND name='decCarSecIxAk')
  BEGIN
    DROP INDEX [cal].[decendiosCardinaisSeculos].[decCarSecIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisSeculos].[decCarSecIxAk] >>>'
  CREATE UNIQUE INDEX [decCarSecIxAk]
    ON [cal].[decendiosCardinaisSeculos]
    (
      [secId]
    , [decCarId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisSeculos].[decCarSecIxFkSec] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosCardinaisSeculos') AND name='decCarSecIxFkSec')
  BEGIN
    DROP INDEX [cal].[decendiosCardinaisSeculos].[decCarSecIxFkSec]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [decCarSecIxFkSec]
    ON [cal].[decendiosCardinaisSeculos]
    (
      [secId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisSeculos].[decCarSecFkSec] >>>'
  ALTER TABLE [cal].[decendiosCardinaisSeculos]
    ADD CONSTRAINT [decCarSecFkSec]
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


  SET @erro = 10
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[decendiosCardinaisSeculos].[decCarSecIxFkDecCar] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.decendiosCardinaisSeculos') AND name='decCarSecIxFkDecCar')
  BEGIN
    DROP INDEX [cal].[decendiosCardinaisSeculos].[decCarSecIxFkDecCar]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [decCarSecIxFkDecCar]
    ON [cal].[decendiosCardinaisSeculos]
    (
      [decCarId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[decendiosCardinaisSeculos].[decCarSecFkDecCar] >>>'
  ALTER TABLE [cal].[decendiosCardinaisSeculos]
    ADD CONSTRAINT [decCarSecFkDecCar]
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
