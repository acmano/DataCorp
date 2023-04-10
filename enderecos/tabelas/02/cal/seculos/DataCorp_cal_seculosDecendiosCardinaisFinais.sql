/*
* TABELA: [DataCorp].[cal].[seculosDecendiosCardinaisFinais]
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
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosDecendiosCardinaisFinais].[secDecCarFinFkDecCar] >>>'
  IF OBJECT_ID('[cal].[secDecCarFinFkDecCar]') IS NOT NULL
    ALTER TABLE [cal].[seculosDecendiosCardinaisFinais]
      DROP CONSTRAINT [secDecCarFinFkDecCar]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 2
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosDecendiosCardinaisFinais].[secDecCarFinFkSec] >>>'
  IF OBJECT_ID('[cal].[secDecCarFinFkSec]') IS NOT NULL
    ALTER TABLE [cal].[seculosDecendiosCardinaisFinais]
      DROP CONSTRAINT [secDecCarFinFkSec]

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 3
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Tabela      [DataCorp].[cal].[seculosDecendiosCardinaisFinais] >>>'
  IF EXISTS ( SELECT  DISTINCT 1  FROM  sys.tables tabela INNER JOIN sys.schemas esquema ON  esquema.schema_id = tabela.schema_id WHERE esquema.name = 'cal' AND tabela.name = 'seculosDecendiosCardinaisFinais' )
  BEGIN
    DROP TABLE [cal].[seculosDecendiosCardinaisFinais]
  END

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4

  SET @erro = 4
  SET @mensagemP3 = 'CREATE: '
  CREATE TABLE [cal].[seculosDecendiosCardinaisFinais]
  (

    [secDecCarFinId]
      BIGINT
      IDENTITY(1,1)
      CONSTRAINT [seculosDecendiosCardinaisFinaissecDecCarFinIdNn] NOT NULL

  , [decCarId]
      BIGINT
      CONSTRAINT [seculosDecendiosCardinaisFinaisdecCarIdNn] NOT NULL

  , [secId]
      BIGINT
      CONSTRAINT [seculosDecendiosCardinaisFinaissecIdNn] NOT NULL

  )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 5
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Primary Key [DataCorp].[cal].[seculosDecendiosCardinaisFinais].[secDecCarFinPk] >>>'
  ALTER TABLE [cal].[seculosDecendiosCardinaisFinais]
    ADD CONSTRAINT [secDecCarFinPk]
      PRIMARY KEY CLUSTERED
      (
        [secDecCarFinId]
      )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 6
  SET @mensagemP2 = 'ERRO! '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosDecendiosCardinaisFinais].[secDecCarFinIxAk] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosDecendiosCardinaisFinais') AND name='secDecCarFinIxAk')
  BEGIN
    DROP INDEX [cal].[seculosDecendiosCardinaisFinais].[secDecCarFinIxAk]
    SET @mensagemP2 = 'Ok!  '
    PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4
  END

  SET @erro = 7
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosDecendiosCardinaisFinais].[secDecCarFinIxAk] >>>'
  CREATE UNIQUE INDEX [secDecCarFinIxAk]
    ON [cal].[seculosDecendiosCardinaisFinais]
    (
      [decCarId]
    , [secId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 8
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'DROP  : '
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosDecendiosCardinaisFinais].[secDecCarFinIxFkDecCar] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosDecendiosCardinaisFinais') AND name='secDecCarFinIxFkDecCar')
  BEGIN
    DROP INDEX [cal].[seculosDecendiosCardinaisFinais].[secDecCarFinIxFkDecCar]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE UNIQUE INDEX [secDecCarFinIxFkDecCar]
    ON [cal].[seculosDecendiosCardinaisFinais]
    (
      [decCarId]
    )
  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 9
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosDecendiosCardinaisFinais].[secDecCarFinFkDecCar] >>>'
  ALTER TABLE [cal].[seculosDecendiosCardinaisFinais]
    ADD CONSTRAINT [secDecCarFinFkDecCar]
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
  SET @mensagemP4 = 'Index       [DataCorp].[cal].[seculosDecendiosCardinaisFinais].[secDecCarFinIxFkSec] >>>'
  IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('cal.seculosDecendiosCardinaisFinais') AND name='secDecCarFinIxFkSec')
  BEGIN
    DROP INDEX [cal].[seculosDecendiosCardinaisFinais].[secDecCarFinIxFkSec]
  END

  SET @mensagemP3 = 'CREATE: '
  CREATE  INDEX [secDecCarFinIxFkSec]
    ON [cal].[seculosDecendiosCardinaisFinais]
    (
      [secId]
    )

  SET @mensagemP2 = 'Ok!  '
  PRINT @mensagemP1 + @mensagemP2 + @mensagemP3 + @mensagemP4


  SET @erro = 11
  SET @mensagemP2 = 'ERRO!  '
  SET @mensagemP3 = 'CREATE: '
  SET @mensagemP4 = 'Foreign Key [DataCorp].[cal].[seculosDecendiosCardinaisFinais].[secDecCarFinFkSec] >>>'
  ALTER TABLE [cal].[seculosDecendiosCardinaisFinais]
    ADD CONSTRAINT [secDecCarFinFkSec]
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
